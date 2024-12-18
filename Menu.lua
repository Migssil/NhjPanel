-- Variáveis principais
local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")

local scriptsTable = {} -- Armazena os scripts adicionados

-- Função para criar Labels
local function createLabel(parent, text, size, position, textSize)
    local label = Instance.new("TextLabel")
    label.Size = size
    label.Position = position
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextSize = textSize or 16
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.Font = Enum.Font.SourceSans
    label.Parent = parent
    return label
end

-- Função para criar Botões
local function createButton(parent, text, size, position, callback)
    local button = Instance.new("TextButton")
    button.Size = size
    button.Position = position
    button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    button.Text = text
    button.TextSize = 16
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Font = Enum.Font.SourceSans
    button.BorderSizePixel = 0
    button.Parent = parent
    button.MouseButton1Click:Connect(callback)
    return button
end

-- Criar o Frame principal
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0.7, 0, 0.7, 0)
mainFrame.Position = UDim2.new(0.15, 0, 0.15, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

-- Título
createLabel(mainFrame, "NHJ Hub", UDim2.new(1, 0, 0.1, 0), UDim2.new(0, 0, 0, 0), 36)

-- Botões de navegação
local currentTab = "Menu"

local contentFrame = Instance.new("Frame")
contentFrame.Size = UDim2.new(0.8, 0, 0.8, 0)
contentFrame.Position = UDim2.new(0.1, 0, 0.1, 0)
contentFrame.BackgroundTransparency = 1
contentFrame.Parent = mainFrame

local function clearContent()
    for _, child in pairs(contentFrame:GetChildren()) do
        child:Destroy()
    end
end

local function showMenu()
    clearContent()
    createLabel(contentFrame, "Bem-vindo ao Menu!", UDim2.new(1, 0, 0.1, 0), UDim2.new(0, 0, 0, 0), 20)
end

local function showScriptBox()
    clearContent()
    local yOffset = 0
    for i, script in pairs(scriptsTable) do
        createButton(contentFrame, script.name, UDim2.new(0.9, 0, 0.1, 0), UDim2.new(0.05, 0, yOffset, 0), function()
            loadstring(script.code)() -- Executar o script
        end)
        yOffset = yOffset + 0.12
    end

    createButton(contentFrame, "+ Adicionar Script", UDim2.new(0.9, 0, 0.1, 0), UDim2.new(0.05, 0, yOffset, 0), function()
        showAddScript()
    end)
end

local function showAddScript()
    clearContent()

    createLabel(contentFrame, "Adicionar Script", UDim2.new(1, 0, 0.1, 0), UDim2.new(0, 0, 0, 0), 24)
    createLabel(contentFrame, "Nome:", UDim2.new(0.2, 0, 0.05, 0), UDim2.new(0.05, 0, 0.1, 0))
    local nameBox = Instance.new("TextBox")
    nameBox.Size = UDim2.new(0.7, 0, 0.05, 0)
    nameBox.Position = UDim2.new(0.25, 0, 0.1, 0)
    nameBox.Parent = contentFrame

    createLabel(contentFrame, "Script:", UDim2.new(0.2, 0, 0.05, 0), UDim2.new(0.05, 0, 0.2, 0))
    local scriptBox = Instance.new("TextBox")
    scriptBox.Size = UDim2.new(0.7, 0, 0.4, 0)
    scriptBox.Position = UDim2.new(0.25, 0, 0.2, 0)
    scriptBox.MultiLine = true
    scriptBox.Parent = contentFrame

    createButton(contentFrame, "Salvar", UDim2.new(0.3, 0, 0.1, 0), UDim2.new(0.35, 0, 0.65, 0), function()
        table.insert(scriptsTable, { name = nameBox.Text, code = scriptBox.Text })
        showScriptBox()
    end)
end

-- Botões de navegação principais
createButton(mainFrame, "Menu", UDim2.new(0.2, 0, 0.1, 0), UDim2.new(0, 0, 0.1, 0), function()
    currentTab = "Menu"
    showMenu()
end)

createButton(mainFrame, "Script Box", UDim2.new(0.2, 0, 0.1, 0), UDim2.new(0.25, 0, 0.1, 0), function()
    currentTab = "ScriptBox"
    showScriptBox()
end)

createButton(mainFrame, "Fechar", UDim2.new(0.2, 0, 0.1, 0), UDim2.new(0.75, 0, 0.1, 0), function()
    screenGui:Destroy()
end)

-- Mostrar o menu inicialmente
showMenu()