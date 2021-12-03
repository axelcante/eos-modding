local ConfigBuilder = require("Libs.ConfigBuilder")

ConfigBuilder.define( "CAMERAS",
{
    VIDEO_PLAYER =
    {
        name = "VideoPlayer",
        type = "Static",
        cameraId = RomeroGames.CameraId.Video,
        prefab = "Prefabs/Cameras/VideoCamera",
    },

    WORLD_MAP =
    {
        name = "MapCamera",
        type = "Map",
        cameraId = RomeroGames.CameraId.WorldMap,
        prefab = "Prefabs/Cameras/MapCamera",
        movementSpeed = 1.2,
        movementSmoothTime = 0.2,
        fastMovementMultiplier = 2,
        rotationSpeed = 120,
        rotationStopTime = 0.5,
        rotateToDuration = 0.25,
        fieldOfView = 30,
        farClipPlane = 5000,
        insideBuildingRadius = 20,
        minBuildingHeight = 35,
        zoom =
        {
            minDistance = 30,
            maxDistance = 4000,
            maxDistance_Switch = 4000,
            defaultDistance = 130,
            defaultDistance_Switch = 130,
            transitionDistance = 80,
            transitionDistance_Switch = 80,
            zoomSpeedMin = 500,
            zoomSpeedMax = 20000,
            controllerSpeedScale = 0.25,
            smoothTime = 0.2,
            tiltDistance = 1000,
            tiltAngleMin = 38,
            tiltAngleMax = 80,
            tiltEaseEnabled = true,
            zoomedInFieldOfView = 40,
            zoomedOutFieldOfView = 30,
            autoZoomDuration = 0.5,
            zoomToInteriorRadius = 20,
            edgeZoomMinScale = 0.254,
        }
    },

    EXTERIOR =
    {
        name = "ExteriorCam",
        type = "Orbit",
        cameraId = RomeroGames.CameraId.Exterior,
        prefab = "Prefabs/Cameras/ExteriorCamera",
        movementSpeed = 2,
        movementSmoothTime = 0.2,
        fastMovementMultiplier = 2,
        rotationSpeed = 120,
        rotationStopTime = 0.5,
        rotateToDuration = 0.25,
        fieldOfView = 45,
        conversationTransitionModifier = 2,
        cameraCollisionRadius = 5,
        enableOccluderFading = false,
        regionOffset = 5,
        zoom =
        {
            minDistance = 12,
            maxDistance = 60,
            maxDistance_Switch = 40,
            defaultDistance = 56,
            defaultDistance_Switch = 30,
            transitionDistance = 58,
            transitionDistance_Switch = 38,
            progressScale = 7, -- Speed of progress bar fill when zooming out to world map
            controllerProgressScale = 8, -- Speed of progress bar when using controller
            progressTimeout = 2,
            zoomSpeedMin = 150,
            zoomSpeedMax = 150,
            zoomFromMapSpeed = 25,
            controllerSpeedScale = 0.25,
            smoothTime = 0.3,
            tiltDistance = 25,
            tiltAngleMin = 35,
            tiltAngleMax = 45,
        }
    },

    INTERIOR =
    {
        _includes = "EXTERIOR",
        name = "InteriorCam",
        type = "Orbit",
        cameraId = RomeroGames.CameraId.Interior,
        prefab = "Prefabs/Cameras/InteriorCamera",
        movementSpeed = 1.75,
        movementSmoothTime = 0.2,
        enableOccluderFading = true,
        zoom =
        {
            minDistance = 10,
            maxDistance = 25,
            maxDistance_Switch = 25,
            defaultDistance = 15,
            defaultDistance_Switch = 15,
            transitionDistance = 24.5,
            transitionDistance_Switch = 24.5, -- 1m less than maxDistance
            tiltDistance = 20,
        }
    },

    DEBUG =
    {
        name = "DebugCam",
        type = "Debug",
        cameraId = RomeroGames.CameraId.Debug,
        prefab = "Prefabs/Cameras/DebugCamera",
        moveSpeed = 1,
        moveStickCurve = 2,
        rotationSpeed = 3,
        rotationStickCurve = 2,
        zoomSpeed = 20,
        smoothTime = 0.1,
        sensitivity = 1,
        depthOfFieldChangeSpeed = 0.4,
    }
})