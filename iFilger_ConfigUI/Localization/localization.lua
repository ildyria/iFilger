local C, F, L = unpack(select(2, ...))

local client = GetLocale()

-- option name
L["Name"] = "Name"
L["Enable"] = "Enable"
L["Size"] = "Size"
L["Direction"] = "Direction"
L["IconSide"] = "IconSide"
L["Interval"] = "Interval"
L["Mode"] = "Mode"
L["Alpha"] = "Alpha"
L["BarWidth"] = "Bar Width"
L["Merge"] = "Merge"

-- option help
L["H_Name"] = "The name of the sub-section, what else ?"
L["H_Enable"] = "Enable or not the sub-section."
L["H_Size1"] = "Size of the Icons"
L["H_Size2"] = "Must be a positive number"
L["H_Direction1"] = "Direction of expending :"
L["H_Direction2"] = "UP, DOWN, LEFT, RIGHT or HORIZONTAL"
L["H_IconSide1"] = "Position of the Icon in bar config mode :"
L["H_IconSide2"] = "LEFT or RIGHT"
L["H_Interval"] = "Interval between Icons/Bars"
L["H_Mode1"] = "Display mode : "
L["H_Mode2"] = "ICON or BAR"
L["H_Alpha1"] = "Transparency :"
L["H_Alpha2"] = "Float between 0 (invisible) and 1 (mat)"
L["H_BarWidth"] = "Width of the Bar (Bar Mode required)"
L["H_Merge"] = "Enable Merging when Name is the same."

-- buttons
L["Apply"] = "Apply"
L["Reset Config"] = "Reset Config"
L["Move Buffs"] = "Move Buffs"
L["Reset Buff Position"] = "Reset Buff Position"


if client == "frFR" then -- French

	-- option name
	L["Name"] = "Nom"
	L["Enable"] = "Activer"
	L["Size"] = "Taille"
	L["Direction"] = "Direction"
	L["IconSide"] = "Coté de l'icone"
	L["Interval"] = "Intervalle"
	L["Mode"] = "Mode"
	L["Alpha"] = "Alpha"
	L["BarWidth"] = "Largeur de la barre"
	L["Merge"] = "Fusionner"

	-- option help
	L["H_Name"] = "Le nom du groupe."
	L["H_Enable"] = "Activer ou non le groupe."
	L["H_Size1"] = "Taille des icones"
	L["H_Size2"] = "Doit être un nombre positif"
	L["H_Direction1"] = "Direction de l'extension :"
	L["H_Direction2"] = "UP (vers le haut), DOWN (vers le bas), LEFT (vers la gauche), RIGHT (vers la droite) ou HORIZONTAL (centré)"
	L["H_IconSide1"] = "Position de l'icone en mode Barre : "
	L["H_IconSide2"] = "LEFT (gauche) ou RIGHT (droite)"
	L["H_Interval"] = "Intervalle entre les Icones/Barres"
	L["H_Mode1"] = "Mode d'affichage : "
	L["H_Mode2"] = "ICON (en icones) ou BAR (en barres)"
	L["H_Alpha1"] = "Transparence :"
	L["H_Alpha2"] = "Nombre entre 0 (invisible) et 1 (opaque)"
	L["H_BarWidth"] = "Largeur de la barre (Mode Barre requis)"
	L["H_Merge"] = "Active la fusion des groupes quand les noms sont les mêmes."

	-- buttons
	L["Apply"] = "Appliquer"
	L["Reset Config"] = "Réinitialiser"
	L["Move Buffs"] = "Déplacer les icones"
	L["Reset Buff Position"] = "Réinitialiser les positions"

elseif client == "deDE" then -- German
	-- Translation is required, is some one can do it, that would be nice. Thx in advance !
end