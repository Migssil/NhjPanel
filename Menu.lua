local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Tela principal
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "NHJHub"
screenGui.Parent = playerGui

-- Função para criar Frames e Botões
local function createFrame(name, size, position, color, parent)
    local frame = Instance.new("Frame")
    frame.Name = name
    frame.Size = size
    frame.Position = position
    frame.BackgroundColor3 = color
    frame.BorderSizePixel = 0
    frame.Parent = parent
    return frame
end

local function createButton(name, text, size, position, parent, onClick)
    local button = Instance.new("TextButton")
    button.Name = name
    button.Size = size
    button.Position = position
    button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    button.Text = text
    button.TextSize = 18
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Parent = parent
    button.MouseButton1Click:Connect(onClick)
    return button
end

-- Tela principal (menu minimalista)
local mainFrame = createFrame("MainFrame", UDim2.new(0.3, 0, 0.6, 0), UDim2.new(0.35, 0, 0.2, 0), Color3.fromRGB(30, 30, 30), screenGui)

-- Título
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0.1, 0)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "NHJ Hub"
title.TextSize = 28
title.TextColor3 = Color3.fromRGB(255, 0, 0)
title.Parent = mainFrame

-- Abas
local tabFrame = createFrame("TabFrame", UDim2.new(1, 0, 0.1, 0), UDim2.new(0, 0, 0.1, 0), Color3.fromRGB(40, 40, 40), mainFrame)

local menuTab = createButton("MenuTab", "Menu", UDim2.new(0.5, -5, 1, 0), UDim2.new(0, 0, 0, 0), tabFrame, function()
    menuFrame.Visible = true
    scriptBoxFrame.Visible = false
end)

local scriptBoxTab = createButton("ScriptBoxTab", "Script Box", UDim2.new(0.5, -5, 1, 0), UDim2.new(0.5, 5, 0, 0), tabFrame, function()
    menuFrame.Visible = false
    scriptBoxFrame.Visible = true
end)

-- Menu Frame
local menuFrame = createFrame("MenuFrame", UDim2.new(1, 0, 0.8, 0), UDim2.new(0, 0, 0.2, 0), Color3.fromRGB(50, 50, 50), mainFrame)
menuFrame.Visible = true

-- Botão exemplo no Menu
createButton("ExampleButton", "Botão Exemplo", UDim2.new(0.8, 0, 0.2, 0), UDim2.new(0.1, 0, 0.1, 0), menuFrame, function()
    print("Botão do Menu clicado!")
end)

-- Script Box Frame
local scriptBoxFrame = createFrame("ScriptBoxFrame", UDim2.new(1, 0, 0.8, 0), UDim2.new(0, 0, 0.2, 0), Color3.fromRGB(50, 50, 50), mainFrame)
scriptBoxFrame.Visible = false

-- Botão "Adicionar Script"
createButton("AddScriptButton", "Adicionar Script", UDim2.new(0.8, 0, 0.2, 0), UDim2.new(0.1, 0, 0.1, 0), scriptBoxFrame, function()
    print("Adicionar Script clicado!")
    -- Função para adicionar script pode ser implementada aqui
end)

-- Fechar botão
local closeButton = createButton("CloseButton", "X", UDim2.new(0.1, 0, 0.1, 0), UDim2.new(0.9, 0, 0, 0), mainFrame, function()
    screenGui:Destroy()
end)
closeButton.TextColor3 = Color3.fromRGB(255, 0, 0)