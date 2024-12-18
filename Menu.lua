-- Inicializar GUI
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Criar ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "NHJHubGui"
screenGui.Parent = playerGui

-- Frame Principal
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0.5, 0, 0.6, 0)
mainFrame.Position = UDim2.new(0.25, 0, 0.2, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

-- UI Corner para arredondamento
local uiCornerMain = Instance.new("UICorner")
uiCornerMain.CornerRadius = UDim.new(0, 10)
uiCornerMain.Parent = mainFrame

-- Título
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -40, 0, 50)
title.Position = UDim2.new(0, 20, 0, 10)
title.Text = "NHJ Hub"
title.TextColor3 = Color3.fromRGB(255, 0, 0)
title.TextScaled = true
title.BackgroundTransparency = 1
title.Font = Enum.Font.SourceSansBold
title.Parent = mainFrame

-- Fechar botão (X)
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 40, 0, 40)
closeButton.Position = UDim2.new(1, -50, 0, 10)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
closeButton.Font = Enum.Font.SourceSansBold
closeButton.TextScaled = true
closeButton.Parent = mainFrame

local uiCornerClose = Instance.new("UICorner")
uiCornerClose.CornerRadius = UDim.new(1, 0)
uiCornerClose.Parent = closeButton

closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

-- Criar Botões de Aba
local menuButton = Instance.new("TextButton")
menuButton.Size = UDim2.new(0, 150, 0, 50)
menuButton.Position = UDim2.new(0, 20, 0, 70)
menuButton.Text = "Menu"
menuButton.TextColor3 = Color3.fromRGB(255, 255, 255)
menuButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
menuButton.Font = Enum.Font.SourceSansBold
menuButton.TextScaled = true
menuButton.Parent = mainFrame

local scriptBoxButton = menuButton:Clone()
scriptBoxButton.Text = "Script Box"
scriptBoxButton.Position = UDim2.new(0, 20, 0, 130)
scriptBoxButton.Parent = mainFrame

-- Frames de Conteúdo
local menuFrame = Instance.new("Frame")
menuFrame.Size = UDim2.new(1, -40, 1, -200)
menuFrame.Position = UDim2.new(0, 20, 0, 200)
menuFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
menuFrame.Visible = true
menuFrame.Parent = mainFrame

local scriptBoxFrame = menuFrame:Clone()
scriptBoxFrame.Visible = false
scriptBoxFrame.Parent = mainFrame

-- Aba Funcionalidade
menuButton.MouseButton1Click:Connect(function()
    menuFrame.Visible = true
    scriptBoxFrame.Visible = false
end)

scriptBoxButton.MouseButton1Click:Connect(function()
    menuFrame.Visible = false
    scriptBoxFrame.Visible = true
end)

-- Conteúdo da Aba Script Box
local scriptList = Instance.new("ScrollingFrame")
scriptList.Size = UDim2.new(1, -20, 1, -150)
scriptList.Position = UDim2.new(0, 10, 0, 10)
scriptList.CanvasSize = UDim2.new(0, 0, 2, 0)
scriptList.ScrollBarThickness = 5
scriptList.BackgroundTransparency = 1
scriptList.Parent = scriptBoxFrame

local addScriptButton = Instance.new("TextButton")
addScriptButton.Size = UDim2.new(1, -20, 0, 40)
addScriptButton.Position = UDim2.new(0, 10, 1, -50)
addScriptButton.Text = "+ Adicionar Script"
addScriptButton.TextColor3 = Color3.fromRGB(255, 255, 255)
addScriptButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
addScriptButton.Font = Enum.Font.SourceSansBold
addScriptButton.TextScaled = true
addScriptButton.Parent = scriptBoxFrame

-- Interface de Adicionar Script
addScriptButton.MouseButton1Click:Connect(function()
    local addFrame = Instance.new("Frame")
    addFrame.Size = UDim2.new(0.4, 0, 0.5, 0)
    addFrame.Position = UDim2.new(0.3, 0, 0.25, 0)
    addFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    addFrame.Parent = screenGui

    local nameBox = Instance.new("TextBox")
    nameBox.Size = UDim2.new(0.8, 0, 0, 30)
    nameBox.Position = UDim2.new(0.1, 0, 0.1, 0)
    nameBox.PlaceholderText = "Nome do Script"
    nameBox.Parent = addFrame

    local scriptBox = Instance.new("TextBox")
    scriptBox.Size = UDim2.new(0.8, 0, 0.3, 0)
    scriptBox.Position = UDim2.new(0.1, 0, 0.25, 0)
    scriptBox.PlaceholderText = "Script..."
    scriptBox.MultiLine = true
    scriptBox.Parent = addFrame

    local descriptionBox = Instance.new("TextBox")
    descriptionBox.Size = UDim2.new(0.8, 0, 0.2, 0)
    descriptionBox.Position = UDim2.new(0.1, 0, 0.6, 0)
    descriptionBox.PlaceholderText = "Descrição..."
    descriptionBox.Parent = addFrame

    local confirmButton = Instance.new("TextButton")
    confirmButton.Size = UDim2.new(0.8, 0, 0, 30)
    confirmButton.Position = UDim2.new(0.1, 0, 0.85, 0)
    confirmButton.Text = "Adicionar"
    confirmButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    confirmButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    confirmButton.Parent = addFrame

    confirmButton.MouseButton1Click:Connect(function()
        local scriptName = nameBox.Text
        local scriptDescription = descriptionBox.Text

        if scriptName ~= "" then
            local newScript = Instance.new("TextLabel")
            newScript.Size = UDim2.new(1, -20, 0, 50)
            newScript.Position = UDim2.new(0, 10, 0, #scriptList:GetChildren() * 60)
            newScript.Text = scriptName .. " - " .. scriptDescription
            newScript.TextColor3 = Color3.fromRGB(255, 255, 255)
            newScript.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            newScript.TextScaled = true
            newScript.Parent = scriptList
        end

        addFrame:Destroy()
    end)
end)