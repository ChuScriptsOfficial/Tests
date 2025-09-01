function serverHop()
local Http = game:GetService("HttpService")
local Teleport = game:GetService("TeleportService")
local Player = game:GetService("Players").LocalPlayer
local placeId = game.PlaceId

local data = Http:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..placeId.."/servers/Public?sortOrder=Asc&limit=100")).data
table.sort(data, function(a,b) return a.playing < b.playing end)

for _,server in ipairs(data) do
    Teleport:TeleportToPlaceInstance(placeId, server.id, Player)
    task.wait(1)
end

end
