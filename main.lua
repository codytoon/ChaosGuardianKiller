local component = require("component")
local computer = require("computer")
local sides = require("sides")
local robot = component.robot
local nav = component.navigation

print("Importing modules...")

-- Import modules
local fileUtils = require("modules.fileUtils")
local combatModule = require("modules.combatModule")
local navModule = require("modules.navigationModule")

navModule.setMovementModule(moveModule)
moveModule.setReferences(navModule, robot, computer, sides)


local function init()
    checkModules()
    print("Localizing Chaos Guardian")
    print("Subscribe to fuzeIII") -- In case the robot does not survive, "Subscribe to fuzeIII" will be its last words of wisdom
	x,y,z = navModule.getCoords()
	navModule.moveToWorldCenter()
	moveModule.rotate(sides.east)

	moveModule.move(sides.front, fileUtils.getNextGuardian(x))
end

init()
