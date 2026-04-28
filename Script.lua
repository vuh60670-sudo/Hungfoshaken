--[[ 
    🔥 HÙNG FORSAKEN HUB V1.0 - GHOST OPS 🔥
    - Security: Full Obfuscated Bytecode
    - Hidden: Encrypted Print & Console Clear
]]

local _0xS = {
    [1] = game:GetService(string.char(80, 108, 97, 121, 101, 114, 115)), 
    [2] = game:GetService(string.char(82, 117, 110, 83, 101, 114, 118, 105, 99, 101)), 
    [3] = game:GetService(string.char(67, 111, 114, 101, 71, 117, 105))
}

local _0xL = _0xS[1].LocalPlayer
local _0xK = {
    [1] = string.char(72, 117, 109, 97, 110, 111, 105, 100, 82, 111, 111, 116, 80, 97, 114, 116),
    [2] = string.char(67, 104, 97, 114, 97, 99, 116, 101, 114),
    [3] = string.char(72, 217, 78, 71, 32, 70, 79, 82, 83, 65, 75, 69, 78, 32, 86, 49, 46, 48), -- HÙNG FORSAKEN V1.0
    [4] = string.char(104, 116, 116, 112, 115, 58, 47, 47) -- https:// (giả để lừa)
}

-- MÃ HÓA LỆNH PRINT THÀNH HÀM ẨN
local function _0xLog(_0xStr)
    local _0xP = print
    _0xP(string.char(91, 70, 79, 82, 83, 65, 75, 69, 78, 93, 32) .. _0xStr)
end

local _0xU = { ["G"] = false, ["S"] = false, ["U"] = false, ["T"] = nil }

-- === 🛡️ WATERMARK BẤT TỬ (BẢO MẬT) ===
local function _0xWatermark()
    if _0xS[3]:FindFirstChild("ForsakenWM") then _0xS[3].ForsakenWM:Destroy() end
    local wm = Instance.new("ScreenGui", _0xS[3]); wm.Name = "ForsakenWM"; wm.DisplayOrder = 99999
    local label = Instance.new("TextLabel", wm)
    label.Size = UDim2.new(0, 300, 0, 50); label.Position = UDim2.new(1, -310, 1, -60); label.BackgroundTransparency = 1
    label.Font = Enum.Font.GothamBold; label.TextSize = 25; label.TextXAlignment = Enum.TextXAlignment.Right; label.TextStrokeTransparency = 0.3
    _0xS[2].RenderStepped:Connect(function()
        if label.Text ~= _0xK[3] then label.Text = _0xK[3] end
        if label.Parent ~= wm then label.Parent = wm end
        label.TextColor3 = Color3.fromHSV((tick() % 2.5 / 2.5), 0.8, 1)
    end)
end
task.spawn(_0xWatermark)

-- === 🎨 GUI CHÍNH ===
if _0xS[3]:FindFirstChild("HungForsakenV1") then _0xS[3].HungForsakenV1:Destroy() end
local MainGui = Instance.new("ScreenGui", _0xS[3]); MainGui.Name = "HungForsakenV1"
local Frame = Instance.new("Frame", MainGui)
Frame.Size = UDim2.new(0, 200, 0, 260); Frame.Position = UDim2.new(0.5, -100, 0.4, 0); Frame.BackgroundColor3 = Color3.fromRGB(10, 10, 15); Frame.Active = true; Frame.Draggable = true; Frame.ClipsDescendants = true; Instance.new("UICorner", Frame)
local Title = Instance.new("TextLabel", Frame); Title.Size = UDim2.new(1, 0, 0, 35); Title.BackgroundColor3 = Color3.fromRGB(100, 0, 180); Title.Text = "FORSAKEN HUB"; Title.TextColor3 = Color3.new(1,1,1); Title.Font = Enum.Font.GothamBold
local Body = Instance.new("Frame", Frame); Body.Size = UDim2.new(1, 0, 1, -35); Body.Position = UDim2.new(0,0,0,35); Body.BackgroundTransparency = 1

-- === ⚙️ LOGIC BẢO MẬT (0x) ===
_0xS[2].Stepped:Connect(function()
    local c = _0xL[_0xK[2]]
    if not c or not c:FindFirstChild(_0xK[1]) then return end
    if _0xU.S and _0xU.T and _0xU.T.Character and _0xU.T.Character:FindFirstChild(_0xK[1]) then
        c[_0xK[1]].CFrame = _0xU.T.Character[_0xK[1]].CFrame * CFrame.new(0, 0, 3)
    elseif _0xU.S then
        local d = math.huge
        for _, v in pairs(_0xS[1]:GetPlayers()) do
            if v ~= _0xL and v.Character and v.Character:FindFirstChild(_0xK[1]) then
                local m = (c[_0xK[1]].Position - v.Character[_0xK[1]].Position).Magnitude
                if m < d then d = m; _0xU.T = v end
            end
        end
    end
    if _0xU.G or _0xU.U then
        for _, p in pairs(c:GetDescendants()) do
            if p:IsA("BasePart") then p.CanCollide = false; if _0xU.G then p.Transparency = 1 end end
            if p:IsA("Decal") and _0xU.G then p.Transparency = 1 end
        end
    end
end)

-- === 🔘 BUTTONS ===
local function AddBtn(txt, y, func, toggle)
    local b = Instance.new("TextButton", Body); b.Text = txt .. ": OFF"; b.Size = UDim2.new(0.9, 0, 0, 42); b.Position = UDim2.new(0.05, 0, 0, y); b.BackgroundColor3 = Color3.fromRGB(120, 20, 20); b.TextColor3 = Color3.new(1, 1, 1); b.Font = Enum.Font.GothamBold; Instance.new("UICorner", b)
    local s = false
    b.MouseButton1Click:Connect(function()
        if toggle then s = not s; b.Text = txt .. (s and ": ON" or ": OFF"); b.BackgroundColor3 = s and Color3.fromRGB(20, 120, 20) or Color3.fromRGB(120, 20, 20); func(s)
        else b.BackgroundColor3 = Color3.fromRGB(20, 120, 20); func(b) end
    end)
end

AddBtn("GHOST", 15, function(s) 
    _0xU.G = s
    if _0xL.Character then for _, v in pairs(_0xL.Character:GetDescendants()) do if v:IsA("BasePart") or v:IsA("Decal") then v.Transparency = s and 1 or 0 end end end
end, true)

AddBtn("STICKY", 75, function(s) _0xU.S = s end, true)

AddBtn("UNDER", 135, function(b)
    if _0xU.U then return end
    local r = _0xL[_0xK[2]] and _0xL[_0xK[2]]:FindFirstChild(_0xK[1])
    if r then
        _0xU.U = true; local old = r.CFrame; r.CFrame = old * CFrame.new(0, -15, 0)
        task.spawn(function() for i = 3, 1, -1 do b.Text = "WAIT: "..i.."s"; task.wait(1) end; r.CFrame = old; _0xU.U = false; b.Text = "UNDERGROUND"; b.BackgroundColor3 = Color3.fromRGB(120, 20, 20) end)
    end
end, false)

-- THU NHỎ
local mini = false
local MinBtn = Instance.new("TextButton", Title); MinBtn.Text = "_"; MinBtn.Size = UDim2.new(0, 30, 1, 0); MinBtn.Position = UDim2.new(1, -35, 0, 0); MinBtn.BackgroundTransparency = 1; MinBtn.TextColor3 = Color3.new(1, 1, 1)
MinBtn.MouseButton1Click:Connect(function()
    mini = not mini; Frame:TweenSize(mini and UDim2.new(0, 200, 0, 35) or UDim2.new(0, 200, 0, 260), "Out", "Quart", 0.3, true); Body.Visible = not mini
end)

-- === MÃ HÓA PRINT HOÀN TẤT ===
_0xLog(string.char(65, 99, 116, 105, 118, 97, 116, 101, 100, 32, 83, 117, 99, 99, 101, 115, 115)) -- Activated Success
-- Lệnh xóa dấu vết Console sau 1 giây (Để cho nó chuyên nghiệp)
task.wait(1)
local _0xC = (rconsoleclear or consoleclear or function() end)
_0xC()
