local screeng = Instance.new("screenGui")
screenGui.Parent = player.PlayerGui

local frame = Instance.new("Frame")
frame,size = UDim2.new(0.7 0 0.7 0)
frame.position = UDim2.new(0, 0, 0, 0)
frame.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
frame.Parent = screeng

-- Criar um Botão
local entrarbt = Instance.new("TextButton")
button.Size = UDim2.new(0.3, 0, 0.15, 0)  -- Tamanho do botão
button.Position = UDim2.new(0.35, 0, 0.425, 0)  -- Posicionado dentro do Frame
button.BackgroundColor3 = Color3.fromRGB(80, 80, 80)  -- Cinza meio escuro
button.Text = "Entrar"  -- Texto no botão
button.TextSize = 20  -- Tamanho do texto
button.TextColor3 = Color3.fromRGB(255, 255, 255)  -- Cor branca para o texto
button.Parent = frame

local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 10)  -- Arredondamento em pixels
uiCorner.Parent = frame

-- Função executada quando o botão é pressionado
entrarbt.MouseButton1Click:Connect(function()
    print("Botão foi pressionado!")  -- Mensagem no console
    button.Text = "Você clicou!"  -- Mudar o texto do botão
    button.BackgroundColor3 = Color3.fromRGB(100, 200, 100)  -- Mudar a cor (verde claro)
end)