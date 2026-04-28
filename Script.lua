--[[ 
    🔥 HÙNG FORSAKEN HUB V1.1 - WATERMARK FIX 🔥
    - Fix: Lỗi Font ô vuông (Anti-Squircle)
    - Chức năng: Màu cầu vồng mượt mà
]]

local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")

local function CreateWatermark()
    -- Xóa bản cũ nếu có
    if CoreGui:FindFirstChild("ForsakenWM") then CoreGui.ForsakenWM:Destroy() end
    
    local wm = Instance.new("ScreenGui", CoreGui)
    wm.Name = "ForsakenWM"
    wm.DisplayOrder = 99999
    
    local label = Instance.new("TextLabel", wm)
    label.Size = UDim2.new(0, 300, 0, 50)
    label.Position = UDim2.new(1, -310, 1, -60) -- Góc dưới bên phải
    label.BackgroundTransparency = 1
    label.Text = "HÙNG FORSAKEN V1.0"
    
    -- === FIX LỖI FONT ===
    -- Tôi chuyển GothamBold sang SourceSansBold, máy nào cũng đọc được chữ Ù
    label.Font = Enum.Font.SourceSansBold
    
    label.TextSize = 25
    label.TextXAlignment = Enum.TextXAlignment.Right
    label.TextStrokeTransparency = 0.3

    -- === VÒNG LẶP CẦU VỒNG RGB MƯỢT MÀ ===
    local hue = 0
    RunService.RenderStepped:Connect(function(dt)
        -- Đảm bảo tên không bị đổi
        if label.Text ~= "HÙNG FORSAKEN V1.0" then label.Text = "HÙNG FORSAKEN V1.0" end
        
        -- Tăng màu cầu vồng (tốc độ: 0.5)
        hue = hue + (0.5 * dt)
        if hue > 1 then hue = 0 end
        
        -- Áp dụng màu RGB mượt mà
        label.TextColor3 = Color3.fromHSV(hue, 1, 1)
    end)
end
task.spawn(CreateWatermark)
            
