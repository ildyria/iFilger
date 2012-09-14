local C, F, L = unpack(select(2, ...))

local client = GetLocale()

if client == "itIT" then
	-- option name
	L["iFilger"] = "|cffffffffConfigurazione|r |cff1784d1iFilger|r"
	L["Config"] = "Se configuri |cff1784d1iFilger|r da LUA e\nvuoi ancora usare la configurazione GUI,\nnon dimenticarti di cliccare su |cff1784d1Reset Configurazione|r\ntutte le volte che vuoi modificare il config.lua"

	L["Name"] = "Nome"
	L["Enable"] = "Abilitato"
	L["Size"] = "Dimensioni"
	L["Direction"] = "Direzione"
	L["IconSide"] = "Icon Side"
	L["Interval"] = "Intervallo"
	L["Mode"] = "Modalità"
	L["Alpha"] = "Alpha"
	L["BarWidth"] = "Larghezza barra"
	L["Merge"] = "Unisci"

	L["cleverzone"] = "Clever Zone"
	L["tooltip"] = "Tooltip"
	L["TooltipMover"] = "Muovi Tooltip"
	L["FlashIcon"] = "Lampeggio (Icone)"
	L["FlashBar"] = "Lampeggio (Barre)"
	L["FlashThreshold"] = "Soglia Lampeggio"
	L["FlashDuration"] = "Durata Lampeggio"

	-- option help
	L["H_Name"] = "Nome della sottosezione"
	L["H_Enable"] = "Abilita o Disabilita questa sottosezione."
	L["H_Size1"] = "Dimensione delle icone"
	L["H_Size2"] = "Deve essere un numero positivo"
	L["H_Direction1"] = "Direzione delle icone:"
	L["H_Direction2"] = "SU, GIU, SINISTRA, DESTRA o ORIZZONTALE"
	L["H_IconSide1"] = "Posizione delle icone in modalità barra"
	L["H_IconSide2"] = "SINISTRA o DESTRA"
	L["H_Interval"] = "Spazione tra icone/barre"
	L["H_Mode1"] = "Modalità Display:"
	L["H_Mode2"] = "ICONE e BARRE"
	L["H_Alpha1"] = "Trasparenza:"
	L["H_Alpha2"] = "Scegli tra 1 (Completo) o 0 (Invisibile)"
	L["H_BarWidth"] = "Larghezza della barra (modalità barra richiesta)"
	L["H_Merge"] = "Abilita fusione quando il nome è lo stesso."

	L["H_cleverzone1"] = "Clever Zone:"
	L["H_cleverzone2"] = "Carica il PVP solo in zone PVP e PVE in zone PVE"
	L["H_cleverzone3"] = "(E' richiesto di ricaricare la ui la prima volta che si entra in una zona PVE)"
	L["H_tooltip"] = "Tooltip su icone"
	L["H_TooltipMover"] = "Tooltip su TooltipMover per gli utenti ElvUI e Tukui."
	L["H_FlashIcon"] = "Lampeggia quando il tempo rimanente è al di sotto della soglia in modalità icone."
	L["H_FlashBar"] = "Lampeggia quando il tempo rimanente è al di sotto della soglia in modalità bar."
	L["H_FlashThreshold1"] = "Soglia quando le icone iniziano a lampeggiare."
	L["H_FlashThreshold2"] = "Deve essere piu grande di 1."
	L["H_FlashDuration1"] = "Durata di ogni lampeggio."
	L["H_FlashDuration2"] = "Deve essere un numero positivo, più piccolo => veloce."

	-- buttons
	L["Apply"] = "Applica"
	L["Reset Config"] = "Reset Configigurazione"
	L["Move Buffs"] = "Muovi Buffs"
	L["Reset Buff Position"] = "Reset Posizione Buff"
	L["Global"] = "Configurazione Globale"
end