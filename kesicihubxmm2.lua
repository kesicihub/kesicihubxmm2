-- // KESICI HUB LITE - KEY SYSTEM EDITION \\ --
-- // 0% FPS DROP - CUSTOM UI & SECURITY \\ --

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- Global Ayarlar
local _G = {
    ESP = false,
    InfJump = false,
    Fly = false,
    Noclip = false,
    FlySpeed = 50,
    IsVerified = false
}

-- // KASMAYAN UI OLUŞTURMA \\ --
local KesiciUI = Instance.new("ScreenGui")
KesiciUI.Name = "KesiciHubLite"
KesiciUI.Parent = CoreGui

-- ==========================================
-- // KEY SİSTEMİ EKRANI \\ --
-- ==========================================
local KeyFrame = Instance.new("Frame")
KeyFrame.Size = UDim2.new(0, 250, 0, 160)
KeyFrame.Position = UDim2.new(0.5, -125, 0.5, -80)
KeyFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
KeyFrame.BorderSizePixel = 2
KeyFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)
KeyFrame.Parent = KesiciUI
KeyFrame.Active = true
KeyFrame.Draggable = true

local KeyTitle = Instance.new("TextLabel")
KeyTitle.Size = UDim2.new(1, 0, 0, 30)
KeyTitle.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
KeyTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyTitle.Text = "KESİCİ HUB - LOGIN"
KeyTitle.Font = Enum.Font.GothamBold
KeyTitle.TextSize = 14
KeyTitle.Parent = KeyFrame

-- OTOMATİK KOPYALAYAN DİSCORD BUTONU BURAYA EKLENDİ!
local DiscordBtn = Instance.new("TextButton")
DiscordBtn.Size = UDim2.new(0.8, 0, 0, 25)
DiscordBtn.Position = UDim2.new(0.1, 0, 0.25, 0)
DiscordBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242) -- Discord Rengi
DiscordBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
DiscordBtn.Text = "📋 Copy Discord Link"
DiscordBtn.Font = Enum.Font.GothamBold
DiscordBtn.TextSize = 12
DiscordBtn.Parent = KeyFrame
local cornerDisc = Instance.new("UICorner", DiscordBtn)
cornerDisc.CornerRadius = UDim.new(0, 5)

local KeyInput = Instance.new("TextBox")
KeyInput.Size = UDim2.new(0.8, 0, 0, 30)
KeyInput.Position = UDim2.new(0.1, 0, 0.48, 0)
KeyInput.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.PlaceholderText = "Enter Key Here..."
KeyInput.Text = ""
KeyInput.Font = Enum.Font.Gotham
KeyInput.TextSize = 14
KeyInput.Parent = KeyFrame
local cornerInput = Instance.new("UICorner", KeyInput)
cornerInput.CornerRadius = UDim.new(0, 5)

local VerifyBtn = Instance.new("TextButton")
VerifyBtn.Size = UDim2.new(0.8, 0, 0, 30)
VerifyBtn.Position = UDim2.new(0.1, 0, 0.72, 0)
VerifyBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
VerifyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
VerifyBtn.Text = "VERIFY KEY"
VerifyBtn.Font = Enum.Font.GothamBold
VerifyBtn.TextSize = 14
VerifyBtn.Parent = KeyFrame
local cornerBtn = Instance.new("UICorner", VerifyBtn)
cornerBtn.CornerRadius = UDim.new(0, 5)

-- ==========================================
-- // ANA MENÜ VE BUTONLAR (BAŞLANGIÇTA GİZLİ) \\ --
-- ==========================================
local MenuToggleBtn = Instance.new("TextButton")
MenuToggleBtn.Size = UDim2.new(0, 50, 0, 50)
MenuToggleBtn.Position = UDim2.new(0, 10, 0.5, -60)
MenuToggleBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MenuToggleBtn.TextColor3 = Color3.fromRGB(255, 0, 0)
MenuToggleBtn.Text = "🔪"
MenuToggleBtn.TextSize = 25
MenuToggleBtn.Visible = false 
MenuToggleBtn.Parent = KesiciUI
local uiCorner1 = Instance.new("UICorner", MenuToggleBtn)
uiCorner1.CornerRadius = UDim.new(1, 0)

local NoclipBtn = Instance.new("TextButton")
NoclipBtn.Size = UDim2.new(0, 50, 0, 50)
NoclipBtn.Position = UDim2.new(0, 10, 0.5, 0)
NoclipBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
NoclipBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
NoclipBtn.Text = "NOC"
NoclipBtn.TextSize = 15
NoclipBtn.Font = Enum.Font.Code
NoclipBtn.Visible = false 
NoclipBtn.Parent = KesiciUI
local uiCorner2 = Instance.new("UICorner", NoclipBtn)
uiCorner2.CornerRadius = UDim.new(1, 0)

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 200, 0, 250)
MainFrame.Position = UDim2.new(0.5, -100, 0.5, -125)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.BorderSizePixel = 2
MainFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)
MainFrame.Visible = false
MainFrame.Parent = KesiciUI
MainFrame.Active = true
MainFrame.Draggable = true 

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Text = "KESİCİ HUB LITE"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 14
Title.Parent = MainFrame

local function CreateButton(text, yPos, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.9, 0, 0, 35)
    btn.Position = UDim2.new(0.05, 0, 0, yPos)
    btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Text = text
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 14
    btn.Parent = MainFrame
    local corner = Instance.new("UICorner", btn)
    corner.CornerRadius = UDim.new(0, 5)
    btn.MouseButton1Click:Connect(callback)
    return btn
end

-- // MOTORLAR (SADECE ONAYDAN SONRA ÇALIŞIR) \\ --
local function UpdateChams()
    for _, v in pairs(Players:GetPlayers()) do
        if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
            local isMurD, isSheriff = false, false
            local function Check(item)
                if item:IsA("Tool") then
                    if item.Name == "Knife" or item:FindFirstChild("KnifeScript") then isMurD = true
                    elseif item.Name == "Gun" or item:FindFirstChild("GunScript") then isSheriff = true end
                end
            end
            for _, item in pairs(v.Character:GetChildren()) do Check(item) end
            if v:FindFirstChild("Backpack") then
                for _, item in pairs(v.Backpack:GetChildren()) do Check(item) end
            end
            
            local clr = Color3.fromRGB(0, 255, 0) 
            if isMurD then clr = Color3.fromRGB(255, 0, 0) 
            elseif isSheriff then clr = Color3.fromRGB(0, 0, 255) end 
            
            local hl = v.Character:FindFirstChild("KesiciChams")
            if not hl then
                hl = Instance.new("Highlight")
                hl.Name = "KesiciChams"
                hl.Parent = v.Character
                hl.FillTransparency = 0.5
                hl.OutlineTransparency = 0.2
            end
            hl.FillColor = clr
            hl.OutlineColor = clr
        end
    end
end

task.spawn(function()
    while task.wait(1) do 
        if _G.ESP and _G.IsVerified then UpdateChams() end
    end
end)

UserInputService.JumpRequest:Connect(function()
    if _G.InfJump and _G.IsVerified and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

RunService.Stepped:Connect(function()
    if _G.Noclip and _G.IsVerified and LocalPlayer.Character then
        for _, p in pairs(LocalPlayer.Character:GetDescendants()) do
            if p:IsA("BasePart") then p.CanCollide = false end
        end
    end
end)

local flyBv, flyGy
local function ToggleFly(state)
    local char = LocalPlayer.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    local hrp = char.HumanoidRootPart
    
    if state then
        flyBv = Instance.new("BodyVelocity", hrp)
        flyBv.Velocity = Vector3.new(0, 0, 0)
        flyBv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
        flyGy = Instance.new("BodyGyro", hrp)
        flyGy.P = 9e4
        flyGy.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
        flyGy.CFrame = hrp.CFrame
        
        task.spawn(function()
            while _G.Fly and _G.IsVerified and char and char:FindFirstChild("Humanoid") do
                local humanoid = char.Humanoid
                local moveDir = humanoid.MoveDirection
                if moveDir.Magnitude > 0 then
                    flyBv.Velocity = (Camera.CFrame.LookVector * (moveDir.Z * -1) + Camera.CFrame.RightVector * moveDir.X + Camera.CFrame.LookVector * moveDir.Z) * _G.FlySpeed
                    flyBv.Velocity = Camera.CFrame.LookVector * (moveDir.Z <= 0 and 1 or -1) * _G.FlySpeed * math.abs(moveDir.Z) + Camera.CFrame.RightVector * moveDir.X * _G.FlySpeed
                else
                    flyBv.Velocity = Vector3.new(0, 0, 0)
                end
                flyGy.CFrame = Camera.CFrame
                task.wait()
            end
        end)
    else
        if flyBv then flyBv:Destroy() end
        if flyGy then flyGy:Destroy() end
    end
end

-- // KOPYALAMA İŞLEMİ \\ --
DiscordBtn.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard("https://discord.gg/ababtVNjTb")
        DiscordBtn.Text = "✅ Copied to Clipboard!"
        DiscordBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
        task.wait(1.5)
        DiscordBtn.Text = "📋 Copy Discord Link"
        DiscordBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
    else
        DiscordBtn.Text = "❌ Not Supported"
        DiscordBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        task.wait(1.5)
        DiscordBtn.Text = "📋 Copy Discord Link"
        DiscordBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
    end
end)

-- // KEY DOĞRULAMA MANTIĞI \\ --
VerifyBtn.MouseButton1Click:Connect(function()
    if KeyInput.Text == "kesicihubxmm2" then
        _G.IsVerified = true
        KeyFrame:Destroy() 
        MenuToggleBtn.Visible = true 
        NoclipBtn.Visible = true 
        MainFrame.Visible = true 
    else
        VerifyBtn.Text = "INVALID KEY!"
        VerifyBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        task.wait(1.5)
        VerifyBtn.Text = "VERIFY KEY"
        VerifyBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    end
end)

-- // MENÜ BUTONLARI \\ --
MenuToggleBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

NoclipBtn.MouseButton1Click:Connect(function()
    _G.Noclip = not _G.Noclip
    if _G.Noclip then
        NoclipBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    else
        NoclipBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    end
end)

CreateButton("ESP/Chams: OFF", 40, function()
    _G.ESP = not _G.ESP
    if _G.ESP then
        MainFrame:GetChildren()[2].Text = "ESP/Chams: ON"
        MainFrame:GetChildren()[2].TextColor3 = Color3.fromRGB(0, 255, 0)
    else
        MainFrame:GetChildren()[2].Text = "ESP/Chams: OFF"
        MainFrame:GetChildren()[2].TextColor3 = Color3.fromRGB(255, 255, 255)
        for _, v in pairs(Players:GetPlayers()) do
            if v.Character and v.Character:FindFirstChild("KesiciChams") then
                v.Character.KesiciChams:Destroy()
            end
        end
    end
end)

CreateButton("Inf Jump: OFF", 85, function()
    _G.InfJump = not _G.InfJump
    if _G.InfJump then
        MainFrame:GetChildren()[3].Text = "Inf Jump: ON"
        MainFrame:GetChildren()[3].TextColor3 = Color3.fromRGB(0, 255, 0)
    else
        MainFrame:GetChildren()[3].Text = "Inf Jump: OFF"
        MainFrame:GetChildren()[3].TextColor3 = Color3.fromRGB(255, 255, 255)
    end
end)

CreateButton("Fly: OFF", 130, function()
    _G.Fly = not _G.Fly
    if _G.Fly then
        MainFrame:GetChildren()[4].Text = "Fly: ON"
        MainFrame:GetChildren()[4].TextColor3 = Color3.fromRGB(0, 255, 0)
    else
        MainFrame:GetChildren()[4].Text = "Fly: OFF"
        MainFrame:GetChildren()[4].TextColor3 = Color3.fromRGB(255, 255, 255)
    end
    ToggleFly(_G.Fly)
end)

CreateButton("Noclip: OFF", 175, function()
    _G.Noclip = not _G.Noclip
    if _G.Noclip then
        MainFrame:GetChildren()[5].Text = "Noclip: ON"
        MainFrame:GetChildren()[5].TextColor3 = Color3.fromRGB(0, 255, 0)
        NoclipBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    else
        MainFrame:GetChildren()[5].Text = "Noclip: OFF"
        MainFrame:GetChildren()[5].TextColor3 = Color3.fromRGB(255, 255, 255)
        NoclipBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    end
end)
