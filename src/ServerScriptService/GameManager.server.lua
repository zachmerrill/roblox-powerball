-- GameManager.lua
-- The main game loop

-- Services
local ServerScriptService = game:GetService("ServerScriptService")
local Players = game:GetService("Players")

-- Module Scripts
local source = ServerScriptService:WaitForChild("Source")
local matchManager = require(source:WaitForChild("MatchManager"))
local gameSettings = require(source:WaitForChild("GameSettings"))

-- Main loop
while true do
    repeat
        -- Pause game logic until enough players are in the server
        wait(gameSettings.intermissionDuration)
    until Players.NumPlayers >= gameSettings.minimumPlayers
    wait(gameSettings.transitionTime)
    matchManager.preparePlayers()
end