-- Criar uma ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Criar um Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0.7, 0, 0.7, 0)
frame.Position = UDim2.new(0.15, 0, 0.15, 0)
frame.BackgroundColor3 = Color3.fromRGB(80, 80, 80)  -- Cinza meio escuro
frame.Parent = screenGui

-- Criar um Botão
local entrarbt = Instance.new("TextButton")
entrarbt.Size = UDim2.new(0.3, 0, 0.15, 0)
entrarbt.Position = UDim2.new(0.05, 0, 0.05, 0)  -- Posicionado dentro do Frame
entrarbt.BackgroundColor3 = Color3.fromRGB(80, 80, 80)  -- Cinza meio escuro
entrarbt.Text = "Entrar"
entrarbt.TextSize = 20
entrarbt.TextColor3 = Color3.fromRGB(255, 255, 255)
entrarbt.Parent = frame

-- Adicionar UICorner ao botão
local uiCornerframe = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 20)
uiCorner.Parent = frame

local uiCornerentrar = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 20)
uiCorner.Parent = entrarbt

-- Função executada quando o botão é pressionado
entrarbt.MouseButton1Click:Connect(function()
    print("Botão foi pressionado!")  -- Mensagem no console

    -- Criar o novo botão
    local HomeMenuBotao = Instance.new("TextButton")  -- Parêntese corrigido
    HomeMenuBotao.Size = UDim2.new(0.3, 0, 0.15, 0)
    HomeMenuBotao.Position = UDim2.new(0, 0, 0, 0)  -- Posicionado dentro do Frame
    HomeMenuBotao.BackgroundColor3 = Color3.fromRGB(50, 50, 50)  -- Cinza mais escuro
    HomeMenuBotao.Text = "Home🏠"  -- Texto no botão
    HomeMenuBotao.TextSize = 20  -- Tamanho do texto
    HomeMenuBotao.TextColor3 = Color3.fromRGB(255, 255, 255)  -- Cor branca para o texto
    HomeMenuBotao.Parent = frame

    -- Conectar o evento do novo botão
    HomeMenuBotao.MouseButton1Click:Connect(function()
        print("Novo botão foi pressionado!")

        local uiCornerHomeMenuBotao = Instance.new("UICorner")
        uiCorner.CornerRadius = UDim.new(0, 20)
        uiCorner.Parent = HomeMenuBotao
                
        HomeMenuBotao:Destroy()
    end)

    -- Agora destrua o botão original
    entrarbt:Destroy()
end)
