-- sky vr with Permadeath integrationfsgdhf

-- GUI Loader Setup
local loader = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local ImageLabel = Instance.new("ImageLabel")
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
local loader_2 = Instance.new("ImageLabel")
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
    Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
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
    TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel.TextScaled = true
    TextLabel.TextWrapped = true

    UICorner_3.Parent = TextLabel
    UICorner_3.CornerRadius = UDim.new(1, 100000)

    errorr.Name = "error"
    errorr.Parent = Frame
    errorr.BackgroundTransparency = 1
    errorr.Position = UDim2.new(-1.07771, 0, 0.74733, 0)
    errorr.Size = UDim2.new(3.15543, 0, 0.52442, 0)
    errorr.Visible = false
    errorr.Font = Enum.Font.Unknown
    errorr.Text = "VR is required for this script"
    errorr.TextColor3 = Color3.fromRGB(255, 20, 20)
    errorr.TextScaled = true
    errorr.TextStrokeTransparency = 0
    errorr.TextWrapped = true
end

-- Global environment
local global = getgenv()

-- Loader animation
TextLabel.Text = "Loading..."
t:TweenSize(UDim2.new(0,0,1,0), nil, Enum.EasingStyle.Linear, 0)
wait(0.01)
t:TweenSize(UDim2.new(0.3,0,1,0), nil, Enum.EasingStyle.Linear, 0.8)
wait(0.81)

-- VR and version checks
if not game:GetService("UserInputService").VREnabled and not global.fullbody then
    errorr.Visible = true
t.Parent.Visible = false
    wait(5)
    loader:Destroy()
    return
end
if global.skyVRversion ~= '3.0.0' then
    errorr.Text = "Please update your script loader!"
    errorr.Visible = true
t.Parent.Visible = false
    wait(5)
    loader:Destroy()
    return
end

t:TweenSize(UDim2.new(1,0,1,0), nil, Enum.EasingStyle.Linear, 0.1)
wait(0.06)

-- Load alternate modes
if global.HATDROP and not global.fullbody then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/presidentanvil/skyvr/main/SkyVRHatdrop.lua"))()
    TextLabel.Text = "Ready!"
    task.delay(5, function() loader:Destroy() end)
    return
end
if global.fullbody then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/presidentanvil/skyvr/main/SkyVRFullbody.lua"))()
    TextLabel.Text = "Ready!"
    task.delay(5, function() loader:Destroy() end)
    return
end

-- Integrate Permadeath & Respawn
local function Permadeath()
    local pr = game.Players.LocalPlayer
    local ch = pr.Character
    local mdl = Instance.new("Model", workspace)
    mdl.Name = pr.Name .. "_Ghost"
    local torso = Instance.new("Part", mdl)
    torso.Name = "Torso" torso.Anchored = true torso.CanCollide = false torso.Position = Vector3.new(0,9999,0)
    local head = Instance.new("Part", mdl)
    head.Name = "Head" head.Anchored = true head.CanCollide = false head.Position = Vector3.new(0,9991,0)
    local hum = Instance.new("Humanoid", mdl) hum.Name = "Humanoid"
    warn("Player perma-dead.")
end

local function Respawn()
    local pr = game.Players.LocalPlayer
    local mdl = Instance.new("Model", workspace)
    mdl.Name = pr.Name .. "_Respawn"
    local torso = Instance.new("Part", mdl)
    torso.Name = "Torso" torso.Anchored = true torso.CanCollide = false torso.Position = Vector3.new(0,9999,0)
    local head = Instance.new("Part", mdl)
    head.Name = "Head" head.Anchored = true head.CanCollide = false head.Position = Vector3.new(0,9991,0)
    local hum = Instance.new("Humanoid", mdl) hum.Name = "Humanoid"
    wait(game.Players.RespawnTime)
    warn("Player respawned.")
end

-- Original Sky VR core below:

local plr = game.Players.LocalPlayer
local input = game:GetService("UserInputService")

function createpart(size, name, outline)
    local Part = Instance.new("Part")
    if outline and global.options.outlinesEnabled then
        local Sel = Instance.new("SelectionBox") Sel.Adornee = Part Sel.LineThickness = 0.05 Sel.Parent = Part
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
local lefttoypart = createpart(Vector3.new(1,1,1), "LToy", true)
local righttoypart = createpart(Vector3.new(1,1,1), "RToy", true)
local thirdpersonpart = createpart(Vector3.new(1,1,1), "thirdpersonpart", false)
local thirdperson = false
local lefttoyenable = false
local righttoyenable = false
local lfirst = true
local rfirst = true
local ltoypos = CFrame.new(1.15,0,0) * CFrame.Angles(0,math.rad(180),0)
local rtoypos = CFrame.new(1.15,0,0) * CFrame.Angles(0,math.rad(0),0)

function Align(Part1,Part0,CFrameOffset)
    local con; con = game:GetService("RunService").PostSimulation:Connect(function()
        if not Part1:IsDescendantOf(workspace) then con:Disconnect() return end
        if not isnetworkowner or not isnetworkowner(Part1) then return end
        Part1.CanCollide = false
        Part1.CFrame = Part0.CFrame * CFrameOffset
        Part1.Velocity = global.options.NetVelocity
    end)
    return con
end

function filterMeshID(id)
    return (string.find(id,'assetdelivery')~=nil and string.match(string.sub(id,37),"%d+")) or string.match(id,"%d+")
end

function findMeshID(id)
    for i,v in pairs(global.headhats) do if i=="meshid:"..id then return true, headpart, v end end
    if global.right=="meshid:"..id then return true, righthandpart, CFrame.new() end
    if global.left=="meshid:"..id then return true, lefthandpart, CFrame.new() end
    if global.options.leftToy=="meshid:"..id then return true, lefttoypart, CFrame.new() end
    if global.options.rightToy=="meshid:"..id then return true, righttoypart, CFrame.new() end
    return false
end

function findHatName(name)
    for i,v in pairs(global.headhats) do if i==name then return true, headpart, v end end
    if global.right==name then return true, righthandpart, CFrame.new() end
    if global.left==name then return true, lefthandpart, CFrame.new() end
    if global.options.leftToy==name then return true, lefttoypart, CFrame.new() end
    if global.options.rightToy==name then return true, righttoypart, CFrame.new() end
    return false
end

function FEScript(char)
    local found = {}
    for _, accessory in ipairs(char:GetDescendants()) do
        if not accessory:IsA("Accessory") then continue end
        local mesh = accessory.Handle:FindFirstChildOfClass("SpecialMesh") or accessory.Handle
        local id = filterMeshID(mesh.MeshId or "")
        if found[id] then continue end
        found[id] = true
        local ok, part, cf = findMeshID(id)
        if ok then
            Align(accessory.Handle, part, cf)
            accessory.Handle.Transparency = (part==headpart and global.options.HeadHatTransparency) or 0
        else
            local ok2, p2, cf2 = findHatName(accessory.Name)
            if ok2 then
                Align(accessory.Handle, p2, cf2)
                accessory.Handle.Transparency = (p2==headpart and global.options.HeadHatTransparency) or 0
            end
        end
    end
end

-- Initial R15 Cleanup & Reanimation
for _, s in ipairs(plr.Character.HumanoidRootPart:GetChildren()) do if s:IsA("Sound") then s.Volume = 0 end end
if plr.Character:FindFirstChild("Head") then plr.Character.Head:Destroy() end
plr.Character.Humanoid.Health = 0

game:GetService("RunService").PostSimulation:Connect(function()
    for _, v in ipairs(plr.Character:GetDescendants()) do
        if v:IsA("BasePart") and v.Name~= "HumanoidRootPart" then v.Velocity = global.options.NetVelocity end
    end
end)
FEScript(plr.Character)
plr.CharacterAdded:Connect(function(char)
    wait(0.25)
    for _, s in ipairs(char:GetDescendants()) do if s:IsA("Sound") then s.Volume=0 end end
    char.Humanoid.Health = 0
    FEScript(char)
end)

-- Finalize Loader
TextLabel.Text = "Ready!"
task.delay(5,function() loader:Destroy() end)

-- VR Handler
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

input.UserCFrameChanged:Connect(function(part, move)
    cam.CameraType = "Scriptable"
    cam.HeadScale = global.options.headscale
    pcall(function()
        if part==Enum.UserCFrame.Head then
            headpart.CFrame = cam.CFrame*(CFrame.new(move.p*(cam.HeadScale-1))*move)
        elseif part==Enum.UserCFrame.LeftHand then
            lefthandpart.CFrame = cam.CFrame*(CFrame.new(move.p*(cam.HeadScale-1))*move*CFrame.Angles(math.rad(global.options.lefthandrotoffset.X),math.rad(global.options.lefthandrotoffset.Y),math.rad(global.options.lefthandrotoffset.Z)))
            if lefttoyenable then lefttoypart.CFrame = lefthandpart.CFrame*ltoypos end
        elseif part==Enum.UserCFrame.RightHand then
            righthandpart.CFrame = cam.CFrame*(CFrame.new(move.p*(cam.HeadScale-1))*move*CFrame.Angles(math.rad(global.options.righthandrotoffset.X),math.rad(global.options.righthandrotoffset.Y),math.rad(global.options.righthandrotoffset.Z)))
            if righttoyenable then righttoypart.CFrame = righthandpart.CFrame*rtoypos end
        end
    end)
end)

input.InputBegan:Connect(function(key)
    if key.KeyCode==global.options.thirdPersonButtonToggle then thirdperson = not thirdperson end
    if key.KeyCode==Enum.KeyCode.ButtonR1 then R1down=true end
    if key.KeyCode==global.options.leftToyBind then
        if not lfirst then ltoypos = lefttoypart.CFrame:ToObjectSpace(lefthandpart.CFrame):Inverse() end
        lfirst=false lefttoyenable = not lefttoyenable
    end
    if key.KeyCode==global.options.rightToyBind then
        if not rfirst then rtoypos = righttoypart.CFrame:ToObjectSpace(righthandpart.CFrame):Inverse() end
        rfirst=false righttoyenable = not righttoyenable
    end
end)

input.InputEnded:Connect(function(key)
    if key.KeyCode==Enum.KeyCode.ButtonR1 then R1down=false end
end)

game:GetService("RunService").RenderStepped:Connect(function()
    if R1down then
        cam.CFrame = cam.CFrame:Lerp(cam.CFrame + (righthandpart.CFrame * CFrame.Angles(math.rad(global.options.controllerRotationOffset.X-global.options.righthandrotoffset.X),
            math.rad(global.options.controllerRotationOffset.Y-global.options.righthandrotoffset.Y),
            math.rad(global.options.controllerRotationOffset.Z-global.options.righthandrotoffset.Z))).LookVector * cam.HeadScale/2, 0.5)
    end
end)

-- Death & Respawn hooks
plr.Character:WaitForChild("Humanoid").Died:Connect(Permadeath)
plr.CharacterAdded:Connect(Respawn)
