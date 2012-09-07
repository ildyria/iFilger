local C, F, L = unpack(select(2, ...))

local client = GetLocale()

if client == "ruRU" then
	L["Config"] = "Если Вы настраиваете |cff1784d1iFilger|r через редактирование \nLua и хотите при этом использовать внутриигровую\n настройку,не забудьте нажать кнопку\n |cff1784d1Сбросить настройки|r после каждой модификации\n config.lua"
	L["iFilger"] = "|cff1784d1iFilger|r |cffffffffНастройки|r"
	
	-- option name
	L["Name"] = "Имя"
	L["Enable"] = "Включить"
	L["Size"] = "Размер"
	L["Direction"] = "Направление"
	L["IconSide"] = "IconSide"
	L["Interval"] = "Промежуток"
	L["Mode"] = "Режим"
	L["Alpha"] = "Прозрачность"
	L["BarWidth"] = "Ширина полосы"
	L["Merge"] = "Сливать"

	L["cleverzone"] = "Умная зона"
	L["tooltip"] = "Подсказка"
	L["TooltipMover"] = "Фиксатор подсказки"
	L["FlashIcon"] = "Мигание (Иконки)"
	L["FlashBar"] = "Мигание (Полосы)"
	L["FlashThreshold"] = "Значение мигания"
	L["FlashDuration"] = "Длительность мигания"

	-- option help
	L["H_Name"] = "Название суб-секции"
	L["H_Enable"] = "Включить или выключить эту суб-секцию."
	L["H_Size1"] = "Размер иконок"
	L["H_Size2"] = "Значение долно быть положительным"
	L["H_Direction1"] = "Направление иконок:"
	L["H_Direction2"] = "UP, DOWN, LEFT, RIGHT или HORIZONTAL"
	L["H_IconSide1"] = "Положение иконки в режиме полос:"
	L["H_IconSide2"] = "LEFT или RIGHT"
	L["H_Interval"] = "расстояние между иконками/полосами"
	L["H_Mode1"] = "Режим отображения:"
	L["H_Mode2"] = "ICON или BAR"
	L["H_Alpha1"] = "Прозрачность:"
	L["H_Alpha2"] = "Значение между 1 (не прозрачно) и 0 (полностью прозрачно)"
	L["H_BarWidth"] = "Ширина полосы (только в режиме полос)"
	L["H_Merge"] = "Включить слияние при одинаковых именах."

	L["H_cleverzone1"] = "Умная зона:"
	L["H_cleverzone2"] = "Загружать только PvP в PvP зонах и PvE в PvE зонах"
	L["H_cleverzone3"] = "(Требует перезагрузки в первое посещение PvE зоны)"
	L["H_tooltip"] = "Подсказка на баффах"
	L["H_TooltipMover"] = "Подсказка на фиксаторе подсказок для пользователей ElvUI или Tukui."
	L["H_FlashIcon"] = "Мигать, когда оставшееся время ниже этого значения в режиме иконок."
	L["H_FlashBar"] = "Мигать, когда оставшееся время ниже этого значения в режиме полос."
	L["H_FlashThreshold1"] = "Значение, при котором начинается мигание."
	L["H_FlashThreshold2"] = "Должно быть больше 1."
	L["H_FlashDuration1"] = "Скорость мигания."
	L["H_FlashDuration2"] = "Должно быть положительным значением, меньше => быстрее."

	-- buttons
	L["Apply"] = "Применить"
	L["Reset Config"] = "Сбросить настройки"
	L["Move Buffs"] = "Двигать баффы"
	L["Reset Buff Position"] = "Сброс позиции баффов"
	L["Global"] = "Global Config"
end