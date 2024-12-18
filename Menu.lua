-- Variáveis principais
local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Tabela para armazenar os scripts adicionados
local scriptsTable = {}

-- Função para criar Labels
local function createLabel(parent, text, size, position)
    local label = Instance.new("TextLabel")
    label.Size = size
    label.Position = position
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextSize = 16
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.Parent = parent
    return label
end

-- Função para criar um botão
local function createButton(parent, text, size, position, callback)
    local button = Instance.new("TextButton")
    button.Size = size
    button.Position = position
    button.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    button.Text = text
    button.TextSize = 16
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Parent = parent
    button.MouseButton1Click:Connect(callback)
    return button
end

-- Criar o Frame principal (aumentado)
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0.8, 0, 0.8, 0) -- Aumentado para 80% da tela
mainFrame.Position = UDim2.new(0.1, 0, 0.1, 0) -- Centralizado
mainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

-- Criar título
local title = createLabel(mainFrame, "NHJ hub", UDim2.new(1, 0, 0.1, 0), UDim2.new(0, 0, 0, 0))
title.TextSize = 36
title.TextColor3 = Color3.fromRGB(255, 0, 0)

-- Botões de navegação
local menuButton = createButton(mainFrame, "Menu", UDim2.new(0.2, 0, 0.1, 0), UDim2.new(0.05, 0, 0.15, 0), function()
    print("Menu selecionado")
end)

local scriptBoxButton = createButton(mainFrame, "Script Box", UDim2.new(0.2, 0, 0.1, 0), UDim2.new(0.05, 0, 0.3, 0), function()
    print("Script Box selecionado")
    showScripts()
end)

-- Função para mostrar scripts adicionados
local function showScripts()
    for _, v in pairs(mainFrame:GetChildren()) do
        if v.Name == "ScriptEntry" then
            v:Destroy() -- Limpar a área
        end
    end

    for i, scriptInfo in pairs(scriptsTable) do
        local scriptLabel = createLabel(mainFrame, scriptInfo.name, UDim2.new(0.6, 0, 0.05, 0), UDim2.new(0.3, 0, 0.15 + (i * 0.06), 0))
        scriptLabel.Name = "ScriptEntry"
    end
end

-- Botão de fechar
local closeButton = createButton(mainFrame, "X", UDim2.new(0.1, 0, 0.1, 0), UDim2.new(0.85, 0, 0.01, 0), function()
    screenGui:Destroy()
end)
closeButton.TextColor3 = Color3.fromRGB(255, 0, 0)

-- Interface para adicionar scripts
local addScriptFrame = Instance.new("Frame")
addScriptFrame.Size = UDim2.new(0.6, 0, 0.6, 0)
addScriptFrame.Position = UDim2.new(0.2, 0, 0.2, 0)
addScriptFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
addScriptFrame.BorderSizePixel = 0
addScriptFrame.Visible = false
addScriptFrame.Parent = mainFrame

-- Labels e campos de texto
createLabel(addScriptFrame, "Adicionar Script", UDim2.new(1, 0, 0.1, 0), UDim2.new(0, 0, 0, 0)).TextSize = 24
createLabel(addScriptFrame, "Nome:", UDim2.new(0.2, 0, 0.1, 0), UDim2.new(0.05, 0, 0.15, 0))
local nameBox = Instance.new("TextBox")
nameBox.Size = UDim2.new(0.7, 0, 0.1, 0)
nameBox.Position = UDim2.new(0.25, 0, 0.15, 0)
nameBox.Parent = addScriptFrame

createLabel(addScriptFrame, "Script:", UDim2.new(0.2, 0, 0.1, 0), UDim2.new(0.05, 0, 0.3, 0))
local scriptBox = Instance.new("TextBox")
scriptBox.Size = UDim2.new(0.7, 0, 0.2, 0)
scriptBox.Position = UDim2.new(0.25, 0, 0.3, 0)
scriptBox.Parent = addScriptFrame
scriptBox.MultiLine = true

createLabel(addScriptFrame, "Descrição:", UDim2.new(0.2, 0, 0.1, 0), UDim2.new(0.05, 0, 0.55, 0))
local descBox = Instance.new("TextBox")
descBox.Size = UDim2.new(0.7, 0, 0.1, 0)
descBox.Position = UDim2.new(0.25, 0, 0.55, 0)
descBox.Parent = addScriptFrame

-- Botão para confirmar adição
local confirmButton = createButton(addScriptFrame, "Adicionar", UDim2.new(0.3, 0, 0.1, 0), UDim2.new(0.35, 0, 0.75, 0), function()
    table.insert(scriptsTable, {
        name = nameBox.Text,
        script = scriptBox.Text,
        description = descBox.Text
    })
    addScriptFrame.Visible = false
    showScripts()
end)

-- Botão para abrir interface de adicionar scripts
local addScriptButton = createButton(mainFrame, "+", UDim2.new(0.1, 0, 0.1, 0), UDim2.new(0.05, 0, 0.45, 0), function()
    addScriptFrame.Visible = true
end)