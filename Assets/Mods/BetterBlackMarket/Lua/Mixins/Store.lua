local ConfigBuilder = require("Libs.ConfigBuilder")
local ItemPool = require("Libs.ItemPool")
local Events = require("Mixins.Events")
local LootDropLib = require("Libs.LootDropLib")
local World = require("World.World")

local function onDayBegin(self, e)
    if not self.daysUntilResupply or not self.resupplyFrequency then
        return
    end
    print("daysUntilResupply: ", daysUntilResupply) -- Mod

    self.daysUntilResupply = self.daysUntilResupply - 1
    if self.daysUntilResupply <= 0 then
        self.daysUntilResupply = self.resupplyFrequency
        self.resupplyQueued = true
    end
end

local function shouldBeInSameSlot(itemA, itemB)
    -- Items should not be in the same slot if they have different ids
    if itemA._id ~= itemB._id then
        return false
    end

    return true
end

local function addToStock(o, item)
    for i = 1, #o.stock do
        if shouldBeInSameSlot(o.stock[i].item, item) then
            o.stock[i].stock = o.stock[i].stock + 1
            return
        end
    end

    -- Not found in loop
    local product = { item = item, stock = 1 }
    o.stock[#o.stock + 1] = product
end

local function checkPlayerInventoriesForItem(itemId)
    local nItems

    -- checking faction inventory
    local playerFaction = World.playerFaction
    local playerFactionInventory = playerFaction.inventory
    local items = playerFactionInventory:getAllItemsById(itemId)
    nItems = #items

    -- checking faction members inventory
    local members = playerFaction.members
    for _, member in next, members do
        local inventory = member.inventory
        local memberNItems = #inventory:getAllItemsById(itemId)
        nItems = nItems + memberNItems
    end

    return nItems
end

local function resupply(o)
    -- Mod - add popup notification
    o.stock = {}
    for i = 1, #o.items do
        local curr = o.items[i]

        local itemConfig = ConfigBuilder.fromId(curr.item)
        if not itemConfig.excluded then
            if curr.persistingStock then
                local existingItems = checkPlayerInventoriesForItem(curr.item)
                local nToAdd = curr.stock - existingItems
                if nToAdd > 0 then
                    local item = ItemPool:acquire(curr.item)
                    for _ = 1, nToAdd do
                        addToStock(o, item)
                    end
                end
            else
                local item = ItemPool:acquire(curr.item)

                if curr.overrides then
                    for k, v in next, curr.overrides do
                        item:override(k, v)
                    end
                end

                for _ = 1, curr.stock or 1 do
                    addToStock(o, item)
                end
            end
        end
    end

    local fnName = o.lootDropGenerateStockFn
    if fnName then
        local randomStock = {}
        LootDropLib[fnName](randomStock)

        for _, item in next, randomStock do
            addToStock(o, item)
        end
    end
end

local function refresh(o)
    if o.resupplyQueued then
        resupply(o)
        o.resupplyQueued = false
    end
end

local function populate(o, configId)
    local items = ConfigBuilder.fromId(configId)

    o.name = items.name
    o.iconSprite = o._o.iconSprite or items.icon
    o.percentDiscount = 0
    o.items = items
    o.resupplyQueued = true
    o.lootDropGenerateStockFn = items.lootDropGenerateStockFn

    if items.resupplyFrequency then
        o.daysUntilResupply = items.resupplyFrequency
        o.resupplyFrequency = items.resupplyFrequency
    end
end

local function removeFromStock(o, item)
    for i = 1, #o.stock do
        if o.stock[i].item == item then
            if o.stock[i].stock > 0 then
                o.stock[i].stock = o.stock[i].stock - 1
            end
            break
        end
    end
end

-- Used for replacing an item with its upgrade.
local function replace(o, oldItem, newItem, count)
    for i = 1, #o.stock do
        if o.stock[i].item == oldItem or o.stock[i].item._id == oldItem then
            if type(newItem) == "string" then
                local configId = newItem
                newItem = ItemPool:acquire(configId)
            end
            local newProduct = { item = newItem, stock = count or 1 }
            o.stock[i] = newProduct
            return newProduct
        end
    end
end

local function getProduct(o, i)
    return o.stock[i].item
end

local function onSetup(store)
    store.onDayBegin = onDayBegin
    store.resupply = resupply
    store.refresh = refresh
    store.populate = populate
    store.removeFromStock = removeFromStock
    store.addToStock = addToStock
    store.getProduct = getProduct
    store.replace = replace

    -- Temp hack until Hank is removed. Blame Canada.
    if store._o.icon then
        if store._o.icon.hasStatusIcon and store._o.icon:hasStatusIcon() then
            store._o.icon:addStatusIcon("STATUS_ICONS.BLACK_MARKET")
        end
    end

    game:addEventListener("onDayBegin", store)
end

local function _mixin(o)

    o = o or { }

    local store = {}

    o.store = store
    store._o = o
    onSetup(store)

    Events.mixin(store)

    return o
end

local function _load(o)
    if o.store then
        onSetup(o.store)
        o.store._o = o
    end
end

local function _save(o, saveBlock)
    if o.store then
        saveBlock.store = SaveState.saveReference(o.store)
    end
end

local function saveGameCompatibility_removeItems(version, compatibility, stores, itemIds)
    for storeIdx = 1, #stores do
        local store = stores[storeIdx]
        local stock = store.stock
        if stock then
            for i = #stock, 1, -1 do
                local product = stock[i]
                for itemIdx = 1, #itemIds do
                    local itemId = itemIds[itemIdx]
                    local productItem = product.item
                    if (type(productItem) == "string" and productItem == itemId) or (type(productItem) == "table" and productItem._id == itemId) then
                        table.remove(stock, i)
                    end
                end
            end
        end
        local resupplyItems = store.items
        if resupplyItems then
            for i = #resupplyItems, 1, -1 do
                local configId = resupplyItems[i].item
                for itemIdx = 1, #itemIds do
                    if itemIds[itemIdx] == configId then
                        resupplyItems[i] = resupplyItems[#resupplyItems]
                        resupplyItems[#resupplyItems] = nil
                    end
                end
            end
        end
    end
end

return {
    mixin = _mixin,
    _rgIsMixin = true,
    load = _load,
    save = _save,
    saveGameCompatibility_removeItems = saveGameCompatibility_removeItems,
}
