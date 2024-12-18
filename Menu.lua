-- Variáveis principais
local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")

local scriptsTable = {} -- Tabela para armazenar scripts

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
    button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    button.Text = text
    button.TextSize = 18
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Font = Enum.Font.SourceSansBold
    button.BorderSizePixel = 0
    button.Parent = parent
    button.MouseButton1Click:Connect(callback)
    return button
end

-- Frame Principal
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0.6, 0, 0.7, 0)
mainFrame.Position = UDim2.new(0.2, 0, 0.15, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

-- Título
createLabel(mainFrame, "NHJ Hub", UDim2.new(1, 0, 0.1, 0), UDim2.new(0, 0, 0, 0), 28)

-- Área de Conteúdo
local contentFrame = Instance.new("Frame")
contentFrame.Size = UDim2.new(0.8, 0, 0.8, 0)
contentFrame.Position = UDim2.new(0.1, 0, 0.1, 0)
contentFrame.BackgroundTransparency = 1
contentFrame.Parent = mainFrame

local currentTab = "Menu"

local function clearContent()
    for _, child in pairs(contentFrame:GetChildren()) do
        child:Destroy()
    end
end

local function showMenu()
    clearContent()
    createLabel(contentFrame, "Bem-vindo ao Menu Principal", UDim2.new(1, 0, 0.1, 0), UDim2.new(0, 0, 0, 0), 20)
end

local function showScriptBox()
    clearContent()
    local yOffset = 0.05

    -- Criar botões para cada script adicionado
    for i, script in pairs(scriptsTable) do
        createButton(contentFrame, script.name, UDim2.new(0.9, 0, 0.1, 0), UDim2.new(0.05, 0, yOffset, 0), function()
            print("Executando script:", script.name)
            loadstring(script.code)() -- Executa o script
        end)
        yOffset = yOffset + 0.12
    end

    -- Botão para Adicionar Script
    createButton(contentFrame, "+ Adicionar Script", UDim2.new(0.9, 0, 0.1, 0), UDim2.new(0.05, 0, yOffset, 0), function()
        clearContent()

        -- Formulário Adicionar Script
        createLabel(contentFrame, "Adicionar Script

### **Correção Completa**:  
Vou refinar tudo **sem cortes**, garantindo uma interface final **organizada** e **pronta para uso**.

---

```lua
-- Variáveis principais
local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
local scriptsTable = {}

-- Função para criar Botões
local function createButton(parent, text, size, position, callback)
    local button = Instance.new("TextButton")
    button.Size = size
    button.Position = position
    button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    button.Text = text
    button.TextSize = 18
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Font = Enum.Font.SourceSansBold
    button.Parent = parent
    button.MouseButton1Click:Connect(callback)
    return button
end

-- Função para limpar conteúdo
local function clearFrame(frame)
    for _, child in pairs(frame:GetChildren()) do
        child:Destroy()
    end
end

-- GUI Principal
local mainFrame = Instance.new("Frame", screenGui)
mainFrame.Size = UDim2.new(0.6, 0, 0.7, 0)
mainFrame.Position = UDim2.new(0.2, 0, 0.15, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

-- Área de Conteúdo
local contentFrame = Instance.new("Frame", mainFrame)
contentFrame.Size = UDim2.new(0.8, 0, 0.8, 0)
contentFrame.Position = UDim2.new(0.1, 0, 0.1, 0)
contentFrame.BackgroundTransparency = 1

-- Função para exibir ScriptBox
local function showScriptBox()
    clearFrame(contentFrame)
    local yOffset = 0.05

    -- Botões dos scripts
    for _, scriptData in pairs(scriptsTable) do
        createButton(contentFrame, scriptData.name, UDim2.new(0.9, 0, 0.1, 0), UDim2.new(0.05, 0, yOffset, 0), function()
            loadstring(scriptData.code)()
        end)
        yOffset = yOffset + 0.12
    end

    -- Adicionar Script
    createButton(contentFrame, "+ Adicionar Script", UDim2.new(0.9, 0, 0.1, 0), UDim2.new(0.05, 0, yOffset, 0), function()
        clearFrame(contentFrame)
        local nameBox = Instance.new("TextBox", contentFrame)
        nameBox.Size = UDim2.new(0.9, 0, 0.1, 0)
        nameBox.Position = UDim2.new(0.05, 0, 0.1, 0)
        nameBox.PlaceholderText = "Nome do Script"

        local scriptBox = Instance.new("TextBox", contentFrame)
        scriptBox.Size = UDim2.new(0.9, 0, 0.4, 0)
        scriptBox.Position = UDim2.new(0.05, 0, 0.25, 0)
        scriptBox.PlaceholderText = "Código do Script"
        scriptBox.MultiLine = true

        createButton(contentFrame, "Salvar", UDim2.new(0.4, 0, 0.1, 0), UDim2.new(0.3, 0, 0.7, 0), function()
            table.insert(scriptsTable, { name = nameBox.Text, code = scriptBox.Text })
            showScriptBox()
        end)
    end)
end

-- Botões de Navegação
createButton(mainFrame, "Menu", UDim2.new(0.2, 0, 0.1, 0), UDim2.new(0, 0, 0, 0), function()
    clearFrame(contentFrame)
    local label = Instance.new("TextLabel", contentFrame)
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = "Bem-vindo ao Menu!"
    label.TextSize = 24
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.Font = Enum.Font.SourceSansBold
end)

createButton(mainFrame, "Script Box", UDim2.new(0.2, 0, 0.1, 0), UDim2.new(0.25, 0, 0, 0), function()
    showScriptBox()
end)

createButton(mainFrame, "Fechar", UDim2.new(0.2, 0, 0.1, 0), UDim2.new(0.75, 0, 0, 0), function()
    screenGui:Destroy()
end)

-- Iniciar no Menu
local welcomeLabel = Instance.new("TextLabel", contentFrame)
welcomeLabel.Size = UDim2.new(1, 0, 1, 0)
welcomeLabel.BackgroundTransparency = 1
welcomeLabel.Text = "Bem-vindo ao NHJ Hub!"
welcomeLabel.TextSize = 24
welcomeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
welcomeLabel.Font = Enum.Font.SourceSansBold