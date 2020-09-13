-- MatchManager.lua
-- Manages individual game matches for players
local MatchManager = {}

-- Services
local ServerStorage = game:GetService("ServerStorage")

-- Module Scripts
local source = ServerStorage:WaitForChild("Source")
local playerManager = require(source:WaitForChild("PlayerManager"))
local gameSettings = require(source:WaitForChild("GameSettings"))
local timer = require(source:WaitForChild("Timer"))

-- Events
local matchStart = Instance.new("BindableEvent")

-- Local Variables
local matchTimer = timer.new()

-- Local Functions
local function endTimer()
    print("Time is up!")
end

local function startTimer()
    print("Timer started")
    matchTimer:start(gameSettings.matchDuration)
    matchTimer.finished:Connect(endTimer)
end

-- Module Functions
function MatchManager.preparePlayers()
    playerManager.sendPlayersToMatch()
    matchStart:Fire()
end

matchStart.Event:Connect(startTimer)

return MatchManager