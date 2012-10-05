local C, F, L = unpack(select(2, ...))

local client = GetLocale()

if client == "frFR" then
	-- option name
	L["iFilger"] = "|cff1784d1iFilger|r |cffffffffConfiguration|r"
	L["Config"] = "Si vous configurez votre |cff1784d1iFilger|r \nen lua et souhaitez toujours utiliser \nl'interface graphique de configuration, \nn'oubliez pas de cliquer sur |cff1784d1Reset Config|r \nà chaque fois que vous modifiez \nle fichier config.lua"

	L["RESETMSG"] = "Êtes-vous sûr de vouloir remplacer tous vos réglages avec ceux par défaut?"--updated

	L["Name"] = "Nom"--updated
	L["Enable"] = "Activé"--updated
	L["Size"] = "Taille"--updated
	L["Direction"] = "Direction"--updated
	L["IconSide"] = "Coté de l'icône"--updated
	L["Interval"] = "Ecart"--updated
	L["Mode"] = "Mode"--updated
	L["Alpha"] = "Alpha"--updated
	L["BarWidth"] = "Longueur des barres"--updated
	L["Merge"] = "Fusion"--updated
	L["Mergewith"] = "fusionner avec"--updated

	L["autoupdate"] = "Mise à jour automatique"--updated
	L["cleverzone"] = "Zone Intelligente" --updated
	L["tooltip"] = "Info-bulle"--updated
	L["TooltipMover"] = "Déplacer l'info-bulle" --updated
	L["FlashIcon"] = "Flash(Icônes)"--updated
	L["FlashBar"] = "Flash(Barres)"--updated
	L["FlashThreshold"] = "Seuil du flash"--updated
	L["FlashDuration"] = "Durée du flash"--updated

	L["AddSpell"] = "Ajout d'un sort"--updated
	L["spellID"] = "ID du sort"--updated
	L["filter"] = "Filtre"--updated
	L["unitId"] = "Unit Id"--updated
	L["caster"] = "Caster"--updated
	L["absID"] = " ID Absolut"--updated
	L["incombat"] = "En combat"--updated
	L["spec"] = "Spec"--updated
	L["trigger"] = "Déclenchement pour ICD"--updated
	L["duration"] = "Durée pour ICD"--updated
	L["icon"] = "Icône"--updated

	-- option help
	L["H_Name"] = "Nom de la sous-section"--updated
	L["H_Enable"] = "Active ou désactive cette sous-section."--updated
	L["H_Size1"] = "Taille de l'icône"--updated
	L["H_Size2"] = "Doit être un nombre positif"--updated
	L["H_Direction1"] = "Direction des icônes:"--updated
	L["H_Direction2"] = "|cffffffffHAUT|r, |cffffffffBAS|r, |cffffffffGAUCHE|r, |cffffffffDROITE|r ou |cffffffffHORIZONTALE|r"--updated
	L["H_IconSide1"] = "Position de l'icône en mode barre:"--updated
	L["H_IconSide2"] = "|cffffffffGAUCHE|r ou |cffffffffDROITE|r"--updated
	L["H_Interval"] = "Espacement entre les icônes/barres"--updated
	L["H_Mode1"] = "Mode affiché:"--updated
	L["H_Mode2"] = "|cffffffffICONE|r ou |cffffffffBARRE|r"--updated
	L["H_Alpha1"] = "Transparence:"--updated
	L["H_Alpha2"] = "Choisir entre 1 (plein) ou 0 (invisible)"--updated
	L["H_BarWidth"] = "Largeur de la barre (mode barre requis)"--updated
	L["H_Merge"] = "Active la fusion."--updated
	L["H_Mergewith"] = "Nom de la liste de fusion si celle-ci est activée."--updated

	L["H_autoupdate"] = " Mettre à jour automatiquement la configuration."--updated
	L["H_cleverzone1"] = "Zone Intelligente:"--updated
	L["H_cleverzone2"] = "Charger uniquement en PvP dans les zones PvP et PvE dans les zones PvE"--updated
	L["H_cleverzone3"] = "(Nécessaire pour recharger la première fois que vous entrez dans une zone PvE)"--updated
	L["H_tooltip"] = "Info-bulle sur icône"--updated
	L["H_TooltipMover"] = "Info-bulle sur TooltipMover pour les utilisateurs ElvUI et Tukui."--updated
	L["H_FlashIcon"] = "Flash lorsque le temps restant est inférieur au seuil en mode icône."--updated
	L["H_FlashBar"] = "Flash lorsque le temps restant est inférieur au seuil en mode barre."--updated
	L["H_FlashThreshold1"] = "Seuil quand l'icône commence à flasher."--updated
	L["H_FlashThreshold2"] = "Doit être superieur à 1."--updated
	L["H_FlashDuration1"] = "Durée de chaques flash."--updated
	L["H_FlashDuration2"] = "Doit être un nombre positif, plus petit => plus rapide."--updated

	L["H_spellID"] = "ID du sort ou ID de l'emplacement : 13 ou 14 pour bijoux"--updated
	L["H_filter1"] = "Listes des filtres disponibles : "--updated
	L["H_filter2"] = "|cffffffffBUFF|r - filtrage des améliorations."--updated
	L["H_filter3"] = "|cffffffffDEBUFF|r - filtrage des affaiblissements."--updated
	L["H_filter4"] = "|cffffffffIBUFF|r - suivit d'une amélioration manquant."--updated
	L["H_filter5"] = "|cffffffffIDEBUFF|r - suivit d'un affaiblissement manquant."--updated
	L["H_filter6"] = "|cffffffffCD|r -suivit des recharges."--updated
	L["H_filter7"] = "|cffffffffACD|r -suivit si un temps de recharge est disponible ou non, nécessitent une programmation lanceur de sorts à tout"--updated
	L["H_filter8"] = "|cffffffffICD|r - suivit de la recharge interne,exige un declenchement et une durée"--updated
	L["H_unitId1"] = "Liste des unités disponibles:"--updated
	L["H_unitId2"] = "|cffffffffjoueur|r"--updated
	L["H_unitId3"] = "|cffffffffcible|r"--updated
	L["H_unitId4"] = "|cfffffffffocus|r"--updated
	L["H_unitId5"] = "|cfffffffffamilier|r"--updated
	L["H_unitId6"] = "|cffffffffciblecible|r" --cible de la cible--updated
	L["H_unitId7"] = "|cffffffffgroupe1|r ..."--updated
	L["H_unitId8"] = "|cffffffffarene1|r ..."--updated
	L["H_caster"] = "|cffffffffjoueur|r ou |cfffffffftout|r -seulement incanté par le joueur ou tout le monde"--updated
	L["H_absID"] = "Afficher seulement si l'ID du  sort est le même"--updated
	L["H_incombat"] = "Seulement affiché pendant le combat"--updated
	L["H_spec"] = "Only show while in that spec (|cffffffff1|r |cffffffff2|r |cffffffff3|r or |cffffffff4|r)"
	L["H_trigger1"] = "declenchement pour  ICD :"--updated
	L["H_trigger2"] = "|cffffffffAMELIORATION|r - ICD commence quand l'amélioration se presente."--updated
	L["H_trigger3"] = "|cffffffffDEBUFF|r - ICD commence quand l'affaiblissement se presente." --updated
	L["H_trigger4"] = "|cffff0000/!\\ NOTE:CE QUI DEMARRE QUAND LE |r" --updated
	L["H_trigger5"] = "|cffff0000DECLENCHEMENT COMMENCE,PAS QUAND IL DISPARAIT.|r" --updated
	L["H_duration"] = "durée ICD en seconde" --updated
	L["H_icon1"] = "Desolé, mais l'icône de configuration est pour" --updated
	L["H_icon2"] = "|cffff0000AVANCES UTILISATEURS|r et"; --updated
	L["H_icon3"] = "Doivent être effectuées par LUA." --updated

	-- buttons
	L["Apply"] = "Appliquer"
	L["Cancel"] = "Abandonner"
	L["Reset Config"] = "Réinitialiser Config."
	L["Move Buffs"] = "Déplacer les amélio."
	L["Reset Buff Position"] = "RAZ positions"
	L["Global"] = "Config. globale"
	L["Del"] = "Suppr"
	L["Edit"] = "Editer"
	L["Add"] = "Ajouter"

	local myClass = select(2, UnitClass("player"));

	L["VersionNotFound"] = " Version non identifiable, nettoyez les variables sauvegardées"
	L["UpdateRequired"] = "Votre version n'est plus à jour. Nous vous recommandons de cliquer sur\n |cffff0000"..L["Reset Config"].."|r \navant l'utilisation d'|cff1784d1iFilger|r."
	L["WarningConfig"] = "Des changements ont été\n éffectués dans la config.\nNous vous recommandons de faire un |cffff0000"..L["Reset Config"].."|r\navant l'utilisation d'|cff1784d1iFilger|r."
	L["Updated"] = "|cff1784d1iFilger|r a été mis à jour."
	L["ClassVersion"] = myClass.." version: "
	L["AllVersion"] = ", Toutes versions: "
	L["CurrentClassVersion"] = " "..myClass.." version: "
	L["CurrentAllVersion"] = ", Ensemble des versions actuelles: "
	L["AvailableClassVersion"] = " "..myClass.." version disponible: "
	L["AvailableAllVersion"] = ",Ensemble des versions disponibles: "
end