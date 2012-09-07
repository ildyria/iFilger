local C, F, L = unpack(select(2, ...))

local client = GetLocale()

if client == "ptBR" or client == "ptPT" then
	-- option name
	L["iFilger"] = "|cffffffffConfiguração|r |cff1784d1iFilger|r"
	L["Config"] = "Se você configurar o seu |cff1784d1iFilger|r por código Lua e\nmesmo assim deseja usar a configuração em jogo,\nnão se esqueça de clicar em |cff1784d1Reset Config|r\ncada vez que modificar o ficheiro config.lua"

	L["Name"] = "Nome"
	L["Enable"] = "Activar"
	L["Size"] = "Tamanho"
	L["Direction"] = "Direcção"
	L["IconSide"] = "Lado do Icon"
	L["Interval"] = "Intervalo"
	L["Mode"] = "Modo"
	L["Alpha"] = "Transparência"
	L["BarWidth"] = "Comprimento da barra"
	L["Merge"] = "Fundir"

	L["cleverzone"] = "Zona inteligente"
	L["tooltip"] = "Tooltip"
	L["TooltipMover"] = "Mover a Tooltip"
	L["FlashIcon"] = "Clarão (Icons)"
	L["FlashBar"] = "Clarão (Barras)"
	L["FlashThreshold"] = "Limiar do Piscar"
	L["FlashDuration"] = "Duração do Piscar"

	-- option help
	L["H_Name"] = "O nome tha sub-secção"
	L["H_Enable"] = "Activar ou desactivar esta sub-secção."
	L["H_Size1"] = "Tamanho dos Icons"
	L["H_Size2"] = "Tem de ser um número positivo"
	L["H_Direction1"] = "Direcção dos icons:"
	L["H_Direction2"] = "CIMA, BAIXO, ESQUERDA, DIREITA ou HORIZONTAL"
	L["H_IconSide1"] = "Posição do Icon em modo de barra:"
	L["H_IconSide2"] = "ESQUERDA or DIREITA"
	L["H_Interval"] = "Espaço entre icons/barras"
	L["H_Mode1"] = "Modo Exibição:"
	L["H_Mode2"] = "ICON ou BARRA"
	L["H_Alpha1"] = "Transparência:"
	L["H_Alpha2"] = "Escolha entre 1 (cheio) ou 0 (invisivel)"
	L["H_BarWidth"] = "Comprimento da barra (modo de barra requerido)"
	L["H_Merge"] = "Activar fuzão quando o nome é o mesmo."

	L["H_cleverzone1"] = "Zona Inteligente:"
	L["H_cleverzone2"] = "Recarregar apenas PVP em zonas PVP e PVE em zonas PVE"
	L["H_cleverzone3"] = "(Requerido para recarregar a primeira vez que você entre numa zona PVE)"
	L["H_tooltip"] = "Tooltip nos icons"
	L["H_TooltipMover"] = "Tooltip no MoverTooltip para utilizadores da ElvUI e da Tukui."
	L["H_FlashIcon"] = "Piscar quando o tempo restante for abaixo do limiar em modo icon"
	L["H_FlashBar"] = "Piscar quando o tempo restante for abaixo do limiar em modo barra"
	L["H_FlashThreshold1"] = "Limiar quando os icons começam a piscar."
	L["H_FlashThreshold2"] = "Tem de ser maior que 1."
	L["H_FlashDuration1"] = "Duração de cada piscadela."
	L["H_FlashDuration2"] = "Tem de ser um número positivo, mais pequeno => mais rápido."

	-- buttons
	L["Apply"] = "Aplicar"
	L["Reset Config"] = "Restaurar configurações"
	L["Move Buffs"] = "Mover os Buffs"
	L["Reset Buff Position"] = "Restaurar a posição"
	L["Global"] = "Configurações Globais"
end