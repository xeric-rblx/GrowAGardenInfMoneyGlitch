--[[
    Tutorial:
    1. Someone most equip a pet (not you)
    2. Run this
    3. Enjoy
]]
local replicated_storage = game:GetService("ReplicatedStorage")
local run_service = game:GetService("RunService")
local players = game:GetService("Players")

local local_player = players.LocalPlayer

local sigma_connection = run_service.RenderStepped:Connect(function()
    for _, v in next, players:GetPlayers() do
        if v ~= local_player and v.Character:FindFirstChildOfClass("Tool") and v.Character:FindFirstChildOfClass("Tool"):GetAttribute("ItemType") == "Pet" then
            replicated_storage:WaitForChild("GameEvents"):WaitForChild("SellPet_RE"):FireServer(v.Character:FindFirstChildOfClass("Tool"))
        end
    end
end)
