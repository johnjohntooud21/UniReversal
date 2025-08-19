local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
    Name = "UniReversal",
    LoadingTitle = "AIO",
    LoadingSubtitle = "By Zen",
    ConfigurationSaving = {
        Enabled = false,
        FolderName = nill, -- create a custom folder
        FileName = "Rwasd"
    },
    KeySystem = false,
    KeySettings = {
        Title = "Untitled",
        Subtitle = "Key System",
        Note = "No Method of obtaining the key is provided",
        FileName = "Key",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {"Hello"}
    }
})
local MainTab = Window:CreateTab("🏡 Home", nil) -- Title
local MainSection = MainTab:CreateSection("Main")

Rayfield:Notify({
   Title = "Successfully Executed!",
   Content = "UniReversal",
   Duration = 5,
   Image = nil,
})

local Toggle = MainTab:CreateToggle({
   Name = "Player ESP",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

--// Shortcuts
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

--// ESP Toggle
_G.ESPEnabled = false
_G.ESPStarted = false

--// Keybind to toggle ESP (press "E")
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.E and not gameProcessed then
        _G.ESPEnabled = not _G.ESPEnabled
        game.StarterGui:SetCore("SendNotification", {
            Title = "Zen Hubb",
            Text = "ESP Toggled: " .. tostring(_G.ESPEnabled),
            Duration = 4
        })
    end
end)

--// ESP Box Storage
local ESPBoxes = {}

--// Create Box Function
local function CreateBox(player)
    local box = Drawing.new("Square")
    box.Visible = false
    box.Color = Color3.fromRGB(255, 0, 0)
    box.Thickness = 2
    box.Transparency = 1
    box.Filled = false
    ESPBoxes[player] = box
end

--// Remove Box
local function RemoveBox(player)
    if ESPBoxes[player] then
        ESPBoxes[player]:Remove()
        ESPBoxes[player] = nil
    end
end

--// Update ESP
RunService.RenderStepped:Connect(function()
    if not _G.ESPEnabled then
        for _, box in pairs(ESPBoxes) do
            box.Visible = false
        end
        return
    end

    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            if not ESPBoxes[player] then
                CreateBox(player)
            end

            local box = ESPBoxes[player]
            local hrp = player.Character.HumanoidRootPart
            local pos, onScreen = Camera:WorldToViewportPoint(hrp.Position)

            if onScreen then
                local size = Vector2.new(35, 75) -- Box size
                box.Size = size
                box.Position = Vector2.new(pos.X - size.X / 2, pos.Y - size.Y / 2)
                box.Visible = true
            else
                box.Visible = false
            end
        else
            RemoveBox(player)
        end
    end
end)
   -- The variable (Value) is a boolean on whether the toggle is true or false
   end,
})
local Toggle = MainTab:CreateToggle({
   Name = "Infinite Jump",
   CurrentValue = false,
   Flag = "Toggle2", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   _G.InfiniteJump = not _G.InfiniteJump

   if _G.InfiniteJumpStarted == nil then
       _G.InfiniteJumpStarted = true
        game.StarterGui:SetCore("SendNotification", {Title = "Zen Hubb"; Text = "Infinite Jump Activated"; Duration=5;})
        local plr = game:GetService('Players').LocalPlayer
        local m = plr:GetMouse()
        m.KeyDown:connect(function(k)
        if _G.InfiniteJump then
            if k:byte() == 32 then
            humanoid = game:GetService'Players'.LocalPlayer.Character:FindFirstChildOfClass('Humanoid')
            humanoid:ChangeState('Jumping')
            wait()
            humanoid:ChangeState('Seated')
            end
        end
   end)
end
   end,
})

local Toggle = MainTab:CreateToggle({
    Name = "Speed hack",
    CurrentValue = false,
    Flag = "Toggle3",
    Callback = function(Value)
       --// Settings
local SpeedValue = 50 -- Change this to your desired speed
local DefaultSpeed = 16

--// Services
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

--// Function to apply speed
local function applySpeed(humanoid)
    if humanoid and humanoid:IsA("Humanoid") then
        humanoid.WalkSpeed = _G.SpeedHackEnabled and SpeedValue or DefaultSpeed
    end
end

--// Monitor character and humanoid
local function setupSpeedHack()
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local humanoid = character:FindFirstChildOfClass("Humanoid") or character:WaitForChild("Humanoid")

    applySpeed(humanoid)

    humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
        if _G.SpeedHackEnabled and humanoid.WalkSpeed ~= SpeedValue then
            humanoid.WalkSpeed = SpeedValue
        end
    end)

    character:WaitForChild("Humanoid").Died:Connect(function()
        _G.SpeedHackEnabled = false
        game.StarterGui:SetCore("SendNotification", {
            Title = "Zen Hubb",
            Text = "Speed Hack Disabled (Player Died)",
            Duration = 4
        })
    end)
end

--// Toggle Speed Hack
_G.SpeedHackEnabled = not _G.SpeedHackEnabled

if _G.SpeedHackStarted == nil then
    _G.SpeedHackStarted = true
    game.StarterGui:SetCore("SendNotification", {
        Title = "Zen Hubb",
        Text = "Speed Hack Toggled: " .. tostring(_G.SpeedHackEnabled),
        Duration = 4
    })

    setupSpeedHack()
end

--// Reapply on respawn
LocalPlayer.CharacterAdded:Connect(function()
    wait(1)
    if _G.SpeedHackEnabled then
        setupSpeedHack()
    end
end)
    end,
})
local Toggle = MainTab:CreateToggle({
    Name = "Skeleton",
    CurrentValue = false,
    Flag = "Toggle4",
    Callback = function(Value)
        local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

--// Shortcuts
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

--// Toggle
_G.SkeletonESPEnabled = false

--// Keybind to toggle (press "T")
UserInputService.InputBegan:Connect(function(input, gp)
    if input.KeyCode == Enum.KeyCode.T and not gp then
        _G.SkeletonESPEnabled = not _G.SkeletonESPEnabled
        game.StarterGui:SetCore("SendNotification", {
            Title = "Zen Hubb",
            Text = "Skeleton ESP: " .. tostring(_G.SkeletonESPEnabled),
            Duration = 4
        })
    end
end)

--// Body Parts to Connect
local bones = {
    {"Head", "UpperTorso"},
    {"UpperTorso", "LowerTorso"},
    {"UpperTorso", "LeftUpperArm"},
    {"LeftUpperArm", "LeftLowerArm"},
    {"LeftLowerArm", "LeftHand"},
    {"UpperTorso", "RightUpperArm"},
    {"RightUpperArm", "RightLowerArm"},
    {"RightLowerArm", "RightHand"},
    {"LowerTorso", "LeftUpperLeg"},
    {"LeftUpperLeg", "LeftLowerLeg"},
    {"LeftLowerLeg", "LeftFoot"},
    {"LowerTorso", "RightUpperLeg"},
    {"RightUpperLeg", "RightLowerLeg"},
    {"RightLowerLeg", "RightFoot"}
}

--// Drawing Storage
local skeletonLines = {}

--// Create Lines for Player
local function createSkeleton(player)
    skeletonLines[player] = {}
    for _, bone in pairs(bones) do
        local line = Drawing.new("Line")
        line.Visible = false
        line.Color = Color3.fromRGB(0, 255, 0)
        line.Thickness = 2
        line.Transparency = 1
        table.insert(skeletonLines[player], line)
    end
end

--// Remove Lines
local function removeSkeleton(player)
    if skeletonLines[player] then
        for _, line in pairs(skeletonLines[player]) do
            line:Remove()
        end
        skeletonLines[player] = nil
    end
end

--// Update Skeleton ESP
RunService.RenderStepped:Connect(function()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            if not skeletonLines[player] then
                createSkeleton(player)
            end

            for i, bone in pairs(bones) do
                local part1 = player.Character:FindFirstChild(bone[1])
                local part2 = player.Character:FindFirstChild(bone[2])
                local line = skeletonLines[player][i]

                if _G.SkeletonESPEnabled and part1 and part2 then
                    local pos1, onScreen1 = Camera:WorldToViewportPoint(part1.Position)
                    local pos2, onScreen2 = Camera:WorldToViewportPoint(part2.Position)

                    if onScreen1 and onScreen2 then
                        line.From = Vector2.new(pos1.X, pos1.Y)
                        line.To = Vector2.new(pos2.X, pos2.Y)
                        line.Visible = true
                    else
                        line.Visible = false
                    end
                else
                    line.Visible = false
                end
            end
        else
            removeSkeleton(player)
        end
    end
end)
    end,
})
--// Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

--// Globals
_G.AimbotEnabled = false

--// Targeting Function
local function GetClosestPlayer()
    local closest, shortest = nil, math.huge
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Head") and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then
            local head = player.Character.Head
            local screenPos, onScreen = Camera:WorldToViewportPoint(head.Position)
            if onScreen then
                local mousePos = UserInputService:GetMouseLocation()
                local dist = (Vector2.new(mousePos.X, mousePos.Y) - Vector2.new(screenPos.X, screenPos.Y)).Magnitude
                if dist < shortest then
                    shortest = dist
                    closest = player
                end
            end
        end
    end
    return closest
end

--// Aimbot Logic
RunService.RenderStepped:Connect(function()
    if _G.AimbotEnabled and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
        local target = GetClosestPlayer()
        if target and target.Character and target.Character:FindFirstChild("Head") then
            Camera.CFrame = CFrame.new(Camera.CFrame.Position, target.Character.Head.Position)
        end
    end
end)

--// UI Toggle Integration
local Toggle = MainTab:CreateToggle({
    Name = "Aimbot",
    CurrentValue = false,
    Flag = "Toggle5",
    Callback = function(Value)
        _G.AimbotEnabled = Value

        game.StarterGui:SetCore("SendNotification", {
            Title = "Zen Hubb",
            Text = "Aimbot " .. (Value and "Activated (Hold RMB)" or "Deactivated"),
            Duration = 4
        })
    end,
})
--// Services
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local LocalPlayer = Players.LocalPlayer

--// Teleport Function
local function teleportToPlayer(playerName)
    local target = Players:FindFirstChild(playerName)
    if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
        local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            hrp.CFrame = target.Character.HumanoidRootPart.CFrame + Vector3.new(0, 5, 0) -- Slight offset to avoid collision
        end
    else
        StarterGui:SetCore("SendNotification", {
            Title = "Teleport Failed",
            Text = "Player not found or not loaded.",
            Duration = 4
        })
    end
end

--// MessageBox UI
local function showTeleportBox()
    local screenGui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
    screenGui.Name = "TeleportBox"

    local textBox = Instance.new("TextBox", screenGui)
    textBox.Size = UDim2.new(0, 300, 0, 50)
    textBox.Position = UDim2.new(0.5, -150, 0.5, -25)
    textBox.PlaceholderText = "Enter player name..."
    textBox.TextScaled = true
    textBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    textBox.ClearTextOnFocus = false

    textBox.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            teleportToPlayer(textBox.Text)
            screenGui:Destroy()
        end
    end)
end

--// Toggle Integration
local Toggle = MainTab:CreateButton({
    Name = "Teleport",
    CurrentValue = false,
    Flag = "TeleportToggle",
    Callback = function(Value)
        if Value then
            showTeleportBox()
        end
    end,
})                                                                                  
local GodmodeToggle = MainTab:CreateToggle({
    Name = "Godmode",
    CurrentValue = false,
    Flag = "Toggle6",
    Callback = function(Value)
        if Value then
            enableGodmode()
        else
            disableGodmode()
        end
    end,
})

-- Define what Godmode actually does
function enableGodmode()
    -- Example: Make player invincible
    local player = game.Players.LocalPlayer
    if player.Character then
        for _, part in pairs(player.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = true
                part.Anchored = false
            end
        end
        player.Character.Humanoid.Health = math.huge
        player.Character.Humanoid.MaxHealth = math.huge
    end
end

function disableGodmode()
    -- Example: Restore normal health
    local player = game.Players.LocalPlayer
    if player.Character then
        player.Character.Humanoid.MaxHealth = 100
        player.Character.Humanoid.Health = 100
    end
end

local InvisibleToggle = MainTab:CreateToggle({
    Name = "Invisible",
    CurrentValue = false,
    Flag = "Toggle7",
    Callback = function(Value)
        if Value then
            makeInvisible()
        else
            makeVisible()
        end
    end,
})

-- Function to make the character invisible
function makeInvisible()
    local player = game.Players.LocalPlayer
    if player.Character then
        for _, part in pairs(player.Character:GetDescendants()) do
            if part:IsA("BasePart") or part:IsA("Decal") then
                part.Transparency = 1
            end
        end
        player.Character.Humanoid.NameDisplayDistance = 0
    end
end

-- Function to restore visibility
function makeVisible()
    local player = game.Players.LocalPlayer
    if player.Character then
        for _, part in pairs(player.Character:GetDescendants()) do
            if part:IsA("BasePart") or part:IsA("Decal") then
                part.Transparency = 0
            end
        end
        player.Character.Humanoid.NameDisplayDistance = 100
    end
end

local NoclipToggle = MainTab:CreateToggle({
    Name = "Noclip",
    CurrentValue = false,
    Flag = "Toggle8",
    Callback = function(Value)
        if Value then
            enableNoclip()
        else
            disableNoclip()
        end
    end,
})

-- Variables to manage the noclip loop
local noclipConnection

-- Function to enable noclip
function enableNoclip()
    local player = game.Players.LocalPlayer
    noclipConnection = game:GetService("RunService").Stepped:Connect(function()
        if player.Character then
            for _, part in pairs(player.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end
    end)
end

-- Function to disable noclip
function disableNoclip()
    if noclipConnection then
        noclipConnection:Disconnect()
        noclipConnection = nil
    end

    local player = game.Players.LocalPlayer
    if player.Character then
        for _, part in pairs(player.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = true
            end
        end
    end
end

local BoostToggle = MainTab:CreateToggle({
    Name = "Vehicle Speed Boost",
    CurrentValue = false,
    Flag = "Toggle9",
    Callback = function(Value)
        if Value then
            enableBoost()
        else
            disableBoost()
        end
    end,
})
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local velocityMultiplier = 0.015
local boostConnection

function enableBoost()
    boostConnection = RunService.Stepped:Connect(function()
        local Character = LocalPlayer.Character
        if Character then
            local Humanoid = Character:FindFirstChildWhichIsA("Humanoid")
            if Humanoid then
                local SeatPart = Humanoid.SeatPart
                if SeatPart and SeatPart:IsA("VehicleSeat") then
                    SeatPart.AssemblyLinearVelocity *= Vector3.new(1 + velocityMultiplier, 1, 1 + velocityMultiplier)
                end
            end
        end
    end)
end

function disableBoost()
    if boostConnection then
        boostConnection:Disconnect()
        boostConnection = nil
    end
end