-- GameSettings.lua
-- Holds global game settings for all servers
local GameSettings = {}

-- Game Variables
-- Seconds before match start
GameSettings.intermissionDuration = 5
-- Second duration of match
GameSettings.matchDuration = 10
-- Number of players needed to start
GameSettings.minimumPlayers = 2
-- Seconds before and after match to slow transition
-- between parts of game
GameSettings.transitionTime = 5

return GameSettings