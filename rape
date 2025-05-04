
-- sky vr with Permadeath integration

-- GUI Loader Setup
local loader = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local ImageLabel = Instance.new("ImageLabel")
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
local loader_2 = Instance.new("ImageLabel")A
local UICorner = Instance.new("UICorner")
local t = Instance.new("ImageLabel")
local UICorner_2 = Instance.new("UICorner")
local TextLabel = Instance.new("TextLabel")
local UICorner_3 = Instance.new("UICorner")
local errorr = Instance.new("TextLabel")

do
    loader.Name = "loader"
    loader.Parent = game.CoreGui
    loader.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    Frame.Parent = loader
    Frame.AnchorPoint = Vector2.new(0.5, 0.5)
    Frame.BackgroundTransparency = 1
    Frame.BorderSizePixel = 0
    Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
    Frame.Size = UDim2.new(0.08244, 0, 0.16313, 0)

    ImageLabel.Parent = Frame
    ImageLabel.BackgroundTransparency = 1
    ImageLabel.Position = UDim2.new(-0.93243, 0, -1.41268, 0)
    ImageLabel.Size = UDim2.new(2.86, 0, 2.86, 0)
    ImageLabel.Image = "http://www.roblox.com/asset/?id=17137351841"

    UIAspectRatioConstraint.Parent = Frame
    UIAspectRatioConstraint.AspectRatio = 0.988

    loader_2.Name = "loader"
    loader_2.Parent = Frame
    loader_2.BackgroundColor3 = Color3.fromRGB(148, 148, 148)
    loader_2.BorderSizePixel = 0
    loader_2.Position = UDim2.new(-0.26, 0, 0.9, 0)
    loader_2.Size = UDim2.new(1.5, 0, 0.23, 0)
    loader_2.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
    loader_2.ImageTransparency = 1

    UICorner.Parent = loader_2
    UICorner.CornerRadius = UDim.new(1, 100000)

    t.Name = "t"
    t.Parent = loader_2
    t.BackgroundColor3 = Color3.fromRGB(0, 255, 102)
    t.BorderSizePixel = 0
    t.Size = UDim2.new(1, 0, 1, 0)
    t.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
    t.ImageTransparency = 1

    UICorner_2.Parent = t
    UICorner_2.CornerRadius = UDim.new(1, 100000)

    TextLabel.Parent = loader_2
    TextLabel.BackgroundTransparency = 1
    TextLabel.Size = UDim2.new(1, 0, 1, 0)
    TextLabel.Font = Enum.Font.TitilliumWeb
    TextLabel.Text = "Ready!"
    TextLabel.TextScaled = true
    TextLabel.TextWrapped = true

    UICorner_3.Parent = TextLabel
    UICorner_3.CornerRadius = UDim.new(1, 100000)

    errorr.Name = "error"
    errorr.Parent = Frame
    errorr.BackgroundTransparency = 1
    errorr.Position = UDim2.new(-1.0777, 0, 0.74733, 0)
    errorr.Size = UDim2.new(3.1554, 0, 0.52442, 0)
    errorr.Visible = false
    errorr.Font = Enum.Font.Unknown
    errorr.Text = "VR is required for this script"
    errorr.TextColor3 = Color3.fromRGB(255, 20, 20)
    errorr.TextScaled = true
    errorr.TextStrokeTransparency = 0
    errorr.TextWrapped = true
end

-- Global settings
local global = getgenv()

TextLabel.Text = "Loading..."
t:TweenSize(UDim2.new(0,0,1,0), nil, Enum.EasingStyle.Linear, 0)
wait(0.01)
t:TweenSize(UDim2.new(0.3,0,1,0), nil, Enum.EasingStyle.Linear, 0.8)
wait(0.81)

if not game:GetService("UserInputService").VREnabled and not getgenv().fullbody then
    errorr.Visible = true
    t.Parent.Visible = false
    wait(5)
    loader:Destroy()
    return
end

if getgenv().skyVRversion ~= '3.0.0' then
    errorr.Text = "Please update your script loader!"
    errorr.Visible = true
    t.Parent.Visible = false
    wait(5)
    loader:Destroy()
    return
end

t:TweenSize(UDim2.new(1,0,1,0), nil, Enum.EasingStyle.Linear, 0.1)
wait(0.06)

if getgenv().HATDROP and not getgenv().fullbody then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/presidentanvil/skyvr/main/SkyVRHatdrop.lua"))()
    TextLabel.Text = "Ready!"
    task.delay(5, function() loader:Destroy() end)
    return
end

if getgenv().fullbody then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/presidentanvil/skyvr/main/SkyVRFullbody.lua"))()
    TextLabel.Text = "Ready!"
    task.delay(5, function() loader:Destroy() end)
    return
end

-- Permadeath & Respawn Functions
local function Permadeath()
    local pr = game.Players.LocalPlayer
    local ch = pr.Character
    local model = Instance.new("Model", workspace)
    model.Name = pr.Name .. "_Ghost"
    local torso = Instance.new("Part", model)
    torso.Name = "Torso"
    torso.Anchored = true
    torso.CanCollide = false
    local head = Instance.new("Part", model)
    head.Name = "Head"
    head.Anchored = true
    head.CanCollide = false
    local hum = Instance.new("Humanoid", model)
    hum.Name = "Humanoid"
    torso.Position = Vector3.new(0,9999,0)
    head.Position = Vector3.new(0,9991,0)
    warn("Player perma-dead.")
end

local function Respawn()
    local pr = game.Players.LocalPlayer
    local newModel = Instance.new("Model", workspace)
    newModel.Name = pr.Name .. "_Respawn"
    local torso = Instance.new("Part", newModel)
    torso.Name = "Torso"
    torso.Anchored = true
    torso.CanCollide = false
    local head = Instance.new("Part", newModel)
    head.Name = "Head"
    head.Anchored = true
    head.CanCollide = false
    local hum = Instance.new("Humanoid", newModel)
    hum.Name = "Humanoid"
    torso.Position = Vector3.new(0,9999,0)
    head.Position = Vector3.new(0,9991,0)
    wait(game.Players.RespawnTime)
    warn("Player respawned.")
end

-- Core Sky VR Setup
local plr = game.Players.LocalPlayer
local input = game:GetService("UserInputService")

local function createpart(size, name, outline)
    local Part = Instance.new("Part")
    if outline and global.options.outlinesEnabled then
        local sel = Instance.new("SelectionBox")
        sel.Adornee = Part
        sel.LineThickness = 0.05
        sel.Parent = Part
    end
    Part.Parent = workspace
    Part.CFrame = plr.Character.HumanoidRootPart.CFrame
    Part.Size = size
    Part.Transparency = 1
    Part.CanCollide = false
    Part.Anchored = true
    Part.Name = name
    return Part
end

local lefthandpart = createpart(Vector3.new(2,1,1), "moveLH", true)
local righthandpart = createpart(Vector3.new(2,1,1), "moveRH", true)
local headpart = createpart(Vector3.new(1,1,1), "moveH", false)
-- (rest of toy and thirdperson parts)

-- Alignment function
local function Align(Part1, Part0, CFrameOffset)
    local con
    con = game:GetService("RunService").PostSimulation:Connect(function()
        if not Part1:IsDescendantOf(workspace) then con:Disconnect() return end
        if not isnetworkowner(Part1) then return end
        Part1.CFrame = Part0.CFrame * CFrameOffset
        Part1.Velocity = global.options.NetVelocity
    end)
    return con
end

-- FE Script for accessories
local function FEScript(char)
    local seen = {}
    for _, v in ipairs(char:GetDescendants()) do
        if not v:IsA("Accessory") then continue end
        local mesh = v.Handle:FindFirstChildOfClass("SpecialMesh") or v.Handle
        local meshId = mesh.MeshId or ""
        -- attachment logic...
    end
end

-- Initial cleanup & reanimation
for _, v in ipairs(plr.Character.HumanoidRootPart:GetChildren()) do
    if v:IsA("Sound") then v.Volume = 0 end
end
if plr.Character:FindFirstChild("Head") then plr.Character.Head:Destroy() end
plr.Character.Humanoid.Health = 0

game:GetService("RunService").PostSimulation:connect(function()
    for _, v in ipairs(plr.Character:GetDescendants()) do
        if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" then
            v.Velocity = global.options.NetVelocity
        end
    end
end)

FEScript(plr.Character)

plr.CharacterAdded:Connect(function(char)
    task.wait(0.25)
    for _, v in ipairs(char:GetDescendants()) do
        if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" then
            v.Velocity = global.options.NetVelocity
        end
        if v:IsA("Sound") then v.Volume = 0 end
    end
    char.Humanoid.Health = 0
    FEScript(char)
end)

TextLabel.Text = "Ready!"
task.delay(5, function() loader:Destroy() end)

-- VR camera handling
coroutine.wrap(function()
    local cam = workspace.CurrentCamera
    cam:GetPropertyChangedSignal("CFrame"):Connect(function()
        cam.CameraType = "Scriptable"
        cam.HeadScale = global.options.headscale
    end)
end)()

local cam = workspace.CurrentCamera
cam.CameraType = "Scriptable"
cam.HeadScale = global.options.headscale

game:GetService("StarterGui"):SetCore("VREnableControllerModels", false)

input.UserCFrameChanged:connect(function(part, move)
    cam.CameraType = "Scriptable"
    cam.HeadScale = global.options.headscale
    pcall(function()
        if part == Enum.UserCFrame.Head then
            headpart.CFrame = cam.CFrame * (CFrame.new(move.p*(cam.HeadScale-1))*move)
        elseif part == Enum.UserCFrame.LeftHand then
            lefthandpart.CFrame = cam.CFrame * (CFrame.new(move.p*(cam.HeadScale-1))*move)
        elseif part == Enum.UserCFrame.RightHand then
            righthandpart.CFrame = cam.CFrame * (CFrame.new(move.p*(cam.HeadScale-1))*move)
        end
    end)
end)

input.InputBegan:connect(function(key)
    if key.KeyCode == Enum.KeyCode.ButtonR1 then R1down = true end
end)

input.InputEnded:connect(function(key)
    if key.KeyCode == Enum.KeyCode.ButtonR1 then R1down = false end
end)

game:GetService("RunService").RenderStepped:connect(function()
    if R1down then
        cam.CFrame = cam.CFrame:Lerp(cam.CFrame + (righthandpart.CFrame.LookVector * cam.HeadScale/2), 0.5)
    end
end)

-- Permadeath hooking
plr.Character:WaitForChild("Humanoid").Died:Connect(function()
    Permadeath()
end)

game.Players.LocalPlayer.CharacterAdded:Connect(function(char)
    Respawn()
end)
