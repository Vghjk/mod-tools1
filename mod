----------------------------------------------------------------------------------
-------------------------------------META---------------------------------------
--------------------------------------------------------------------------------
script_name("MOD-HELPER")
script_version("0.0.3")
script_author("hhti")
local script_version_str = "0.0.3"
--------------------------------------VAR---------------------------------------
local gID
local color = 0xdd2861
local sf = require "sampfuncs"
local key = require "vkeys"
local dlstatus = require('moonloader').download_status
local inicfg = require "inicfg"
local imgui = require 'imgui'
local aah = imgui.ImBool(false)
local xyinya = imgui.ImBool(false)
local gendera = imgui.ImBool(false)
local menushkaaaaa = imgui.ImBool(false)
local vremya = os.time()
local show_main_window33313 = imgui.ImBool(false)
local agun = imgui.ImBool(false)
local _, tid = sampGetPlayerIdByCharHandle(PLAYER_PED)
local lastweap = 0
local encoding = require 'encoding'
local memory = require "memory"
local mad = require 'MoonAdditions'
local clock_textdraw = mad.textdraw.new("Loading...", 10, 350)
local sampev = require "lib.samp.events"
local notf = import 'imgui_notf.lua'
local ffi = require 'ffi'
local lanes = require('lanes').configure()
encoding.default = 'CP1251'
u8 = encoding.UTF8
require 'lib.sampfuncs'

local dir = "\\Czar Ramirez\\MOD.ini"
local mainCFG = inicfg.load({
  Settings = {
  short_name = "",
  fraction = "",
  rang = "",
  rTag = "",
  fTag = "",
  gender = false,
  autoscreen = true,
  healreport = false,
  startmessage = true,
  blockcmd = true,
},
Price = {
  idle = "1",
  medic = "1",
  army = "1",
  police = "1",
  instructor = "1",
  cnn = "1",
  fbi = "1",
  ap = "1",
  groove = "1",
  ballas = "1",
  aztec = "1",
  vagos = "1",
  rifa = "1",
  yakuza = "1",
  columbia = "1",
  mexican = "1",
  outlaws = "1",
  bandidos = "1",
  hellsangels = "1"
},
Key = {
  welcome = 81,
  heal = 49,
  inject = 50,
  vactination = 52,
  medcard = 51,
  setsex = 53
}}, dir)


--------------------------------------------------------------------------------
----------------------------------IMGUI VAR-------------------------------------
--------------------------------------------------------------------------------
local show_main_window = imgui.ImBool(false)
local show_main_window33313 = imgui.ImBool(false)
local menu3 = imgui.ImBool(false)
local menu5 = imgui.ImBool(false)
local gender = imgui.ImBool(mainCFG.Settings.gender)
local autoscreen = imgui.ImBool(mainCFG.Settings.autoscreen)
local healreport = imgui.ImBool(mainCFG.Settings.healreport)
local startmessage = imgui.ImBool(mainCFG.Settings.startmessage)

local edit = imgui.ImBuffer(65536)
local edit_heal_bind = imgui.ImBuffer(65536)
local edit_inject_bind = imgui.ImBuffer(65536)
local edit_setsex_bind = imgui.ImBuffer(65536)
local edit_vac_bind = imgui.ImBuffer(65536)
local edit_medcard_bind = imgui.ImBuffer(65536)
local short_name = imgui.ImBuffer(256)
local fraction = imgui.ImBuffer(256)
local rang = imgui.ImBuffer(256)
local rTag = imgui.ImBuffer(32)
local fTag = imgui.ImBuffer(32)
local idle = imgui.ImBuffer(16)
local medic = imgui.ImBuffer(16)
local army = imgui.ImBuffer(16)
local police = imgui.ImBuffer(16)
local instructor = imgui.ImBuffer(16)
local cnn = imgui.ImBuffer(16)
local fbi = imgui.ImBuffer(16)
local ap = imgui.ImBuffer(16)
local groove = imgui.ImBuffer(16)
local ballas = imgui.ImBuffer(16)
local aztec = imgui.ImBuffer(16)
local vagos = imgui.ImBuffer(16)
local rifa = imgui.ImBuffer(16)
local yakuza = imgui.ImBuffer(16)
local columbia = imgui.ImBuffer(16)
local mexican = imgui.ImBuffer(16)
local outlaws = imgui.ImBuffer(16)
local bandidos = imgui.ImBuffer(16)
local hellsangels = imgui.ImBuffer(16)
local ratingLS = imgui.ImBuffer(8)
local ratingLV = imgui.ImBuffer(8)
local ratingSF = imgui.ImBuffer(8)
local IDWARN = imgui.ImBuffer(8)
local reasonWARN = imgui.ImBuffer(8)
local IDLEAVE = imgui.ImBuffer(8)
local reasonLEAVE = imgui.ImBuffer(8)


local file = {}
local window_file = {}

local add_name_bind = imgui.ImBuffer(256)
local edit_name_bind = imgui.ImBuffer(256)
local edit_binds = imgui.ImBuffer(65536)
local find_name_bind = imgui.ImBuffer(256)
local find_text_bind = imgui.ImBuffer(256)
local blackcheckerpath = imgui.ImBuffer(256)

local russian_characters = { [168] = 'Ё', [184] = 'ё', [192] = 'А', [193] = 'Б', [194] = 'В', [195] = 'Г', [196] = 'Д', [197] = 'Е', [198] = 'Ж', [199] = 'З', [200] = 'И', [201] = 'Й', [202] = 'К', [203] = 'Л', [204] = 'М', [205] = 'Н', [206] = 'О', [207] = 'П', [208] = 'Р', [209] = 'С', [210] = 'Т', [211] = 'У', [212] = 'Ф', [213] = 'Х', [214] = 'Ц', [215] = 'Ч', [216] = 'Ш', [217] = 'Щ', [218] = 'Ъ', [219] = 'Ы', [220] = 'Ь', [221] = 'Э', [222] = 'Ю', [223] = 'Я', [224] = 'а', [225] = 'б', [226] = 'в', [227] = 'г', [228] = 'д', [229] = 'е', [230] = 'ж', [231] = 'з', [232] = 'и', [233] = 'й', [234] = 'к', [235] = 'л', [236] = 'м', [237] = 'н', [238] = 'о', [239] = 'п', [240] = 'р', [241] = 'с', [242] = 'т', [243] = 'у', [244] = 'ф', [245] = 'х', [246] = 'ц', [247] = 'ч', [248] = 'ш', [249] = 'щ', [250] = 'ъ', [251] = 'ы', [252] = 'ь', [253] = 'э', [254] = 'ю', [255] = 'я' }
local magicChar = { '\\', '/', ':', '*', '?', '"', '>', '<', '|' }

local tags_description = [[
]]

--------------------------------------------------------------------------------
------------------------------------TEXT----------------------------------------
--------------------------------------------------------------------------------
local text = [[{38b4c9}В этом разделе скрипта, размещены основные настройки.]]


--------------------------------------------------------------------------------
-------------------------------------MAIN---------------------------------------
--------------------------------------------------------------------------------
function main()
  if not isSampfuncsLoaded() or not isSampLoaded() then
    return
  end
  while not isSampAvailable() do
    wait(100)
  end
  
  if isSampLoaded() then
  sampSendChat('/mynick')
  end
  
  files_add() -- загрузка файлов и подгрузка текстур
	sampSendGiveDamage()
	moxylePic = imgui.CreateTextureFromFile(getGameDirectory() .. '\\moonloader\\MOD\\images\\drp.png')
  	
  if mainCFG.Settings.startmessage then
    sampAddChatMessage("{ff0000}MOD-HELPER LEADERS - v" .. script_version_str .. " загружен! {0FFFFF}Автор: hhti.", -1)
    sampAddChatMessage("{ff0000}Открыть меню скрипта - /mod. Отключить это сообщение можно в настройках.", -1)
	sampAddChatMessage("{ff0000}Перед началом использования данного скрипта пропишите команду /mynick.", -1)
	notf.addNotification(string.format("Уведомление.\n\n\nПрочитать информацию о скрипте\nвы можете в\n/mod - FAQ.\n\n\nПриятного пользования хелпером.", os.date()), 25)
  end
  
  -- wait(15000)	
  -- if not isCharModel(PLAYER_PED, 191) then
  -- ShowMessage('Вы не состоите в министерстве обороны!', 'Ошибка', 0x10)
    -- if isSampAvailable() then
    -- repeat ShowMessage('Перезайдите в игру, перед этим удалив modhelper.', 'MOD-HELPER', 0) until not isSampAvailable()
	-- end
  -- end
  -- if not isCharModel(PLAYER_PED, 295) then
  -- ShowMessage('Вы не состоите в министерстве обороны!', 'Ошибка', 0x10)
    -- if isSampAvailable() then
    -- repeat ShowMessage('Перезайдите в игру, перед этим удалив modhelper.', 'MOD-HELPER', 0) until not isSampAvailable()
    -- end
  -- end	
  -- if not isCharModel(PLAYER_PED, 61) then
  -- ShowMessage('Вы не состоите в министерстве обороны!', 'Ошибка', 0x10)
    -- if isSampAvailable() then
    -- repeat ShowMessage('Перезайдите в игру, перед этим удалив modhelper.', 'MOD-HELPER', 0) until not isSampAvailable()
    -- end  
  -- end	
  
	if sampGetCurrentServerAddress() == "194.61.44.61" then
		gameServer = "Emerald"
	elseif sampGetCurrentServerAddress() == "5.254.123.3"  then -- проверяем подключенный сервер
		gameServer = "Radiant"
	elseif sampGetCurrentServerAddress() == "5.254.123.4"  then -- проверяем подключенный сервер
		gameServer = "Trilliant"
	elseif sampGetCurrentServerAddress() == "194.61.44.64"  then -- проверяем подключенный сервер
		gameServer = "Crystal"
	elseif sampGetCurrentServerAddress() == "5.254.123.6"  then -- проверяем подключенный сервер
		gameServer = "Sapphire"
	elseif sampGetCurrentServerAddress() == "5.254.105.202"  then -- проверяем подключенный сервер
		gameServer = "Onyx"
	elseif sampGetCurrentServerAddress() == "194.61.44.67"  then -- проверяем подключенный сервер
		gameServer = "Amber"
	elseif sampGetCurrentServerAddress() == "5.254.105.204"  then -- проверяем подключенный сервер
		gameServer = "Quartz"
    end
	
	async_http_request('GET', 'https://api.jsonbin.io/b/5c71965a4281e229194b8f77/4', nil --[[параметры запроса]],
  function(response) -- вызовется при успешном выполнении и получении ответа
    print(response.text) -- response.text - текст ответа. ещё есть response.status_code и response.headers
  end,
  function(err) -- вызовется при ошибке, err - текст ошибки. эту функцию можно не указывать
    print(err)
  end)
  
    -- autoupdate("https://api.jsonbin.io/b/5c71965a4281e229194b8f77/4", '['..string.upper(thisScript().name)..']: ', "https://raw.githubusercontent.com/Vghjk/MOD-TOOLS/master/Admin%20Tools.lua?token=AtevXS19aAc5GyJKtOVfpKV3BJ6nAttJks5ccZdbwA%3D%3D")
  sampRegisterChatCommand("mod", function () show_main_window.v = not show_main_window.v end)
  -- sampRegisterChatCommand("menu", function () menu3.v = not menu3.v end)
  sampRegisterChatCommand("prem", function () menu5.v = not menu5.v end)
	sampRegisterChatCommand("gun", autogun)
	sampRegisterChatCommand("rn", function(text) if text ~= "" then sampSendChat("/r (( "..text.." ))") else sampAddChatMessage("{d10000}[Ошибка] {bababa}Правильное использование команды - /rn текст", 0xd10000) end end)
	sampRegisterChatCommand("fn", function(text) if text ~= "" then sampSendChat("/f (( "..text.." ))") else sampAddChatMessage("{d10000}[Ошибка] {bababa}Правильное использование команды - /fn текст", 0xd10000) end end)
	sampRegisterChatCommand("mynick", nicks)
	sampRegisterChatCommand("r", function(text) if text ~= "" then sampSendChat("r ["..mainCFG.Settings.rTag.."]: "..text.."") end end)
	sampRegisterChatCommand("f", function(text) if text ~= "" then sampSendChat("r ["..mainCFG.Settings.fTag.."]: "..text.."") end end)
	sampRegisterChatCommand("test", test)
	sampRegisterChatCommand("gate", function (gateshka)
	lua_thread.create(function ()
	if gateshka == "" then
	sampSendChat("/me введя код, открыл"..lpl.." шлагбаум")
	sampAddChatMessage("{00FF00}[MOD TOOLS]: {FFFFFF}Чтобы закрыть шлагбаум нажмите Z", -1)
	repeat wait(0) until isKeyJustPressed(90)
	sampSendChat("/me введя код, закрыл"..lpl.." шлагбаум")
	end
	end)
	end)
	sampRegisterChatCommand("inv", function ()
	  lua_thread.create(function ()
	  	sampSendChat('/me достал планшет, после чего записал человека в список служащих')
	  	wait(1500)
	  	sampSendChat('/do В руках новая форма и рация.')
	  	wait(1500)
	  	sampSendChat('/me передал форму и рацию человеку напротив')
	  	wait(1500)
	  	sampSendChat('Переодевайтесь и после, ознакомтесь с Уставом Министерства.')
	  	wait(1500)
	  	sampSendChat('/me взяв со стола книгу с Уставом, передал человеку напротив')
		sampAddChatMessage('{ffffff}Нажмите ПКМ + Х, наведясь на человека.')
		repeat wait(0) until isKeyJustPressed(88)
		wait(1500)
		sampSendChat('/inv '..gID)
	  end)
	end)  
	sampRegisterChatCommand("uninv", function ()
	  lua_thread.create(function ()
	  	sampSendChat('/me достал планшет, после чего удалил человека из списка военнослужащих')
	  	wait(1500)
	  	sampSendChat('Давайте форму и рацию.')
	  	wait(1500)
	  	sampSendChat('/n /me положил форму на стол')
		sampAddChatMessage('{ffffff}Для продолжения нажмите на Х.')
		repeat wait(0) until isKeyJustPressed(88)
	  	wait(1500)
	  	sampSendChat('Всё, Вы свободны.')
	  	wait(1500)
	  	sampSendChat('/me достав со стола документы человека, передал их')
		sampAddChatMessage('{ffffff}Нажмите ПКМ + Х, наведясь на человека.')
		repeat wait(0) until isKeyJustPressed(88)
		wait(1500)
		sampSendChat('/uninv '..gID)
		wait(1000)
		sampSendChat('Всё, свободен.')
	  end)
	end)  
	sampRegisterChatCommand("rangp", function ()
	  lua_thread.create(function ()
	  	sampSendChat('/me открыл шкаф, после чего достал новую форму')
	  	wait(1500)
	  	sampSendChat('/me передал форму человеку напротив')
	  	wait(1500)
	  	sampSendChat('Вот, переодевайтесь и давайте свою старую форму.')
		sampSendChat("/n /me переоделся, после чего положил старую форму на стол")
		sampAddChatMessage('{ffffff}Для продолжения нажмите на Х.')
		repeat wait(0) until isKeyJustPressed(88)
	  	sampSendChat('/me взял форму в руки, далее положил в шкаф')
		sampAddChatMessage('{ffffff}Нажмите ПКМ + Х, наведясь на человека.')
		repeat wait(0) until isKeyJustPressed(88)
		sampSendChat('/rangp '..gID)
		wait(1000)
		sampSendChat('Поздравляю с повышением, а теперь за работу!')
	  end)
	end)  
	sampRegisterChatCommand("cskin", function ()
	  lua_thread.create(function ()
	  	sampSendChat('/me открыв шкаф, достал новую форму')
	  	wait(1500)
	  	sampSendChat('/do В руках новая форма.')
	  	wait(1500)
	  	sampSendChat('/me передал форму человеку напротив')
	  	wait(1500)
	  	sampSendChat('Переодевайтесь.')
		sampAddChatMessage('{ffffff}Нажмите ПКМ + Х, наведясь на человека.')
		repeat wait(0) until isKeyJustPressed(88)
		wait(1500)
		sampSendChat('/cskin '..gID)
	  end)
	end)  
	sampRegisterChatCommand("myorg", player)
	sampRegisterChatCommand("adm", adminka)
	sampRegisterChatCommand("where", function(arg)
        if tonumber(arg) ~= nil then
            if sampIsPlayerConnected(tonumber(arg)) then
                local nick = sampGetPlayerNickname(tonumber(arg)):gsub('_', ' ')
                sampSendChat("/r ["..mainCFG.Settings.rTag.."]: "..nick.." доложите Ваше местоположение, на ответ 10 секунд.")
            else
                sampAddChatMessage("Игрок с таким ID не найден!", 0xFFFFFF)
           end
        else
            sampAddChatMessage("Введите нормальный ID", 0xFFFFFF)
        end
    end)
  if not doesDirectoryExist('moonloader/MOD') then
    createDirectory('moonloader/MOD/Binds')
    createDirectory('moonloader/MOD/Commands')
    createDirectory('moonloader/MOD/Other')
  end

  if not doesFileExist('moonloader/MOD/Binds/tht.txt') then
    local file = io.open('moonloader/MOD/Binds/tht.txt', 'a')
    file:write('/me откры{GENDER} шкаф и доста{GENDER} из шкафа спиртовой раствор для рук и стерильные перчатки\n/me закры{GENDER} шкаф\n/me простерилизова{GENDER} руки спиртовым раствором и наде{GENDER} перчатки на руки\n/do Перчатки на руках.\n/me взя{GENDER} со стола поднос с хирургическими инструментами\n/me несёт поднос в руках\n/me постави{GENDER} поднос на столик рядом с операционным столом\n/me взя{GENDER} в руки заполненный шприц с наркозом\n/do Шприц в руках.\n/me вве{GENDER} препарат в вену пациента\n/do Пациент уснул.\n/me нача{GENDER} процесс операции над болезнью пациента\n/do Процесс операции закончен.\n/do Пациент пришел в себя.')
    file:flush()
    file:close()
  end

  if not doesFileExist('moonloader/MOD/Commands/hela.txt') then
    local file = io.open('moonloader/MOD/Commands/hela.txt', 'a')
    file:write('/me записа{GENDER} диагноз в блокнот после чего откры{GENDER} сумку и положи{GENDER} в неё блокнот\n/me доста{GENDER} нужное лекарство и переда{GENDER} его человеку напротив\n/heal {ID} {PRICE}')
    file:flush()
    file:close()
  end
  if not doesFileExist('moonloader/MOD/Commands/Inject.txt') then
    local file = io.open('moonloader/MOD/Commands/Inject.txt', 'a')
    file:write('/me доста{GENDER} пачку шприцов из ящика, предварительно открыв её\n/me доста{GENDER} шприц из пачки, затем взяв со стола ампулу с лекарство\n/me продезенфицирова{GENDER} руки специальным средством\n/me взя{GENDER} со стола ватку и спирт\n/me открыв флакончик, смочи{GENDER} ватку спиртом\n/me взя{GENDER} со стола медицинские перчатки, наде{GENDER} их на руки\n/me оголи{GENDER} нужную часть тела пациента\n/me смаза{GENDER} спиртом кожу\n/me вколо{GENDER} шприц в нужную часть тела пациента\n/inject {ID}')
    file:flush()
    file:close()
  end
  if not doesFileExist('moonloader/MOD/Commands/medard.txt') then
    local file = io.open('moonloader/MOD/Commands/medard.txt', 'a')
    file:write('/me доста{GENDER} перчатки затем наде{GENDER} перчатки\n/me прове{GENDER} осмотр верхней части тела затем нижней части тела\n/me доста{GENDER} с стола тонометр после чего наде{GENDER} рукав на руку человеку напротив и с помощью груши..\n/me накача{GENDER} давление к показателю 200 и нача{GENDER} помалу стравливать воздух\n/do Пульс было слышно на показателе 125/80.\nХорошо\n/me вписа{GENDER} "{N S}" в мед.карту и постави{GENDER} печать "Здоров"\n/me постави{GENDER} печать "{FRACTION}"\nВот ваша мед.карта,всего хорошего.\n/medcard {ID}')
    file:flush()
    file:close()
  end
  if not doesFileExist('moonloader/MOD/Commands/sex.txt') then
    local file = io.open('moonloader/MOD/Commands/sex.txt', 'a')
    file:write('/me доста{GENDER} из шкафа перчатки стерильные\n/me наде{GENDER} перчатки\n/me наде{GENDER} маску для наркоза на пациента\n/me включи{GENDER} аппарат для наркоза\n/do Пациент уснул.\n/me взя{GENDER} скальпель, затем сдела{GENDER} надрез\n/me смени{GENDER} пол пациенту\n/me взя{GENDER} мед.иглу и мед.нитки и наложи{GENDER} швы, затем взял бинт и наложи{GENDER} бинт\n/me отключи{GENDER} аппарат для наркоза, затем сня{GENDER} маску для наркоза с пациента.\n/do Пациент проснулся.')
    file:flush()
    file:close()
  end
  if not doesFileExist('moonloader/MOD/Commands/vacifashion.txt') then
    local file = io.open('moonloader/MOD/Commands/vacifashion.txt', 'a')
    file:write('/me откры{GENDER} шкаф и доста{GENDER} из него шприц и нужное лекарство\n/me закры{GENDER} шкаф\n/me надломив ампулу заполни{GENDER} шприц лекарством\n/me выброси{GENDER} пустую ампулу в мусоную корзину\n/me протянув руку вперед, взя{GENDER} человека напротив за руку\nПоработайте кулачком!\n/me подстави{GENDER} шприц к вене человека напротив\n/vac {ID} 1 500\n/vac {ID} 2 500\n/vac {ID} 3 500\n/vac {ID} 4 500')
    file:flush()
    file:close()
  end
  if not doesFileExist('moonloader/MOD/Commands/Welcome.txt') then
    local file = io.open('moonloader/MOD/Commands/Welcome.txt', 'a')
    file:write('Здравствуйте я ваш лечаший врач {SHORTNAME}, имеються ли у вас жалобы?\n/do На груди весит бейджик: "{SHORTNAME}, {RANG}, {FRACTION}".')
    file:flush()
    file:close()
  end
  if not doesFileExist('moonloader/MOD/Other/Charter.txt') then
    local file = io.open('moonloader/MOD/Other/Charter.txt', 'a')
    file:write('Заполняйте сами, долго редактровать:)".')
    file:flush()
    file:close()
  end
  if not doesFileExist('moonloader/MOD/Other/Increase-sys.txt') then
    local file = io.open('moonloader/MOD/Other/Increase-sys.txt', 'a')
    file:write('Заполняйте сами, долго редактровать:)".')
    file:flush()
    file:close()
  end
  
  clock_textdraw.style = mad.font_style.PRICEDOWN
	clock_textdraw.width = 0
	clock_textdraw.height = 0
	clock_textdraw.outline = 0
	clock_textdraw.shadow = 0
	clock_textdraw.background = false
	clock_textdraw.wrap = 175
	clock_textdraw:set_text_color(1650, 81, 151, 250)
	clock_textdraw:set_background_color(240, 240, 240, 1)
	clock_textdraw:set_shadow_color(30, 30, 30, 60)
	
  while true do
    wait(0)
	
  if autogun then	
	if lastweap ~= getCurrentCharWeapon(playerPed) then
			local weapon = getCurrentCharWeapon(playerPed)
			if weapon == 0 then
				sampSendChat("/me спрятал оружие")
			end
			if weapon == 24 then
				sampSendChat("/me достал пистолет Desert Eagle из кобуры")
			end
			if weapon == 25 then
				sampSendChat("/me достал Shotgun из-за спины")
			end
			if weapon == 31 then
				sampSendChat("/me снял с плеча автомат М4А1")
			end
			if weapon == 33 then
				sampSendChat("/me взял винтовку Sniper Rifle в руки")
			end
			if weapon == 29 then
				sampSendChat("/me взял MP-5 в руки")
			end
			if weapon == 46 then
				sampSendChat("/me надел парашют на плечи")
			end
			if weapon == 23 then
				sampSendChat("/me достал пистолет Silenced 9mm из кобуры")
			end
			lastweap = weapon
		end
  end		
    
    files, window_file = getBinds()
	
	-- clock_textdraw.text = '' .. os.date("%X")
	if ahah then
		if isPlayerPlaying(PLAYER_HANDLE) then
			if not isCharDead(PLAYER_PED) then
				local hp_str = string.format('~w~Health: ~r~%d~n~~w~Armor: ~g~%d', getCharHealth(PLAYER_PED), getCharArmour(PLAYER_PED))
				-- 'draw_text' displays text once for a frame
				mad.draw_text(hp_str, 10, 280, mad.font_style.MENU, 0.9, 1.3, mad.font_align.LEFT, 640, true, false, 255, 255, 255, 255, 1, 1)
			end
		end	
	end		
			if xyinyaaaa then
			local x, y, z = getCharCoordinates(PLAYER_PED)
			for _, object in ipairs(mad.get_all_objects(x, y, z, 300)) do
				local model = getObjectModel(object)
				if model == 1226 and getObjectHealth(object) > 0 then
					local matrix = mad.get_object_matrix(object)
					if matrix then
						local objx, objy, objz = matrix:get_coords_with_offset(-1.3, 0.165, 3.69)
						local ground_z = getGroundZFor3dCoord(objx, objy, objz)
						mad.draw_spotlight(objx, objy, objz, objx, objy, ground_z, 0.065, 27)
					end
				end
			end
			end
		
    imgui.Process = true
    imgui.ShowCursor = false
    imgui.SetMouseCursor(-1)
	
  if kod1 then
    if kod3 then
	  if kod5 then
	    if kod7 then
		  if kod9 then
		    if kod11 then
			prem = true
			spasibooo = true
			end
		  end
        end
      end
    end
  end	
	
	if neprkod then
	prem = false
	spasibooo = false
	end
	
	if menushka then
	menushka3333123 = true
	elseif not menushka then
	menushka3333123 = false
	end
	
	if polj then
	lpl = "a"
	end
	
	if polm then
	lpl = ""
	end
	
    local valid, ped = getCharPlayerIsTargeting(PLAYER_HANDLE)
    if valid and doesCharExist(ped) then
      local result, id = sampGetPlayerIdByCharHandle(ped)
      if result then
        gID = id
        clist = sampGetPlayerColor(gID)
		nickname = sampGetPlayerNickname(id)
		
        if result and isKeyJustPressed(mainCFG.Key.welcome) then
          local name, surname = string.match(sampGetPlayerNickname(id), "(%a+)_(%a+)")
          tags = {
            ["{N}"] = name or "ERROR",
            ["{S}"] = surname or "ERROR",
            ["{ID}"] = id or "ERROR",
            ["{I_D}"] = idbreak(id) or "ERROR",
            ["{N_S}"] = sampGetPlayerNickname(id) or "ERROR",
            ["{N S}"] = string.gsub(sampGetPlayerNickname(id), "_", " ") or "ERROR",
            ["{PRICE}"] = price(clist) or "ERROR",
            ["{GENDER}"] = Gender() or "ERROR",
            ["{SHORTNAME}"] = mainCFG.Settings.short_name or "ERROR",
            ["{RANG}"] = mainCFG.Settings.rang or "ERROR",
            ["{FRACTION}"] = mainCFG.Settings.fraction or "ERROR"
          }
          lua_thread.create(
            function()
              for line in io.lines('moonloader/MOD/Commands/Welcome.txt') do
                for tag in pairs(tags) do
                  if line:find(tag) then
                    line = line:gsub(tag, tags[tag])
                  end
                end
                sampSendChat(line)
                wait(2000)
              end
          end)
        end


        if result and isKeyJustPressed(mainCFG.Key.heal) then
          local name, surname = string.match(sampGetPlayerNickname(id), "(%a+)_(%a+)")
          tags = {
            ["{N}"] = name or "ERROR",
            ["{S}"] = surname or "ERROR",
            ["{ID}"] = id or "ERROR",
            ["{I_D}"] = idbreak(id) or "ERROR",
            ["{N_S}"] = sampGetPlayerNickname(id) or "ERROR",
            ["{N S}"] = string.gsub(sampGetPlayerNickname(id), "_", " ") or "ERROR",
            ["{PRICE}"] = price(clist) or "ERROR",
            ["{GENDER}"] = Gender() or "ERROR",
            ["{SHORTNAME}"] = mainCFG.Settings.short_name or "ERROR",
            ["{RANG}"] = mainCFG.Settings.rang or "ERROR",
            ["{FRACTION}"] = mainCFG.Settings.fraction or "ERROR"
          }
          lua_thread.create(
            function()
              for line in io.lines('moonloader/MOD/Commands/hela.txt') do
                for tag in pairs(tags) do
                  if line:find(tag) then
                    line = line:gsub(tag, tags[tag])
                  end
                end
                sampSendChat(line)
                wait(2000)
                if mainCFG.Settings.autoscreen then
                  function sampev.onServerMessage(color, text)
                    if text:find('Пациент согласился на лечение') then -- text:find('Вы предложили %a+_%a+ купить лекарство за %d+) and
                      sampAddChatMessage("Пациент согласился на лечение", 0x33aa33) --фикс бага функции onServerMessage
                      lua_thread.create(
                        function()
                          sampSendChat('/time')
                          wait(300)
                          setVirtualKeyDown(119, true)
                          wait(20)
                          setVirtualKeyDown(119, false)
                      end)
                      if mainCFG.Settings.healreport then
                        lua_thread.create(
                          function()
                            sampSendChat('/r '..mainCFG.Settings.rTag.." Пациент: "..string.gsub(sampGetPlayerNickname(id), "_", " ").." быстро пошел на поправку и был досрочно выписан с больницы.")
                        end)
                      end
                    end
                  end
                end
              end
          end)
        end
      end

      if result and isKeyJustPressed(mainCFG.Key.inject) then
        local name, surname = string.match(sampGetPlayerNickname(id), "(%a+)_(%a+)")
        tags = {
          ["{N}"] = name or "ERROR",
          ["{S}"] = surname or "ERROR",
          ["{ID}"] = id or "ERROR",
          ["{I_D}"] = idbreak(id) or "ERROR",
          ["{N_S}"] = sampGetPlayerNickname(id) or "ERROR",
          ["{N S}"] = string.gsub(sampGetPlayerNickname(id), "_", " ") or "ERROR",
          ["{PRICE}"] = price(clist) or "ERROR",
          ["{GENDER}"] = Gender() or "ERROR",
          ["{SHORTNAME}"] = mainCFG.Settings.short_name or "ERROR",
          ["{RANG}"] = u8(mainCFG.Settings.rang) or "ERROR",
          ["{FRACTION}"] = u8(mainCFG.Settings.fraction) or "ERROR"
        }
        lua_thread.create(
          function()
            for line in io.lines('moonloader/MOD/Commands/Inject.txt') do
              for tag in pairs(tags) do
                if line:find(tag) then
                  line = line:gsub(tag, tags[tag])
                end
              end
              sampSendChat(line)
              wait(2000)
            end
        end)
      end

      if result and isKeyJustPressed(mainCFG.Key.vactination) then
        local name, surname = string.match(sampGetPlayerNickname(id), "(%a+)_(%a+)")
        tags = {
          ["{N}"] = name or "ERROR",
          ["{S}"] = surname or "ERROR",
          ["{ID}"] = id or "ERROR",
          ["{I_D}"] = idbreak(id) or "ERROR",
          ["{N_S}"] = sampGetPlayerNickname(id) or "ERROR",
          ["{N S}"] = string.gsub(sampGetPlayerNickname(id), "_", " ") or "ERROR",
          ["{PRICE}"] = price(clist) or "ERROR",
          ["{GENDER}"] = Gender() or "ERROR",
          ["{SHORTNAME}"] = mainCFG.Settings.short_name or "ERROR",
          ["{RANG}"] = u8(mainCFG.Settings.rang) or "ERROR",
          ["{FRACTION}"] = u8(mainCFG.Settings.fraction) or "ERROR"
        }
        lua_thread.create(
          function()
            for line in io.lines('moonloader/MOD/Commands/vacifashion.txt') do
              for tag in pairs(tags) do
                if line:find(tag) then
                  line = line:gsub(tag, tags[tag])
                end
              end
              sampSendChat(line)
              wait(2000)
            end
        end)
      end

      if result and isKeyJustPressed(mainCFG.Key.setsex) then
        local name, surname = string.match(sampGetPlayerNickname(id), "(%a+)_(%a+)")
        tags = {
          ["{N}"] = name or "ERROR",
          ["{S}"] = surname or "ERROR",
          ["{ID}"] = id or "ERROR",
          ["{I_D}"] = idbreak(id) or "ERROR",
          ["{N_S}"] = sampGetPlayerNickname(id) or "ERROR",
          ["{N S}"] = string.gsub(sampGetPlayerNickname(id), "_", " ") or "ERROR",
          ["{PRICE}"] = price(clist) or "ERROR",
          ["{GENDER}"] = Gender() or "ERROR",
          ["{SHORTNAME}"] = mainCFG.Settings.short_name or "ERROR",
          ["{RANG}"] = u8(mainCFG.Settings.rang) or "ERROR",
          ["{FRACTION}"] = u8(mainCFG.Settings.fraction) or "ERROR"
        }
        lua_thread.create(
          function()
            for line in io.lines('moonloader/MOD/Commands/sex.txt') do
              for tag in pairs(tags) do
                if line:find(tag) then
                  line = line:gsub(tag, tags[tag])
                end
              end
              sampSendChat(line)
              wait(2000)
            end
        end)
      end

      if result and isKeyJustPressed(mainCFG.Key.medcard) then
        local name, surname = string.match(sampGetPlayerNickname(id), "(%a+)_(%a+)")
        tags = {
          ["{N}"] = name or "ERROR",
          ["{S}"] = surname or "ERROR",
          ["{ID}"] = id or "ERROR",
          ["{I_D}"] = idbreak(id) or "ERROR",
          ["{N_S}"] = sampGetPlayerNickname(id) or "ERROR",
          ["{N S}"] = string.gsub(sampGetPlayerNickname(id), "_", " ") or "ERROR",
          ["{PRICE}"] = price(clist) or "ERROR",
          ["{GENDER}"] = Gender() or "ERROR",
          ["{SHORTNAME}"] = mainCFG.Settings.short_name or "ERROR",
          ["{RANG}"] = u8(mainCFG.Settings.rang) or "ERROR",
          ["{FRACTION}"] = u8(mainCFG.Settings.fraction) or "ERROR"
        }
        lua_thread.create(
          function()
            for line in io.lines('moonloader/MOD/Commands/medard.txt') do
              for tag in pairs(tags) do
                if line:find(tag) then
                  line = line:gsub(tag, tags[tag])
                end
              end
              sampSendChat(line)
              wait(2000)
            end
        end)
      end
    end
  end
end
--------------------------------------------------------------------------------
--------------------------------------GUI---------------------------------------
--------------------------------------------------------------------------------



function apply_custom_style()
    imgui.SwitchContext()
    local style = imgui.GetStyle()
    local colors = style.Colors
    local clr = imgui.Col
    local ImVec4 = imgui.ImVec4

    style.WindowRounding = 2.0
    style.WindowTitleAlign = imgui.ImVec2(0.5, 0.84)
    style.ChildWindowRounding = 2.0
    style.FrameRounding = 2.0
    style.ItemSpacing = imgui.ImVec2(5.0, 4.0)
    style.ScrollbarSize = 13.0
    style.ScrollbarRounding = 0
    style.GrabMinSize = 8.0
    style.GrabRounding = 1.0

    colors[clr.FrameBg]                = ImVec4(0.48, 0.23, 0.16, 0.54)
    colors[clr.FrameBgHovered]         = ImVec4(0.98, 0.43, 0.26, 0.40)
    colors[clr.FrameBgActive]          = ImVec4(0.98, 0.43, 0.26, 0.67)
    colors[clr.TitleBg]                = ImVec4(0.04, 0.04, 0.04, 1.00)
    colors[clr.TitleBgActive]          = ImVec4(0.48, 0.23, 0.16, 1.00)
    colors[clr.TitleBgCollapsed]       = ImVec4(0.00, 0.00, 0.00, 0.51)
    colors[clr.CheckMark]              = ImVec4(0.98, 0.43, 0.26, 1.00)
    colors[clr.SliderGrab]             = ImVec4(0.88, 0.39, 0.24, 1.00)
    colors[clr.SliderGrabActive]       = ImVec4(0.98, 0.43, 0.26, 1.00)
    colors[clr.Button]                 = ImVec4(0.98, 0.43, 0.26, 0.40)
    colors[clr.ButtonHovered]          = ImVec4(0.98, 0.43, 0.26, 1.00)
    colors[clr.ButtonActive]           = ImVec4(0.98, 0.28, 0.06, 1.00)
    colors[clr.Header]                 = ImVec4(0.98, 0.43, 0.26, 0.31)
    colors[clr.HeaderHovered]          = ImVec4(0.98, 0.43, 0.26, 0.80)
    colors[clr.HeaderActive]           = ImVec4(0.98, 0.43, 0.26, 1.00)
    colors[clr.Separator]              = colors[clr.Border]
    colors[clr.SeparatorHovered]       = ImVec4(0.75, 0.25, 0.10, 0.78)
    colors[clr.SeparatorActive]        = ImVec4(0.75, 0.25, 0.10, 1.00)
    colors[clr.ResizeGrip]             = ImVec4(0.98, 0.43, 0.26, 0.25)
    colors[clr.ResizeGripHovered]      = ImVec4(0.98, 0.43, 0.26, 0.67)
    colors[clr.ResizeGripActive]       = ImVec4(0.98, 0.43, 0.26, 0.95)
    colors[clr.PlotLines]              = ImVec4(0.61, 0.61, 0.61, 1.00)
    colors[clr.PlotLinesHovered]       = ImVec4(1.00, 0.50, 0.35, 1.00)
    colors[clr.TextSelectedBg]         = ImVec4(0.98, 0.43, 0.26, 0.35)
    colors[clr.Text]                   = ImVec4(1.00, 1.00, 1.00, 1.00)
    colors[clr.TextDisabled]           = ImVec4(0.50, 0.50, 0.50, 1.00)
    colors[clr.WindowBg]               = ImVec4(0.06, 0.06, 0.06, 0.94)
    colors[clr.ChildWindowBg]          = ImVec4(1.00, 1.00, 1.00, 0.00)
    colors[clr.PopupBg]                = ImVec4(0.08, 0.08, 0.08, 0.94)
    colors[clr.ComboBg]                = colors[clr.PopupBg]
    colors[clr.Border]                 = ImVec4(0.43, 0.43, 0.50, 0.50)
    colors[clr.BorderShadow]           = ImVec4(0.00, 0.00, 0.00, 0.00)
    colors[clr.MenuBarBg]              = ImVec4(0.14, 0.14, 0.14, 1.00)
    colors[clr.ScrollbarBg]            = ImVec4(0.02, 0.02, 0.02, 0.53)
    colors[clr.ScrollbarGrab]          = ImVec4(0.31, 0.31, 0.31, 1.00)
    colors[clr.ScrollbarGrabHovered]   = ImVec4(0.41, 0.41, 0.41, 1.00)
    colors[clr.ScrollbarGrabActive]    = ImVec4(0.51, 0.51, 0.51, 1.00)
    colors[clr.CloseButton]            = ImVec4(0.41, 0.41, 0.41, 0.50)
    colors[clr.CloseButtonHovered]     = ImVec4(0.98, 0.39, 0.36, 1.00)
    colors[clr.CloseButtonActive]      = ImVec4(0.98, 0.39, 0.36, 1.00)
    colors[clr.PlotHistogram]          = ImVec4(0.90, 0.70, 0.00, 1.00)
    colors[clr.PlotHistogramHovered]   = ImVec4(1.00, 0.60, 0.00, 1.00)
    colors[clr.ModalWindowDarkening]   = ImVec4(0.80, 0.80, 0.80, 0.35)
end
apply_custom_style()

function imgui.OnDrawFrame()

   if menu5.v then
   local x, y = getScreenResolution()
    imgui.ShowCursor = true
    imgui.SetMouseCursor(1)
    imgui.LockPlayer = true
    imgui.SetNextWindowPos(imgui.ImVec2(x / 2, y / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
    imgui.SetNextWindowSize(imgui.ImVec2(137, 150), imgui.Cond.FirstUseEver)
    imgui.Begin(u8"Premium Version", menu5, imgui.WindowFlags.NoResize)
	imgui.Button("1")
	imgui.SameLine()
    imgui.Button("2")
	imgui.SameLine()
	if imgui.Button("3") then
	kod3 = true
	end
	imgui.SameLine()
	imgui.Button("4")
	imgui.SameLine()
	imgui.Button("5")
	if imgui.Button("6") then
	kod1 = true
	end
	imgui.SameLine()
	if imgui.Button("7") then
	kod9 = true
	end
	imgui.SameLine()
	imgui.Button("8")
	imgui.SameLine()
	imgui.Button("9")
	imgui.SameLine()
	if imgui.Button("10") then
	kod7 = true
	end
	if imgui.Button("11") then
	neprkod = true
	end
	imgui.SameLine()
	if imgui.Button("12") then
	neprkod = true
	end
	imgui.SameLine()
	if imgui.Button("13") then
	neprkod = true
	end
	imgui.SameLine()
	if imgui.Button("14") then
	neprkod = true
	end
	if imgui.Button("13m") then
	kod11 = true
	end
	imgui.SameLine()
	imgui.Button("1s")
	imgui.SameLine()
	imgui.Button("4d")
	imgui.SameLine()
	if imgui.Button("6ssd") then
	kod5 = true
	end
	imgui.Button("9dda")
	imgui.SameLine()
	imgui.Button("5l")
	imgui.SameLine()
	imgui.Button("3df")
	imgui.SameLine()
	imgui.Button("2da")
	
	if spasibooo then
	imgui.Text(u8"Спасибо за\nпокупку\nPremium Version!")
	end
	
    imgui.End()
   end	

 if menushka3333123 then
  local x, y = getScreenResolution()
    imgui.ShowCursor = false
    imgui.SetMouseCursor(1)
    imgui.LockPlayer = false
    imgui.SetNextWindowPos(imgui.ImVec2(x / 2, y / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
    imgui.SetNextWindowSize(imgui.ImVec2(200, 100), imgui.Cond.FirstUseEver)
    imgui.Begin("", menu3, imgui.WindowFlags.NoTitleBar + imgui.WindowFlags.NoResize)
	imgui.Text(u8"Ваш ник: "..nickname)
	imgui.Text(u8"Ваш id: "..tid)
	imgui.Text(u8"Армия: "..mainCFG.Settings.fraction)
	imgui.Text(u8"Время: ")
	
	imgui.End()
 end 
 
  if show_main_window.v then
    local x, y = getScreenResolution()
    imgui.ShowCursor = true
    imgui.SetMouseCursor(1)
    imgui.LockPlayer = true
    imgui.SetNextWindowPos(imgui.ImVec2(x / 2, y / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
    imgui.SetNextWindowSize(imgui.ImVec2(1570, 500), imgui.Cond.FirstUseEver)
    imgui.Begin(u8"Ministry Of Defence", show_main_window, imgui.WindowFlags.MenuBar + imgui.WindowFlags.NoResize + imgui.WindowFlags.NoCollapse)
    if not selected then selected = 1 end
    imgui.BeginMenuBar()
    if imgui.MenuItem(u8'MOD IC') then
      selected = 5
    end
    if imgui.MenuItem(u8'MOD OOC') then
      selected = 6
    end
    if imgui.MenuItem(u8'Options') then
      selected = 7
    end
    if imgui.MenuItem(u8'FAQ') then
      selected = 8
    end
    if imgui.MenuItem(u8'Перезагрузить скрипт') then
      sampAddChatMessage("{1aa8a0}Успешно! {440728}Скрипт перезагрузился. Введите /mod для продолжения работы.")
      thisScript():reload()
    end

    imgui.EndMenuBar()

    imgui.BeginChild('left pane', imgui.ImVec2(150, 0), true)
    if imgui.Selectable(u8'Мои данные', false) then selected = 1 end
    -- if imgui.Selectable(u8'Секретная информация', false) then selected = 2 end
    if imgui.Selectable(u8'Блокнот', false) then selected = 3 end
	if imgui.Selectable(u8'Биндер',false) then selected = 4 end
	if imgui.Selectable(u8'Панель для лидеров',false) then selected = 5785 end
    imgui.Separator()
    imgui.EndChild()

    imgui.SameLine()

    imgui.BeginGroup()
	
	if selected == 5785 then
	  imgui.Text(u8("Кинуть госку о собеседовании в ВВС:"))
	  imgui.SameLine()
	  if imgui.Button("VVS") then
	    lua_thread.create(function ()
		  sampSendChat("/gnews MOD | Здравия желаю, жители Республики "..gameServer..". Вещает - "..nickname..".")
		  wait(2500)
		  sampSendChat("/gnew MOD | Сейчас пройдёт призыв в армию Air Force.")
		  wait(1500)
          sampSendChat("/gnew MOD | Призыв пройдёт в военкомате г. Las-Venturas.")
		end)		
      end		
	  imgui.Text(u8("Кинуть конец:"))
	  imgui.SameLine()
	  if imgui.Button("VVS1") then
		sampSendChat("/gnews MOD | Призыв в Air Force подошёл к концу. Всем спасибо!")
	  end	
	  imgui.Text(u8("Кинуть госку о собеседовании в СВ:"))
	  imgui.SameLine()
	  if imgui.Button("SV") then
	    lua_thread.create(function ()
		  sampSendChat("/gnews MOD | Здравия желаю, жители Республики "..gameServer..". Вещает - "..nickname..".")
		  wait(2500)
		  sampSendChat("/gnew MOD | Сейчас пройдёт призыв в Land Forces Army.")
		  wait(1500)
          sampSendChat("/gnew MOD | Призыв пройдёт в военкомате г. Las-Venturas.")
		end)  
      end		
	  imgui.Text(u8("Кинуть конец:"))
	  imgui.SameLine()
	  if imgui.Button("SV1") then
		sampSendChat("/gnews MOD | Призыв в Land Forces Army подошёл к концу. Всем спасибо!")
	  end	
	  imgui.Text(u8("Кинуть госку о собеседовании в ВМФ:"))
	  imgui.SameLine()
	  if imgui.Button("VMF") then
	    lua_thread.create(function ()
		  sampSendChat("/gnews MOD | Здравия желаю, жители Республики "..gameServer..". Вещает - "..nickname..".")
		  wait(2500)
		  sampSendChat("/gnew MOD | Сейчас пройдёт призыв в Военно-Морской флот.")
		  wait(1500)
          sampSendChat("/gnew MOD | Призыв пройдёт в военкомате г. Las-Venturas.")
		end)  
      end		
	  imgui.Text(u8("Кинуть конец:"))
	  imgui.SameLine()
	  if imgui.Button("VMF1") then
		sampSendChat("/gnews MOD | Призыв в Navy подошёл к концу. Всем спасибо!")
	  end	
    end
	
    if selected == 1 then
	
      imgui.TextColoredRGB(text)

      imgui.Separator()

      imgui.BeginChild('root func', imgui.ImVec2(350, 0), true)

      imgui.Text(u8"Армия:")
      imgui.SameLine()
	  
	  hint("Например: Air Force")
	  
      imgui.PushItemWidth(200)
      imgui.PushAllowKeyboardFocus(false)
      if imgui.InputText("##fraction", fraction) then
        mainCFG.Settings.fraction = u8:decode(fraction.v)
        inicfg.save(mainCFG, dir)
        imgui.PopAllowKeyboardFocus()
        imgui.PopItemWidth()
      end
      if not imgui.IsItemActive() then
        local r, g, b, a = imgui.ImColor(240, 240, 240, 240):GetRGBA()
        imgui.SameLine(20)
        imgui.PushStyleColor(imgui.Col.Text, imgui.ImColor(r, g, b, 180):GetVec4())
        imgui.Text(u8(mainCFG.Settings.fraction))
        imgui.PopStyleColor()
      end

      imgui.NewLine()
	  
      imgui.Text(u8"Ваш никнейм:")
      imgui.SameLine()

	  hint("Например: Vasya Pupkin.")

      imgui.PushItemWidth(200)
      imgui.PushAllowKeyboardFocus(false)
      if imgui.InputText("##short_name", short_name) then
        mainCFG.Settings.short_name = u8:decode(short_name.v)
        inicfg.save(mainCFG, dir)
        imgui.PopAllowKeyboardFocus()
        imgui.PopItemWidth()
      end
      if not imgui.IsItemActive() then
        local r, g, b, a = imgui.ImColor(240, 240, 240, 240):GetRGBA()
        imgui.SameLine(20)
        imgui.PushStyleColor(imgui.Col.Text, imgui.ImColor(r, g, b, 180):GetVec4())
        imgui.Text(u8(mainCFG.Settings.short_name))
        imgui.PopStyleColor()
      end

      imgui.NewLine()

      imgui.Text(u8"Должность:")
      imgui.SameLine()

      hint("Например: военный врачь.")

      imgui.PushItemWidth(200)
      imgui.PushAllowKeyboardFocus(false)
      if imgui.InputText("##rang", rang) then
        mainCFG.Settings.rang = u8:decode(rang.v)
        inicfg.save(mainCFG, dir)
      end
      imgui.PopAllowKeyboardFocus()
      imgui.PopItemWidth()
      if not imgui.IsItemActive() then
        local r, g, b, a = imgui.ImColor(240, 240, 240, 240):GetRGBA()
        imgui.SameLine(20)
        imgui.PushStyleColor(imgui.Col.Text, imgui.ImColor(r, g, b, 180):GetVec4())
        imgui.Text(u8(mainCFG.Settings.rang))
        imgui.PopStyleColor()
      end
      imgui.NewLine()

      imgui.Text(u8"Тэг /r:")
      imgui.SameLine()

      hint("Например: [1 взвод]")

      imgui.PushItemWidth(200)
      imgui.PushAllowKeyboardFocus(false)
      if imgui.InputText("##r", rTag) then
        mainCFG.Settings.rTag = u8:decode(rTag.v)
        inicfg.save(mainCFG, dir)
      end
      imgui.PopAllowKeyboardFocus()
      imgui.PopItemWidth()
      if not imgui.IsItemActive() then
        local r, g, b, a = imgui.ImColor(240, 240, 240, 240):GetRGBA()
        imgui.SameLine(20)
        imgui.PushStyleColor(imgui.Col.Text, imgui.ImColor(r, g, b, 180):GetVec4())
        imgui.Text(u8(mainCFG.Settings.rTag))
        imgui.PopStyleColor()
      end

      imgui.NewLine()

      imgui.Text(u8"Тэг /f:")
      imgui.SameLine()

      hint("Например: [Air Force]")

      imgui.PushItemWidth(200)
      imgui.PushAllowKeyboardFocus(false)
      if imgui.InputText("##f", fTag) then
        mainCFG.Settings.fTag = u8:decode(fTag.v)
        inicfg.save(mainCFG, dir)
      end
      imgui.PopAllowKeyboardFocus()
      imgui.PopItemWidth()
      if not imgui.IsItemActive() then
        local r, g, b, a = imgui.ImColor(240, 240, 240, 240):GetRGBA()
        imgui.SameLine(20)
        imgui.PushStyleColor(imgui.Col.Text, imgui.ImColor(r, g, b, 180):GetVec4())
        imgui.Text(u8(mainCFG.Settings.fTag))
        imgui.PopStyleColor()
      end

      imgui.EndChild()

      imgui.SameLine()

      imgui.BeginChild('other func', imgui.ImVec2(350, 0), true)
      imgui.AlignTextToFramePadding()
  
      imgui.Text(u8("Уведомление при входе в игру"))
      imgui.SameLine(300)
      if imgui.ToggleButton("Startmessage", startmessage) then
        if mainCFG.Settings.startmessage == true then
          mainCFG.Settings.startmessage = false
        else
          mainCFG.Settings.startmessage = true
        end
        inicfg.save(mainCFG, dir)
      end
      if imgui.Checkbox("Armour and Health", aah) then 
	    if aah.v then
	    ahah = true
		elseif not aah.v then
		ahah = false
		end
	  end
	  if prem then
	    if imgui.Checkbox(u8"Улучшенный свет от столбов с фонарями", xyinya) then
	      if xyinya.v then
		  xyinyaaaa = true
		  elseif not xyinya.v then
		  xyinyaaaa = false
		  end
	    end	
	  elseif not prem then
        imgui.Text(u8"")	
      end		
      if imgui.Checkbox(u8"Женский пол", gendera) then
        if gendera.v then
		polj = true
		elseif not gendera.v then
		polj = false
		polm = true
		end
	  end	
	  if imgui.Checkbox(u8"Авто-отыгровка оружий", agun) then
	    if agun.v then
		autogun = true
		elseif not agun.v then
		autogun = false
		end
	  end	
	  if imgui.Checkbox("Menuuuu", menushkaaaaa) then
	    if menushkaaaaa.v then
		menushka = true
		elseif not menushkaaaaa.v then
		menushka = false
		end
	  end	
	  if imgui.Button("CHECK UPDATE", imgui.ImVec2(100, 100)) then
	  upd = true
	  else
	  upd = false
	  end
	  
      imgui.EndChild()
    end
	
    -- if selected == 2 then
	    -- local file = io.open('moonloader/MOD/Commands/blacklist.txt', 'r')
        -- while not file do file = io.open('moonloader/MOD/Commands/blacklist.txt', 'r') end
        -- local fileText3 = file:read('*a')
        -- fileText3 = fileText3:gsub('{GENDER}', Gender())
        -- fileText3 = fileText3:gsub('\n\n', '\n \n')
      -- imgui.BeginChild('Goss Price', imgui.ImVec2(350, 0), true)

      -- -- imgui.TextColoredRGB("{ff0000}BLACK LIST:")

	  -- -- imgui.TextColoredRGB("{FFFFFF}"..fileText3)
	  
      -- imgui.EndChild()

    -- end

    if selected == 3 then
      imgui.Separator()

      imgui.BeginChild('CMD pane', imgui.ImVec2(150, 0), true)
      if imgui.Selectable(u8'1', false) then cmd = 1 end
      if imgui.Selectable(u8'2', false) then cmd = 2 end
      if imgui.Selectable(u8'3', false) then cmd = 3 end
      if imgui.Selectable(u8'4', false) then cmd = 4 end
      if imgui.Selectable(u8'5', false) then cmd = 5 end
      imgui.EndChild()

      imgui.SameLine()

      imgui.BeginChild('edit pane', imgui.ImVec2(0, 0), true)

      if cmd == 1 then
        local file = io.open('moonloader/MOD/Commands/hela.txt', 'r')
        while not file do file = io.open('moonloader/MOD/Commands/hela.txt', 'r') end
        local fileText = file:read('*a')
        fileText = fileText:gsub('{GENDER}', Gender())
        fileText = fileText:gsub('\n\n', '\n \n')
        imgui.Separator()
        imgui.Text(u8(fileText))
        imgui.Separator()
        if imgui.Button(u8("Сохранить")) then
          edit_heal_bind.v = edit_heal_bind.v:gsub('\n\n', '\n \n')
          local file = io.open('moonloader/MOD/Commands/hela.txt', 'w')
          file:write(u8:decode(edit_heal_bind.v))
          file:flush()
          file:close()
        end
        imgui.SameLine()
        if imgui.Button(u8("Отмена")) then
          cmd = -1
        end
        imgui.SameLine()
        imgui.Separator()
        imgui.InputTextMultiline('', edit_heal_bind, imgui.ImVec2(-0.1, - 0.1))
        imgui.Separator()

      end

      if cmd == 2 then
        local file = io.open('moonloader/MOD/Commands/Inject.txt', 'r')
        while not file do file = io.open('moonloader/MOD/Commands/Inject.txt', 'r') end
        local fileText = file:read('*a')
        fileText = fileText:gsub('{GENDER}', Gender())
        fileText = fileText:gsub('\n\n', '\n \n')
        imgui.Separator()
        imgui.Text(u8(fileText))
        imgui.Separator()
        if imgui.Button(u8("Сохранить")) then
          edit_inject_bind.v = edit_inject_bind.v:gsub('\n\n', '\n \n')
          local file = io.open('moonloader/MOD/Commands/Inject.txt', 'w')
          file:write(u8:decode(edit_inject_bind.v))
          file:flush()
          file:close()
        end
        imgui.Separator()
        imgui.InputTextMultiline('', edit_inject_bind, imgui.ImVec2(-0.1, - 0.1))
        imgui.Separator()
      end

      if cmd == 3 then
        local file = io.open('moonloader/MOD/Commands/sex.txt', 'r')
        while not file do file = io.open('moonloader/MOD/Commands/sex.txt', 'r') end
        local fileText = file:read('*a')
        fileText = fileText:gsub('{GENDER}', Gender())
        fileText = fileText:gsub('\n\n', '\n \n')
        imgui.Separator()
        imgui.Text(u8(fileText))
        imgui.Separator()
        if imgui.Button(u8("Сохранить")) then
          edit_setsex_bind.v = edit_setsex_bind.v:gsub('\n\n', '\n \n')
          local file = io.open('moonloader/MOD/Commands/sex.txt', 'w')
          file:write(u8:decode(edit_setsex_bind.v))
          file:flush()
          file:close()
        end
        imgui.Separator()
        imgui.InputTextMultiline('', edit_setsex_bind, imgui.ImVec2(-0.1, - 0.1))
        imgui.Separator()
      end
      imgui.EndChild()

      imgui.Separator()
    end
    if selected == 4 then

      local t_find_text = {}
      imgui.BeginChild(1, imgui.ImVec2(180, 0), true)
      if imgui.Selectable(u8("Добавить бинд")) then add_bind = true end
      imgui.Separator()
      for i, k in pairs(files) do
        find_name_bind.v = find_name_bind.v:gsub('%[', '')
        find_name_bind.v = find_name_bind.v:gsub('%(', '')
        find_text_bind.v = find_text_bind.v:gsub('%[', '')
        find_text_bind.v = find_text_bind.v:gsub('%(', '')
        if k then
          local nameFileOpen = k:match('(.*).txt')
          if find_text_bind.v:find('%S') then
            local file = io.open('moonloader/MOD/Binds/'..k, 'r')
            while not file do file = io.open('moonloader/MOD/Binds/'..k, 'r') end
            local fileText = file:read('*a')
            fileText = fileText:gsub('{......}', '')
            if string.rlower(fileText):find(string.rlower(u8:decode(find_text_bind.v))) then
              t_find_text[#t_find_text + 1] = k
              if imgui.Selectable(u8(nameFileOpen)) then
                find_text_bind.v = ''
                text_bind = true
                id_file = i
              end
            end
            file:close()
          elseif string.rlower(nameFileOpen):find(string.rlower(u8:decode(find_name_bind.v))) and imgui.Selectable(u8(nameFileOpen)) then
            text_bind = true
            id_file = i
          end
        end
      end
      imgui.EndChild()
      imgui.SameLine()
      imgui.BeginChild(2, imgui.ImVec2(0, 0), false)
      if t_find_text[1] then

      elseif add_bind then
        imgui.InputText(u8("Название:"), add_name_bind)
        imgui.SameLine()
        if imgui.Button(u8("Сохранить")) then
          add_name_bind.v = u8(removeMagicChar(u8:decode(add_name_bind.v)))
          local namedublicate = false
          for i, k in pairs(files) do
            if k == u8:decode(add_name_bind.v) or not u8:decode(add_name_bind.v):find('%S') then namedublicate = true end
          end
          if not namedublicate then
            local index, boolindex = 0, false
            while not boolindex do
              index = index + 1
              send = true
              if not files[index] then boolindex = true end
            end
            local file = io.open('moonloader/MOD/Binds/'..u8:decode(add_name_bind.v)..'.txt', 'a')
            file:write('')
            file:flush()
            file:close()
            window_file[#window_file + 1] = imgui.ImBool(false)
            files[#files + 1] = u8:decode(add_name_bind.v)..'.txt'
            add_bind = false
          end
        end
        imgui.SameLine()
        if imgui.Button(u8("Отмена")) then add_bind = false end
      elseif edit_nbind then
        imgui.InputText(u8("Название:"), edit_name_bind)
        imgui.SameLine()
        if imgui.Button(u8("Сохранить")) then
          edit_name_bind.v = u8(removeMagicChar(u8:decode(edit_name_bind.v)))
          local namedublicate = false
          for i, k in pairs(files) do
            if k == u8:decode(edit_name_bind.v) or not u8:decode(edit_name_bind.v):find('%S') then namedublicate = true end
          end
          if not namedublicate then
            local file = io.open('moonloader/MOD/Binds/'..files[id_file], 'r')
            while not file do file = io.open('moonloader/MOD/Binds/'..files[id_file], 'r') end
            local fileText = file:read('*a')
            file:close()
            os.remove('moonloader/MOD/Binds/'..files[id_file])
            local file = io.open('moonloader/MOD/Binds/'..u8:decode(edit_name_bind.v)..'.txt', 'w')
            file:write(fileText)
            file:flush()
            file:close()
            files[id_file] = u8:decode(edit_name_bind.v)..'.txt'
            edit_nbind = false
          end
        end
        imgui.SameLine()
        if imgui.Button(u8("Отмена")) then edit_nbind = false end
        imgui.Separator()
        local file = io.open('moonloader/MOD/Binds/'..files[id_file], 'r')
        while not file do file = io.open('moonloader/MOD/Binds/'..files[id_file], 'r') end
        local fileText = file:read('*a')
        fileText = fileText:gsub('\n\n', '\n \n')
        for w in fileText:gmatch('[^\r\n]+') do
          imgui.TextColoredRGB(w, imgui.GetMaxWidthByText(fileText))
        end
        file:close()
      elseif id_file then
        if not window_file[id_file].v then
          if not text_bind then
            if edit_bind then
              imgui.Text(u8(files[id_file]:match('(.*).txt')))
              imgui.SameLine()
              if imgui.Button(u8("Сохранить текст")) then
                edit_binds.v = edit_binds.v:gsub('\n\n', '\n \n')
                local file = io.open('moonloader/MOD/Binds/'..files[id_file], 'w')
                file:write(u8:decode(edit_binds.v))
                file:flush()
                file:close()
                text_bind = true
                edit_bind = false
              end
              imgui.SameLine()
              if imgui.Button(u8("Отмена")) then
                text_bind = true
                edit_bind = false
              end
              imgui.Separator()
              imgui.InputTextMultiline('', edit_binds, imgui.ImVec2(-0.1, 300))
              imgui.Separator()
              imgui.TextColoredRGB(tags_description)
            end
            if activate_bind then
              local name, surname = string.match(sampGetPlayerNickname(gID), "(%a+)_(%a+)")
              tags = {
                ["{N}"] = name or "ERROR",
                ["{S}"] = surname or "ERROR",
                ["{ID}"] = id or "ERROR",
                ["{I_D}"] = idbreak(id) or "ERROR",
                ["{N_S}"] = sampGetPlayerNickname(id) or "ERROR",
                ["{N S}"] = string.gsub(sampGetPlayerNickname(id), "_", " ") or "ERROR",
                ["{PRICE}"] = price(clist) or "ERROR",
                ["{GENDER}"] = Gender() or "ERROR",
                ["{SHORTNAME}"] = mainCFG.Settings.short_name or "ERROR",
                ["{RANG}"] = mainCFG.Settings.rang or "ERROR",
                ["{FRACTION}"] = mainCFG.Settings.fraction or "ERROR"
              }
              lua_thread.create(
                function()
                  for line in io.lines('moonloader/MOD/Binds/'..files[id_file]) do
                    for tag in pairs(tags) do
                      if line:find(tag) then
                        line = line:gsub(tag, tags[tag])
                      end
                    end
                    sampSendChat(line)
                    wait(2000)
                  end
              end)
              text_bind = true
              activate_bind = false
            end
          else
            local file = io.open('moonloader/MOD/Binds/'..files[id_file], 'r')
            while not file do file = io.open('moonloader/MOD/Binds/'..files[id_file], 'r') end
            local fileText = file:read('*a')
            fileText = fileText:gsub('\n\n', '\n \n')
            edit_bind = false
            activate_bind = false
            imgui.Text(u8(files[id_file]:match('(.*).txt')))
            file:close()
            imgui.SameLine()
            if imgui.Button(u8("Изменить бинды")) then
              text_bind = false
              edit_bind = true
              edit_binds.v = u8(fileText)
            end
            imgui.SameLine()
            if imgui.Button(u8("Изменить название")) then
              edit_nbind = true
              edit_name_bind.v = u8(files[id_file]:match('(.*).txt'))
            end
            imgui.SameLine()
            if imgui.Button(u8("Активировать")) then
              text_bind = false
              activate_bind = true
            end
            imgui.SameLine()
            if imgui.Button(u8("Удалить")) then
              os.remove('moonloader/MOD/Binds/'..files[id_file])
              while doesFileExist('moonloader/MOD/Binds/'..files[id_file]) do os.remove('moonloader/MOD/Binds/'..files[id_file]) end
              window_file[id_file] = nil
              files[id_file] = nil
              id_file = nil
              text_bind = false
            end
            imgui.Separator()
            for w in fileText:gmatch('[^\r\n]+') do
              imgui.TextColoredRGB(w, imgui.GetMaxWidthByText(fileText))
            end
          end
        end
      end
      imgui.EndChild()
    end
	
    if selected == 5 then
      imgui.Separator()

      imgui.BeginChild('Lead pane', imgui.ImVec2(225, 0), true)
      if imgui.Selectable(u8'Устав(emerald)', false) then pane = 1 end
      imgui.Separator()
      if imgui.Selectable(u8'Устав(radiant)', false) then pane = 2 end
	  imgui.Separator()
      if imgui.Selectable(u8'Устав(trilliant)', false) then pane = 3 end
	  imgui.Separator()
      if imgui.Selectable(u8'Устав(crystal)', false) then pane = 4 end
	  imgui.Separator()
      if imgui.Selectable(u8'Устав(sapphire)', false) then pane = 5 end
	  imgui.Separator()
      if imgui.Selectable(u8'Устав(onyx)', false) then pane = 6 end
	  imgui.Separator()
      if imgui.Selectable(u8'Устав(amber)', false) then pane = 7 end
	  imgui.Separator()
      if imgui.Selectable(u8'Устав(quartz)', false) then pane = 8 end
      imgui.Separator()
	  if imgui.Selectable(u8'Система повышений(emerald)', false) then pane = 9 end
      imgui.Separator()
	  if imgui.Selectable(u8'Система повышений(radiant)', false) then pane = 0 end
      imgui.Separator()
	  if imgui.Selectable(u8'Система повышений(trilliant)', false) then pane = 123 end
      imgui.Separator()
	  if imgui.Selectable(u8'Система повышений(crystal)', false) then pane = 414 end
      imgui.Separator()
	  if imgui.Selectable(u8'Система повышений(sapphire)', false) then pane = 231 end
      imgui.Separator()
	  if imgui.Selectable(u8'Система повышений(onyx)', false) then pane = 13 end
      imgui.Separator()
	  if imgui.Selectable(u8'Система повышений(amber)', false) then pane = 41 end
      imgui.Separator()
	  if imgui.Selectable(u8'Система повышений(quartz)', false) then pane = 234 end
      imgui.Separator()
	  if imgui.Selectable(u8'Строевой устав', false) then pane = 4345 end
      imgui.Separator()
	  if imgui.Selectable(u8'Устав [arizona] (messa)', false) then pane = 9959 end
	  imgui.Separator()
	  if imgui.Selectable(u8'Устав [arizona] (scottdale)', false) then pane = 8800 end
	  imgui.Separator()
	  if imgui.Selectable(u8'Устав [arizona] (chandler)', false) then pane = 55535 end
	  imgui.Separator()
	  if imgui.Selectable(u8'Устав [arizona] (brainburg)', false) then pane = 352 end
	  imgui.Separator()
	  if imgui.Selectable(u8'Устав [arizona] (saint rose)', false) then pane = 706 end
	  imgui.Separator()
	  if imgui.Selectable(u8'Устав [arizona] (tucson)', false) then pane = 112233 end
	  imgui.Separator()
	  if imgui.Selectable(u8'Устав [arizona] (phoenix)', false) then pane = 123123123 end
	  imgui.Separator()
	  if imgui.Selectable(u8'Устав [arizona] (yuma)', false) then pane = 8585 end
	  imgui.Separator()
	  if imgui.Selectable(u8'Устав [arizona] (redrock)', false) then pane = 5051 end
	  imgui.Separator()
      imgui.EndChild()

      imgui.SameLine()

      imgui.BeginChild('edit pane', imgui.ImVec2(0, 0), true)

      if pane == 1 then
        if imgui.TreeNode(u8"Открыть(E)") then
        local text = [[Настоящий Устав определяет права и обязанности военнослужащих Вооруженных Сил Республики Эмеральд и взаимоотношения между ними,
		обязанности основных должностных лиц части и его подразделений, а также правила внутреннего порядка.

Обязанности должностных лиц, не указанных в Уставе, определяются соответствующими положениями, наставлениями, инструкциями и руководствами.

Настоящим Уставом руководствуются военнослужащие органов военного управления, воинских частей, организаций Вооруженных Сил,
в том числе военных образовательных учреждений профессионального образования Министерства обороны (далее - воинские части),
и лица гражданского персонала, замещающие воинские должности.?

Общие положения

1. Повседневная жизнь и деятельность военнослужащих в воинской части осуществляются в соответствии с требованиями внутренней службы.
Внутренняя служба предназначена для поддержания в воинской части внутреннего порядка и воинской дисциплины, обеспечивающих ее постоянную боевую готовность,
безопасность военной службы, учебу личного состава, организованное выполнение им других задач в повседневной деятельности и охрану здоровья военнослужащих.

2. Внутренняя служба требует организованных действий военнослужащих независимо от их желаний.
Выполнение требований внутренней службы развивает у военнослужащих чувство ответственности, самостоятельность, аккуратность и добросовестность.
Взаимопонимание, доброжелательность и готовность помочь друг другу способствуют укреплению войскового товарищества и сплочению воинских коллективов,
позволяют не только выполнять задачи в повседневной деятельности, но и выдерживать тяжелые испытания в боевой обстановке.

3. Требования внутренней службы обязан знать и добросовестно выполнять каждый военнослужащий.
В начале прохождения военной службы военнослужащий нуждается в особом внимании.
Строгий контроль со стороны командиров (начальников) и их личный пример помогают военнослужащему быстрее осознать требования внутренней службы.

4. Руководство внутренней службой в воинской части осуществляет командир воинской части, а в расположении подразделения - командир подразделения.
К военнослужащим относятся:?
Офицеры, прапорщики и мичманы, курсанты военных образовательных учреждений профессионального образования, сержанты и старшины,
солдаты и матросы,
проходящие военную службу по контракту (далее - военнослужащие, проходящие военную службу по контракту);
Каждому военнослужащему присваивается соответствующее воинское звание. Воинские звания подразделяются на войсковые и корабельные.
Военнослужащие при исполнении обязанностей военной службы, а при необходимости и во внеслужебное время,
имеют право на хранение, ношение, применение и использование оружия.

Правила хранения оружия, условия и порядок применения его военнослужащими определяются настоящим Уставом.
При ношении и использовании оружия военнослужащие обязаны обеспечить его сохранность и исключить доступ к нему посторонних лиц. 
Военнослужащие в соответствии с законодательством Республики Эмеральд могут применять оружие лично,
а командиры (начальники) приказать подчиненным применить оружие для защиты жизни, здоровья и собственности в состоянии необходимой обороны
или крайней необходимости в следующих случаях:
для отражения вооруженного либо группового нападения на охраняемые государственные и военные объекты,
а также на расположения воинских частей и подразделений, здания и сооружения воинских частей, воинские эшелоны, колонны машин, единичные
транспортные средства и караулы, если иными способами и средствами их защитить невозможно;
для пресечения попытки насильственного завладения вооружением и военной техникой, если иными способами и средствами их защитить невозможно;
для защиты военнослужащих и гражданских лиц от нападения, угрожающего их жизни или здоровью, если иными способами и средствами защитить их невозможно;
для задержания лица, совершившего противоправные действия и оказывающего вооруженное сопротивление,
а также вооруженного лица, отказывающегося выполнить законные требования о сдаче оружия,
если иными способами и средствами подавить сопротивление, задержать данное лицо или изъять у него оружие невозможно.
В боевых условиях командир (начальник), кроме того, имеет право применить оружие лично или приказать применить оружие для восстановления дисциплины
и порядка в случае открытого неповиновения подчиненного, когда действия неповинующегося явно направлены на государственную измену или
срыв выполнения боевой задачи, а также при выполнении задач в условиях чрезвычайного положения.
За нарушение уставных правил взаимоотношений между военнослужащими, связанное с унижением чести и достоинства, издевательством или сопряженное с насилием,
а также за оскорбление одним военнослужащим другого виновные привлекаются к дисциплинарной ответственности, а при установлении в их действиях состава
преступления - к уголовной ответственности.

Приказ - распоряжение командира (начальника), обращенное к подчиненным и требующее обязательного выполнения определенных действий,
соблюдения тех или иных правил или устанавливающее какой-либо порядок, положение.
Приказ может быть отдан в письменном виде, устно или по техническим средствам связи одному или группе военнослужащих.
Приказ, отданный в письменном виде, является основным распорядительным служебным документом (нормативным актом) военного управления,
издаваемым на правах единоначалия командиром воинской части. Устные приказы имеют право отдавать подчиненным все командиры (начальники).
Обсуждение (критика) приказа недопустима, а неисполнение приказа командира (начальника),
отданного в установленном порядке, является преступлением против военной службы.

Приказание - форма доведения командиром (начальником) задач до подчиненных по частным вопросам. Приказание отдается в письменном виде или устно.

Глава №1. Общие обязанности военнослужащих.

Пункт 1.1. Военнослужащий обязан в служебной деятельности руководствоваться Конституцией Республики Emerald,
федеральными законами и иными нормативно правовыми актами.
Пункт 1.2. Военнослужащий обязан быть дисциплинированным, бдительным, хранить государственную тайну.
Пункт 1.3. Военнослужащий обязан быть верным Военной присяге, мужественно и умело защищать Республику Emerald.
Пункт 1.4. Военнослужащий обязан совершать воинское мастерство, содержать в постоянной готовности к применению вооружения
и военную технику, беречь военное имущество.
Пункт 1.5. Военнослужащий должен быть честным, храбрым, при выполнении воинского долга проявлять разумную инициативу,
защищать командиров (начальников) в бою.
Пункт 1.6. Военнослужащий обязан уважать честь и достоинство других военнослужащих, выручать их из опасности,
помогать им словом и делом, удерживать от недостойных поступков, не допускать в отношении себя и других военнослужащих грубости и издевательства,
содействовать командирам (начальникам) и старшим в поддержании порядка и дисциплины. Он должен соблюдать правила воинской вежливости, поведения,
выполнения воинского приветствия, ношения военной формы одежды и знаков различия.
Пункт 1.7. Военнослужащий обязан находится на территории своей части с 9:00 до 22:00
(Рядовым\Матросам, Младшим сержантам\Старшинам Сержантам\Мичманам круглосуточно, исключения прописаны в пункте 5.5).
Пункт 1.8. Каждый военнослужащий обязан подчинятся военнослужащему по должности выше. Подчиненный обязан беспрекословно выполнять приказы начальника.
Пункт 1.9. Рядовые/Матросы-Младшие сержанты/Старшины-Сержанты/Мичманы-Прапорщики/Мл.лейтенанты ночуют в казарме. (/setspawn - Стандартный спавн)
Пункт 1.10. При уходе в отпуск запрещается вступать в нелегальные организации.
Пункт 1.11. Каждый военнослужащий обязан исполнять приказы, указанные в официальных документах, выпущенных Министром Обороны,
Генералом/Адмиралом/Вице-Президентом/Президентом.
Пункт 1.12. Каждый военнослужащий во время несении службы (раб.день) обязан быть экипирован в бронежилет.


Глава №2. Общение и субординация.

Пункт 2.1. Военнослужащий обязан обращаться к старшим строго по званию.
Пункт 2.3. Военнослужащий обязан проявлять уважение к старшим по званию. Обращаться к старшим строго по строевому уставу:

"Здравия желаю!"
/me выполнил воинское приветствие
"Т.Звание, разрешите обратиться?"

Пункт 2.4. Строго запрещено обращаться к военнослужащим фразой: "Сэр/мэм".
Пункт 2.5. Запрещено употреблять такие слова как: "ку", "да", "нет" "сори" "Можно" и так далее.
Все эти слова должны автоматически заменяться на: "Здравия желаю", "Так точно", "Никак нет" "Виноват" "Разрешите".
Пункт 2.6. Военнослужащим запрещено использовать рацию армии [/r] и рацию Мин. Обороны [/f] не по назначению.
Пункт 2.7. Каждый военнослужащий который обращается к другому военнослужащему в рацию, обязан называть его Звание/Должность Имя Фамилию. 


Глава №3. Построение.

Пункт 3.1. При команде "Общее построение" строятся все военнослужащие.
Пункт 3.2. При опоздании в строй, боец обязан произнести фразу: "Виноват. Т.Звание, разрешите встать в строй?".
Пункт 3.3. Строй офицеров должен быть отделён от строя бойцов младшего состава.
Пункт 3.4. В строю запрещается: без разрешения разговаривать, засыпать, использовать мобильные телефон, держать оружие в руках, курить.
Пункт 3.5. Во время строя бойцы, офицеры должны выполнять всё приказы, которые им отдаёт командир.
Пункт 3.6. Часть разрешается строить для проверок от сотрудников "ФБР".*
Пункт 3.7. Общее построение разрешается делать со звания Ст.лейтенант и по приказу старших офицеров со звания Мл.лейтенант
Пункт 3.8. Прапорщик имеет право строить "бойцовский состав"


Глава №4. Проникновение посторонних на территорию воинской части (в/ч).

Пункт 4.1. При обнаружении гражданских лиц на территории военной базы, военнослужащий должен вывести его за территорию.
В случае неподчинения, боец обязан дать отсчет до пяти, после чего сделать предупредительных выстрел в воздух.
В случае неподчинения после предупредительного выстрела разрешается открыть огонь на поражение.
Пункт 4.2. При обнаружении представителей нелегальных организаций или лиц, несущих прямую угрозу военнослужащим
на территории военной базы незамедлительно открывать огонь на поражение.
Пункт 4.3. При обнаружении представителей государственных организаций на территории военной базы,
военнослужащий обязан спросить цель прибытия, после чего доложить в рацию о постороннем, спросить разрешение на пропуск на территорию военной базы.
Пункт 4.4. Сотрудники FBI имеют право круглосуточно находиться на территории базы.
Сотрудники Спец. подразделений EPD имеют право находиться на территории военной базы для её охраны и устранений ЧС, а так же, они имеют право входит в
воздушное пространство во время облёта баз.
Пункт 4.5. В том случае, если кто-либо подъехал к КПП, дежурный по КПП должен спросить о цели прибытия,
но открывать огонь или давать отсчёт запрещается.
Пункт 4.6. В случае подачи признаков агрессии (вооруженное или невооруженное), боец должен немедленно нейтрализовать нападающего.


Глава №5. Выход за территорию базы и увольнительное время.

Пункт 5.1. Базу разрешается покидать со звания Полковник/Вице-Адмирал для выполнения должностных обязанностей(Поиск самоволов/дезертиров).
Пункт 5.2. Увольнительные можно брать бойцам со звания Прапорщик(СВ/ВВС)/Мл.Лейтенант(ВМФ).
Пункт 5.3. Увольнительное время действует с 22:00 до 09:00.
Пункт 5.4. Запрещено использовать оружие в личных целях.
Пункт 5.5. Бойцы со звания Рядовой/Матрос, Мл.Сержант/Старшина и Сержант/Мичман имеют право отправляться в увольнительное время в следующие дни:
Субботу и Воскресенье (с 22:00 до 9:00).
Пункт 5.6. Запрещается посещать казино вне увольнительного времени(Во время увольнительного времени разрешено посещать казино только в гражданской одежде).


Глава №6. Склад оружия.

Пункт 6.1. При обнаружении на территории склада оружия представителей ОПГ незамедлительно открыть огонь на поражение.
Пункт 6.2. При обнаружении на территории склада оружия сотрудников СМИ, МЗ или гражданских, обязан сопроводить их за территорию,
а потом указать путь от закрытой зоны. В случае сопротивления военнослужащему разрешается открыть огонь на поражение,
после дачи отсчета и предупредительного выстрела в воздух.
Пункт 6.3. Сотрудники SWAT и FBI имеют полное право находится на территории склада оружия.
Пункт 6.4. Военнослужащий на КПП обязан проверять документы у всех въезжающих на территорию Склада Оружия (СО) лиц,
не важно, гражданский это, военный или Министр Обороны (даже если вы узнали их по лицу).
Пункт 6.5. Каждый военнослужащий, въезжающий и выезжающий за пределы склада оружия, обязан закрывать за собой шлагбаум на КПП.



Глава №7. Повышения.

Пункт 7.1. Общее повышения проходят в установленное Генералом/Адмиралом время.
Пункт 7.2. Внеочередное повышение можно получить за ночное дежурство в карауле.


Глава №8. Отчеты и доклады.

Пункт 8.1. Каждый офицер обязан оставлять заявление на отпуск, прежде чем уйти в него.
Пункт 8.2. Каждый боец, находящийся при исполнении служебных обязанностей, обязан докладывать о состоянии своего поста в рацию.
Пункт 8.3. Каждый Генерал/Адмирал обязан оставлять ежедневный и еженедельные отчёты о проделанной работе.
Пункт 8.4. Каждый офицер в звании Подполковник/Капитан 1-го ранга обязан оставлять отчёт на усмотрение Генерала/Адмирала.
Пункт 8.5. Каждый офицер в звании Полковник/Вице-Адмирал обязан оставлять отчёт о проделанной работе раз в 7 дней.


Глава №9. Склад боеприпасов.?

Пункт 9.1. Норма БП для Рядовых составляет 180 Ед. и 100 патронов. [1 ранг]
Пункт 9.2. Норма БП для Мл.Сержантов-Прапорщиков составляет 500 Ед. и 500 патронов. [2-4 ранг]
Пункт 9.3. Норма БП для Офицеров составляет 1000 Ед. и 1000 патронов. [5+ ранг]
Пункт 9.4. Офицеры после прибытия колонны с СО обязаны раздать норму военнослужащим.
Пункт 9.5. Склад разрешено открывать для всех военнослужащих при состоянии не ниже 195/195 БП.
Пункт 9.6. Склад разрешено открывать со звания Мл.Лейтенант(СВ/ВВС)/Лейтенант(ВМФ).
Пункт 9.7. Минимальное состояние склада для взятия боеприпасов Спец.Отрядам прописана в их Уставах.


Глава №10. Военный транспорт.

Пункт 10.1. Военный транспорт разрешено брать с разрешения офицера.
Пункт 10.2. Запрещается оставлять военные фуры на "Складе оружия".
Пункт 10.3. Военные фуры разрешается брать со звания Мл.сержант\Старшина.
Пункт 10.4. Военные патриоты разрешается брать со звания Сержант\Мичман.
Пункт 10.5. Воздушную технику разрешается брать со звания Младший Лейтенант\Лейтенант и бойцам спец.подразделений.


Глава №11. Правила рации.

Пункт 11.1. Запрещено повторять одну информацию два и более раз. (флудить)
Пункт 11.2. Рация создана для докладов, а так же для важного общения.
Пункт 11.3. Запрещен мат в рацию, а так же оскорбления.
Пункт 11.4. Рация Министерства доступна со звания Сержант/Мичман.
Пункт 11.5. Запрещено нести бред в рацию.
Пункт 11.6. Запрещено невнятно говорить. (Использовать транслитерацию).
Пункт 11.7. Запрещено устраивать конфликты по рации.
Пункт 11.8. Запрещено использовать рацию в личный целях (продажа/покупка).
Пункт 11.9. Военнослужащий обязан уважительно относиться к другим.
Пункт 11.10. Военнослужащий обязан соблюдать субординацию.


Глава №12. Правила военкомата.

Пункт 12.1. К проверке призывников допускаются военнослужащие со звания Прапорщика.
Пункт 12.2. В военкомат категорически запрещено являться с оружием.
Пункт 12.3. Запрещено открывать огонь и наносить побои гражданским.
Пункт 12.4. Запрещено допускать к службе незаконопослушных призывников.
Пункт 12.5. Запрещено допускать к службе призывников, не ознакомленных с законодательством Республики.
Пункт 12.6. Призыв может проходить только в военкомате.
Пункт 12.7. Проводить призыв на базе, или на заднем дворе военкомата категорически запрещено.


Глава №13. Правила отпуска.

Пункт 13.1. Во время отпуска запрещено заниматься нелегальной деятельностью или состоять в организации, занимающейся нелегальной деятельностью.
Пункт 13.2. Во время отпуска запрещено отправляться на исправительные работы (получать варны и баны).
Пункт 13.3. Во время отпуска запрещено подниматься по карьерной лестнице в других государственных организациях (выше 3 ранга).


Глава №14. Наркотические вещества и алкогольная продукция.

Пункт 14.1. Во время службы в армии запрещается хранение и употребление любых наркотических средств и алкогольных продукций.]]
      imgui.TextColoredRGB(text)
      imgui.Separator()		
            imgui.BeginChild('BLS', imgui.ImVec2(160, 90), false)
            imgui.EndChild()
            imgui.TreePop()
        end
      end

      if pane == 2 then
        if imgui.TreeNode(u8"Открыть(R)") then
        local text = [[Глава №1. Общее положение.



Раздел 1:Общие положения.
Пункт 1.0: Военнослужащий обязан исполнять обязанности,
указанные в уставе Министерства Обороны и чтить правила военнослужащего, указанных в уставе Министерства Обороны.
Пункт 1.1: Если военнослужащий не приветствует бойца/офицера высшем по званию ему даётся выговор.
Пункт 1.2: Военнослужащий обязан добросовестно нести службу, и исполнять долг Родины.
Пункт 1.3: Военнослужащий обязан защищать военную базу, военные объекты, других военнослужащих,
гостей базы от незаконного вторжения на территорию базы или от нападения.
Пункт 1.4: Военнослужащий обязан находится на территории своей части круглосуточно.
(Данный пункт распространяется до звания Подполковник/Капитан 1-го ранга)
Пункт 1.5: Каждый военнослужащий обязан подчинятся военнослужащему по званию выше.
Например: Матрос подчиняется Сержанту,
Сержант подчиняется Капитану 1-ого ранга.
Пункт 1.6: Бойцы от звания Рядовой/Матрос до звания Лейтенант/Мл.Лейтенант обязаны жить только в казарме.
(/setspawn - Стандартный,у всех до 5-ого ранга.)
Пункт 1.7: Каждый военнослужащий обязан исполнять приказы, указанные в официальных документах, выпущенных Министром Обороны, либо Генералом/Адмиралом.
Пункт 1.8: Разрешается посещать казино, пейнтболл, бейсжампинг,
гонки и участие в семенных играх вне увольнительного времени только при получении разрешения от Министра обороны.
Пункт 1.9: При уходе в отпуск запрещается вступать в любые организации.
Пункт 1.10: Рядовым/Матросам запрещается пользоваться федеральной волной [/f] Исключение: Сообщение о ЧС.
Пункт 1.11: Всем бойцам армии запрещается состоять в байкерском клубе.
Пункт 1.12: Запрещено брать служебный наземный/воздушный/водный транспорт в личных целях.
Пункт 1.13: Запрещено воровать боеприпасы,если склад закрыт.
Пункт 1.14: Запрещено игнорировать в рацию руководящий состав.
Пункт 1.15: Запрещено продавать/передавать ключи(от КПП СО)/форму/боеприпасы/служебный транспорт военных баз.
Пункт 1.16: Запрещено пользоваться командами /anim на посту.
Пункт 1.17: Запрещено спать на посту/в строю/вне положенном месте.
Пункт 1.18: Запрещено пользоваться телефоном в строю и на посту, только СМС сообщения.
Пункт 1.19: Запрещено самовольно покидать пост, менять его.
Пункт 1.20: Запрещено выпрашивать внеочередное звание/снятие выговора/проверку отчетов.
Пункт 1.21: Запрещено находиться на базе без бронежилета.
Пункт 1.22: Запрещено бегать/стоять на базе без дела.
Пункт 1.23: Аксессуары носить можно только со звания Капитана/Капитана 3-го ранга. (Только очки,шляпы,попугаи).
Исключение: часы(разрешено носить с рядового/матроса),портфели.
Пункт 1.24: Если Вам нужно покинуть территорию базы, вы обязаны взять разрешение у Подполковника/Капитана 1-го ранга или более высокого звания.
Пункт 1.25 Запрещено читать лекции в рацию.
Пункт 1.26 Генерал/Адмирал и Министр обороны имеет полное право спросить в любое время у любого офицера устав,
и в случае незнания устава офицер будет уволен или получит выговор.
Пункт 1.27 Запрещено носить прически до звания Подполковник/Капитан 1-ого ранга(включительно).
Пункт 1.28: Запрещено находиться на базе без шлема. Исключения: офицеры со звания Мл.Лейтенант/Лейтенант ( 4 + ),
Вице-Адмиралы/Полковники,Генералы/Адмирал,Министр Обороны, спец.отряд ОСН, Военный Полицейский.
Пункт 1.29 : Военный Прокурорам разрешается нарушать некоторые пункты устава(исключение : измена родине)
Пункт 1.30 : Главный склад - место,где вы можете пополнить свои "карманы" боеприпасами для самообороны и обороны военной базы.
Количество разрешённой "нормы" боеприпасов меняется с повышением вашего звания:
Рядовой/Матрос [1] - могут брать боеприпасы до состояния 195/195.
Мл.Сержант/Старшина - Сержант/Мичман [2-3] - могут брать боеприпасы до состояния 190/190.
Прапорщик/Мл.Лейтенант [4] - могут брать боеприпасы до состояния 185/185.
Мл.Лейтенанта/Лейтенанта - Ст.Лейтенанта/Капитана-Лейтенанта [5-7] - могут брать боеприпасы до состояния 180/180.
Капитана/Капитана 3-го ранга - Подполковника/Капитана 1-го ранга [8-10] - могут брать боеприпасы до состояния 170/170. 
?




Глава 2. Субординация.



Пункт 2.1:Субординация — положение военнослужащего в системе отношений армии и флота. Воинская подчиненность (то же, что и военная дисциплина) и послушание.
Пункт 2.2: Военнослужащие должны постоянно служить примером высокой культуры, скромности и выдержанности, свято блюсти воинскую честь,
защищать свое достоинство и уважать достоинство других. Они должны помнить, что по их поведению судят не только о них, но и о Вооруженных Силах в целом.
Пункт 2.3: Если военнослужащий не будет соблюдать правила субординации, он будет демобилизован.
Пункт 2.4: Военнослужащий обязан исполнять любые приказы старшего по званию.
Пункт 2.5: Каждый военнослужащий обязан подчинятся военнослужащему старше по званию. Например: Матрос подчиняется Сержанту,
Сержант подчиняется Капитану 1-ого ранга.
Пункт 2.5.1: Правило не действительно в том случае, если бойцу уже отдал приказ офицер выше по званию. Сержант не может отдать приказ Рядовому или Матросу,
если ему приказывает Лейтенант.
Пункт 2.5.2: Отдать приказ военнослужащему другой армии возможно только в случае отсутствия поблизости офицера той армии, в которой состоит военнослужащий,
которому отдали приказ.
Пункт 2.5.3: Любой приказ служащему другой армии должен проходить через федеральную волну (/f). Исключение: боец стоит перед вами.

Пункт 2.6: Военнослужащий обязан обращаться к старшим строго по званию и на ВЫ.
Пункт 2.7: Военнослужащий обязан проявлять уважение к старшим по званию. Обращаться к старшим строго по уставному общению
Пункт 2.8: В Армии строго запрещено обращаться к военнослужащим фразой: "Товарищ". Обращение строго по форме - " "Звание" "Фамилия", разрешите обратится?"
Пункт 2.9: Запрещено употребление нецензурных слов и оскорбление по отношению к военнослужащим и гражданским лицам.
Пункт 2.10: Если военнослужащий не приветствует бойца/офицера выше по званию, ему даётся выговор.
Пункт 2.11: Запрещено беспокоить Генерала/Адмирала, Полковника/Вице-Адмирала с вопросами на которые могут ответить офицеры.
Пункт 2.12: Запрещено просить Министра, Генерала/Адмирала, Полковника/Вице-Адмирала что либо проверить.
Пункт 2.13: Военнослужащим запрещается держать руки в карманах одежды, сидеть или курить в присутствии начальника (старшего)
без его разрешения, а также курить на улицах на ходу и в местах, не отведенных для курения.
Пункт 2.14: Запрещено вести речь о покупке/продаже/обмене чего-либо в волну армии и федеральную волну.
Пункт 2.15: Офицерам запрещается игнорировать младший состав, когда тем необходимо сдать экзамен или норматив.
Пункт 2.16: В армии нет таких фраз, как:
"Так точно", "Никак нет", "Господин", "Окей", "Возможно", "Ясно", "Приказ принят", "Извините", "Можно", "Здравствуйте", "Не знаю", "Товарищ",
"Ладно", "Хорошо", "Привет", "Добрый день/вечер/утро", "До свидания", "Пока".
Они заменяются эквивалентными: "Да,сэр/мэм/мисс", "Нет,сэр/мэм/мисс", "Понял", "Принято", "Виноват", "Разрешите",
"Не могу знать", "Здравия желаю", "Честь имею", "Вас понял сэр/мэм/мисс"
Пункт 2.17: В случае незнания звания офицера, боец имеет право назвать его "Офицер, "Фамилия офицера"".
Группу военнослужащих младшего состава разрешается называть "Бойцами".
Бойцам разрешено обращаться к старшему офицерскому составу на "Офицеры". (Во множественном числе)


Глава 3. Присяга.

Пункт 3.1:Военная Присяга – это церемониальная торжественная клятва,
даваемая каждым гражданином при поступлении на военную службу в вооружённые силы государства.
Пункт 3.2: Присяга принимается при получении погон Старшины/Младшего Сержанта, после сдачи отчёта.
Пункт 3.3: Текст присяги может изменить только Министр Обороны республики.
Пункт 3.4: Текст присяги указан в Уставе Министерства Обороны:
"Я, гражданин республики Радиант, вступая в ряды армии республики Радиант, принимаю присягу.
Я торжественно клянусь свято соблюдать Конституцию республики, строго..
..выполнять требования воинских уставов, приказы командиров и начальников.
Клянусь достойно исполнять воинский долг, мужественно защищать..
..свободу, независимость, и конституционный строй республики Радиант…
Если же по злому умыслу, я нарушу эту присягу, я понесу суровое..
..наказание, ненависть и презрение военнослужащих."
Пункт 3.5: За предательство военной присяги, вы будете отправлены под Военный Трибунал.



Глава 4. Строй.


Раздел 4.1: Общие понятия.

Пункт 4.1.1: Строй - установленное Уставом размещение военнослужащих, подразделений и воинских частей для их совместных действий в пешем порядке и на машинах.
Шеренга - строй, в котором военнослужащие размещены один возле другого на одной линии на установленных интервалах.
Линия машин - строй, в котором машины размещены одна возле другой на одной линии.
Фланг - правая (левая) оконечность строя. При поворотах строя названия флангов не изменяются.
Фронт - сторона строя, в которую военнослужащие обращены лицом (машины - лобовой частью).
Тыльная сторона строя - сторона, противоположная фронту.
Интервал - расстояние по фронту между военнослужащими (машинами), подразделениями и воинскими частями.
Дистанция - расстояние в глубину между военнослужащими (машинами), подразделениями и воинскими частями.
Ширина строя - расстояние между флангами.
Глубина строя - расстояние от первой шеренги (впереди стоящего военнослужащего) до последней шеренги (позади стоящего военнослужащего),
а при действиях на машинах - расстояние от первой линии машин (впереди стоящей машины) до последней линии машин (позади стоящей машины).
Колонна - строй, в котором военнослужащие расположены в затылок друг другу, а подразделения (машины) - одно за другим на дистанциях,
установленных Уставом или командиром.
Ряд - два военнослужащих, стоящих в двухшережном строю в затылок один другому.
Направляющий - военнослужащий (подразделение, машина), движущийся головным в указанном направлении.
По направляющему сообразуют свое движение остальные военнослужащие (подразделения, машины).
Замыкающий - военнослужащий (подразделение, машина), движущийся последним в колонне.

Раздел 4.2: Управление строем.
Пункт 4.2.1: Управление строем осуществляется командами и приказаниями, которые подаются командиром голосом, сигналами и личным примером,
а также передаются с помощью технических и подвижных средств.
Пункт 4.2.2: Команды и приказания могут передаваться по колонне через командиров подразделений (старших машин) и назначенных наблюдателей.
Управление в машине осуществляется командами и приказаниями, подаваемыми голосом и с помощью средств внутренней связи.
В строю старший командир находится там, откуда ему удобнее командовать. Остальные командиры подают команды, оставаясь на местах,
установленных Уставом или старшим командиром.
Пункт 4.2.3: Команда разделяется на предварительную и исполнительную. Команды могут быть и только исполнительные.
Предварительная команда подается отчетливо, громко и протяжно, чтобы находящиеся в строю поняли, каких действий от них требует командир.
Пример: Нале-ВО! Кру-ГОМ! и т.д.

Раздел 4.3: Особые положения.
Пункт 4.3.1: При команде "Общее построение" строятся все военнослужащие.
Пункт 4.3.2: При опоздании в строй, боец обязан произнести фразу: "Виноват! Разрешите встать в строй?".
Пункт 4.3.3: Строй офицеров должен быть отделен от строя бойцов младшего состава.
Пункт 4.3.4: В строю запрещается:
- Разговаривать;
- Засыпать (AFK):
- Использовать мобильный телефон, только СМС;
- Держать оружие в руках (Исключение: когда необходимо выровняться.);
- Смеяться, улыбаться, плакать;
- Вставать в любые стойки (/anim);
- Выполнять другие действия не по уставу;
Пункт 4.3.5: Если Вам нужно выйти из строя, Вы должны спросить разрешение.


Глава 5. Допуск на территорию ВБ.


Пункт 5.1: Информация о допусках:

Уровни допуска на территорию военных баз:

"Красный "

Обладателю красного допуска разрешено посещение всей армии в любое время.
Красный уровень допуска может выдавать только Министр Обороны.
Обладатели красного уровня допуска:

Комиссар ПД
Директор FBI
Заместитель Директора FBI
Советник по Нац. Безопасности

Всем получившим красный уровень допуска разрешается:

- Расспрашивать руководящий состав о делах в армии.
- Посещать бункер.
- Использовать табельное оружие.
- Перемещаться по базе в сопровождении офицера

Всем получившим красный уровень допуска запрещается:

- Парковать свои автомобили на территории части.
- Нарушать субординацию в части.
- Общаться с солдатами, несущих караульную службу.
- Дерзить солдатам.
- Нарушать действия режимов ЧС.

"Оранжевый"

Обладателю оранжевого допуска разрешено посещение всех ВБ с 7:00 до 22:00
(исключение в случае если президенту или мэру города угрожает опасность он может в любое время укрыться в бункере на базе СВ).
Оранжевый уровень допуска может выдавать только Министр Обороны.
Обладатели оранжевого уровня допуска:
Президент республики
Мэры городов
Шефы SAPD 
Министр Здравоохранения 
Сотрудники FBI
Упр.СМИ.

Всем получившим оранжевый уровень допуска разрешается:

- Перемещаться по базе в сопровождении офицера
- Посещать бункер.
- Использовать табельное оружие.

Всем получившим оранжевый уровень допуска запрещается:

- Парковать свои автомобили на территории части.
- Нарушать субординацию в части.
- Общаться с солдатами, несущими караульную службу.
- Дерзить солдатам.
- Нарушать действия режимов ЧС.
- Заходить без разрешения на склад.
- Посещать армии в комендантский час.
- Самовольно заходить на любую ВБ без уведомления об этом старшего офицера армии.(исключение ЧС)

"Зелёный"

Обладателю зеленого допуска разрешено посещение всех ВБ с 10:00 до 14:00 и с 16:00 до 21:00.
Зеленый уровень допуска может выдавать Министр Обороны.
Обладатели зелёного уровня допуска:

Сотрудники МЗ
Военные корреспонденты

Всем получившим зелёный уровень допуска разрешается:

- Посещать бункер.
- Перемещаться по базе в сопровождении офицера

Всем получившим зелёный уровень допуска запрещается:

- Парковать свои автомобили на территории части.
- Нарушать субординацию в части.
- Общаться с солдатами, несущими караульную службу.
- Дерзить солдатам.
- Нарушать действия режимов ЧС.
- Не подчиняться военнослужащим.

Пункт 5.2:Военнослужащий может выдавать пропуск только на свою базу.
Пункт 5.3: При обнаружении Президента, Вице-президента, Советника по Нац.Безопасности, Мэра, Агентов FBI,
боец обязан немедленно сообщить в рацию и пропустить его на территорию ВБ.
Пункт 5.4: При обнаружении гражданских лиц на территории военной базы, военнослужащий должен вывести его за территорию.
В случае неподчинения, боец имеет право отсчитать до 20 и открыть огонь на поражение.
Пункт 5.5: При обнаружении представителей банд/мафии на территории военной базы незамедлительно открывать огонь на поражение.
Пункт 5.6: Сотрудникам ФБР разрешено находится на базах армий в любое время суток при наличии ЧС.





Глава 6. Увольнительное время, Отпуск, Комендантский час.


Раздел 6.1: Увольнительное время.
Пункт 6.1.1: Увольнительное время действует с 22:00 до 07:00, в воскресенье с 21:00 до 07:00
Пункт 6.1.2: Увольнительный можно брать бойцам со звания Младший Лейтенант/Прапорщик
Пункт 6.1.3: Покидать базу вне увольнительного времени разрешается со звания Подполковника/Капитан 1-го ранга и выше,
так же они имеют право отпускать бойцов за территорию части по необходимости.
Пункт 6.1.4: Чтобы получить увольнительный лист, необходимо получить одобрение Полковника/Вице-Адмирала/Генерала/Адмирала в специальной теме.
Пункт 6.1.5: Если вы ушли в увольнительную, вам запрещено брать транспорт армии, боеприпасы со склада, надевать бронежилет. Исключение: режим ЧС.

Раздел 6.2: Отпуск военнослужащих.
Пункт 6.2.1: Каждый офицер обязан оставлять заявление на отпуск, прежде чем уйти в него.
Пункт 6.2.2: Максимальное время отпуска 10 дней.
Пункт 6.2.3: Во время отпуска нельзя вступать в любые государственные организации.

Раздел 6.3: Комендантский час.
Пункт 6.3.1: Комендантский Час длится с 22:00 до 7:00, в воскресенье комендантский час с 21:00 до 7:00
Пункт 6.3.2: Во время Комендантского часа, гражданским и сотрудникам гос. организаций запрещено находиться на военных базах и объектах
Исключение: работникам спецназа RSPD/FBI разрешено находиться на базе в Комендантский Час.
Пункт 6.3.1: При обнаружении гражданского на территории ВБ во время комендантского часа,
военнослужащий имеет право открыть огонь на поражение после того, как произведёт предупредительный выстрел.


?

Глава 7. Караульная служба.


Раздел 7.1: Общие правила несения караульной службы.
Пункт 7.1.1: Запрещено заступать на пост и покидать его без доклада в федеральную волну (/f) (для СО) или базовую волну (/r) (для баз ВМФ, ВВС, СВ).
Пункт 7.1.2: Военнослужащий обязан заступить на пост, который выдал офицер.
Пункт 7.1.3: Военнослужащий обязан делать доклады о состоянии на постах.
Пункт 7.1.4: В случае возникновения угрозы ЧС, военнослужащий обязан сообщить об этом в рацию (/r).
Пункт 7.1.5: Военнослужащему, несущему караульную службу запрещается:

- Разговаривать с другими военнослужащими, которые стоят на посту;
- Общаться с гражданскими или любыми сотрудниками силовых структур. Исключение: караульные поста КПП, но в рамках субординации
- Засыпать(AFK);
- Использовать мобильный телефон, только СМС;
- Смеяться, улыбаться, плакать;
- Использовать различные стойки (/anim);
- Выполнять прочие действия, противоречащие уставу армии.

Пункт 7.1.6: Военнослужащий не имеет право общаться с гражданским или иным сотрудником с организаций на посту.
Пункт 7.1.7: При обнаружении гражданского на территории ВБ, военнослужащий обязан выпроводить его за территорию.
Если же гражданский оказывает сопротивление, надлежит сделать предупредительный выстрел в воздух, при дальнейшем неподчинении открыть огонь на поражение.
Пункт 7.1.8: При обнаружении в помещении главного склада гражданского, надлежит открыть огонь без предупреждения.
Пункт 7.1.9: В том случае, если кто-либо подъехал к КПП, дежурный должен попросить его убрать машину от въезда и спросить о цели прибытия,
но открывать огонь или давать отсчет запрещается.

Раздел 7.2: Правила несения караульной службы на СО.
Пункт 7.2.3: Заступить на пост СО может только боец, чьё звание не ниже, чем Сержант/Мичман.
Пункт 7.2.6: На посту СО запрещено любое нарушение общий правил несения караульной службы.
Пункт 7.2.4: Сон на СО разрешён только в специально отведённом для этого месте (будка в которой находится сирена).
Пункт 7.2.5: Разрешено самому выбирать свой пост на СО. НО, если старший отдал Вам приказ занять другой пост, Вы обязаны беспрекословно выполнить его.
Пункт 7.2.1: При обнаружении на территории склада оружия представителей банд/мафий незамедлительно открыть огонь на поражение, до полного устранение угрозы.
Пункт 7.2.2: При обнаружении на территории склада оружия сотрудников СМИ, МЗ, или гражданских,
боец обязан сопроводить их за территорию, а потом указать путь от закрытой зоны. В случае агрессии или отказа - огонь на поражение.



Глава 8. Склад Оружия.


Раздел 8.1: Общие правила нахождения на СО.
Пункт 8.1.1: Запрещено продавать электронный ключ от шлагбаума СО.
Пункт 8.1.2: Запрещено без причины включать сирену, баловаться с ней. 
Пункт 8.1.3: Разрешено использовать сирену только в том случае, если не справляетесь с членами ОПГ. 
Пункт 8.1.4: Запрещено воровать боеприпасы чужих армий.
Пункт 8.1.5: Запрещено мешать погрузке боеприпасов в фуры.
Пункт 8.1.6: Запрещено воровать фуры своей армии.
Пункт 8.1.7: Запрещено продавать фуры/боеприпасы армии.
Пункт 8.1.8: Парковка служебного транспорта, не требующего загрузки боеприпасов,
и личного транспорта производится в дальней части СО, за Пунктом Управления (будка в которой находится сирена).
Пункт 8.1.9: Парковать вертолёты на СО разрешено только на вертолётных площадках,
отмеченных белым квадратом. Исключение: грузовой вертолёт.
Пункт 8.1.10: Воздушное пространство над СО, как и над остальными базами, является зоной без полётов.
В воздухе над СО разрешено передвижение только военных и правительственных воздушных средств.
Раздел 8.2: Правила загрузки и разгрузки боеприпасов.
Пункт 8.2.1: Правила загрузки и разгрузки фуры: на СО 20/20; на базе 20/20.
Пункт 8.2.2: Парковать фуры и хаммеры для загрузки надлежит только в ангарах и около них.
Пункт 8.2.3: Парковка грузового вертолёта "Cargobob" производится на носовой части корабля.
Исключение: ЧС или невозможность совершить посадку. Тогда грузовые вертолёты можно парковать в дальней части СО (за будкой в которой находится сирена).
Пункт 8.2.4: Место для разгрузки фур на территории базы: специальная площадка, отмеченная жёлтыми полосами.
Пункт 8.2.5: Место для посадки грузовых вертолётов на территории ВБ с целью разгрузки – вертолётная площадка.
Допускается перегрузка боеприпасов из вертолёта в фуры в целях экономии времени доставки амуниции на склад


Глава 9. Поощрения Военнослужащих.


Раздел 9.1: Виды поощрений.
Пункт 9.1.1: Поощрения являются важным средством воспитания военнослужащих и укрепления воинской дисциплины.

- Командир в пределах прав, определенных настоящим Уставом,
обязан поощрять подчиненных военнослужащих за особые личные заслуги, разумную инициативу, усердие и отличие по службе.
- В том случае, когда командир считает, что предоставленных ему прав недостаточно,
он может ходатайствовать о поощрении отличившихся военнослужащих властью вышестоящего командира.

Пункт 9.1.2: К военнослужащим могут применяться следующие виды поощрений:

- Снятие ранее примененного дисциплинарного взыскания;
- Объявление благодарности;
- Награждение грамотой, ценным подарком или деньгами;
- Награждение личной фотографией военнослужащего, снятого при развернутом Боевом знамени воинской части;
- Досрочное присвоение очередного воинского звания, но не вше воинского звания, предусмотренного республике для занимаемой воинской должности;
- Награждение нагрудным знаком отличника;
- Занесение в Книгу почета воинской части фамилии отличившегося военнослужащего;
- Награждение именным холодным и огнестрельным оружием.

Раздел 9.2: Полномочия по поощрениям.
Пункт 9.2.1: Командир/заместитель командира взвода имеют право:

- снимать ранее примененные ими дисциплинарные взыскания по средствам ходатайства;
- объявлять благодарность.

Пункт 9.2.2: Генерал/Адмирал/Полковник/Вице-Адмирал имеют право:

- снимать ранее примененные им дисциплинарные взыскания;
- объявлять благодарность;
- награждать грамотой, ценным подарком или деньгами;
- награждать личной фотографией военнослужащего, снятого при развернутом Боевом знамени воинской части;
- присваивать очередное воинское звание на одну ступень выше воинского звания, предусмотренного республики для занимаемой воинской должности;
- награждать нагрудным знаком отличника;
- заносить в Книгу почета воинской части фамилии отличившихся солдат, матросов, сержантов и старшин.

Пункт 9.2.3: Министр Обороны имеет право применять поощрения в полном объеме настоящего Устава.

Раздел 9.3: Отчёты военнослужащих.
Пункт 9.3.1: Если военнослужащий желает получить очередное воинское звание,
он обязан оставить отчёт о проделанной работе на рассмотрение Генерала/Адмирала.
Пункт 9.3.2: Каждый Командир взвода/подразделения и их заместители обязаны оставлять отчет о проделанной работе каждую неделю в воскресенье.
Пункт 9.3.3: Каждый Полковник/Вице-Адмирал обязан оставлять отчет о проделанной работе в воскресенье.
Пункт 9.3.4: Каждый Генерал/Адмирал обязан оставлять отчет о проделанной работе каждый день.



Глава 10. Дисциплинарные взыскания.


Раздел 10.1: Общая информация о взысканиях.
Пункт 10.1.1: Дисциплинарное взыскание является установленной государством мерой
ответственности за дисциплинарный проступок, совершенный военнослужащим, и применяется в целях предупреждения совершения дисциплинарных проступков.
К военнослужащему могут применяться следующие виды дисциплинарных взысканий:

- Устный выговор;
- Письменный выговор;
- Лишение нагрудного значка;
- Лишение очередного увольнительного;
- Лишение нагрудного знака отличия (медали и т.п.);
- Лишение нагрудного значка;
- Понижение в воинской должности;
- Снижение в воинском звании на одну ступень;
- Снижение в воинском звании на одну ступень со снижением в воинской должности;
- Досрочное увольнение с военной службы;
- Дисциплинарный арест.

Пункт 10.1.2: Взыскания за один и тот-же проступок применяемые к офицеру и бойцу могут различаться по степени тяжести.

Раздел 10.2: Полномочия по взысканиям.
Пункт 10.2.1: Командир / заместитель командира взвода имеют право применить такие взыскания как:

- Устный выговор;
- Письменный выговор;
- Лишение очередного увольнительного.

Пункт 10.2.2: Генерал/Адмирал/Полковник/Вице-Адмирал имеют право применить такие взыскания как:

- Устный выговор;
- Письменный выговор;
- Лишение очередного увольнительного;
- Лишение нагрудного знака отличия (медали и т.п.);
- Понижение в воинской должности;
- Снижение в воинском звании на одну ступень;
- Снижение в воинском звании на одну ступень со снижением в воинской должности;
- Досрочное увольнение с военной службы.

Пункт 10.2.3: Военные прокуроры имеют право объявлять военнослужащим такие взыскания как:

- Письменный выговор;
- Понижение в воинской должности;
- Снижение в воинском звании на одну ступень;
- Снижение в воинском звании на одну ступень со снижением в воинской должности;
- Досрочное увольнение с военной службы;
- Дисциплинарный арест.

Пункт.10.2.4: Министр Обороны имеет право применять взыскания в полном объеме настоящего Устава.

Глава 11. Транспорт.


Пункт 11.1: Разрешено использовать фуру марки "Barracks" в служебных целях со звания Младший Сержант/Старшина[2].
Пункт 11.2: Разрешено использовать Хаммер марки "Patriot" в служебных целях со звания Сержант/Мичман[3].
Пункт 11.3: Разрешено использовать водный транспорт ВМФ со звания Мичман[3]. 
Пункт 11.4: Разрешено использовать воздушный транспорт "Maverick" в служебных целях со звания Младший Лейтенант/Лейтенант[5].
Пункт 11.5: Разрешено использовать грузовой вертолёт "Cargobob" в служебных целях со звания Младший сержант/старшина[2].
Пункт 11.6: Разрешено использовать истребитель марки "Shamal" для облетов баз со звания Капитан/Капитан 3-го ранга[8].
Пункт 11.7: Разрешено использовать военный автобус марки "Coach" в служебных целях со звания Подполковник/Капитан 1-го ранга[10]. 
Пункт 11.8: Разрешено использовать офицерский джип марки "Mesa" в служебных/личных целях со звания Полковник/Вице-Адмирал[11].
Пункт 11.9: Разрешено использовать десантный самолёт "Nevada" в служебных целях со звания Полковник[11].

Глава 12. Проведение гарнизонных мероприятий.



Раздел 12.1: Нормативы по стрельбе.
Пункт 12.1.1: Нормативы по стрельбе обязан сдавать каждый боец и офицер при повышении на определённые звания.
Пункт 12.1.2: Нормативы по стрельбе проводятся 3 раза в неделю по понедельникам, средам, субботам в 17:00-18:00 в тире базы Сухопутных Войск.

Раздел 12.2: Учения.
Пункт. 12.2.1: Полевые стрельбы, Десантные Учения и Военный Пейнтбол проходят по определённым дням и в устанавливаемое Министром Обороны Время.
Пункт 12.2.2: Дата и время проведения Военного Биатлона устанавливается Советом Генерального Штаба армии. (МО, Генерала ВВС, Генерала СВ и Адмирала ВМФ)
Пункт 12.2.3: Порядок, время и место проведения учений по предупреждению и ликвидации последствий чрезвычайных ситуаций устанавливаются Министром Обороны.


Раздел 12.3: Общие гарнизонные мероприятия.
Пункт 12.3.1: Вооружённые силы в исключительных случаях на основании указа Президента республики могут
привлекаться к обеспечению режима чрезвычайного положения для выполнения следующих задач:

- Поддержание особого режима въезда на территорию, на которой введено чрезвычайное положение, и выезда с нее;
- Охрана объектов, обеспечивающих жизнедеятельность населения и функционирование транспорта, и объектов,
представляющих повышенную опасность для жизни и здоровья людей, а также окружающей природной среды;
- Разъединение противоборствующих сторон, участвующих в конфликтах, сопровождающихся насильственными действиями с применением оружия,
боевой и специальной техники;
- Участие в пресечении деятельности незаконных вооруженных формирований;
участие в ликвидации чрезвычайных ситуаций и спасении жизни людей в составе государственной системы предупреждения и ликвидации чрезвычайных ситуаций.

Пункт 12.3.2: Парады войск проводятся по особому указанию в ознаменование важных событий государственного и военного значения.

- Состав войск гарнизона, участвующих в параде, время и место парада, форма одежды, маршруты следования воинских частей,
порядок их построения и прохождения определяются командующим парадом.

Пункт 12.3.3: Командующий парадом назначается по особому указанию.

Глава 13. Тир военных баз.?

Пункт 10.1: Тир открыт: В дневное время с 13:00 до 14:00.В ночное время с 22:00 до 06:00.
Пункт 10.2: Генерал/Адмирал имеет право открыть тир в любое время с согласием Министра Обороны.?]]
      imgui.TextColoredRGB(text)
      imgui.Separator()			
            imgui.BeginChild('BLS', imgui.ImVec2(160, 90), false)
            imgui.EndChild()
            imgui.TreePop()
        end
      end
	  
	  if pane == 3 then
        if imgui.TreeNode(u8"Открыть(T)") then
        local text = [[Настоящий Устав определяет права и обязанности военнослужащих Вооруженных Сил Триллианта и взаимоотношения между ними,
		обязанности основных должностных лиц части и его подразделений, а также правила внутреннего порядка.

Обязанности должностных лиц, не указанных в Уставе, определяются соответствующими положениями, наставлениями, инструкциями и руководствами.

Настоящим Уставом руководствуются военнослужащие органов военного управления, воинских частей, организаций Вооруженных Сил,
в том числе военных образовательных учреждений профессионального образования Министерства обороны (далее - воинские части), и лица гражданского персонала,
замещающие воинские должности.


Общие положения

1. Повседневная жизнь и деятельность военнослужащих в воинской части осуществляются в соответствии с требованиями внутренней службы.

Внутренняя служба предназначена для поддержания в воинской части внутреннего порядка и воинской дисциплины, обеспечивающих ее постоянную боевую
готовность, безопасность военной службы, учебу личного состава, организованное выполнение им других задач в повседневной деятельности и охрану
здоровья военнослужащих.

2. Внутренняя служба требует организованных действий военнослужащих независимо от их желаний.

Выполнение требований внутренней службы развивает у военнослужащих чувство ответственности, самостоятельность, аккуратность и добросовестность.
Взаимопонимание, доброжелательность и готовность помочь друг другу способствуют укреплению войскового товарищества и сплочению воинских коллективов,
позволяют не только выполнять задачи в повседневной деятельности, но и выдерживать тяжелые испытания в боевой обстановке.

3. Требования внутренней службы обязан знать и добросовестно выполнять каждый военнослужащий.

В начале прохождения военной службы военнослужащий нуждается в особом внимании. Строгий контроль со стороны командиров (начальников)
и их личный пример помогают военнослужащему быстрее осознать требования внутренней службы.

4. Руководство внутренней службой в воинской части осуществляет командир воинской части, а в расположении подразделения - командир подразделения.

К военнослужащим относятся:

Офицеры, прапорщики и мичманы, курсанты военных образовательных учреждений профессионального образования, сержанты и старшины, солдаты
и матросы, проходящие военную службу по контракту (далее - военнослужащие, проходящие военную службу по контракту);

Каждому военнослужащему присваивается соответствующее воинское звание. Воинские звания подразделяются на войсковые и корабельные.

Военнослужащие при исполнении обязанностей военной службы, а при необходимости и во внеслужебное время, имеют право на хранение, ношение,
применение и использование оружия.

Правила хранения оружия, условия и порядок применения его военнослужащими определяются настоящим Уставом. При ношении и использовании
оружия военнослужащие обязаны обеспечить его сохранность и исключить доступ к нему посторонних лиц.

Военнослужащие в соответствии с законодательством Триллианта могут применять оружие лично, а командиры (начальники) приказать подчиненным
применить оружие для защиты жизни, здоровья и собственности в состоянии необходимой обороны или крайней необходимости в следующих случаях:

для отражения вооруженного либо группового нападения на охраняемые государственные и военные объекты, а также на расположения воинских частей
и подразделений, здания и сооружения воинских частей, воинские эшелоны, колонны машин, единичные транспортные средства и караулы, если иными способами
и средствами их защитить невозможно;
для пресечения попытки насильственного завладения вооружением и военной техникой, если иными способами и средствами их защитить невозможно;
для защиты военнослужащих и гражданских лиц от нападения, угрожающего их жизни или здоровью, если иными способами и средствами защитить их невозможно;
для задержания лица, совершившего противоправные действия и оказывающего вооруженное сопротивление, а также вооруженного лица, отказывающегося
выполнить законные требования о сдаче оружия, если иными способами и средствами подавить сопротивление, задержать данное лицо или изъять
у него оружие невозможно.
В боевых условиях командир (начальник), кроме того, имеет право применить оружие лично или приказать применить оружие для восстановления
дисциплины и порядка в случае открытого неповиновения подчиненного, когда действия неповинующегося явно направлены на государственную измену
или срыв выполнения боевой задачи, а также при выполнении задач в условиях чрезвычайного положения.

За нарушение уставных правил взаимоотношений между военнослужащими, связанное с унижением чести и достоинства, издевательством или
сопряженное с насилием, а также за оскорбление одним военнослужащим другого виновные привлекаются к дисциплинарной ответственности,
а при установлении в их действиях состава преступления - к уголовной ответственности.

Приказ - распоряжение командира (начальника), обращенное к подчиненным и требующее обязательного выполнения определенных действий,
соблюдения тех или иных правил или устанавливающее какой-либо порядок, положение.

Приказ может быть отдан в письменном виде, устно или по техническим средствам связи одному или группе военнослужащих.
Приказ, отданный в письменном виде, является основным распорядительным служебным документом (нормативным актом) военного управления,
издаваемым на правах единоначалия командиром воинской части. Устные приказы имеют право отдавать подчиненным все командиры (начальники).

Обсуждение (критика) приказа недопустима, а неисполнение приказа командира (начальника), отданного в установленном порядке,
является преступлением против военной службы.

Приказание - форма доведения командиром (начальником) задач до подчиненных по частным вопросам. Приказание отдается в письменном виде или устно.



Глава §1. Общие обязанности военнослужащих.
Пункт 1.1. Военнослужащий обязан в служебной деятельности руководствоваться Конституцией Триллианта, федеральными законами и иными нормативно правовыми актами.
Пункт 1.2. Военнослужащий обязан быть дисциплинированным, бдительным, хранить государственную тайну.
Пункт 1.3. Военнослужащий обязан быть верным Военной присяге, мужественно и умело защищать Триллианта.
Пункт 1.4. Военнослужащий обязан совершать воинское мастерство, содержать в постоянной готовности к применению вооружения и военную технику,
беречь военное имущество.
Пункт 1.5. Военнослужащий должен быть честным, храбрым, при выполнении воинского долга проявлять разумную инициативу, защищать командиров (начальников) в бою.
Пункт 1.6. Военнослужащий обязан уважать честь и достоинство других военнослужащих, выручать их из опасности, помогать им словом и делом,
удерживать от недостойных поступков, не допускать в отношении себя и других военнослужащих грубости и издевательства, содействовать командирам
(начальникам) и старшим в поддержании порядка и дисциплины. Он должен соблюдать правила воинской вежливости, поведения, выполнения воинского приветствия,
ношения военной формы одежды и знаков различия.
Пункт 1.7. Военнослужащий обязан защищать военную базу, других военнослужащих, гостей базы от незаконного вторжения на территорию базы или от нападения.
Пункт 1.8. Военнослужащий обязан находится на территории своей части с 9:00 до 22:00 (Рядовым\Матросам,
Младшим сержантам\Старшинам Сержантам\Мичманам круглосуточно, исключения прописаны в пункте 5.5).
Пункт 1.9. Каждый военнослужащий обязан подчинятся военнослужащему по должности выше. Подчиненный обязан беспрекословно выполнять приказы начальника.
Пункт 1.10. Рядовые/Матросы-Младшие сержанты/Старшины-Сержанты/Мичманы-Прапорщики/Мл.лейтенанты ночуют в казарме. (/setspawn - Стандартный спавн)
Пункт 1.11. Каждый военнослужащий обязан исполнять приказы, указанные в официальных документах, выпущенных Министром Обороны, Генералом/Адмиралом/Президентом.
Пункт 1.12. Каждый военнослужащий во время несении службы (раб.день) обязан быть экипирован в бронежилет. Исключение: Рядовые/матросы и офицеры штаба МО

Глава §2. Общение и субординация.
Пункт 2.1. Военнослужащий обязан обращаться к старшим строго по званию.
Пункт 2.2. Военнослужащий обязан проявлять уважение к старшим по званию. Обращаться к старшим строго по уставу:

"Здравия желаю!"
/me встал по стойке смирно, затем выполнил воинское приветствие
"Товарищ “звание”, разрешите обратиться?"

Пункт 2.3. Строго запрещено обращаться к военнослужащим фразой: "Сэр/мэм".
Пункт 2.4. Запрещено употреблять такие слова как: "ку", "да", "нет" "сори" "Можно" и так далее.
Все эти слова должны соответственно заменяться на: "Здравия желаю", "Так точно", "Никак нет" "Виноват" "Разрешите".
Пункт 2.5. За нарушение одного из пунктов этой главы военнослужащий получает выговор.

Глава §3. Построение.
Пункт 3.1. При команде "Общее построение" строятся все военнослужащие. Исключение: ВП и НГ строятся только для проверки от Министра
Пункт 3.2. При опоздании в строй, боец обязан произнести фразу: "Виноват. Товарищ “звание”, разрешите встать в строй?".
Пункт 3.3. Строй офицеров должен быть отделён от строя бойцов младшего состава.
Пункт 3.4. В строю запрещается: разговаривать (без разрешения), засыпать, использовать мобильный телефон, держать оружие в руках, курить, использовать рацию.
Пункт 3.5. Во время строя бойцы, офицеры должны выполнять всё приказы, которые им отдаёт командир.
Пункт 3.6. Общее построение разрешается делать со звания Вице-Адмирал/Полковник и Командиру Мед.Отряда с целью
проведения мед.осмотра составу с разрешения Полковника/Вице-Адмирала.
Пункт 3.7. Прапорщик/Мл. Лейтенант имеет право строить "бойцовский состав".
Пункт 3.8. В строю запрещено носить каски, любые аксессуары: маски, очки, шляпы и так далее. Исключение: наручные часы.
Пункт 3.9. Запрещено находиться в строю без бронежилета. Исключение: Рядовые/матросы.
Пункт 3.10. За нарушение одного из пунктов этой главы военнослужащий получает выговор.

Глава §4. Проникновение посторонних на территорию воинской части.
Пункт 4.1. При обнаружении гражданских лиц на территории военной базы, военнослужащий должен вывести его за территорию.
В случае неподчинения, боец обязан дать отсчет до пяти, после чего сделать предупредительных выстрел в воздух. В случае неподчинения после
предупредительного выстрела разрешается открыть огонь на поражение.
Пункт 4.2. При обнаружении представителей нелегальных организаций или лиц, несущих прямую угрозу военнослужащим на территории
военной базы незамедлительно открывать огонь на поражение.
Пункт 4.3. При обнаружении представителей государственных организаций на территории военной базы, военнослужащий обязан спросить
цель прибытия, после чего доложить в рацию о постороннем, спросить разрешение на пропуск на территорию военной базы.
Пункт 4.4. Сотрудники FBI имеют право круглосуточно находиться на территории базы. Сотрудники SWAT имеют право находиться на
территории военной базы для её охраны и устранений ЧС, а так же, они имеют право входит в воздушное пространство во время облёта баз.
Пункт 4.5. В том случае, если кто-либо подъехал к КПП, дежурный по КПП должен спросить о цели прибытия, но открывать огонь или давать отсчет запрещается.
Пункт 4.6. В случае подачи признаков агрессии (вооруженное или невооруженное), боец должен немедленно нейтрализовать нападающего.


Глава §5. Выход за территорию базы и увольнительное время.
Пункт 5.1. Базу разрешается покидать со звания Подполковника/Капитан 1-ого ранга после доклада о выезде из базы. Запрещается покидать базу для личных целей.
Пункт 5.2. Базу резрешается покидать со звания Младший Лейтенант/Лейтенант после доклада о выезде из базы с разрешения Полковника/Вице-Адмирала и выше,
при выезде необходимо иметь док-ва того, что вас отпустили. Бойцовскому составу разрешено покидать базу в сопровождении офицера.
Пункт 5.2. Увольнительные можно брать офицерам со звания Мл.Лейтенант/Лейтенант (5+).
Пункт 5.3. Увольнительное время действует с 22:00 до 07:00.
Пункт 5.4. Запрещено использовать оружие в личных целях.
Пункт 5.5. Бойцы со звания Рядовой/Матрос, Мл.Сержант/Старшина и Сержант/Мичман имеют право отправляться в увольнительное время в следующие дни:
Пятницу, Субботу и Воскресенье (с 22:00 до 7:00).
Пункт 5.6. Запрещается посещать казино,участвовать в мероприятиях вне увольнительного времени.
Примечание: Во время увольнительного времени разрешено посещать казино только в гражданской одежде.
Пункт 5.7. За нарушение одного из пунктов этой главы военнослужащий будет отправлен в дисциплинарный батальон
(исключение: за нарушение 5.4 и 5.6 военнослужащий будет комиссован с ЧС).

Глава §6. Склад оружия.
Пункт 6.1. При обнаружении на территории склада оружия представителей ОПГ незамедлительно открыть огонь на поражение.
Пункт 6.2. При обнаружении на территории склада оружия сотрудников государственных учреждений или гражданских,
обязан сопроводить их за территорию, а потом указать путь от закрытой зоны. В случае сопротивления военнослужащему разрешается открыть
огонь на поражение, после дачи отсчета и предупредительного выстрела в воздух.
Пункт 6.3. Сотрудники SWAT и FBI имеют полное право находится на территории склада оружия.
Пункт 6.4. Военнослужащий на КПП обязан проверять документы у всех въезжающих на территорию Склада Оружия (СО) лиц, не важно,
гражданский это, военный или Министр Обороны (даже если вы узнали их по лицу).
Пункт 6.5. Каждый военнослужащий, въезжающий и выезжающий за пределы склада оружия, обязан закрывать за собой шлагбаум на КПП.
Пункт 6.6. За нарушение одного из пунктов этой главы военнослужащий получает выговор.

Глава §7. Повышения.
Пункт 7.1. Повышение младшего состава (Рядовой/Мичман - Прапорщик/Мл. Лейтенант) происходит в любое время после одобрения соответствующего рапорта.
Пункт 7.2. Повышение офицерского состава (5-8) происходит после одобрения соответствующего рапорта Министром Обороны.
Отчеты проверяются по средам и субботам.Примечание: повышение офицеров происходит 1 раз в 4 дня.
Пункт 7.3. Повышение старшего офицерского состава (9-11) происходит 1 раз в неделю после одобрения рапорта Министром Обороны. Отчеты проверяются по субботам.
Пункт 7.4. Запрещается выпрашивать проверку рапорта на повышение. В таком случае проверяющий имеет полное право игнорировать ваш рапорт 24 часа.

Глава §8. Отчеты и доклады.
Пункт 8.1. Каждый офицер обязан оставлять заявление на отпуск, прежде чем уйти в него.
Пункт 8.2. Каждый боец, находящийся при исполнении служебных обязанностей, обязан докладывать о состоянии своего поста в рацию.
Пункт 8.3. Каждый офицер штаба Министерства Обороны обязан оставлять еженедельный рапорт о проделанной работе.
Пункт 8.4. Каждый офицер в звании Подполковник/Капитан 1-го ранга обязан оставлять рапорт о проделанной работе Генералам/Адмиралу своей Армии.
Пункт 8.5. Каждый военнослужащий, покидающий воинскую часть в увольнительное время (доп. случай прописан в п. 5.1.),
обязан сделать об этом доклад в рацию своей базы и зафиксировать его.
Пункт 8.6. Каждый военнослужащий, охраняющий КПП своей базы, обязан делать доклад о каждом вьезде в базу/выезде из базы.
Пункт 8.7. Каждый офицер, который проснулся в своём доме, обязан делать доклад о выезде из дома и зафиксировать момент.
Пункт 8.8. За нарушение пунктов 8.1, 8.2, 8.3, 8.4, 8.6 этой главы военнослужащий получает выговор.
За нарушение пунктов 8.7 и 8.5 военнослужащий отправляется в дисбат.

Глава §9. Склад боеприпасов.
Пункт 9.1. Главный склад военных баз открыт для военнослужащих со звания Мл. сержант/Старшина.
Пункт 9.2. Склад боеприпасов открыт до состояния:
9.2.1. для младшего состава до 195/195
9.2.2. для офицеров до звания “Майор/Капитан 2-ого ранга” до 190/190
9.2.3. для офицеров со звания Майор/Капитан 2-ого ранга до звания Полковник/Вице-Адмирал до 185/185
9.2.4. для военнослужащих национальной гвардии до 180/180.
9.2.5. для военнослужащих Воздушно-Десантного Взвода до 185/185.
9.2.6. для высших офицеров комитета начальников штабов (12-13) склад открыт при любом состоянии.
Пункт 9.3. Высшие офицеры комитета начальников штабов (12-13) имеют право закрыть главный склад своих баз при любом состоянии.
Министр имеет право закрывать склад любой базы.
Пункт 9.4. Минимальное состояние складов армий составляет 140/140.
Пункт 9.5. Каждый военнослужащий имеет право взять боеприпасы исключительно из склада своей базы.
Исключение: Национальная гвардия, Воздушно-Десантный Взвод, Комитет начальников штабов (12-13).
Пункт 9.6. Полковник/Вице-Адмирал/Генерал/Адмирал имеет право отказать бойцам из других Армий брать боеприпасы со склада своей Армии,
если на то есть соответствующие основания.
Пункт 9.7. За нарушение одного из пунктов этой главы военнослужащий получает выговор.
Исключение: за нарушение 9.5 военнослужащий будет комиссован, а за нарушение 9.4 Генерал/Адмирал получают выговор в устной форме.

Глава §10. Военный транспорт.
Пункт 10.1. Военный транспорт разрешено брать с разрешения старших офицеров (9-13).
Пункт 10.2. Запрещается оставлять военные фуры/лодки/хаммеры на Складе оружия.
Пункт 10.3. Военные фуры разрешается брать со звания Мл.сержант\Старшина для доставки боеприпасов.
Пункт 10.4. Военные патриоты разрешается брать со звания Сержант\Мичман для доставки боеприпасов.
Пункт 10.5. Воздушную технику разрешается брать бойцам национальной гвардии и офицерам со звания Майор/Капитан 2-ого ранга.
Пункт 10.6. Нельзя использовать военный транспорт для собственных целей.
Пункт 10.7. За нарушение одного из пунктов этой главы военнослужащий получает выговор.

Глава §11. Правила рации.
Пункт 11.1. Запрещено повторять одну информацию два и более раз. (флудить)
Пункт 11.2. Рация создана для докладов, а так же для важного общения.
Пункт 11.3. Запрещен мат в рацию, а так же оскорбления. (Даже в OOC чат )
Пункт 11.4. Рация Министерства доступна со звания Прапорщик/Мл. Лейтенант (4+).
Пункт 11.5. Запрещено нести бред в рацию и создавать в ней помехи (MG, NonRP)
Пункт 11.6. Запрещено невнятно говорить. (Использовать транслитерацию).
Пункт 11.7. Запрещено устраивать конфликты по рации.
Пункт 11.8. Запрещено использовать рацию в личный целях (продажа/покупка).
Пункт 11.9. Военнослужащий обязан уважительно относиться к другим.
Пункт 11.10. Военнослужащий обязан соблюдать субординацию.
Пункт 11.11. Военнослужащий обязан при общении в рацию указывать ту воинскую часть, в которой он служит. (тэг - ВМФ |, ВВС |, СВ |)
Пункт 11.12. Военнослужащий обязан указывать своё подразделение при общении в рацию. Примечание: если вашего подразделения нет в /division.
Пункт 11.13. Запрещено кричать в рацию (caps/нарушения в ООС чат,мат).
Пункт 11.14. За нарушение одного из пунктов этой главы военнослужащий получает выговор, при частых повторениях военнослужащий будет Комиссован.

Глава §12. Правила военкомата.
Пункт 12.1. К проверке призывников допускаются военнослужащие со звания Прапорщика/Мл. Лейтенанта.
Пункт 12.2. В военкомат категорически запрещено являться с оружием.
Пункт 12.3. Запрещено открывать огонь и наносить побои гражданским.
Пункт 12.4. Запрещено допускать к службе незаконопослушных призывников.
Пункт 12.5. Запрещено допускать к службе призывников, не ознакомленных с законодательством республики.
Пункт 12.6. Призыв может проходить только в военкомате; проводить призыв на базе, или на заднем дворе военкомата категорически запрещено.
Пункт 12.7. Запрещено нарушать правила проверки призывников.
Пункт 12.8. За нарушение одного из пунктов этой главы военнослужащий получает два выговора.

Глава §13. Правила отпуска.
Пункт 13.1. Во время отпуска запрещено заниматься нелегальной деятельностью или состоять в организации, занимающейся нелегальной деятельностью.
Пункт 13.2. Во время отпуска запрещено отправляться на исправительные работы (получать варны и баны).
Пункт 13.3. Во время отпуска запрещено подниматься по карьерной лестнице в других государственных организациях на должность индексом выше 3 (выше 3 ранга).
Пункт 13.4. За нарушение одного из пунктов этой главы военнослужащему запрещается возвращаться из отпуска, и он комиссуется с занесением в ЧС МО.

Глава §14. Наркотические вещества и алкогольная продукция.
Пункт 14.1. Во время службы в армии запрещается хранение и употребление любых наркотических средств и алкогольных продукций.
Пункт 14.2. За нарушение пункта 14.1 этой главы военнослужащий получает комиссуется с ЧС МО.


Глава §15. Выговоры и демобилизация.
Пункт 15.1. При выдачи выговора или при демобилизации из рядов армии, вы должны указать свою армию. (ВМФ, СВ, ВВС | Причина)
Пункт 15.2. Если Рядовой/Матрос комиссуется из министерства, он попадает в Черный Список Министерства Обороны.
Пункт 15.3. Если военнослужащий комиссуется за 3 письменных выговора, он попадает в Черный Список Министерства Обороны.
Пункт 15.4. За нападение на любого военнослужащего, боец/офицер будет комиссован с занесением в Черный Список Министерства Обороны.
Пункт 15.5. За сон (афк более минуты) вне казармы военнослужащий получит выговор. Исключение: Командиры отрядов, высшие офицеры.
Пункт 15.6 Если военнослужащий будет уволен, он попадает в Черный Список Министерства Обороны. Исключения: Демобилизация по собственному желанию
без нарушения внутренних правил Министерства Обороны (Правила резерва и т.д.)

Глава §16. Классификация военнослужащих.
Пункт 16.1. Военнослужащие, со звания Рядовой/Матрос по Прапорщик/Мл Лейтенант (1-4), входят в младший состав (бойцовский состав).
Пункт 16.2. Военнослужащие, со звания Мл.Лейтенант/Лейтенант по Капитан/Капитан 3-ого ранга, входят в офицерский состав.
Пункт 16.3. Военнослужащие, со звания Майор/Капитан 2-ого ранга по Подполковник/Капитан 1-ого ранга, входят в состав старших офицеров.
Пункт 16.4. Военнослужащие, со звания Полковник/Вице-Адмирал по Генерал/Адмирал, входят в состав высших офицеров (Штаб Министерства Обороны).
Пункт 16.5. Со звания Майор/Капитан 2-ого ранга действует ограничения на определенное количество военнослужащих этих званий:
Майор/Капитан 2-ого ранга - 5 человек;
Подполковник/Капитан 1-ого ранга - 4 человек;
Полковник/Вице-Адмирал (Офицеры Штаба Армии) - 3 человека.
Пункт 16.6. Начальники штабов (Генералы/Адмирал) и Министр Обороны входят в состав объединённого комитета начальников штабов
(орган планирования и управления министерством.)

Глава §17. Дисциплинарный батальон.
Пункт 17.1. В дисбат попадают военнослужащие которые самовольно покинули воинскую часть и были пойманы Военной прокуратурой.
Пункт 17.2. Военнослужащим находящиеся в дисбате не могут повышаться пока не выйдут из него. Исключение: Начальник ДБ.
Пункт 17.3. Военнослужащие, которые находятся в дисбате, не имеют никаких полномочий и прав в отношении с другими военнослужащими и не могут ими командовать.
Пункт 17.4. Если в дисбат заносятся старшие и высшие офицеры, то они получают 2 письменных выговора.
Пункт 17.5. Если военнослужащие не прошел дисбат и был комиссован, он будет занесен в Черный Список Министерства Обороны.
Пункт 17.6. Начальник дисбата подчиняется только Министру.
Пункт 17.7. Начальник дисбата имеет право просить у офицеров штаба МО сменить военнослужащему подразделение и форму.
Пункт 17.8. После выпуска из дисбата военнослужащий получает обратно форму и подразделение, в котором он находился до занесения.
Пункт 17.9. Начальник дисбата повышается в том отряде, в котором он находится помимо срока полномочий Начальника дисбата.


Глава §18. Внешний вид военнослужащих.
Пункт 18.1. Военнослужащим запрещается носить аксессуары до звания Полковник/Вице-Адмирал. Исключение: наручные часы,
солнцезащитные очки черного цвета, рюкзак походного образца. Наказание: Выговор.
Исключения: бойцам Национальной гвардии разрешено носить маски, прикрывающие лицо.
Пункт 18.2. Находясь на службе военнослужащий обязан находиться в военной форме, предписанной ему общим дресс-кодом Министерства Обороны,
Исключение: Генерал/Адмирал. Наказание: два выговора.
Пункт 18.3. Генералам/Адмиралу разрешено ходить в свободной одежде строго делового стиля.
Пункт 18.4. Женскому полу Штабов МО и Армии разрешено ходить в свободной одежде строго делового стиля.
Пункт 18.5. Запрещено находится в маске на территории базы. Исключение: Военная прокуратура, Национальная гвардия.
Пункт 18.6. Запрещено находится в маске на СО. Исключение: Национальная гвардия.
Пункт 18.7. Министру Обороны разрешено ходить в любой одежде.
Пункт 18.8. За нарушение одного из пунктов этой главы военнослужащий получает два выговора.

Глава §19. Допуск на территорию Армии.
Пункт 19.1. Уровни допуска на территорию:
Красный:
Обладателю красного допуска разрешено посещение всей Армии в любое время.
Красный уровень допуска может выдавать только Министр Обороны.
Обладатели красного уровня допуска:
Министр Внутренних Дел;
Судьи верховного суда;
Генеральный прокурор;
Президент;
Вице-Президент;
Глава АП;
Губернаторы;
Сотрудники ФБР;
Сотрудники SWAT/DD;
Советник по Национальной безопасности.

Желтый:
Обладателю желтого доступа разрешено посещение Армии с 16:00 до 20:00.
Данный уровень допуска запрещает присутствие в Складе и возле него, запрещено близко находится к фурам.
Желтый уровень допуска могут выдавать только Генералы Aрмий, Адмирал и Министр Обороны.
Всем получившим допуск в Армии разрешается:
• Свободно перемещаться по базам с сопровождением старшего офицера Армии.
• Расспрашивать руководящий состав о делах в армии.
• Использовать табельное оружие (если на то есть соответствующие причины).

Всем получившим допуск в Армии запрещается:
• Парковать свои автомобили на территории части.
• Нарушать субординацию в части.
• Общаться с солдатами, несущих караульную службу.
• Дерзить солдатам.
• Нарушать действия режимов ЧС.

Пункт 19.2. Уровни допуска может изменять Министр Обороны.

Глава §20. Военный Комиссариат.
Пункт 20.1. Военный Комиссариат (далее - Военком) - это орган управления и руководства всей армией в военное и мирное время.
Пункт 20.2. Офицеры Военкома назначаются исключительно Генералом/Полковниками Армии по заявлению на вступление,
руководствуясь личным доверием и служебной характеристикой.
Пункт 20.3. Офицером Военкома является любой офицер, достигший звания Старший Лейтенант.
Пункт 20.4. Каждый офицер, достигший звания Майор, переводится в отряд Военный Комиссариат.
Пункт 20.5. Офицере Военкома подчиняются военнослужащим по должности выше.
Пункт 20.6. Офицеры Военкома повышаются по единой системе повышения, указанной в разделе их отряда.]]
      imgui.TextColoredRGB(text)
      imgui.Separator()			
            imgui.BeginChild('BLS', imgui.ImVec2(160, 90), false)
            imgui.EndChild()
            imgui.TreePop()
        end
      end
	  
	  if pane == 4 then
        if imgui.TreeNode(u8"Открыть(C)") then
        local text = [[1. Общие положения:

1.1. Устав является главным документом Министерства Обороны.
1.2. Действующий устав регламентирует права и обязанности военнослужащих. Устав закрепляет структуру Армии/Флота, фиксирует права и обязанности военнослужащих.
1.3. Инспектор Обороны вправе изменять содержание устава/нарушать его в случае особой необходимости, уведомив об этом военнослужащих.
1.4. Некоторые права и свободы гражданина (на передвижение, ведение определённого рода деятельности), несущего службу в рядах Министерства обороны могут быть
притеснены только с целью реализации им своих воинских и должностных обязанностей.
1.5. Гражданин считается военнослужащим только после подписания им контракта о несении добровольной службы в войсках Штата San Andreas.
1.6. Настоящий устав не является исчерпывающим. В последствии он может быть дополнен/изменен Инспектором Министерством Обороны.
Также Инспектор Министерства Обороны имеет право на издание указов и иного рода актов, регламентирующих и утверждающих порядок и структуру несения
военной службы в рядах министерства обороны.
1.7. Незнание устава не освобождает от ответственности.

2. Права и обязанности военнослужащего:

2.1. Каждый гражданин Штата San Andreas в возрасте от 18 до 55 лет имеет право поступление на добровольную службу по контракту в Армию/Флот.
2.2. Любой военнослужащий имеет право на получение трехразового питания.
2.3. Военнослужащий имеет право на получение огнестрельного оружия и экипировки.
2.4. Любой военнослужащий имеет право на получение специального военного образования в Officer Training System.
2.5. Любой военнослужащий имеет право на получение воинских званий и должностей.
2.6. Военнослужащий от звания Младшего Сержанта/Старшина имеет право на пользование воинского транспорта, по званию и назначению.
2.7. Любой военнослужащий имеет право на получение медицинской помощи.
2.8. Любой военнослужащий имеет право на владение собственностью.
2.9. Любой военнослужащий имеет право на получение своевременной заработной платы.
2.10. Любой военнослужащий имеет право на получение премий.
2.11. Военнослужащие со звания Мл.Лейтенант/Лейтенант имеют право на получение увольнительного времени.
2.12. Военнослужащие имеют право подрабатывать, в период увольнительного времени и отпуска.
2.13. Офицеры имеет право на получение отпусков/отгулов, больничного.
2.14. Военнослужащий от любого звания имеет право на расторжение контракта по собственному желанию, но в случае,
если он не достигнет звания Прапорщик/Мл.лейтенант, то будет занесен в Чёрный Список Министерства Обороны 2-ой степени.
2.15. Военнослужащий имеет право не выполнять приказы командира/начальника, если тот противоречит Уставу Министерства Обороны,
Указам Инспектора Обороны/Генерала/Адмирала и другим Законам Штата.
Исключение: Приказ Инспектора Обороны и Генерала/Адмирала.
2.16. Любой военнослужащий имеет право выбирать и быть избранным (роль в политических партиях, массовых движениях, роль в митингах и демонстрациях).
2.17. Любой военнослужащий имеет право на свободу совести.
2.18. Любой военнослужащий имеет право на свободу слова.
2.19. Любой военнослужащий обязан соблюдать условия контракта на протяжении всего срока службы.
2.20. Любой военнослужащий обязан подчинятся воинскому уставу, приказам командиров и начальников, за исключением пунктов,
указанных в статье 2.16 настоящего Устава.
2.21. Любой военнослужащий обязан доблестно нести тягости военной службы.
2.22. Любой военнослужащий обязан охранять территорию Армии/Флота от лиц, постигаемых на военное имущество.
2.23. Любой военнослужащий обязан уважительно относится к гражданам Штата, соблюдать Субординацию при общении со сослуживцами.
2.24. Любой военнослужащий обязан соблюдать Конституцию, Уголовный и Административный Кодексы, Законы Штата,
Указы Губернатора и Инспектора Обороны и Указы своего Руководства, ратифицированные международные договоры.
2.25. Каждый сотрудник обязан знать и чтить Устав Министерства Обороны (не обязательно по пунктам).
2.26. Любой военнослужащий обязан знать офицерский состав Армии/Флота в лицо и поимённо.
2.27. Военнослужащие, не достигшие звания Прапорщик/Младший Лейтенант, лишаются права пользования личным транспортным
средством и проживания в собственном жилье.
2.28. Основной задачей военнослужащих является защита гражданских лиц, в рамках Штата San Andreas. 


3. Субординация:

3.1. Субординация – это система строгого служебного общения между военнослужащими.
3.2. Субординация предопределяет поведение, уважительное отношение к сослуживцам и старшим по званию/должности.
3.3. Военнослужащий обязан обращаться к старшим по званию используя фразы: "Сэр" или: "Звание Фамилия".
Пример: "Сэр, разрешите обратиться?" или: Инспектор Обороны Пингвин, разрешите обратиться?".
3.4. Военнослужащий обязан обращаться к сослуживцам используя фразу: "Звание Фамилия".
Пример: Инспектор Обороны Такэда, давайте приступим к выполнению поставленной задачи". В данной форме обращения возможно небольшое
пренебрежение правилами общения военнослужащих.
3.5. Разрешаются следующие слова: Здравия желаю, Так точно, Сэр, Никак нет, Разрешите обратиться.

4. Строевая дисциплина:

4.1. Строевая дисциплина определяет строевые приёмы, правила поведения в строю.
4.2. Запрещено самовольно покидать строй, даже если вы видите что есть проникновение. Вначале надо дождаться приказа Офицеров.
4.3. Запрещено использовать мобильный телефон, и различные предметы в руках.
4.4. Запрещено обращаться к сослуживцам, офицерам. Исключение: Вопрос, команда от руководителя строя.
4.5. Запрещено предпринимать любые телесные движения, без приказа от руководителя строя.
4.6. Запрещено держать в руках оружия. Исключение: Приказ старших по званию.
4.7. При опоздании на построение обязан извиниться за опоздание и без всяких вопросов встать в конец строя.
4.8. Любой военнослужащий армии обязан знать и уметь применить строевые приёмы:
Строй – размещение военнослужащих, подразделений и воинских частей.
Шеренга – строй, в котором военнослужащие размещены один возле другого на одной линии.
Линия машин – строй, в котором машины размещены одна возле другой на одной линии.
Фланг – правая ( левая ) оконечность строя. При поворотах название флангов не изменяются.
Фронт – сторона строя, в которую военнослужащие обращены лицом.
Тыльная сторона – сторона, противоположная фронту.
Колонна – строй, в котором военнослужащие (машины) расположены в затылок друг другу.
Направляющий – военнослужащий, движущийся головным в указанном направлении.

5. Пользование рацией и рационной волны:

5.1. Военная рация предназначена для докладов, а так же для не менее важной коммуникации между военнослужащими.
5.2. Военная рация настроена на 4 волны: Военно-Воздушных Сил, Военно-Морского Флота, Сухопутных Войск,
которые отделены между собой, и на Федеральную волну, которой могут пользоваться все военнослужащие начиная со звания Сержант/Мичман.
Исключение: Смотреть статью 5.4.
5.3. Запрещено любое использование военной рации не по назначению. Соблюдая остальные пункты: Это продавать имущество, просить денег и тому подобное...
5.4. Федеральная рация разрешена со звания Сержант/Мичман. Исключение: При Чрезвычайных Ситуациях,
рацию могут использовать Рядовые/Матросы, но если их запрос/объявление адекватны, четки и имеют ясный характер.
5.5. При использовании рации запрещается использовать не нормативную лексику.
5.6. Бойцу запрещено создавать многочисленные помехи в рацию.
5.7. Военнослужащий обязан поддерживать рацию в рабочем состоянии.
5.8. Запрещено создавать помехи в федеральную и армейскую волну.

6. Постовая служба, пропускной режим в армиях:

6.1. Военнослужащие обязаны находиться на посту в полном обмундировании и с оружием.
6.2. Военнослужащим запрещается самовольно покидать пост. Необходимо доложить причину в рацию.
6.3. Разрешено покидать пост при отсутствии доклада только после объявления построения.
6.4. Разрешено покидать пост при наличии чрезвычайной ситуации в другой точке военного объекта.
6.5. Доклады с поста должны осуществляться с интервалами в 10 минут. Исключение: О Чрезвычайной Ситуации военнослужащие обязаны доложить незамедлительно.
6.9. Военнослужащие обязаны проводить доклады с постов строго по форме:
"Докладывает: *Звание Фамилия* | Пост: *Наименование поста* | Состояние: *Код-1/2/3".
Состояние постов разделяется на три кода: Код - 1 (Стабильно). Код - 2 (Чрезвычайная ситуация. Подкрепление не требуется).
Код – 3 (Чрезвычайная ситуация, требуется подкрепление.)
6.10. Въезд на территорию базы осуществляется строго через Контрольно Пропускной Пункт (КПП - 1).
Исключение: Для военнослужащих Военно-Морского Флота: КПП-2, ангары для подлодок, корабль.
6.11. Военнослужащий, находящийся на дежурстве пропускного пункта, обязан запрашивать у прибывших документы, свидетельствующие их личности.
Без исключений!
6.12. Военнослужащий имеет право открыть огонь по проезжающим при нарушении пункта 6.11 настоящего Устава, со стороны приезжающих,
учитывая Указы Инспектора Обороны.
6.13. Военнослужащие имеют право открыть огонь по лицам, которые проникли/проехали/совершили попытку проникнуть на территорию
базы путём исключающим пропускной режим КПП, без исключений, учитывая Указы Инспектора Обороны.
6.14. В случае неадекватного поведения со стороны гражданских лиц, военнослужащие в праве открывать огонь на поражение без предупреждения.
6.15. В случае необходимости гражданину совершить стоянку возле Военной Базы, он должен придерживаться расстояния в пределах 30 метров.
6.16. Въезд на территорию базы имеют право:
1) Генеральный Прокурор.
2) Советник по Нац.Безопасности.
3) Губернатор/Вице-Губернатор.
4) Сотрудники Федерального Бюро Расследования.

7. Армейские склады оружия:

7.1. Главный склад Армии/Флота – ГС. Склад является одним из основных объектом на территории военного сектора, наравне с казармой.
7.2. Норма склада составляет 200.000 единиц оружия и 200.000 патрон.
7.3. Склад открывается только при статусе 180.000 единиц оружия и 180.000 патронов. Склад может быть закрыт по решению
Генерала/Адмирала, Полковника/Вице-Адмирала. Руководящий состав Армии/Флота имеет внесистемный доступ к складу.
7.4. Спец.подразделения Министерства Обороны: Национальная Гвардия и Военная Полиция, которые имеют право пользоваться
складом в любое время, при любом состоянии, учитывая Указы Инспектора Обороны.
7.5. Генерал/Адмирал обязан поддерживать склад в норме. Пункт: 7.2. настоящего Устава.
7.6. Склад оружия - СО. СО является главной точкой хранения общих боеприпасов Армий/Флота, а также зоной повышенной опасности.
7.7. При поездки на СО за боеприпасами в виде колонны военнослужащие обязаны организованно подойти к вопросу о
размещении транспорта, в целях компактного, безопасного и удобного формирования.
7.8. В целях усиления охраны колоны военнослужащие спец.подразделений имеют право организовать сопровождение.
7.9. При движении колонны, отряд сопровождения обязан любой ценой обеспечить сохранность транспорта.
7.10. Пропускной режим СО осуществляется по пунктам Устава №6.
7.11. Порча имущества Министерства Обороны карается согласно Уставу.
7.12. Все военнослужащие достигшие звания Мл.Сержант/Старшина имеют право выезда на СО, но с разрешения Руководящего состава.

8. Правила ношения Военной формы:

8.1. Дресс-код Армии/Флота строго регламентируется уставом. По пункту № 8.2. Генералу/Адмиралу,
а также Инспектору Обороны разрешено носить любую форму строгого вида. Инспектор Обороны в праве нарушать Дресс-Код.
8.3. Полковникам/Вице-Адмиралам разрешено носить форму Генерала/Адмирала, по разрешению Инспектора Обороны.
8.4. Военнослужащим запрещено находится на базе без бронежилета. Исключение: Советник по Нац.Безопасности, Инспектор Обороны.
8.5. Военнослужащим, не достигшим звания Подполковник/Капитан 1 ранга, запрещено носить аксессуары любого типа. 
Исключение: Бойцы отрядов Национальной Гвардии и Военной Полиции.
8.6. Военная Полиция имеет право носить гражданскую форму для её же скрытности и слитности с гражданскими лицами.

9. Транспорт Армий/Флота:

9.1. При использовании служебного транспорта военнослужащий обязан поддерживать его в работоспособном состоянии.
9.2. Военнослужащему запрещается использовать служебный транспорт в личных целях. 
9.3. Офицерский автомобиль марки "Mesa" разрешены для офицерского состава со звания Капитан/Капитан 3-го ранга.
9.4. Хаммеры марки "Patriot" разрешены для военнослужащих со звания Младший Сержант/Старшина.
9.5. Автобусы марки "Coach" разрешено использовать с разрешения/приказа Генерала/Адмирала или же Инспектора Обороны.
9.6. Вертолёты марки "Maverick" разрешено использовать со звания Подполковник/Капитан 1-го ранга и спец.отрядам.
9.7. Вертолёты марки "Cargobob" разрешены только со звания Лейтенант для военный действий или доставки боеприпасов.
9.8. Самолёты марки "Shamall" разрешены только со звания Лейтенант для патрулирования и военных действий.
9.9. Самолёты марки "Nevada" разрешено использовать по приказу Генерала/Адмирала, а так же Инспектора Обороны.
9.10. Военные катера "Coastguard" разрешено использовать со звания Младший Сержант/Старшина для патрулирования и военных действий.
9.11 Военные катера "Dinghy" используются только для обучения Матросов управлению военно-морского транспорта.
9.12. Военнослужащие имеющие офицерское звание обязаны ставить личный транспорт возле Штаба.

10. Порядок приёма граждан на добровольную службу:

10.1. После объявления Генерала/Адмирала об общем собрании офицеров, по причине приёма граждан на
добровольную службу вызванные лица обязаны явится в военкомат. Исключение: Национальная Гвардия и Военная Полиция.
10.2. После небольшого инструктажа требуется взять транспорт. Желательно, автобус марки "Coach".
10.3. По прибытию в военкомат, тот, кто занял Военкомат обязан оповестить об этом в Федеральную волну
и не посредственно начинать проверку после объявления по государственным новостям или по приказу Генерала/Адмирала - Полковника/Вице-Адмирала.
10.4. Служба в Армии/Флоте состоит на добровольной основе.
10.5. Новобранец обязан иметь с собой: Паспорт, Мед.осмотр, а так же пакет лицензий для определенной Армии/Флота:
1) Военно-Воздушные Силы: Лицензия на вождение и все остальные: Исключение: Лицензия пилота. Для Рядовых она не нужна.
2) Военно-Морской Флот: Лицензия на вождение и все остальные. Исключений нету.
3) Сухопутные Войска: Лицензия на вождение. Исключение: Лицензия на воздушный транспорт и на Морской тоже.
10.6. После проверки документов, при условии, что гражданин проживает в Штате минимум три года, офицер должен задать
вопросы добровольцу, дабы разузнать психологический силуэт будущего военнослужащего.
10.7. После проверки на психическое состояние будущего военнослужащего, офицер обязан отправить его за третий столик.
дабы там проверили его состояния здоровья.
10.7. После подписания добровольной службы, офицер докладывает по рации о том, что новобранец прошёл добровольную службу.
10.8. После доклада, офицер обязан сообщить, чтобы новобранец прошёл в кабинет. После выдачи формы, рации и погон,
новобранца отправляют в автобус для дальнейшей доставки на военную базу.

11. Увольнительное время:

11.1. Военнослужащие офицерского звания, сняв форму и нашивки, переодевшись, имеют право выйти в увольнительное время.
11.2. Увольнительное время начинается с 22:00 и заканчивается в 08:00.
11.3. Военнослужащие имеют право под зарабатывать, в период увольнительного времени.
11.4. Перед уходом в увольнительное время, военнослужащий обязан сообщить об этом в рацию.
11.5. Отменить увольнительное время, вправе Генерал/Адмирал. Инспектор Обороны имеет полное право отменить
увольнительное время и выходной для всего Министерства Обороны. Исключений не имеется.
11.6. Офицеры, имеющие звания Подполковник/Капитан 1-го ранга и выше имеют право покинуть часть вне
увольнительного времени, не более чем на 10 минут при условии того что перед отъездом с базы он доложит об этом руководству.
11.7. Рядовой/Матрос - Сержант/Мичман имеют право быть за пределами базы только с сопровождением в виде офицера, доверенного лица.
11.8. На военнослужащего армии все целостно действуют законы Штата, когда он находится вне части, в увольнительное время.

12. Построения:

12.1. При команде "Всеобщее построение" строятся все военнослужащие без исключения (Всеобщее построение имеет право делать только Генерал/Адмирал,
Инспектор Обороны, Полковник/Вице-Адмирал).
12.2. При опоздании в строй, боец обязан извинится и попросить разрешение встать в конец строя.
12.3. Строй офицеров должен быть отделен от строя бойцов Младшего Состава.
12.4. В строю запрещено носить любые аксессуары: Маски, Очки, Шляпы и так далее.
12.5. В строю запрещено находится без бронежилета и военной каски.
12.6. Правила поведения в строю указаны в 4-ом разделе Устава Министерства Обороны.

13. Проникновение посторонних на территорию:

13.1. При обнаружении гражданских лиц на территории военной базы, военнослужащий должен вывести его за территорию. В случае неподчинения,
боец имеет право отсчитать до 3 и открыть огонь на поражение, действуя при этом и соблюдая Указ МО.
13.2. При обнаружении представителей ОПГ на территории военной базы необходимо незамедлительно открывать огонь на поражение.
13.3. При обнаружении представителей государственных организаций на территории военной базы, военнослужащий должен спросить
цель прибытия, после чего доложить в рацию о постороннем, спросить разрешение на пропуск на территорию военной базы.
13.4. В том случае, если кто-либо подъехал к КПП, дежурный должен попросить его убрать машину от въезда и спросить о цели прибытия,
но открывать огонь или давать отсчет запрещается.
13.5. В случае подачи признаков агрессии (вооруженное или невооруженное), боец имеет право открыть огонь на поражение без отсчета.
13.6. Сотрудникам ФБР, Советнику по Нац.Безопасности разрешено находится на базах Армии/Флота в любое время суток.
13.7. Комендантский час отменяет все вышеупомянутые пункты раздела 13, за исключением пунктов 13.6, а так же 13.3.

14. Общие запреты в Министерстве Обороны:

14.1. Военнослужащим запрещено выпрашивать звание, любыми способами намекать на повышение.
14.2. Военнослужащим запрещено врать своим сослуживцам, иметь личную неприязнь друг к другу.
14.3. Военнослужащим запрещено продавать боеприпасы, служебный транспорт.
14.4. Военнослужащим запрещено самовольно покидать территорию базы. Исключение: Руководящий состав Армии/Флота.
14.5. Военнослужащим запрещено не уставное общение.
14.6. Военнослужащим запрещено оттачивать навыки стрельбы вне учений и без разрешения.
14.7. Военнослужащим запрещено применять оружие в личных целях.
14.8. Военнослужащим запрещено использовать огнестрельное оружие без причины.
14.9. Военнослужащим запрещено игнорировать приказы офицеров.
14.10. Военнослужащим запрещено спать вне спальных мест казармы.
14.11. Военнослужащим запрещено самовольно менять взвод, только по разрешению Руководства Министерства Обороны.
14.12. Военнослужащим запрещено находится в маске без приказа офицера. Исключение: Спец.Отряд.
14.13.Военнослужащим запрещено пользоваться ГС в случаях, предусмотренных пунктом 7.3 настоящего Устава.
14.14. Военнослужащим запрещается ношение аксессуаров, до звания Капитан 1-го ранга/Подполковник. Исключение: Спец.Отряд.
14.15. Военнослужащим запрещено использовать служебный транспорт в личных целях.
14.16. Военнослужащим запрещено использование нецензурной лексики.
14.17. Военнослужащим запрещено игнорировать проникновение на базу со стороны ОПГ, ОП, ООП (ОПГ - Организованная Преступная Группировка,
ОП - Опасный Преступник, ООП – Особо Опасный Преступник).
14.18. Военнослужащим запрещено обманывать/вводить в заблуждение военнослужащих.
14.19. Военнослужащим запрещено находится на базе без бронежилета и каски. Исключение: Инспектор Обороны/Советник по Нац.Безопасности.
14.20. Военнослужащим запрещается иметь неопрятный внешний вид, длинные волосы и волосы окрашенные в яркие цвета.
14.21. Военнослужащим запрещено находится в казино, пейнтболе и других развлекательных мероприятиях в служебное время.
14.22. Военнослужащим запрещено употреблять наркотические и психотропные вещества.
14.23. Военнослужащим запрещено употреблять алкогольные напитки в рабочее время.
14.24. Военнослужащим запрещено нарушать законы Штата, Устав, Указы Инспектора и своего Генерала/Адмирала.
14.25. Военнослужащим запрещено спать вне казармы. Максимальное время сна - 3 минуты.
14.26. Запрещено рукоприкладство, со стороны офицерского состава к младшим по званию.
14.27. Запрещено заниматься криминальной деятельностью, попадать под подозрения.
14.28. Нарушение любого пункта Устава министерства обороны карается в соответствии с "Рапортами наказаний военнослужащих". ?]]
      imgui.TextColoredRGB(text)
      imgui.Separator()			
            imgui.BeginChild('BLS', imgui.ImVec2(160, 90), false)
            imgui.EndChild()
            imgui.TreePop()
        end
      end
	  
	  if pane == 5 then
        if imgui.TreeNode(u8"Открыть(S)") then
        local text = [[§1
Правила поведение военно-служащих
?
1.1. | Военнослужащим разрешено спать в казарме, на вахте (СО) , а именно на своей кровати либо в комнате досуга.
Во всех остальных местах казармы и в не казармы разрешено спать не больше одной минут.
Исключения: Министр Обороны, Генералы, Полковники.
- Наказание: Выговор.

1.2. | Каждый военнослужащий обязан носить бронежилет. Неважно где он находится на базе или в не базы.
Исключения: Генерал, Полковник, Министр Обороны.
- Наказание: Выговор.

1.3. | Всем военнослужащим запрещено состоять в Байкерских Клубах.
- Наказание: Увольнение и занесение в Чёрный Список Министерства Обороны.

1.4. | Всем военнослужащим запрещено сотрудничать с ОПГ.
- Наказание: Увольнение и занесение в Чёрный Список Министерства Обороны.

1.5. | Всем военнослужащим запрещено употреблять наркотические вещества.
- Наказание: Увольнение и тюремный срок.

1.6. Всем военнослужащим запрещено обманывать Министра Обороны, Генерала, Адмирала, либо же офицеров.
- Наказание: Увольнение и Чёрный Список Министерства Обороны.

1.7. | Военнослужащим запрещено носить все аксессуары , кроме масок и шапок спец.отрядам.
Исключение: Министр обороны, Генералы. 
- Наказание: Выговор.

1.8. | Всем военнослужащим строго запрещено взламывать любой транспорт. 
(Неудачная попытка взлома - тоже считается).
- Наказание: Выговор.

1.9. | Военнослужащим запрещено выпрашивать повышение, снятие выговора без наличия отчёта, проверку какого-либо отчёта.
- Наказание: Выговор.

1.10. | Военнослужащим запрещено участвовать в ограблении, не важно в какое время и в какой день.
- Наказание: Увольнение, Чёрный Список Министерства Обороны и тюремный срок.


§2
Общение и субординация
?
2.1. | Каждый военнослужащий обязан исполнять любые приказы старшего по званию.
- Наказание: Выговор.

2.2. | Военнослужащий обязан обращаться к старшим строго: Товарищ *Звание*, а старший по званию к младшему строго по фамилии.
Пример: "Товарищ Генерал, Здравия Желаю." "Хендерсон, выполнять приказ."
- Наказание: Выговор.

2.3. | В Армии запрещено употреблять такие слова как: *ку*, *да*, *нет*, *сэр*, *можно* и т.д. Все эти слова
должны автоматически заменяться на: *Здравия желаю*, *Так точно*, *Никак нет* *Товарищ*.
Исключение: В дружеских разговорах, наедине друг с другом можно использовать обычные слова , Министр Обороны ,
Генерал(Генералу общаться по субординации только с МО)
- Наказание: Выговор.

2.4. | Военнослужащим запрещено перебивать офицеров или оспаривать их решение.
- Наказание: Выговор.

2.5. | Запрещено материться, бредить (МГшить), повторять одно и тоже много раз (Флудить).
- Наказание: Выговор.

2.6. | Запрещено оскорблять Министра Обороны, Адмирала/Генералов, Полковников/Вице-Адмиралов.
- Наказание: Увольнение и Чёрный Список Министерства Обороны.


§3

Построение
?
3.1. | При команде: "Общее построение на плацу" - строятся все военнослужащие.
- Наказание: Выговор.

3.2. | Строй офицеров должен быть отделён от строя бойцов младшего состава.
- Наказание: Выговор.

3.3. | В строю запрещается: разговаривать, засыпать (становится в АФК больше 1 минуты), использовать мобильные телефон,
держать оружие в руках, плакать, танцевать, выполнять другие действия.
- Наказание: Выговор.

3.4. | Во время строя бойцы/офицеры должны моментально выполнять всё приказы, которые им даёт командующий строем.
- Наказание: Выговор.

3.5. | Армию разрешается строить по приказу сотрудников ФБР.

3.6. | Общее построение разрешается делать со звания Капитан[СВ/ВВС], и со звания Мл. Лейтенант[СВ/ВВС], но по приказу ст. состава.

3.7. | Мл. состав разрешено строить со звания: Мл.Лейтенант[СВ/ВВС], но с разрешения старшего офицерского состава.

3.8. | Мл. состав разрешено строить со звания: Лейтенант[СВ/ВВС] без разрешения.

3.9. | Интервал между всеобщими строями должен составлять 1 час для всех офицеров и Генерала.
Исключение: Приказ Министра Обороны, приказ ФБР, приказ Заместителя Министра.


§4

Проникновение посторонних на территорию
?
4.1. | При обнаружении гражданских лиц на территории военной базы, военнослужащий должен вывести его за территорию. В случае неподчинения,
боец обязан открыть огонь на поражение.
- Наказание: Иначе это будет расцениваться как сотрудничество с гражданскими.

4.2. | В том случае, если кто-либо подъехал к Контрольно-Пропускному Пункту, дежурный должен спросить о цели прибытия и документы.

4.3. | В случае подачи признаков агрессии (вооруженное или невооруженное), боец имеет право открыть огонь на поражение.

4.4. | Если военнослужащий не в военной форме ему запрещается находиться на базе.
- Наказание: Выговор.

4.5. | Сотрудникам Sapphire Police Deportment разрешено въезжать на территорию баз, только с разрешением Министра Обороны, Заместителя Министра Обороны.

4.6. | Неприкосновенным лицам, уполномоченным лицам разрешается находится на военных базах,а так же на Складе Оружия круглосуточно без каких-либо заявлений,
но с предъявлением документов удостоверяющих их личность.Бойцам категорически запрещено открывать по ним огонь. 
(СНБ имеет полное право взять с собой охранников.)
- Наказание: Увольнение, тюремный срок и Чёрный Список Министерства Обороны 3 третьей степени.


§5

Выходы за территорию базы. Увольнительное время:
?
5.1. | Базу запрещено покидать без действительно важных причин и без разрешения Генерала/Адмирала несмотря на звание.
- Наказание: Выговор.

5.2. | Увольнительные можно брать только Офицерам.

5.3. | Бойцам запрещено самовольно покидать базу без доклада в рацию.
- Наказание: Выговор.

5.4. | Всем военнослужащим запрещено самовольно покидать базу без доклада в рацию в не увольнительное время.
- Наказание: Выговор/Увольнение.

5.5. | Всему составу запрещено посещать казино в не увольнительное время.
Исключения: При поиске дезертиров.
- Наказание: Увольнение и Чёрный Список Министерства Обороны.

5.6. | Увольнительное время:
- Для младшего состава в будни с 23:00 до 07:00, в выходные: с 22:30 до 08:00.
- Для офицеров в будни с 22:00 до 08:00, в выходные: с 22:00 до 10:00.
- За нарушение данного графика: Мл. Составу - Увольнение, Офицерам - Выговор.


§6

Склад оружия
?
6.1. | При обнаружении на территории склада оружия неизвестных личностей, немедленно открывать огонь.
- Наказание: Иначе это будет рассчитываться как сотрудничество с преступной организацией.

6.3. | Сотрудники FBI имеют полное право находится на территории склада оружия без маски (Без рп маски)

6.4. | Каждый военнослужащий, въезжающий и выезжающий за пределы Склада Оружия, обязан закрывать за собой шлагбаум на Контрольно-Пропускном Пункте.
- Наказание: Выговор.


§7

Повышение
?
7.1. | Повышение младшего состава происходит в любой день и в любое время.

7.2. | В армии есть ночное дежурство. (Только для 1-3 рангов).

7.3. | Запрещено подделывать отчеты и выкладывать в отчет доказательства с прошлого отчета.
- Наказание: Считает обман Генерала или Адмирала.

7.4. | Повышения Офицерского состава происходят по вторникам [5-10], пятницам [5-10] в 19:00 - 20:00.

7.5. | Доказательства которым, более 7 дней не принимаются.

7.6. | Если у Офицера есть выговор в личном деле , то его отчет будет отклонен соответственно он не будет повышен.

7.7. | "Каждый военнослужащий обязан качественно выполнять наряды - (( Не менее 7 строк отыгровок )).
- Наказание: Иначе рапорт будет отклонён.


§8

Отчеты и доклады:
?
8.1. | Каждый офицер обязан оставлять заявление на отпуск, прежде чем уйти в него.
- Наказание: Выговор.

8.2. | Каждый боец, находящийся при исполнении, обязан докладывать в рацию о состоянии базы/СО.

8.3. | Каждый Полковник/Вице-Адмирал обязан оставлять ежедневный отчёт о проделанной работе до 01:00 [МСК].

8.4. | Каждый Подполковник/Капитан 1-го ранга обязан оставлять ежедневный отчёт о проделанной работе до 01:00 [МСК].
Исключение: Другие проблемы.

8.5. | Расстояние между докладами с поста - 10 минут. Погрешность: +2 минуты.
- Наказание: Иначе рапорт будет отклонён.


§9

Склад боеприпасов:
?
9.1. | Норма Боеприпасов для Младшего Сержантов - Прапорщиков составляет 500 Ед. и 500 патронов. [2-4 ранги].

9.2. | Норма Боеприпасов для Младшего Лейтенантов и выше составляет 1000 Ед. и 1000 патронов. [5-6 ранг].

9.3. | Норма Боеприпасов для рядовых составляет 180 Ед. и 100 патронов, которые выдают офицеры.[1-ранги].

9.4. | Норма выдается раз в пол часа.

9.5. | Склад открыт для младшего состава, если его состояние выше 190.000/190.000.

9.6. | Склад открыт для офицерского состава, если его состояние выше 185.000/185.000.

9.7. | Склад открыт для спец.отряда, если его состояние выше 180.000/180.000.

9.8. | Запрещено брать боеприпасы, когда он закрыт. Исключение: Министр Обороны, Генералы, Полковники.
- Наказание: Выговор.

9.9. | Запрещено нарушать правила использования складом.
- Наказание: Выговор.

9.10. | Склад закрывается, если он ниже нормы, либо по решению Генерала, Полковника.

9.11. | Вы обязаны брать патроны бережно. (/anim 16 9).
- Наказание: Выговор.


§10

Транспорт
?
10.1. | Военный транспорт разрешено брать с разрешения офицера.
- Наказание: Выговор.

10.2. | Запрещается оставлять военные фуры на Складе Оружия или на дороге.
- Наказание: Выговор.

10.3. Военные фуры разрешается брать со звания Мл.Сержант.
- Наказание: Выговор.

10.4. | Военные хаммеры разрешается брать со звания Сержант.
- Наказание: Выговор.

10.5. | Воздушную технику разрешается брать только спец. отрядам, а так же Майору и выше, но с разрешением. Без разрешения со звания Полковник и выше.
- Наказание: Выговор/Увольнение.

10.6. | Офицерский транспорт "Mesa" разрешен только старшему офицерскому составу [9-13].
- Наказание: Выговор.

10.7. | Въезд на личном транспортном средстве на территорию базы разрешен со звания Майор/Капитан 2-го ранга.
- Наказание: Выговор.

10.8. | Военные катера находящиеся на территории базы Военно-Морского Флота разрешено брать со звания Мичман.
- Наказание: Выговор.

10.9. | Автобус разрешено брать только для тренировок, мероприятий, и призывов.
- Наказание: Выговор.


§11

Правила рации
?
11.1. | Запрещено повторять одну информацию более двух раз.
- Наказание: Выговор.

11.2. | Рация создана для докладов, а так же для важного общения.
- Наказание: Выговор.

11.3. | Запрещен мат в рацию.
- Наказание: Выговор.

11.4. | Рацию Министерства доступна со звания Сержант.
Исключение: При предупреждении о ЧС.
- Наказание: Выговор.

11.5. | Запрещено нести бред в рацию.
- Наказание: Выговор.

11.6. | Запрещено игнорировать рацию старших по званию.
- Наказание: Выговор.

11.7. | Запрещено невнятно говорить. (Использовать транслитерацию).
- Наказание: Выговор.

11.8. | Запрещено устраивать конфликты по рации.
- Наказание: Выговор.

11.9. | Запрещено использовать рацию в личный целях.(продажа/покупка).
- Наказание: Выговор.

11.10. | Военнослужащий обязан уважительно относиться к другим.
- Наказание: Выговор.

11.11. | Запрещено пользоваться неисправной рацией, издавать частые помехи.
- Наказание: Выговор.


§12

Правила военкомата
?
12.1. | К проверке призывников допускаются военнослужащие со звания Мл. Лейтенант[СВ/ВВС].
- Наказание: Выговор.

12.2. | Запрещено открывать огонь и наносить ущерб кулаками гражданским.
- Наказание: Выговор.

12.3. | Запрещено допускать к службе не законопослушных призывников.
- Наказание: Выговор.

12.4. | Запрещено допускать к службе призывников, не ознакомленных с правилами республики.
- Наказание: Выговор.

12.5. | Призыв может проходить только в военкомате.
- Наказание: Выговор.

12.6. | Проводить призыв на базе, или на заднем дворе военкомата категорически запрещено.
- Наказание: Выговор.

12.7. | Запрещено оскорблять гражданских лиц.
- Наказание: Выговор.

12.8. | После того как сообщили что данный человек годен Генерал или Полковник обязаны проверить его паспорт и мед.карту.

12.9. | Минимальное время проведения призыва 20 минут. Максимальное время проведения призыва 40 минут.
- Наказание: Выговор.


§13

Правила отпуска
?
13.1. | Во время отпуска нельзя быть в нелегальных организациях.
- Наказание: Не восстановление в должности.

13.2. | Во время отпуска запрещено получать варны и баны.
- Наказание: Не восстановление в должности.

13.3. | Во время отпуска запрещено подниматься по карьерной лестницу.(Не более 3 ранга).
- Наказание: Не восстановление в должности.

13.4. | Сроки отпуска:
- Не долгосрочный отпуск - Не более 7 дней.
- Долгосрочный отпуск - Не более 14 дней.

13.5. | Полковники и Подполковники имеют права выдавать "Увольнительное".


§14

Правила пользования оружием:
?
14.1. | Запрещено стрелять в фуры/хаммеры/вертолеты/самолеты/лодки (вы должны по RP заложить С4 (/me заложил С4) после чего открыть огонь по т.с.).
- Наказание: Выговор.

14.2. | Запрещено передавать оружие кому-либо.(Продавать и т.д. и т.п)
- Наказание: Увольнение и Чёрный Список Министерства Обороны.

14.3. | Военнослужащим запрещено целиться или открывать огонь в своих бойцов/офицеров.
- Наказание: Увольнение и Чёрный Список Министерства Обороны.


§15

Правила пользования тиром
?
15.1. | Запрещено пользоваться тиром когда он закрыт.
- Наказание: Выговор.

15.2. | Запрещено устраивать тир в не положенном месте.
- Наказание: Выговор.

15.3. | Тир открыт только с разрешением рук.состава(11+).
- Наказание: Выговор.


§16

Правила лекций
?
16.1. | Минимальный интервал между чтениями лекций 1 час.
- Наказание: Выговор и отклонение отчёта.

16.2. | Интервал между прослушиванием лекций отсутствует.


§17
Правила увольнительных карточек
?
17.1. | Военнослужащие, у которых имеется увольнительный билет не могут находится на базе без формы.]]
      imgui.TextColoredRGB(text)
      imgui.Separator()			
            imgui.BeginChild('BLS', imgui.ImVec2(160, 90), false)
            imgui.EndChild()
            imgui.TreePop()
        end
      end
	  
	  if pane == 6 then
        if imgui.TreeNode(u8"Открыть(O)") then
        local text = [[• Статья 1. Общие положения 

1.1. Устав является главным документом Ministry of Defence. 
1.2. Действующий устав регламентирует права и обязанности военнослужащих.Закрепляет структуру армий, фиксирует запреты и ограничения применяемые
для военнослужащих. 
1.3. Незнание устава не освобождает от ответственности. 
1.4. Министр Обороны вправе изменять содержание устава/нарушать его в случае особой необходимости,уведомив об этом военнослужащих. 
1.5. Военнослужащие имеют права и свободы человека,с установленными в уставе ограничениями. 
1.6. Служба в армии действует согласно подписываемого контракта. 




• Статья 2. Права и обязанности военнослужащего. 

2.1. Каждый гражданин штата в возрасте от 18 до 55 лет имеет право на службу по контракту в армиях штата. 
2.2. Любой военнослужащий имеет право на получение четырёх разового питания. 
2.3. Военнослужащий от звания Младшего Сержанта имеет право на получение огнестрельного оружия. 
2.4 Военнослужащий от звания Рядовой имеет право на получение экипировки. 
2.5. Любой военнослужащий имеет право на получение специального военного образования. 
2.6. Любой военнослужащий имеет право на получение воинских званий и должностей. 
2.7. Военнослужащий от звания Младшего Сержанта имеет право на пользование воинского транспорта,по званию и назначению. 
2.8. Любой военнослужащий имеет право на получение медицинской помощи. 
2.9. Любой военнослужащий имеет право на владение собственностью. 
2.10. Любой военнослужащий имеет право на получение заработной платы. 
2.11. Любой военнослужащие имеет право на получение премий. 
2.12. Военнослужащие со звания Лейтенант/Младший Лейтенант имеют право на получение увольнительного времени. 
2.13. Военнослужащие офицерского звания имеют право работать на подработках,в период увольнительного времени. 
2.14 Военнослужащие во время выходных имеют право работать на подработках. 
2.15. Военнослужащий имеет право на получение отпусков/отгулов, больничного. 
2.16. Военнослужащий от любого звания имеет право на расторжение контракта по собственному желанию,без занесения в Чёрный список Ministry of Defence. 
2.17. Военнослужащий имеет право не выполнять приказы командира/начальника,если тот противоречит уставу армии.
Исключение: приказ Министра Обороны и приказы Генералов/Адмирала. 
2.18 Военнослужащий имеет право не выполнять приказы вышестоящего руководства,если тот противоречит законам. 
2.19. Любой военнослужащий имеет избирательное право ( роль в политических партиях,массовых движениях,роль в митингах и демонстрациях ) 
2.20. Любой военнослужащий имеет право на свободу слова, вероисповедания,религии. 
2.21. Любой военнослужащий обязан соблюдать условия контракта на протяжении всего срока службы. 
2.22. Любой военнослужащий обязан подчинятся воинскому уставу,приказам командиров и начальников.Исключение:приказы незаконные\внеуставные 
2.23. Любой военнослужащий обязан доблестно нести тягости военной службы. 
2.24. Любой военнослужащий обязан охранять территорию армии,от лиц постигаемых на военное имущество. 
2.25. Любой военнослужащий обязан уважительно относится к гражданам штата, соблюдать субординацию при общении с сослуживцами. 
2.26. Любой военнослужащий обязан соблюдать Конституцию, Уголовный, Административный кодекс Штата. 
2.27. Любой военнослужащий обязан знать свои обязанности и обязанности своих командиров и начальников. 
2.28. Любой военнослужащий обязан знать офицерский состав армии в лицо. 
2.29. Любой военнослужащий обязан исполнять воинские обязанности,назначаемые при получении воинских званий. 
2.30. Военнослужащие которые не достигли офицерского звания,обязаны проживать в казармах. (искл. Пункт 2.15) 




• 3. Субординация 

3.1. Субординация – это система строгого служебного подчинения младших к старшим. 
3.2. Субординация предопределяет поведение, уважительное отношение к сослуживцам и старшим по званию/должности. 
3.3. Военнослужащий обязан обращаться к старшим по званию используя фразы: “Сэр” или: "Звание Фамилия".
Пример: Сэр, разрешите обратиться? Генерал Висконти, разрешите обратиться? 
3.4. Военнослужащий обязан обращаться к сослуживцам используя фразу: “Звание Фамилия”.
Пример: Сержант Волков, давайте приступим к выполнению поставленной задачи”. В данной форме обращения возможно не большое пренебрежение
субординационными правилами. 
3.5. Запрещаются следующие слова: Здравия желаю, Так точно, Никак нет, Товарищ. 
Данные слова заменены на: 
Добрый вечер, сэр, мисс, мэм. 
Добрый день, сэр, мисс, мэм. 
Сэр, мэм, мисс. 
Есть, сэр, мэм, мисс. 
Нет, сэр, мэм, мисс. 
3.6. Нарушение субординации будет караться строго по уставу пункта 14.1. 
3.7. Офицеры должны обращаться к младшему составу с уважением и соблюдением этических норм. 




• Статья 4. Строевая дисциплина 

4.1. Строевая дисциплина определяет строевые приёмы, правила поведения в строю. 
4.2. Запрещено самовольно покидать строй. 
4.3. Запрещено использовать мобильный телефон. 
4.4. Запрещено обращаться к сослуживцам, офицерам. Исключение: Вопрос, команда от руководителя строя. 
4.5. Запрещено предпринимать любые телесные движения, без приказа от руководителя строя. 
4.6. Запрещено использование оружия. Исключение: Спец. Отряд армии. Данный отряд реагирует на ЧС незамедлительно. 
4.7. При опоздании на построение рекомендуется молча встать в конец строя. 
4.8. Любой военнослужащий армии обязан знать и уметь применить строевые приёмы: 
Строй – размещение военнослужащих, подразделений и воинских частей. 
Шеренга – строй, в котором военнослужащие размещены один возле другого на одной линии. 
Линия машин – строй, в котором машины размещены одна возле другой на одной линии. 
Фланг – правая ( левая ) оконечность строя. При поворотах название флангов не изменяются. 
Фронт – сторона строя, в которую военнослужащие обращены лицом. 
Тыльная сторона – сторона, противоположная фронту. 
Колонна – строй, в котором военнослужащие (машины ) расположены в затылок друг другу. 
Направляющий – военнослужащий, движущийся головным в указанном направлении. 





5. Пользование Армейской рацией 

5.1. Армейская рация предназначена для докладов, а так же для не менее важной коммуникации военнослужащих. 
5.2. Армейская рация настроена на четыре волны: Волны Land Forces, Air Forces, Naval Forces,
которые отдельны между собой и на Федеральную волну, которой могут пользоваться все военнослужащие. 
5.3. Запрещено использование рации, не по назначению. 
5.4. Федеральная рация разрешена со звания Сержант/Мичман. Исключение: Чрезвычайная ситуация,боец 
5.5 Специальному отряду разрешается использование федеральной рации по пунктам 5.1 ; 5.3. 
5.6. Запрещается,при использовании рации,использовать не нормативную лексику. 
5.7. Запрещено создавать помехи в рацию. 
5.8. Военнослужащий обязан поддерживать рацию в рабочем состоянии. 
5.9 Запрещено во время рабочего времени отключать,убирать рацию. 
5.10 Запрещено терять армейскую рацию. 




6. Постовая служба, пропускной режим в армии 

6.1. Военнослужащие обязаны находиться на посту в полном обмундировании с оружием. 
6.2. Военнослужащим запрещается самовольно покидать пост.Необходимо доложить причину. 
6.3. Разрешено покидать пост при отсутствии доклада, после объявления построения. 
6.4. Разрешено покидать пост, при наличии чрезвычайной ситуации в другой точке военного объекта. 
6.5. Доклады с поста должны осуществляться с интервалами в 10 минут. Исключение: о чрезвычайно ситуации военнослужащие обязаны доложить незамедлительно. 
6.9. Военнослужащие обязаны проводить доклады с постов строго по форме: 
“Докладывает: *Звание, Фамилия* | Пост: *Наименование поста* | Состояние: *Код-1, 2, 3.” 
Состояние постов разделяется на три кода. Код - 1 ( Стабильно ). Код -2
( Чрезвычайная ситуация. Подкрепление не требуется ). Код – 3 ( Чрезвычайная ситуация. Требуется подкрепление. ) Исключение: спец. отряд. 
6.10. Въезд на территорию базы осуществляется строго через Контрольно Пропускной Пункт ( КПП - 1 ).
Исключение для военнослужащих Naval Forces: КПП-2, ангары для подлодок, корабль. 
6.11. Военнослужащий, находящийся на дежурстве пропускного пункта, обязан запрашивать у прибывших документы, свидетельствующие их личности. Без исключений. 
6.12. Военнослужащий имеет право открыть огонь по проезжающим при нарушении пункта “6 | 1.11.”, со стороны приезжающих. 
6.13. Военнослужащие имеют право открыть огонь по лицам, которые проникли/проехали/совершили попытку проникнуть на
территорию базы путём исключающим пропускной режим КПП. Без исключений. 
6.14. Въезд на территорию базы имеют право: 
1. Советник по Национальной Безопасности. 
2. Президент\Вице-Президент. 
3. Генеральный\Военные прокуроры





?
• Статья 7. Армейские склады оружия 

7.1. Главный склад армии – ГС. Склад является основным объектом на территории военного сектора,на ровне с казармой. 
7.2. Норма склада составляет 100.000 единиц оружия и 100.000 патрон. 
7.3. Склад открывается только при разрешении офицера или Нач.Склада. 
7.4. Открытие и закрытие склада регулирует руководство определённой армии.. 
7.5. Спец. подразделения армии имеют право пользоваться складом в любое время, при любом состоянии.Имеются исключения пункт 7.8 
7.6. Генерал/Адмирал армии обязан поддерживать склад в норме. Пункт: “7.2.” 
7.8 Следуя из пункта 7.6 Генерал\Адмирал может закрыть склад абсолютно всем. 
7.8. Склад оружия - СО. СО является главной точкой хранения общих запасов БП армий штата, а также зоной повышенной опасности. 
7.9. Порча военного имущества строго запрещена и карается согласно уставу. Пункт: “14.18”. 
7.10. Военнослужащие обязаны организованно подойти к вопросу о размещении транспорта,в целях компактного и удобного формирования. 
7.11. В целях усиления охраны колоны военнослужащие спец. подразделений имеют право организовать сопровождение. 
7.12. При движении колонны, отряд сопровождения обязан любой ценой обеспечить сохранность транспорта. 
7.13. Пропускной режим СО осуществляется по пунктам устава № 6. 




• Статья 8. Правила ношения Военной формы 

8.1. Дресс-код армий строго регламентируется уставом. По пункту № 8. 
8.2 Дресс-код может определять генерал\адмирал армии,с соглосованием министра обороны. 
8.3. Полковникам/Вице-Адмиралам разрешено носить форму Генерала/Адмирала - Министра Обороны по разрешению Министра Обороны или же Генерала/Адмирала.
8.4. Военнослужащим запрещено находится на базе без бронежилета. Исключение: офицеры. 
8.5 Офицерам разрешено носить одежду строго вида во время важных совещаний. 




• Статья 9. Транспорт армий 

9.1. Перед использованием служебного транспорта военнослужащий обязан доложить об этом по рации. 
9.2. При использовании служебного транспорта военнослужащий обязан поддерживать его в работоспособном состоянии. 
9.3. Военнослужащему запрещается использовать служебный транспорт в личных целях. Исключение: Офицерская машина “Mesa”, а так же “Patriot”. 
9.4. Офицерский автомобиль марки “Mesa” разрешены для офицерского состава со звания Майор. 
9.5. Хаммеры марки “Patriot” разрешены для военнослужащих со звания Младший Сержант/Старшина. 
9.6. Автобусы марки “Coach” разрешено использовать с разрешения/приказа Главнокомандующего Армии. 
9.7. Вертолёты марки “Maverick” разрешены спец. отрядам,а также офицерам. Мл.Лейтенант/Лейтенант с разрешения\приказа Генерала\Адмирала армии. 
9.7.1. Вертолёты марки "Cargobob" разрешено брать со звания Прапорщик/Мл.Лейтенант, вертолёт может использоваться как транспорт для боеприпасов или
переброски особых грузов. 
9.8. Самолёты марки “Shamall” разрешены спец. отрядам,а также офицерам. Мл.Лейтенант/Лейтенант с разрешения\приказа Генерала\Адмирала армии. 
9.9. Самолёты марки “Nevada” разрешено использовать по приказу главнокомандующего армией,а также Министра Обороны. 
9.10. Военные катера Naval Forces разрешено использовать со звания Младший Сержант/Старшина. Исключение: Приказ Министра Обороны. 
9.12. Военнослужащие имеющие офицерское звание обязаны ставить личный транспорт на парковке,определённой Главнокомандующим Армии. 





• Статья 10. Порядок приёма граждан на контрактную службу 

10.1. После объявления Генерала/Полковника об общем собрании офицеров, по причине приёма граждан на контрактную службу вызванные лица обязаны явится в военкомат. 
10.2. После небольшого инструктажа требуется взять транспорт. Желательно автобус марки “Coach”. 
10.3. По прибытию в военкомат, не посредственно, начинать проверку после объявления по государственным новостям или по приказу Генерала/Адмирала -
Полковника/Вице-Адмирала. 
10.4. Служба в армии состоит на контрактной основе. 
10.5. Новобранец обязан иметь с собой: ID-card,MED-card и водительские права. 
10.6. После проверки документов,при условии,что гражданин проживает в штате минимум три года,офицер должен задать вопросы добровольцу да
бы разузнать психологический силуэт будущего военнослужащего. 
10.7. После подписания контракта офицер докладывает по рации о том,что новобранец годен. 
10.8. После доклада новобранец находится рядом с офицером до момента выдачи формы. После формы новобранца отправляют в автобус
для дальнейшей доставки на военную базу. 





• Статья 11. Контракт Военнослужащего 

Министерство обороны штата Onyx в лице Министра Обороны с одной стороны, далее – Наниматель. 
И гражданин штата Onyx ( Имя, фамилия ), далее Исполнитель заключили контракт о нижеследующем. 
Наниматель обязуется выполнять условия, закреплённые за действующим уставом армии. Со своей стороны Исполнитель так же обязуется
выполнять требования действующего устава армий. 
В случае неисполнения условий со стороны Исполнителя, контракт расторгается. 
В случае неисполнения условий со стороны Нанимателя, Исполнитель имеет право обратиться в суд за взысканием в соответствии с
действующим законодательством штата Onyx. 
Дата: 
Подписи сторон: 
Наниматель/Исполнитель 

11.1. С офицером может быть расторжен контракт в случае провала переаттестации офицерского состава. 
11.2. По разрешению Министра Обороны, Глава Военной Академии имеет право проводить не более 2-х переаттестаций за один срок Министра Обороны.
Так же, Глава Военной Академии обязан написать форму заявления на переаттестацию, разослать данную форму всем офицерам. Офицеры, согласно данной форме,
должны заполнить заявление СТРОГО по форме. 
11.3, После неудачного написания переаттестации, офицеру даётся ровно один шанс. Если, офицер не проходит переаттестацию и со второго раза,
с ним расторгается контракт. После удачного перепрохождения переаттестации, офицеру выдаётся 2 выговора. 




?
• Статья 12. Увольнительное время 

12.1. Военнослужащие офицерского звания, сняв форму и нашивки, переодевшись имеют право выйти в увольнительное время. 
12.2. Увольнительное время начинается в 22:00 и заканчивается в 10:00. 
12.3. Военнослужащие имеют право работать на подработках, в период увольнительного времени. 
12.4. Перед уходом в увольнительное время,военнослужащий обязан сообщить об этом в рацию. 
12.5. Отменить увольнительное время,для своей армии,вправе Генерал/Адмирал. Министр Обороны имеет право отменить увольнительное время для всего Министерства. 
12.6. Офицеры, имеющие звания Капитан/Капитан 3-го ранга и выше имеют право покинуть часть вне увольнительного времени,
не более чем на 15 минут и только с разрешения Министра Обороны или Главнокомандующего. 
12.7. Рядовые/Матросы - Сержант/Мичман имеют право быть за пределами базы только с сопровождением в виде офицера, доверенного лица.
Исключение: разрешение Генерала\Министра Обороны под свою ответственность. 
12.8. На военнослужащего армии все целостно действуют законы Штата, когда он находится вне части, в увольнительное время. 
12.9 Воскресенье является исключительным днём,в данный день режим работы изменяется,Младший Состав получают возможность отдыха в следующие время:
00:00 - 13:00 ; 21:00 - 00:00 по местному времени.





• Статья 13. Общие запреты в Ministry of Defence 

13.1. Военнослужащим запрещено выпрашивать звание, любыми способами намекать на повышение.Исключение: разрешается поинтересоваться. 
13.2. Военнослужащим запрещено врать своим сослуживцам. 
13.3. Военнослужащим запрещено продавать боеприпасы, служебный транспорт. 
13.4. Военнослужащим запрещено самовольно покидать территорию базы. Исключение: Старшие офицеры. 
13.5. Военнослужащим запрещено не уставное общение.Исключение: не служебное время. 
13.6. Военнослужащим запрещено оттачивать навыки стрельбы вне учений и без разрешения. 
13.7. Военнослужащим запрещено применять оружие в личных целях. 
13.7. Военнослужащим запрещено использовать огнестрельное оружие без причины. 
13.8. Военнослужащим запрещено игнорировать приказы офицеров. 
13.9. Военнослужащим запрещено спать в запрещённом месте. 
13.10. Военнослужащим запрещено самовольно менять взвод. 
13.11. Военнослужащим запрещено находится в маске без приказа офицера. Исключение: спец. подразделения. 
13.12. Военнослужащим запрещено пользоваться ГС не по расписанию/разрешению. Приравнивается к краже. 
13.13. Военнослужащим запрещается ношение аксессуаров, закрывающих полностью лицо,привлекающих особое внимание.Спец.отрядам
разрешается исключительно на заданиях.
13.14. Военнослужащим запрещено использовать служебный транспорт в личных целях. Исключение: “Mesa”, “Patriot”, для старших офицеров армии. 
13.15. Военнослужащим запрещено использовать нецензурные слова.Имеются исключения. 
13.16. Военнослужащим запрещено игнорировать проникновение на базу со стороны ОПГ, ОП, ООП.
( ОПГ - Организованная Преступная Группировка, ОП - Опасный Преступник, ООП – Особо Опасный Преступник. ) 
13.17. Военнослужащим запрещено обманывать/вводить в заблуждение офицерский состав. 
13.18. Военнослужащим запрещено находится на базе без бронежилета и каски. Исключение Офицеры - Министр Обороны/Генерал/Адмирал. 
13.19. Военнослужащим запрещается иметь не опрятный внешний вид, длинные волосы, волосы, окрашенные в яркие цвета. 
13.20. Военнослужащим запрещено находится в казино, пейнтболе и других развлекательных мероприятиях в служебное время. 
13.21. Военнослужащим запрещено употреблять наркотические и психотропные вещества. 
13.22. Военнослужащим запрещено употреблять алкогольные напитки в рабочее время. 
13.23. Военнослужащим запрещено нарушать законы штата, устав, УК, АК и ПДД. 
13.24. Военнослужащим запрещено спать вне казармы. Максимальное время сна - 5 минут. 
13.25. Запрещено рукоприкладство, со стороны офицерского состава к младшим по званию. 
13.26. Запрещено заниматься криминальной деятельностью, попадать под подозрения. 
13.27. Запрещено участвовать в несанкционированных митингах. 
13.28. Запрещено расторгать контракт военнослужащего, за нарушение условий контракта/единого устава, не имея при этом доказательств. 
13.29. Запрещено повышаться в звании, при наличие 2-ух выговоров 
13.30 Запрещено развратное поведение в служебное время.





• Статья 14. Наказания 

14.1. Нарушение субординации: выговор. На усмотрение судьи или офицера. 
14.2. Кража БП: выговор/расторжение контракта. На усмотрение судьи или офицера 
14.3. Нарушение строевого устава: выговор. На усмотрение судьи или офицера. 
14.4. Нарушение правил пользования армейской рации: выговор/расторжение контракта/расторжение контракта с
занесением в Чёрный список. На усмотрение судьи или офицера. 
14.5. Нарушение постовой службы, пропускного режима: выговор/расторжение контракта. На усмотрение судьи или офицера. 
14.6. Нарушения дресс-кода: выговор. 
14.7. Нарушение пользования служебным транспортом: выговор/увольнение/увольнение с занесением в Чёрный список. На усмотрение судьи или офицера. 
14.8. Нарушение расписания увольнительного времени: выговор/расторжение контракта/расторжение контракта с занесением в Чёрный список.
На усмотрение судьи или офицера. 
14.9. Нарушение правил увольнительного времени: расторжение контракта/расторжение контракта с занесением в Чёрный список. На усмотрение судьи или офицера. 
14.10. Обман военнослужащего: расторжение контракта/расторжение контракта с занесением в Чёрный список. На усмотрение судьи или офицера. 
14.11. Продажа военного имущества: расторжение контракта с занесением в Чёрный список. 
14.12. Криминальная деятельность, подозрения на криминальную деятельность: расторжение контракта/расторжение контракта с
занесением в Чёрный список. На усмотрение судьи или офицера. 
14.13. Участие в несанкционированных митингах: расторжение контракта/расторжение контракта с занесением в Чёрный список. На усмотрение судьи или офицера. 
14.14. Самовол: Объявление в розыск, после поимки вы будите посажены в военную тюрьму(20 минут) или расторжение контракта с занесением в Чёрный список. 
14.14.1 Самовол офицера карается двумя выговорами или выговором с понижением в звании. На усмотрение судьи или офицера 
14.15. Применение оружия в личных целях: расторжение контракта/расторжение контракта с занесением в Чёрный список. 
14.16. Применение огнестрельного оружия без причины:выговор/расторжение контракта. На усмотрение судьи или офицера. 
14.17. Не подчинение: Расторжение контракта. На усмотрение судьи или офицера. 
14.18. Порча воинского имущества: расторжение контракта. На усмотрение судьи или офицера. 
14.19. Использование нецензурной брани: расторжение контракта/расторжение контракта с занесением в Чёрный список.На усмотрение судьи или офицера. 
14.20. Сотрудничество с ОПГ: расторжение контракта с занесением в Чёрный список. 
14.21. Употребление наркотических и психотропных веществ: расторжение контракта с занесением в Чёрный список. 
14.22. Распитие алкогольных напитков в рабочее время: расторжение контракта. 
14.23. Нарушение закона штата, УК, АК, ПДД: выговор/расторжение контракта/расторжение контракта с занесением в Чёрный список.
В зависимости от тяжести нарушения. 
14.24. Сон вне положенном месте более 2 минут: выговор. 
14.25. Неадекватное поведение: выговор/расторжение контракта/расторжение контракта с занесением в Чёрный список. На усмотрение судьи или офицера. 
14.26. Рукоприкладство: расторжение контракта/расторжение контракта с занесением в Чёрный Список. На усмотрение судьи или офицера. 
14.27. При расторжении контракта, расторгающий обязан иметь при себе доказательства: выговор. На усмотрение судьи или офицера. 
14.28. Расторжение контракта с наличием двух выговор карается занесением в Чёрный Список. 
14.29. Игнорирование рации и игнорирование строя - расторжение контракта для младшего состава, для офицеров выговор 
14.30 Использование армейского имущества во время отпуска.Два выговора\расторжение контракта.На усмотрение судьи или офицера.
14.31 Опоздание с выходом на работу после отпуска.Выговор\расторжение контракта.На усмотрение судьи или офицера.



?
• Статья 15. Отпуск военнослужащих

15.1 Отпуск — временное освобождение от работы на определённый период времени для отдыха и иных социальных целей с сохранением прежнего места работы. 
15.2 Отпуск может получить любой военнослужащий,отслуживший 3 месяца.
15.3 Во время отпуска на военнослужащего не действует Единый Устав MoD.Есть исключения.
15.4 Во время отпуска военнослужащий не может пользоваться техникой,экипировкой,оружием армии.
15.5 Военнослужащий может быть призван с отпуска в любой момент времени при чрезвычайной ситуации.
15.6 Бойцы армии имеют право на 5 дневный отпуск;офицеры на 10 дневный отпуск;старшие офицеры на 15 дневный отпуск.]]
      imgui.TextColoredRGB(text)
      imgui.Separator()			
            imgui.BeginChild('BLS', imgui.ImVec2(160, 90), false)
            imgui.EndChild()
            imgui.TreePop()
        end
      end
	  
	  if pane == 7 then
        if imgui.TreeNode(u8"Открыть(A)") then
        local text = [[1. Общее положение:
1.1. Устав обязан соблюдать каждый солдат и офицер.
1.2. Нарушение или игнорирование устава ведет за собой наказание.
1.3. Главные руководители вооруженных сил федерации Amber являются - Президент, Вице-Президент и Министр Обороны.
1.4. Любой военнослужащий обязан слушать старших по званию.
1.5. Не знание устава - не освобождает Вас от ответственности.
1.6. Устав может быть изменен в любую минуту - поэтому следите за новостями.
1.7 Устав Министерства Обороны главнее всех устав спец,отрядов.
  
2. Главные обязанности военнослужащих:
2.1. Внутренняя служба требует организованных действий среди всех Армий.
2.2. Устав Министерства Обороны и порядки Армии должен знать и выполнять каждый военнослужащий.
2.3. Военнослужащий должен быть честным, храбрым, защищать командиров и Министра Обороны.
2.4. По служебным вопросам военнослужащий должен обращаться к своему Генералу или Адмиралу.
2.5. Военнослужащий обязан хранить военную тайну.
2.6. Каждый призывник обязан принять присягу перед новым воинским званием.
 
3. Порядок несения службы, внутренние военные обязанности:
3.1. Незамедлительно выполнять приказы старших по званию. Невыполнение: карается выговором/увольнением(на усмотрение)
3.2. Знать в лицо и поимённо офицерский состав.
3.3. Соблюдать устав, законы и реформы федерации Amber.
3.4. Обращаться к старшим строго по их званию и фамилии.
3.5. Носить бронежилет. Наказание - Предупреждение/Выговор (на усмотрение)(исключения: если Полковник/Вице-Адмирал находится в военкомате,
он имеет право не одевать бронежилет).
3.6. Быть в курсе всех изменений в структуре Министерства Обороны.
3.7. Бойцы от звания Рядовой/Матрос до Прапорщика/Младшего Лейтенанта, обязаны проживать в казарме своих войск.
3.8. Обязанностью является соблюдение норм субординации и дисциплины.
3.9. Использование техники и боеприпасов нужно только по своему военному званию. Нарушение карается выговором/увольнением(на усмотрение)
3.10. Самостоятельный доступ к боеприпасам имеют бойцы спец. отрядов и офицеры подразделения.
3.11. В период "Комендантского Часа" основной обязанностью военнослужащих является защита территории базы.
3.12. Каждый военнослужащий обязан слушать старших по званию.
3.13. Каждый военнослужащий обязан следить за порталом Министерства Обороны.
3.14. Со звания Рядовой/Матроса до Младшего лейтенанта/Лейтенанта запрещено носить очки и различные аксессуары, карается - выговором.
3.15. Офицерам разрешено носить очки черного-защитного цвета. В случае нарушения данного пункта - выговор.
3.16. Доклады постов своей армии осуществляются в рацию на волне своей армии [/r]
3.17. Доклады постов чужой армии осуществляется в рацию на общей волне [/f]
3.18. Доклады постов СО осуществляются в рацию на общей волне [/f]
3.19. Бойцы обязаны придерживаться единого маршрута поездок на СО. Наказание за нарушение: отстранение от службы, выговор в личное дело.
 
4. Права военнослужащих.
4.1. Жизнь и права военнослужащих находятся под защитой государства:
4.2. Военнослужащий имеет право пользоваться собственностью министерства не нарушая правила пользования.
4.3. Каждый военнослужащий при выполнении и несении воинской службы имеет право носить огнестрельное оружие.
4.4. Военнослужащий от звания Младший Лейтенант/Лейтенант, имеет право покидать базу - с 23:00 до 10:00.
Воскресенье является выходным днем. Если вам приказывает Подполковник/Капитан 1-го ранга, Полковник/Вице-Адмирал или Генерал/Адмирал/Министр Обороны
в данное время - вы обязаны выполнять приказы. Нарушение карается выговором/увольнением(на усмотрение)
4.5. Офицеры в должности Полковник/Вице-Адмирал, а также сам Генерал/Адмирал имеют право покидать базу - в любое время.
 
5. Внутренняя служба в министерстве обороны запрещает:
5.1. Под любым предлогом нарушать настоящий устав министерства обороны.
5.2. Обсуждения и вопросы о повышении, выпрашивание повышения в звании,выпрашивание сдачи присяги, карается -выговором. (( Касается так же ООС,
можно выдать выговор с причиной "Помехи в рацию" ))
5.3. Пререкание, оспаривание или обсуждение решений старших по званию. Нарушение карается выговором/увольнением(на усмотрение)
5.4. Употреблять и хранить наркотические средства, карается - отстранением от службы и занесением в Черный список Министерства Обороны.
5.5. Продажа, передача патронов ОПГ, карается - отстранением от службы и занесением в Черный список Министерства обороны.
5.6. Обманывать, вводить в заблуждение старших по званию, карается - отстранением от службы и занесением в Черный список Министерства обороны.
5.7. Засорять рацию, нецензурно выражаться, разводить споры, оскорбления других военнослужащих, карается - выговором (Касается так же ООС,
можно выдать выговор с причиной "Помехи в рацию")
5.8. Покидать базу без уважительной причины, будет расценено как самовольство, карается - отстранением от службы и занесением в Черный список
Министерства обороны. Для офицеров: выговор в личное дело/понижение в воинском звании.
5.9. Запрещено нарушать дресс-код, карается - выговором.
5.10. Не слушаться старших по званию, карается - выговором.
5.11. Запрещено любое сотрудничество с ОПГ(Мафия, Банды, Байкеры), карается - отстранением от службы и занесением в Черный список Министерства обороны.
5.12. Запрещено покидать военную базу со звания Рядовой/Матрос до Прапорщика/Младшего Лейтенанта, считается как самовольство, карается -
отстранением от службы и занесением в Черный список Министерства обороны. (( Если едете из дома, то как зашли должны сообщить что едете на базу.))
5.13. Хранение и использование имущества министерства обороны в собственных и корыстных целях, карается -отстранением от службы и
занесением в Черный список Министерства обороны.
5.14. Порчу личного имущества и имущества Министерства Обороны (даже если вы просто бьете т/с) карается -выговором.
5.15. Хамское обращение с гражданами, карается - выговором.
5.16. Превышать полномочия, карается - выговором.
5.17. Быть в тире в неположенное время и стрелять без причины в неположенном месте, карается - выговором.
5.18. Спать в неположенном месте и спать с открытыми глазами (( AFK более 2-х минут )), карается - выговором.
5.19. Отлынивать от работы , карается - выговором или отстранением от службы.
5.20. Красть боеприпасы со склада чужой армии, карается - отстранением от службы и занесением в Черный список Министерства обороны.
Нарушение карается выговором/увольнением(на усмотрение)
5.21. Красть боеприпасы со склада. Нарушение карается выговором/увольнением(на усмотрение)
5.22. Создавать помехи в рации. Нарушение карается выговором/увольнением(на усмотрение)
5.23. Ношение грязной/рваной/невыглаженной формы (( ООС оскорбления, мат )) - выговор/увольнение.
 
6. Проникновение на территорию военных баз:
6.1. При обнаружении гражданских лиц на территории военной базы, военнослужащий должен силой вывести его за КПП. В случае агрессии,
боец имеет право - отсчитать до 3 и открыть огонь на поражение.
6.2. При обнаружении представителей ОПГ на территории военной базы, военнослужащий обязан - незамедлительно предупредить об этом в
рацию и открывать огонь на поражение.
6.3. При обнаружении личностей, у которых имеется оружие, на лице надета маска, открывать огонь на поражение.
6.4. При обнаружении Президента, Вице-президентов, Сотрудников ФБР, боец обязан немедленно сообщить в рацию и пропустить,
если сотрудник отказывается предъявлять документы, которые утверждают его личность, то вы в праве отказать ему.
6.5. В том случае, если кто-либо подъехал к КПП, дежурный должен попросить его убрать машину от въезда и спросить о цели прибытия,
в случае неподчинения, боец имеет право - дать отчет до 3 и открыть огонь на поражение.
6.6. В случае подачи признаков агрессии на любой территории, боец имеет право открыть огонь на поражение без отсчета.
6.7. Лица, проникшие на базу при помощи транспортного средства - разрешено уничтожить без отсчета.
6.8. При обнаружении посторонних на складе военной базы незамедлительно открывать огонь на поражение.
6.9 Во время Комендантского часа, а именно с 23:00 по 07:00 разрешено открывать огонь на поражение в случае проникновения сторонних лиц на территорию базы.
 
7. Разговор, субординация, рация:
7.1. Каждый военнослужащий обязан соблюдать субординацию. Несоблюдение субординации карается - выговором.
7.2. Запрещены любые сокращения (спс, ок, нз, пт, авиа, мет, хз, и т.д.), карается - выговором.
7.3. Обращение к любому из военнослужащих должно быть в вежливой форме, но к бойцам, которые младше по званию, разрешено обращаться на Ты.
7.4. Обращение в рацию "Всех Армий" [/F] разрешено со звания Сержант/Мичман, в крайних случаях разрешено докладывать любым званиям,
например по поводу ЧС, карается - выговором.
7.5. Запрещаются любые разговоры на гражданские темы, в том числе объявления о продаже, покупке имущества, карается - выговором.
(( Касается так же ООС, можно выдать выговор с причиной "Помехи в рацию" ))
7.6. Обращение в рацию "Всех Армий" [/F] обязательно должно иметь тэг вашего подразделения (( /f [ВВС/СВ/ВМФ] текст )), карается - выговором.
7.7. Обращение в рацию своей Армии обязательно должно иметь тэг вашего взвода или должности (( /r [Взводный 1го взвода] текст )), карается - выговором.
7.8. Повторять одни и те же слова несколько раз (( флуд, считается как 3 строки )) карается - выговором.
 
8. Повышение личного состава:
8.1. Повышение всех военнослужащих производится строго по рапортам оставленных на портале федерации.
8.2. Если хотя бы один критерий не подходит по единой системе повышения - военнослужащий не повышается.
8.3. Повышения военнослужащих от звания Младший сержант/Старшина [2] до звания Прапорщик/Младший Лейтенант [4] - 
происходит только с одобрением Генерала или Адмирала.
8.4. Повышения военнослужащих от звания Прапорщик/Младший Лейтенант [4] до звания Полковник/Вице-Адмирал [11] - 
происходит только с одобрения Министра Обороны.
8.5. При наличии 2-ух выговор военнослужащий - лишается права на проверку рапорта.
 
9. Переводы:
9.1. Все переводы осуществляются только после одобрения Министра Обороны.
9.2. Переводимый обязан запросить одобрение у своего начальника и у начальника, к которому он переводится.
9.3. После получения одобрения переводимый обязан написать заявление на перевод в отдельной теме.
9.4. Перевод осуществляется только после одобрения заявления Министром Обороны.
9.5. Если у бойца будет выговор – выговор будет возращен после перевода.
9.6. При подаче рапорта на перевод, Вы должны предоставить копию старого отчета.
 
10. Воинское приветствие:
10.1. Подчинённые и младшие по воинскому званию приветствуют старших первыми.
10.2. В приветствие должна присутствовать следующая фраза - "Здравия желаю, товарищ [Звание]".
 
11. Законы федерации:
11.1 Каждый военнослужащий обязан соблюдать законы федерации.
11.2 Драка с военнослужащими [легкая степень] карается - выговором.
11.3 Драка с военнослужащими в казарме [тяжелая степень] карается - отстранением от службы и занесением в
Черный список Министерства обороны.
11.4 Убийство военнослужащего карается - отстранением от службы и занесением в Черный список Министерства обороны.
11.5 Любое проявление псих. расстройства карается - отстранением от службы и занесением в Черный список
Министерства обороны или выговором в зависимости от тяжести нарушения.
11.6 Использование различных видов допинга(( Читы, Софты, в том числе и метла )) карается - отстранением
от службы и занесением в Черный Список Министерства Обороны.
 
12. Правила поведения в строю:
12.1 Разговоры (( любые чаты, кроме ООС )) караются - выговором.
12.2 Сон в строю (( AFK более 2-х минут )) карается - выговором.
12.3 Стоять в строю с оружием (Исключение выполнение команд на повороты) карается - выговором.
12.4 Стрелять из строя без причины, карается - выговором.
12.5 Стоять в строю не по стойке (( любые /anim )) исключение приказ старшего состава карается - выговором.
12.6 Самовольно покидать строй карается - выговором.
12.7 Отсутствовать на построении без причины, карается - отстранением от службы.
 
13. Правила для Генералов и Адмирала.
13.1 Генералы и Адмиралы не имеют права нарушать данный устав.
13.2 Если Генерал или Адмирал решил создать новое подразделение, то он обязан обсудить это с Министром обороны.
13.3 Генерал/Адмирал имеет право отпускать бойца только в больницу ( Не более 30 минут ).
13.4 Генерал/Адмирал имеет право отпустить бойца с 23:00 - 10:00 по любым другим делам ( Не более 1 часа ).
13.5 Генерал/Адмирал имеет право спать где угодно без ограничения.
13.6 Генералы и Адмиралы не обязаны носить бронижелет
 
14. Служебная форма.
14.1 - Во время служебного дня запрещено снимать военную форму. Наказание - Офицерам выговор/Бойцам отстранение от службы.
14.2 Если вы в служебной форме, ваш рабочий день продолжается, во время рабочего дня запрещено работать где-либо. Наказание - 
Офицерам 2 выговора/Бойцам отстранение от службы.
14.3 - После служебного дня разрешено переодеться Офицерам и выше по званию.
14.4 - За потерю военной формы наказание - отстранение от службы.

15. Увольнительная
15.1 - Увольнительную могут получить только офицеры.
15.2 - Если у вас есть увольнительная то вы имеете право переодеться и покинуть базу.
15.3 - Если вы получили увольнительную, но не переоделись вы получите выговор.
15.4 - Если у вас есть увольнительная то вы не должны появляться на территории базы вашей армии в гражданской одежде.
15.5 - Если вам приказывает Подполковник/Капитан 1-ого ранга/Полковник/Вице-Адмирал/Генерал/Адмирал/Министр Обороны - вы обязаны явиться на построение.
15.6 - Если у вас имеется увольнительная и вас поймал военный комендант, вы должны предъявить ему свой увольнительный билет (Role Play).
15.7 - Заявление на получение увольнительной вы можете оставить в на портале федерации вашей Армии.
15.8 - Если на портале Федерации вашей Армии не будет найдено заявление на получение увольнительного - получаете письменный выговор. 
15.9 - Увольнительный разрешено получать максимально на 5 дней, и только 2 раза в неделю.]]
      imgui.TextColoredRGB(text)
      imgui.Separator()			
            imgui.BeginChild('BLS', imgui.ImVec2(160, 90), false)
            imgui.EndChild()
            imgui.TreePop()
        end
      end
	  
	  if pane == 8 then
        if imgui.TreeNode(u8"Открыть(Q)") then
        local text = [[Глава №1. Основные положения.
Пункт 1.1. Данный уставной документ является основным документом Министерства Обороны Республики Quartz.
Пункт 1.2. Не знание данного уставного документа - не освобождает Вас от ответственности за его нарушение.
Пункт 1.3. Данный уставной документ обязан соблюдать каждый военнослужащий Армии Республики Quartz.
Пункт 1.4. Нарушать данный уставной документ может только Кабинет Министров.
Пункт 1.5. Нарушение или игнорирование данного уставного документа ведет за собой незамедлительное наказание. 
Пункт 1.6. Главные руководители Министерства Обороны - Правительство, Премьер-Министр и Министр Обороны. 
Пункт 1.7. Военнослужащий обязан следовать данному уставному документу и подчиняться всем его правилам. 
Пункт 1.8. Военнослужащий обязан защищать военную базу, других военнослужащих, гостей базы от незаконного вторжения на территорию базы или от нападения. 
Пункт 1.9. Каждый военнослужащий обязан исполнять приказы, указанные в официальных документах, выпущенных Министром Обороны, Генералом/Адмиралом. 
Пункт 1.10. Запрещается посещать казино/семейный центр вне увольнительного времени.
Пункт 1.11. Работать в любых других местах разрешается строго с одобрения Генерала/Адмирала или Министра Обороны. 
Пункт 1.12. Бойцам запрещается спать на посту или в любом другом месте, кроме казармы. (( AFK более 7 минут )) 
Пункт 1.13. За нарушение правил пользования тиром или полигоном, боец будет незамедлительно уволен. 
Пункт 1.14. За употребление наркотических веществ боец будет уволен. 
Пункт 1.15. Запрещено устраивать митинги и идти против Государства. 
Пункт 1.16. Со звания Мл.Лейтенант/Лейтенант военнослужащий обязан подать заявление в любой спец. отряд Армии. 
Пункт 1.17. За самовольное оставление части, боец объявляется в розыск. 
Пункт 1.18. Склад Армии обязан находиться в нормальном состоянии, в случае, если склад имеет критическое состояние - 
Генералу/Адмиралу последует устное предупреждение. 
Пункт 1.19. Генералу/Адмиралу - запрещается проверять рапорта на отправление в Командировку и заявления на переводы.
Пункт 1.20. Название Армий: NF - Naval Forces; AF - Air Forces; LF - Land Forces. Использовать старые названия строго запрещено.
Пункт 1.21. Запрещено повышать военнослужащих, которые имеют выговор.

Глава №2. Общение и субординация. 
Пункт 2.1. Каждый военнослужащий обязан подчиняться другому военнослужащему, если он по званию выше. 
Пункт 2.2. Обращаться ко всем военнослужащим строго по его званию. 
Пункт 2.3. Если военнослужащий не будет соблюдать правила субординации, он получит наряд и выговор в личное дело. 
Пункт 2.4. Ко всем военнослужащий выше Вас по должности и звании, Вы обязаны обращаться на "Сэр; Мэм".
Пункт 2.5. Запрещено употреблять такие фразы как: "Здравия желаю; Так точно; Никак нет; Виноват; Разрешите и т.п". За нарушение данного пункта,
последует немедленное наказание в виде выговора в личное дело. 

Глава №3. Построение. 
Пункт 3.1. При команде в рацию:"Всеобщее построение" строятся все военнослужащие. 
Пункт 3.2. Строй офицеров должен быть отделён от строя бойцов младшего состава. 
Пункт 3.3. В строю запрещается: разговаривать, засыпать, использовать мобильный телефон, держать оружие в руках, показывать на публику свои эмоции. 
Пункт 3.4. Во время строя военнослужащие обязаны выполнять все приказания, данные Руководящим составом Армии. 
Пункт 3.5. Армия обязана выполнить построение в случае приказа сотрудников NBI и ген.Прокурора. 
Пункт 3.6. Всеобщее построение может собирать любой военнослужащий, начиная со звания Ст.Лейтенант/Капитан-Лейтенант.

Глава №4. Проникновение посторонних на территорию. 
Пункт 4.1. При обнаружении гражданских лиц на территории военной базы, военнослужащему запрещено открывать огонь на поражение.
Военнослужащий обязан сопроводить гражданского до выхода с территории базы и вызвать сотрудников ПО. 
Пункт 4.2. При обнаружении представителей ОПГ на территории военной базы, военнослужащий немедленно должен предупредить человека,
о том, что в случае сопротивления/угрозы жизни, будет применять огнестрельное оружие. 
Пункт 4.3. При обнаружении представителей Гос.Структур на территории военной базы, военнослужащий обязан спросить цель прибытия,
после чего доложить в рацию о постороннем, спросить разрешение на пропуск на территорию военной базы. 
Пункт 4.4. Сотрудники SWAT и FBI имеют право круглосуточно находится на территории базы. Сотрудники QRPD вправе находиться на территории баз,
при исполнении своих должностных обязанностей.
Пункт 4.5. В том случае, если кто-либо подъехал к КПП, дежурный должен спросить о цели прибытия, но открывать огонь запрещается.

Глава №5. Выход за территорию базы и увольнительное время. 
Пункт 5.1. Находиться вне военной базы в рабочее время разрешается со звания Подполковник/Капитан 1-го Ранга. 
Пункт 5.2. Увольнительное время действует с 20:00 до 10:00. 
Пункт 5.3. Бойцы звания Рядовой/Матрос и Мл.Сержант/Старшина не имеют право отправляться в увольнительное. 
Пункт 5.4. В отпускное время военнослужащему разрешено находиться без бронежилета. 
Пункт 5.5. В отпускное время военнослужащему разрешено покидать территорию армии и находиться без военной формы. 
Пункт 5.6. В отпускное время военнослужащему запрещено нарушать пункты данного уставного документа. 
Пункт 5.7. В отпускное время военнослужащему запрещено сотрудничать с ОПГ, а также заниматься продажей имущества армии. 
Пункт 5.8. В отпускное время руководящий состав армии, либо Министр Обороны, может обязать военнослужащего вернуться на территорию армии в случае ЧС. 
Пункт 5.9. Если Генерал/Адмирал - Полковник/Вице-Адмирал - Подполковник/Капитан 1-го ранга - выдают увольнительные военнослужащим других
армий они будут немедленно уволены и занесены в ЧС MOD - 3 степени. 
Пункт 5.10. Руководящий состав Министерства Обороны вправе выдавать увольнительные талоны бойцу, только в том случае,
если у него оставлен рапорт в разделе своего подразделения.

Глава №6. Отчеты и доклады.
Пункт 6.1. Каждый офицер обязан оставлять заявление на отпуск, прежде чем уйти в него. 
Пункт 6.2. Каждый боец, находящийся на посту, обязан сообщать в рацию о состоянии объекта каждые 10 минут.

Глава №7. Склад боеприпасов. 
Пункт 7.1. Норма БП для рядовых/матросов - составляет 180 Ед.единиц оружия и 100 патронов. 
Пункт 7.2. Норма БП для мл.Сержант/Прапорщик - составляет 500 Ед.единиц оружия и 500 патронов. 
Пункт 7.3. Норма БП для Офицеров - составляет 1000 Ед.единиц оружия и 1000 патронов. 
Пункт 7.4. Офицеры после прибытия конвоев/фур с СО обязаны раздать норму солдатам.

Глава №8. Военный транспорт. 
Пункт 8.1. Запрещается оставлять военные фуры на СО без присмотра. 
Пункт 8.2. Военные фуры разрешается брать со звания Мл.сержант/Старшина. 
Пункт 8.3. Военные хамви разрешается брать со звания Сержант/Мичман. 
Пункт 8.4. Воздушную технику разрешается брать со звания Полковник/Подполковник, Вице-Адмирал/Капитан 1-го ранга и бойцам спец.подразделений армии.
Пункт 8.5. Офицерский транспорт "Mesa" разрешается брать со звания Подполковник/Капитан 1-го ранга/Командирам и Зама.Командиров отрядов.

Глава №9. Правила рации. 
Пункт 9.1. Запрещено забивать эфир рации пустыми разговорами. 
Пункт 9.2. В рацию разрешается оповещать о ЧС на территории баз и ситуациях, касательно состава армии. 
Пункт 9.3. Любое оскорбление, сказанное в эфире рации, расценивается как нарушение субординации. 
Пункт 9.4. Доступ к рации Министерства Обороны, открывается доступ со звания Сержант/Мичман. 
Пункт 9.5. Запрещается игнорировать рацию, если к вам обращаются старшие по званию. 
Пункт 9.6. Запрещено забивать эфир частыми помехами в рацию. (( OOC нарушения записываются на видео или сообщаются в /rep ))

Глава №10. Правила военкомата. 
Пункт 10.1. К помощи на призыве допускаются военнослужащие со звания - Сержант/Мичман. 
Пункт 10.2. Разрешено применить силу, в случае неадекватности со стороны гражданского. 
Пункт 10.3. Место проведения призыва - Военкомат г.Las-Venturas.

Глава №11. Запреты военнослужащих Министерства Обороны: 
Пункт 11.1. Запрещено военнослужащему игнорировать приказы руководящего состава армии и Министра Обороны. [Наказание: наряд/письменный выговор] 
Пункт 11.2. Запрещено военнослужащему нарушать любые законодательные акты Республики Quartz, а также данный уставной документ - 
Министерства Обороны. [Наказание: Устное предупреждение/Демобилизация] 
Пункт 11.3. Запрещено военнослужащему заниматься криминальной деятельностью, а также сотрудничать с нарушителями закона,
которые являются членами преступных группировок. [Наказание: Демобилизация + ЧС MOD 3 степени] 
Пункт 11.4. Запрещено военнослужащему самовольно покидать базу без сопровождения старшего состава армии, либо Министра Обороны,
без увольнительного талона. [Наказание: Устное предупреждение/Письменный выговор/Демобилизация] 
Пункт 11.5. Запрещено военнослужащему нарушать субординацию по отношению ко всем жителям Республики Quartz.
[Наказание: Устное предупреждение/Письменный выговор] 
Пункт 11.6. Запрещено военнослужащему злоупотреблять служебными полномочиями. [Наказание: Устное предупреждение/Письменный выговор] 
Пункт 11.7. Запрещено военнослужащему не появляться на рабочем месте более пяти дней, при этом не находясь в отпуске. [Наказание: Демобилизация] 
Пункт 11.8. Запрещено военнослужащему производить выстрелы из огнестрельного оружия без весомой причины. [Наказание: Письменный выговор/Демобилизация] 
Пункт 11.9. Запрещено военнослужащему обманывать, либо вводить в заблуждение весь состав Министерства Обороны.
[Наказание: Письменное предупреждение/Понижение/Демобилизация + ЧС MOD 2 степени] 
Пункт 11.10. Запрещено военнослужащему находится на территории республики без бронежилета.
[Наказание: Наряд/Письменный выговор. Исключение: Министр Обороны/Генерал/Адмирал.]
Пункт 11.11. Запрещено военнослужащему до получения звания - Сержант/Мичман, одному выезжать на СО. [Наказание: Устное предупреждение/Письменный выговор] 
Пункт 11.12. Запрещено военнослужащему оспаривать выданное ему наказание вне апелляционной комиссии. [Наказание: Устное предупреждение/Письменный выговор] 
Пункт 11.13. Запрещено военнослужащему заступать на постовую службу без наличия огнестрельного оружия и бронежилета. [Наказание: Устное предупреждение] 
Пункт 11.14. Запрещено военнослужащему засыпать или находиться не в трезвом состоянии на посту. [Наказание: Устное предупреждение/Письменный выговор] 
Пункт 11.15. Запрещено военнослужащему покидать строй без разрешения от руководящего состава. [Наказание: Письменный выговор] 
Пункт 11.16. Запрещено военнослужащему носить на себе предметы личного характера, до звания Мл.Лейтенант/Лейтенант. [Наказание: Письменный выговор] 
Пункт 11.17. Запрещено военнослужащему вести общение по федеральной волне до звания Сержант/Мичман. [Наказание: Письменный выговор] 
Пункт 11.18. Запрещено неадекватно вести себя при демобилизации. [Наказание: ЧС MOD 2 степени] 
Пункт 11.19. Запрещено устраивать митинги и идти против Министра Обороны. [Наказание:Демобилизация + ЧС MOD 2 степени]
Пункт 11.20. Запрещено использовать старые названия армий: СВ - Сухопутные Войска; ВМФ - Военно-Морской Флот; ВВС - Военно-Воздушные Силы.
[Наказание: Письменный выговор]
Пункт 11.21. В отпускное время военнослужащему запрещено брать военную технику в личных целях. [Наказание: Письменный выговор/Демобилизация]
Пункт 11.22. В отпускное время военнослужащему запрещено находиться на территории базы без военной формы. [Наказание: Письменный выговор/Демобилизация]

Глава №12. Обязанности военнослужащих Министерства Обороны: 
Пункт 12.1. Военнослужащий обязан соблюдать субординацию и проявлять уважение к другим военнослужащим. 
Пункт 12.2. Военнослужащий обязан соблюдать дресс-код министерства обороны, установленный Министром Обороны. 
Пункт 12.3. Военнослужащий обязан соблюдать правила проведения призыва, установленные Министром Обороны. 
Пункт 12.4. Военнослужащий обязан соблюдать правила поведения в строю, установленные Министром Обороны. 
Пункт 12.5. Военнослужащий обязан соблюдать правила общения по рации, установленные Министром Обороны. 
Пункт 12.6. Военнослужащий обязан раз в десять минут сообщать по рации состояние объекта, на котором находится пост. 
Пункт 12.7. Военнослужащий обязан сообщать Руководящему составу, а также Руководству своего отряда о посещении армии
со стороны представителей иных Государственных организаций. 
Пункт 12.8. Военнослужащий обязан запросить у представителей иных Государственных организаций документ удостоверяющий их личность, а также цель их посещения. 
Пункт 12.9. Военнослужащий обязан незамедлительно вывести гражданских лиц с охраняемой территории. 
Пункт 12.10. Военнослужащий обязан охранять территорию базы и не пропускать на нее представителей преступных группировок, а также гражданских лиц.
Пункт 12.11. Военнослужащий обязан исполнять приказы старшего по званию и руководства отряда, если эти приказы не
перечат Уставу Министерства Обороны и Законодательству Республики Quartz. 
Пункт 12.12. Военнослужащий обязан носить погоны и свой жетон на видном месте. 
Пункт 12.13. Военнослужащий обязан вести общение по рации с указанием подразделения своей армии. 
Пункт 12.14. Военнослужащий обязан вести общение по рации с другими военнослужащими исключительно в уважительной форме. 
Пункт 12.15. Министр Обороны вправе одобрять переводы военнослужащих, без ведома Генерала/Адмирала. 
Пункт 12.16. Кураторы National Security Agency/Military Police - обязаны проверять рапорты Командиров/Заместителей -
каждый день, а так же следить за подразделением в целом.

Глава №13. Должностные полномочия военнослужащих Министерства Обороны: 
Пункт 13.1. С главного склада армии Military Academy и Oficer Academy разрешено брать боеприпасы до состоянии 150 Ед.оружия / 150 Патрон. 
Пункт 13.2. С главного склада армии офицерскому составу разрешено брать боеприпасы, при состоянии 140 Ед.оружия / 140 Патрон. 
Пункт 13.3. С главного склада армии руководящему составу разрешено брать боеприпасы, при состоянии 100 Ед.оружия / 100 Патрон. 
Пункт 13.4. С главного склада армии Генералу/Адмиралу/Министру Обороны разрешено брать боеприпасы при любом состоянии.
Пункт 13.5. Бойцам National Security Agency разрешено брать боеприпасы с любых главных складов, при состоянии 110 Ед.оружия / 110 Патрон. 
Пункт 13.6. Сотрудникам Military Police разрешено брать боеприпасы с главного склада их военной части, при состоянии 140 Ед.оружия / 140 Патрон. 
Пункт 13.7. Полигон Армии доступен - в отпускное время с 20:00 - 10:00 со звания Сержант/Мичман. 
Пункт 13.8. Увольнительное время Армии начинается в 20:00 и длится до 10:00. 
Пункт 13.9. Увольнительный талон для выезда в город в рабочее время выдаётся Генералом/Адмиралом/Министром Обороны по отчетности/усмотрению.]]
      imgui.TextColoredRGB(text)
      imgui.Separator()			
            imgui.BeginChild('BLS', imgui.ImVec2(160, 90), false)
            imgui.EndChild()
            imgui.TreePop()
        end
      end
	  
	  if pane == 9 then
        if imgui.TreeNode(u8"Открыть(ED)") then
        local text = [[{ff0808}С Рядового/Матроса [1] на Младшего Сержанта/Старшину [2]:

Принять присягу
Отстоять на посту ВЧ 60 минут.
Сдать строевые приемы
Выполнить один наряд. (RolePlay)
Пройти полосу препятствий
Прохождение КМБ проводится Командованием части в установленное Генералом/Адмиралом время.

 
{ff0808}С Младшего Сержанта/Старшины [2] на Мичмана [3]:

Привезти 4 полных фуры с боеприпасами.
Отстоять на посту 90 минут.
Сдать Устав внутренней службы
Выполнить два очередных наряда (RolePlay)

 
{ff0808}С Сержанта/Мичмана [3] на Прапорщика/Младшего лейтенанта [4]:

Привезти 6 полных фур с боеприпасами.
Отстоять 2 часа на одном из постов Склада Оружия (СО).
Сдача дисциплинарного устава.
Выполнить три очередных наряда (RolePlay)

 
{ff0808}С Прапорщика/Младшего лейтенанта [4] на Младшего Лейтенанта/Лейтенанта [5]:

Пройти Офицерскую/Летную/Морскую Академию:

Помочь на 4 призывах.
Отстоять на СО 3 часа. (не менее чем за 3 дня).
Отстоять на посту в воинской части 1 час 30 минут.
Сдача основных терминов Строевого и Дисциплинарного устава.
Пройти курсы военного управления, установленные в вашей воинской части (Лётная, Морская, Офицерская академии).
Сдать экзамен на умение организовывать личный состав. (провести строевую подготовку/тренировку/учения от начала и до конца)
Выполнить четыри очередных наряда (RolePlay).
Академия проходится не менее 3 дней и не более 7.
Построить и сопроводить 2 колонны на Склад Оружия.?

 
{ff0808}С Младшего Лейтенанта/Лейтенанта [5] на Лейтенанта/Старшего Лейтенанта [6]:

Построить и сопроводить 3 колонны на Склад Оружия.
Помочь на 1 призыве.
Провести 1 тренировку.
Сделать 1 Role Play ситуацию с составом.
Отстоять на СО 3 часа
Прочитать две разные лекции. Интервал между лекциями 15 минут.
Принять присягу/экзамен/полосу препятствий у 10 военнослужащих
Принять участие в учениях(прыжки с парашютом/полевые учения/страйкбол)

 
{ff0808}C Лейтенанта/Старшего Лейтенанта [6] на Старшего Лейтенанта/Капитана-Лейтенанта [7]:

Построить и сопроводить 4 колонн на Склад Оружия.
Помочь на 2 призывах.
Провести 2 тренировки(Одна из которых должна быть строевой подготовкой)
Сделать 2 Role Play ситуации с составом
Отстоять на СО 3 часа 30 минут
Прочитать две разные лекции. Интервал между лекциями 15 минут.
Принять присягу/экзамен/полосу препятствий у 15 военнослужащих
Принять участие в учениях(прыжки с парашютом/полевые учения/страйкбол)

 
{ff0808}С Старшего Лейтенанта/Капитана-Лейтенанта [7] на Капитана/Капитана 3-го ранга [8]:

Построить и сопроводить 6 колонн на Склад Оружия.
Помочь на 4 призывах.
Провести 3 тренировки(Одна из которых должна быть строевой подготовкой)
Сделать 3 Role Play ситуации с составом.
Прочитать три разные лекции. Интервал между лекциями 15 минут.(Одна из лекций должна быть посвящена пребыванию на СО и охране СО)
Принять присягу/экзамен/полосу препятствий у 15 военнослужащих
Принять участие в учениях(прыжки с парашютом/полевые учения/страйкбол)

 
{ff0808}С Капитана/Капитана 3-го ранга [8] на Майора/Капитана 2-го ранга [9]:

Построить и сопроводить 6 колонн на Склад Оружия.
Помочь на 5 призывах.
Сделать 4 Role Play ситуации с составом.
Провести 4 тренировки(Одна из которых должна быть строевой подготовкой)
Прочитать три разные лекции. Интервал между лекциями 15 минут.(Одна из лекций должна быть посвящена пребыванию на СО и охране СО)
Принять присягу/экзамен/полосу препятствий у 25 военнослужащих
Принять участие в учениях(прыжки с парашютом/полевые учения/страйкбол)

 
{ff0808}С Майора/Капитана 2-го ранга [9] на Подполковника/Капитана 1-го ранга [10]:

Построить и сопроводить 8 колонн на Склад Оружия.
Помочь на 7 призывах.
Сделать 5 Role Play ситуации с составом.
Провести 3 тренировки.(Одна из которых должна быть строевой подготовкой)
Принять присягу/экзамен/полосу препятствий/ДУ у 25 военнослужащих
Принять участие в учениях(прыжки с парашютом/полевые учения/страйкбол)

 
{ff0808}С Подполковника/Капитана 1-го ранга [10] на Полковника/Вице Адмирала [11]:

Построить и сопроводить 8 колонн на Склад Оружия.
Провести 4 тренировки.
Помочь на 5 призывах.
Сделать 6 Role Play ситуации с составом.
Пройти обзвон.
Принять участие в учениях(прыжки с парашютом/полевые учения/страйкбол) ?]]
      imgui.TextColoredRGB(text)
      imgui.Separator()
            imgui.BeginChild('BLS', imgui.ImVec2(160, 90), false)
            imgui.EndChild()
            imgui.TreePop()
        end
      end
	  
	  if pane == 0 then
        if imgui.TreeNode(u8"Открыть(RT)") then
        local text = [[{ff0808}Не найдено.]]
      imgui.TextColoredRGB(text)
      imgui.Separator()		
            imgui.BeginChild('BLS', imgui.ImVec2(160, 90), false)
            imgui.EndChild()
            imgui.TreePop()
        end
      end
	  
	  if pane == 123 then
        if imgui.TreeNode(u8"Открыть(TT)") then
        local text = [[{ff0808}Не найдено.]]
      imgui.TextColoredRGB(text)
      imgui.Separator()		
            imgui.BeginChild('BLS', imgui.ImVec2(160, 90), false)
            imgui.EndChild()
            imgui.TreePop()
        end
      end
	  
	  if pane == 414 then
        if imgui.TreeNode(u8"Открыть(CL)") then
        local text = [[{ff0808}Не найдено.]]
      imgui.TextColoredRGB(text)
      imgui.Separator()
            imgui.BeginChild('BLS', imgui.ImVec2(160, 90), false)
            imgui.EndChild()
            imgui.TreePop()
        end
      end
	  
	  if pane == 231 then
        if imgui.TreeNode(u8"Открыть(SE)") then
        local text = [[{ff0808}Не найдено.]]
      imgui.TextColoredRGB(text)
      imgui.Separator()		
            imgui.BeginChild('BLS', imgui.ImVec2(160, 90), false)
            imgui.EndChild()
            imgui.TreePop()
        end
      end
	  
	  if pane == 13 then
        if imgui.TreeNode(u8"Открыть(OX)") then
        local text = [[{ff0808}
{ff0808}Матрос » Старшина
{ff0808}Рядовой » Младший Сержант
1. Присягнуть на верность штату Onyx 

{ff0808}Старшина » Мичман
{ff0808}Младший Сержант » Сержант 
В статистике: 30+ ящиков 
Активная работа.

{ff0808}Мичман » Младший Лейтенант
{ff0808}Сержант » Прапорщик
В статистике: 40+ ящиков | 40+ минут на СО 
Активная работа

{ff0808}Младший Лейтенант » Лейтенант
{ff0808}Прапорщик » Младший Лейтенант
1) Пройти военную академию 

{ff0808}Лейтенант » Старший Лейтенант
{ff0808}Младший Лейтенант » Лейтенант 
1) Помогать Адмиралу и Вице-Адмиралу в проведении рекрутинга. 
2) Проводить тренировки 
3) Активно участвовать в жизни армии 
В статистике: 80+ ящиков | 80+ минут на СО 

{ff0808}Старший Лейтенант » Капитан-Лейтенант
{ff0808}Лейтенант » Старший Лейтенант
1) Помогать Адмиралу и Вице-Адмиралу в проведении рекрутинга. 
2) Проводить тренировки 
3) Активно участвовать в жизни армии 
В статистике: 90+ ящиков | 100+ минут на СО 

{ff0808}Капитан-Лейтенант » Капитан 3-его ранга
{ff0808}Старший Лейтенант » Капитан
1) Помогать Адмиралу и Вице-Адмиралу в проведении рекрутинга. 
2) Проводить тренировки 
3) Активно участвовать в жизни армии 
В статистике: 120+ ящиков | 130+ минут на СО 

{ff0808}Капитан 3-ого ранга » Капитан 2-ого ранга 
{ff0808}Капитан » Майор
1) Помогать Адмиралу и Вице-Адмиралу в проведении рекрутинга. 
2) Проводить тренировки 
3) Активно участвовать в жизни армии 
4) Оставить эссе о работе в секретариате
В статистике: 130+ ящиков | 140+ минут на СО 

{ff0808}Капитан 2-ого ранга » Капитан 1-ого ранга
{ff0808}Майор » Подполковник 
1) Помогать Адмиралу и Вице-Адмиралу в проведении рекрутинга. 
2) Проводить тренировки 
3) Активно участвовать в жизни армии 
4) Оставить эссе о работе в секретариате
В статистике: 150+ ящиков | 160+ минут на СО 

{ff0808}Капитан 1-ого ранга » Вице-Адмирал
{ff0808}Подполковник » Полковник
1) Помогать Адмиралу и Вице-Адмиралу в проведении рекрутинга. 
2) Проводить тренировки 
3) Активно участвовать в жизни армии 
4) Пройти проверку компетентности 
В статистике: 200+ ящиков | 200+ минут на СО ]]
      imgui.TextColoredRGB(text)
      imgui.Separator()
            imgui.BeginChild('BLS', imgui.ImVec2(160, 90), false)
            imgui.EndChild()
            imgui.TreePop()
        end
      end
	  
	  if pane == 41 then
        if imgui.TreeNode(u8"Открыть(AR)") then
        local text = [[{ff0808}Рядовой / Матрос [1] - Младший Сержант / Старшина [2]:

Принять присягу Армии.
Простоять на любом посту армии 1 час
Сдать строевую
Иметь лицензию на оружие


{ff0808}Младший Сержант / Старшина [2] - Сержант / Мичман [3]:

Привезти 2 полных фуры с СО
Отстоять 1 час на ГС.
Присутствовать на 1-ом наряде от офицера.
Присутствовать на 1-ой тренировке.
Положить рапорт на стол Генерала / Адмирала.
Повышение происходит после одобрения Генерала / Адмирала.


{ff0808}Сержант / Мичман [3] - Прапорщик / Младший Лейтенант [4]:

Привезти 3 полных фуры с СО
Отстоять 1 час на посту базы.
Отстоять 1 час на посту СО.
Присутствовать на 2-ух нарядах от офицера.
Выполнить 2 наряда.
Присутствовать на 2 тренировке.
Прослушать 1 лекции.
Положить рапорт на стол Генерала / Адмирала.
Повышение происходит после одобрения Генерала / Адмирала.


{ff0808}Прапорщик / Младший Лейтенант [4] - Младший Лейтенант / Лейтенант [5]:

Привезти 4 полных фуры с СО
Отстоять 2 часа на различных постах базы.
Отстоять 1 часа на посту СО.
Присутствовать на 2-ух нарядах от офицера.
Выполнить 2 наряда.
Присутствовать на 1 тренировке.
Прослушать 2 лекции.
Проверить 10 человек на призывах.
Выполнить норму нормативов
Положить рапорт на стол Генерала / Адмирала.


{ff0808}Младший Лейтенант / Лейтенант [5] - Лейтенант / Старший Лейтенант [6]:

Организовать 2 колонны на СО.
Отстоять 2 часа на различных постах базы.
Отстоять 1 часа на посту СО.
Выполнить 2 наряда с Младшим Составом.
Провести 2 тренировки.
Продекларировать 2 лекции.
Проверить 15 человек на призывах.
Сделать 1 облет баз.
Положить рапорт на стол Генерала / Адмирала.
Повышение происходит после одобрения Министра Обороны.


{ff0808}Лейтенант / Старший Лейтенант [6] - Старший Лейтенант / Капитан-Лейтенант [7]:

Организовать 3 колонны на СО.
Отстоять 2 часа на различных постах базы.
Отстоять 2 часа на посту СО.
Выполнить 3 наряда с Младшим Составом.
Провести 2 тренировки.
Продекларировать 3 лекции.
Проверить 15 человек на призывах.
Сделать 3 облета баз.
Положить рапорт на стол Генерала / Адмирала.
Отслужить 2 дня, на данном посту, повышение происходит после одобрения Министра Обороны.


{ff0808}Старший Лейтенант / Капитан-Лейтенант [7] - Капитан / Капитан 3-го ранга [8]:

Организовать 4 колонны на СО.
Отстоять 3 часов на любых различных постах базы.
Отстоять 2 часа на посту СО
Выполнить 4 наряда с Младшим Составом.
Провести 3 тренировки.
Продекларировать 4 лекций.
Проверить 20 человек на призывах.
Сделать 4 облета баз.
Положить рапорт на стол Генерала / Адмирала.
Отслужить 3 дня, на данном посту, повышение происходит после одобрения Министра Обороны.


{ff0808}Капитан / Капитан 3-го ранга [8] - Майор / Капитан 2-го ранга [9]:

Организовать 5 колонн на СО.
Отстоять 3 часов на любых различных постах базы.
Отстоять 3 часа на посту СО
Выполнить 5 наряда с Младшим Составом.
Провести 4 тренировки.
Продекларировать 5 лекций.
Проверить 30 человек на призывах.
Сделать 5 облетов баз.
Положить рапорт на стол Генерала / Адмирала.
Отслужить 4 дней, на данном посту, повышение происходит после одобрения Министра Обороны.


{ff0808}Майор / Капитан 2-го ранга [9] - Подполковник / Капитан 1-го ранга [10]:

Организовать 6 колонн на СО.
Отстоять 4 часов на любых различных постах базы.
Отстоять 3 часа на посту СО.
Выполнить 5 нарядов с Младшим Составом.
Провести 5 тренировок.
Продекларировать 6 лекций.
Проверить 40 человек на призывах.
Сделать 5 облетов баз.
Положить рапорт на стол Генерала / Адмирала.
Отслужить 5 дней, на данном посту, повышение происходит после одобрения Министра Обороны.


{ff0808}Подполковник / Капитан 1-го ранга [10] - Полковник / Вице-Адмирал [11]:

Организовать 7 колонн на СО.
Отстоять 4 часов на любых различных постах базы.
Отстоять 4 часа на посту СО.
Выполнить 6 нарядов с Младшим Составом.
Провести 6 тренировок.
Продекларировать 8 лекций.
Проверить 50 человек на призывах.
Сделать 6 облетов баз.
Положить рапорт на стол Генерала / Адмирала.
Отслужить 6 дней, на данном посту, повышение происходит после одобрения Министра Обороны. 



{ff0808}Примечания:

[!] Все скриншоты должны быть совершены с командой - /time.
[!] В скриншотах с загрузками фурами должны присутствовать - доклады в рацию, скриншоты должны быть: Выезд с базы | [0/20] на СО | [20/20] на СО | [20/20]
на базе.
[!] За кражу скриншотов у другого игрока, вы будете - отстранены от службы и занесены в Черный Список Министерства Обороны.
[!] За попытку обмана в отчете - будет отстранены от службы и занесены в Черный Список Министерства Обороны.
[!] Когда стоите на посту должны присутствовать - доклады в рацию. Интервал между докладами 10 минут. Погрешность ±5 минут.
[!] При помощи на призывах необходимо делать скриншот паспорта призывника. Скриншот должен быть сделан из-за стола в военкомате.
[!] Интервал между тренировками 30 минут. На тренировке должно быть не менее 4 бойцов из Мл.Состава.
[!] Интервал между лекциями 30 минут. Лекцию необходимо проводить минимум 4 бойцам Мл.Состава.
[!] Присутствие на нарядах должно быть [Начало, процесс, процесс, конец]. От Вашего персонажа должно быть минимум 5+ РП ДЕЙСТВИЙ.
[!] Интервал между облетами баз 30 минут.
[!] На посту стоять минимум по часу.
[!] У поста должны быть начало и конец, сопровождаемые соответствующими докладами.
[!] Скриншоты, которым больше 14 дней - не принимаются в отчет.
[!] Скриншоты каждого пункта должны находится в отдельных альбомах.
[!] Скриншоты со старого звания офицера - не принимаются.
[!] Ссылки должны быть кликабельны.
[!] За любой offtop в теме - РО.
[!] Скриншоты /pass,/stats,/ud должны соответствовать по /time со днем отправления отчета.
[!] Интервал между RP заданиями 30 минут, тоже самое касается RP заданий с младшим составом.
[!] На RP с младшим составом должно быть как минимум 4 человек.
[!] Скриншоты с поста на СО заливать через команду /mystats.
[!] При заступлении на СО обязательно докладывать в рацию начало и конец поста. (/time+/f Доклад начало+/mystats и /time+/f Доклад конец+/mystats).
[!] При участии или проведении тренировок должно быть 4+ скриншота. (Начало, участие, участие, конец).
[!] При участии или проведении нарядов должно быть 4+ скриншота. (Начало, участие, участие, конец).
[!] Однотипные тренировки/наряды не принимаются.
[!] В нарядах должно быть минимум 15 RP действий.
[!] В одной строке может быть максимум 3 действия.
[!] Пост Главный Склад стоится только на улице.
[!] Пост Бункер стоится внутри.]]
      imgui.TextColoredRGB(text)
      imgui.Separator()
            imgui.BeginChild('BLS', imgui.ImVec2(160, 90), false)
            imgui.EndChild()
            imgui.TreePop()
        end
      end
	  
	  if pane == 234 then
        if imgui.TreeNode(u8"Открыть(QZ)") then
           local text = [[{ff0808}Рядовой/Матрос - Мл.Сержант/Старшина.

{ffffff}1. Принять присягу. 
2. Сдача устава Министерства Обороны. 
3. Выслушать одну лекцию и ответить на вопросы по ней.
4. Принять участие на одной тренировке. (( отыгровка /me /do /try /todo + oldanim 60 // "с" ))

  

{ff0808}Мл.Сержант/Старшина - Сержант/Мичман.

{ffffff}1. Отстоять на посту "ГС" двадцать минут.
2. Прослушать лекцию на тему: «Основные правила поведения».
3. Прослушать лекцию на тему: «Доклады на постах».
4. Прослушать лекцию на тему: «Отпускное время».
5. Выполнить один наряд. (( отыгровка /me /do /try /todo ))

 

{ff0808}Сержант/Мичман - Прапорщик/Мл.Лейтенант.

{ffffff}1. Отстоять на посту "ГС" сорок минут.
2. Привезти три фуры со склада оружия.
3. Выполнить два наряда. (( отыгровка /me /do /try /todo ))
4. Участвовать на двух тренировках на полосе препятствий.
5. Выполнить сборку/разборку пистолета Desert Eagle, под присмотром офицера.
6. Создать личное дело в составе вашей армии.

 

{ff0808}Прапорщик/Мл.Лейтенант - Мл.Лейтенант/Лейтенант.

{ffffff}1. Сдать экзамены об окончании Офицерской Академии.
2. Отстоять на посту "ГС" или "СО" шестьдесят минут.
3. Выполнить два наряда. (( отыгровка /me /do /try /todo ))
4. Прослушать лекцию на тему: "Офицерский состав".
5. Привезти четыре фуры со склада оружия.
6. Выполнить сборку/разборку пистолета Desert Eagle не более, чем за 30 секунд, под присмотром офицера.
7. Иметь одобренное заявление в Military Police // National Security Agency.
8. Дополнить личное дело в разделе вашей армии.

  

{ff0808}Мл.Лейтенант/Лейтенант - Полковник/Вице-Адмирал.

{ffffff}1. Получить нашивку и форму отряда, в который вас одобрили. 
2. Дополнить личное дело в составе своей своей армии. 

  

{ff0808}Дополнение:
{ffffff}Генерал, либо Адмирал имеют право отклонить повышение и добавить от 2 до 5 дней к сроку, если вашей работы не достаточно.
По истечению дополнительных дней вы подаёте повторный отчёт.
Доклады делать каждые 10 минут. За нарушение данного пункта возможен отказ, допускается погрешность 1-5 минуты.
На всех фото-доказательствах обязательно должна быть фиксация времени.
Брать фото-доказательства с прошлых отчетов, либо из отчетов других военнослужащих запрещено.
За попытку подделки доказательств работы, либо иных доказательств - вы получите строжайшее наказание.
Интервал между лекциями, тренировками - 20 минут.
Если у Вас имеется один выговор в личном деле - Вы не имеете право получить новое воинское звание.]]
            imgui.TextColoredRGB(text)
            imgui.BeginChild('BLS', imgui.ImVec2(160, 90), false)
            imgui.EndChild()
            imgui.TreePop()
        end
      end
	  
	  if pane == 4345 then
        if imgui.TreeNode(u8"Открыть(all)") then
           imgui.Text(u8("В строю военнослужащему запрещается:\n[!] Разговаривать.\n[!] Пользоваться мобильным телефоном.\n[!] Открывать огонь без приказа офицера.\n[!] Доставать оружие ( Искл. 
