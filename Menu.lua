-- Criar uma ScreenGui
local screenGui = Instance.new("ScreenGui")  -- Nome corrigido
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")  -- Jogador local

-- Criar um Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0.7, 0, 0.7, 0)  -- Corrigido com vírgulas
frame.Position = UDim2.new(0.15, 0, 0.15, 0)  -- Centralizado na tela
frame.BackgroundColor3 = Color3.fromRGB(80, 80, 80)  -- Cinza meio escuro
frame.Parent = screenGui

-- Criar um Botão
local entrarbt = Instance.new("TextButton")
entrarbt.Size = UDim2.new(0.3, 0, 0.15, 0)  -- Tamanho do botão
entrarbt.Position = UDim2.new(0, 0, 0, 0)  -- Posicionado dentro do Frame
entrarbt.BackgroundColor3 = Color3.fromRGB(80, 80, 80)  -- Cinza meio escuro
entrarbt.Text = "Entrar"  -- Texto no botão
entrarbt.TextSize = 20  -- Tamanho do texto
entrarbt.TextColor3 = Color3.fromRGB(255, 255, 255)  -- Cor branca para o texto
entrarbt.Parent = frame

-- Adicionar UICorner ao botão
local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 20)  -- Arredondamento em pixels
uiCorner.Parent = entrarbt

-- Função executada quando o botão é pressionado
entrarbt.MouseButton1Click:Connect(function()
    print("Botão foi pressionado!")  -- Mensagem no console  -- Mudar o texto do botão
    entrarbt.BackgroundColor3 = Color3.fromRGB(100, 200, 100)  -- Mudar a cor (verde claro).
    entrarbt:Destroy()
    local HomeMenuBotao = Instance.new("TextButton"
    HomeMenuBotao.Size = UDim2.new(0.3, 0, 0.15, 0)
    HomeMenuBotao.Position = UDim2.new(0, 0, 0, 0)  -- Posicionado dentro do Frame
    HomeMenuBotao.BackgroundColor3 = Color3.fromRGB(50, 50, 50)  -- Cinza meio escuro
    HomeMenuBotao.Text = "Entrar"  -- Texto no botão
    HomeMenuBotao.TextSize = 20  -- Tamanho do texto
    HomeMenuBotao.TextColor3 = Color3.fromRGB(255, 255, 255)  -- Cor branca para o texto
    HomeMenuBotao.Parent = frame
end)
