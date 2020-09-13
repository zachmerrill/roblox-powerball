-- PlayerManager.lua
-- Handles spawn and movement of players within the server
local PlayerManager = {}

-- Services
local Players = game:GetService("Players")
local ServerStorage = game:GetService("ServerStorage")

-- Local Variables
local lobbySpawn = workspace.World.Lobby.SpawnLocation
local arenaMap = workspace.World.Arena
local spawnLocations = arenaMap.SpawnLocations
local activePlayers = {}

-- Local Functions
local function onPlayerJoin(player)
    -- Spawn player in lobby
    player.RespawnLocation = lobbySpawn
end

local function preparePlayer(player, spawn)
    player.RespawnLocation = spawn
    -- Force respawn
    player:LoadCharacter()
end

-- Module Functions
function PlayerManager.sendPlayersToMatch()
    -- Get array of arena spawns
    local arenaSpawns = spawnLocations:GetChildren()

    for key, player in pairs(Players:GetPlayers()) do
        -- Track active players
        table.insert(activePlayers, player)

        -- Put player in first available spawn
        -- and remove it from selection
        -- TODO: randomly assign players to spawns fairly
        local spawnLocation = arenaSpawns[1]
        preparePlayer(player, spawnLocation)
        table.remove(arenaSpawns, 1)
    end
end

Players.PlayerAdded:Connect(onPlayerJoin)

return PlayerManager