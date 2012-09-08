local C, F, L = unpack(select(2, ...))

local client = GetLocale()

if client == "esES" or client == "esMX" then
	-- option name
	L["iFilger"] = "|cffffffffConfiguración de|r |cff1784d1iFilger|r"
	L["Config"] = "Si configuras |cff1784d1iFilger|r por Lua y aún\ndeseas usar la interfaz de configuración,\nno olvides hacer clic en |cff1784d1Resetear Configuración|r\ncada vez que modifiques config.lua"

	L["Name"] = "Nombre"
	L["Enable"] = "Activar"
	L["Size"] = "Tamaño"
	L["Direction"] = "Dirección"
	L["IconSide"] = "Lado del Icono"
	L["Interval"] = "Intervalo"
	L["Mode"] = "Modo"
	L["Alpha"] = "Transparencia"
	L["BarWidth"] = "Anchura de barra"
	L["Merge"] = "Mezclar"

	L["cleverzone"] = "Zona inteligente"
	L["tooltip"] = "Consejo Emergente"
	L["TooltipMover"] = "Mover Tooltip"
	L["FlashIcon"] = "Destello (Iconos)"
	L["FlashBar"] = "Destello (Barras)"
	L["FlashThreshold"] = "Umbral de Destello"
	L["FlashDuration"] = "Duración del Destello"

	-- option help
	L["H_Name"] = "El nombre de la sub-sección"
	L["H_Enable"] = "Activa/Desactiva esta sub-sección."
	L["H_Size1"] = "Tamaño de los Iconos"
	L["H_Size2"] = "Debe ser un número positivo"
	L["H_Direction1"] = "Dirección de los iconos:"
	L["H_Direction2"] = "ARRIBA, ABAJO, IZQUIERDA, DERECHA u HORIZONTAL"
	L["H_IconSide1"] = "Posición del Icono en el modo barra:"
	L["H_IconSide2"] = "IZQUIERDA o DERECHA"
	L["H_Interval"] = "Espacio entre iconos/barras"
	L["H_Mode1"] = "Modo de Visualización:"
	L["H_Mode2"] = "ICONO o BARRA"
	L["H_Alpha1"] = "Transparencia:"
	L["H_Alpha2"] = "Elige entre 1 (opaco) o 0 (invisible)"
	L["H_BarWidth"] = "Anchura de la barra (modo barra requerido)"
	L["H_Merge"] = "Activa mezclado cuando el nombre es el mismo."

	L["H_cleverzone1"] = "Zona Inteligente:"
	L["H_cleverzone2"] = "Cargar JcJ solo en zonas JcJ y JcE solo en zonas JcE"
	L["H_cleverzone3"] = "(Requiere recargar la primera vez que entres a una zona JcE)"
	L["H_tooltip"] = "Descripción emergente en iconos"
	L["H_TooltipMover"] = "Descripción emergente en el mismo lugar que los usuarios de ElvUI y Tukui"
	L["H_FlashIcon"] = "Destello cuando el tiempo restante está por debajo del umbral en el modo icono."
	L["H_FlashBar"] = "Destello cuando el tiempo restante está por debajo del umbral en el modo barra."
	L["H_FlashThreshold1"] = "Umbral cuando los iconos empiezan el destello."
	L["H_FlashThreshold2"] = "Debe ser mayor que 1."
	L["H_FlashDuration1"] = "Duración de cada destello."
	L["H_FlashDuration2"] = "Debe ser un número positivo, pequeño => rápido."

	-- buttons
	L["Apply"] = "Aplicar"
	L["Reset Config"] = "Restablecer Configuración"
	L["Move Buffs"] = "Mover Beneficios"
	L["Reset Buff Position"] = "Restablecer las Posiciones"
	L["Global"] = "Configuración Global"
end