--[[ 
    🔥 HÙNG FORSAKEN HUB V1.6 - ULTIMATE GHOST 🔥
    - Security: Numeric Bytecode (Vừa phải, không lag)
    - Feature: Xóa sạch Particle, Trail, Beam trong bán kính 3m
    - Status: 100% Invisible
]]

local function _0xH(d)
    local r = ""
    for b in d:gmatch("%d+") do r = r .. string.char(tonumber(b)) end
    return r
end

-- Logic V1.6 đã fix lỗi hiệu ứng lộ vị trí
local _0xLogic = [[
local P = game:GetService("Players")
local R = game:GetService("RunService")
local C = game:GetService("CoreGui")
local L = P.LocalPlayer
local U = {G = false, S = false, U = false}

-- 1. WATERMARK RGB
local function CreateWM()
    if C:FindFirstChild("ForsakenWM") then C.ForsakenWM:Destroy() end
    local wm = Instance.new("ScreenGui", C); wm.Name = "ForsakenWM"
    local lb = Instance.new("TextLabel", wm)
    lb.Size = UDim2.new(0,300,0,50); lb.Position = UDim2.new(1,-310,1,-60); lb.BackgroundTransparency = 1
    lb.Font = Enum.Font.SourceSansBold; lb.TextSize = 25; lb.TextXAlignment = 2
    R.RenderStepped:Connect(function()
        lb.Text = "HÙNG FORSAKEN V1.6"
        lb.TextColor3 = Color3.fromHSV(tick()%2.5/2.5, 0.8, 1)
    end)
end
task.spawn(CreateWM)

-- 2. LOGIC GHOST + ANTI-EFFECT (XÓA HIỆU ỨNG 3M)
R.Heartbeat:Connect(function()
    if not L.Character or not L.Character:FindFirstChild("HumanoidRootPart") then return end
    local root = L.Character.HumanoidRootPart
    
    if U.G then
        -- Quét hiệu ứng trên người và xung quanh 3m
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Beam") or v:IsA("Fire") or v:IsA("Smoke") then
                if v:IsDescendantOf(L.Character) then
                    v.Enabled = false -- Tắt hiệu ứng của bản thân
                elseif v.Parent and v.Parent:IsA("BasePart") then
                    local dist = (v.Parent.Position - root.Position).Magnitude
                    if dist <= 15 then -- Bán kính 15 stud (~3-5m)
                        v.Enabled = false -- Ép tắt hiệu ứng xung quanh
                    end
                end
            end
        end
        -- Tàng hình nhân vật
        for _, p in pairs(L.Character:GetDescendants()) do
            if p:IsA("BasePart") or p:IsA("Decal") then p.Transparency = 1 end
        end
    end
end)

-- 3. GIAO DIỆN (ĐÃ FIX NÚT THU NHỎ)
local gui = Instance.new("ScreenGui", C); gui.Name = "H_F_V16"
local f = Instance.new("Frame", gui); f.Size = UDim2.new(0,200,0,260); f.Position = UDim2.new(0.5,-100,0.4,0); f.BackgroundColor3 = Color3.fromRGB(15,15,20); f.Active = true; f.Draggable = true
Instance.new("UICorner", f)
local head = Instance.new("TextLabel", f); head.Size = UDim2.new(1,0,0,35); head.BackgroundColor3 = Color3.fromRGB(120,0,200); head.Text = "FORSAKEN V1.6"; head.TextColor3 = Color3.new(1,1,1); head.Font = 3
local body = Instance.new("Frame", f); body.Size = UDim2.new(1,0,1,-35); body.Position = UDim2.new(0,0,0,35); body.BackgroundTransparency = 1

local function _AB(n, y, c)
    local bt = Instance.new("TextButton", body); bt.Text = n..": OFF"; bt.Size = UDim2.new(0.9,0,0,42); bt.Position = UDim2.new(0.05,0,0,y); bt.BackgroundColor3 = Color3.fromRGB(150,0,0); bt.TextColor3 = Color3.new(1,1,1); bt.Font = 3
    Instance.new("UICorner", bt)
    local a = false
    bt.MouseButton1Click:Connect(function()
        a = not a; bt.Text = n..(a and ": ON" or ": OFF"); bt.BackgroundColor3 = a and Color3.fromRGB(0,150,0) or Color3.fromRGB(150,0,0); c(a)
    end)
end

_AB("ULTRA GHOST", 15, function(s) 
    U.G = s 
    if not s then -- Khi tắt thì hiện hình lại
        for _, p in pairs(L.Character:GetDescendants()) do
            if p:IsA("BasePart") or p:IsA("Decal") then p.Transparency = 0 end
        end
    end
end)
]]

loadstring(_0xLogic)()
print(_0xH("72 85 78 71 32 70 79 83 65 75 69 78 32 86 49 46 54 32 65 67 84 73 86 69"))
