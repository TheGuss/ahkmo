; <COMPILER:
Menu, Tray,NoStandard
Menu, Tray,DeleteAll
Menu, Tray, Icon,,, 1
Menu, Tray, Add, Папка скрипта,direct
Menu, Tray, Add,
Menu, Tray, Add, Настройки,guipoint
Menu, Tray, Add,
Menu, Tray, Add, Связь с Разработчиком,vk
Menu, Tray, Add,
Menu, Tray, Add, Закрыть скрипт,off
Menu, Tray, color, %script_color%
buildscr := 6
downlurl := "https://raw.githubusercontent.com/FOsborn/TH/master/updtmz.exe"
downllen := "https://raw.githubusercontent.com/FOsborn/TH/master/verlenmz.ini"
WM_HELP(){
    IniRead, vupd, %a_temp%/verlen.ini, UPD, v
    IniRead, desupd, %a_temp%/verlen.ini, UPD, des
    desupd := Utf8ToAnsi1(desupd)
    IniRead, updupd, %a_temp%/verlen.ini, UPD, upd
    updupd := Utf8ToAnsi1(updupd)
    msgbox, , Список изменений версии %vupd%, %updupd%
    return
}
OnMessage(0x53, "WM_HELP")
Gui +OwnDialogs
SplashTextOn, , 60,Загрузка данных, Запрос обновлений. Ожидайте..`nПроверяем наличие обновлений.
URLDownloadToFile, %downllen%, %a_temp%/verlen.ini
IniRead, buildupd, %a_temp%/verlen.ini, UPD, build
if buildupd =
{
    SplashTextOn, , 60,Загрузка данных, Запуск скрипта. Ожидайте..`nОшибка. Нет связи с сервером.
    sleep, 2000
}
if buildupd > % buildscr
{
    IniRead, vupd, %a_temp%/verlen.ini, UPD, v
    SplashTextOn, , 60,Загрузка данных, Запуск скрипта. Ожидайте..`nОбнаружено обновление до версии %vupd%!
    sleep, 2000
    IniRead, desupd, %a_temp%/verlen.ini, UPD, des
    desupd := Utf8ToAnsi1(desupd)
    IniRead, updupd, %a_temp%/verlen.ini, UPD, upd
    updupd := Utf8ToAnsi1(updupd)
    SplashTextoff
    msgbox, 16384, Обновление скрипта до версии %vupd%, %desupd%
    IfMsgBox OK
    {
        msgbox, 1, Обновление скрипта до версии %vupd%, Хотите ли Вы обновиться?
        IfMsgBox OK
        {
            put2 := % A_ScriptFullPath
            RegWrite, REG_SZ, HKEY_CURRENT_USER, Software\SAMP ,put2 , % put2
            SplashTextOn, , 60,Автообновление, Обновление. Ожидайте..`nОбновляем скрипт до версии %vupd%!
            URLDownloadToFile, %downlurl%, %a_temp%/updt.exe
            sleep, 1000
            run, %a_temp%/updt.exe
            exitapp
        }
    }
}
global ADDR_SET_POSITION := 0xB7CD98
global ADDR_SET_POSITION_OFFSET := 0x14
global ADDR_SET_POSITION_X_OFFSET := 0x30
global ADDR_SET_POSITION_Y_OFFSET := 0x34
global ADDR_SET_POSITION_Z_OFFSET := 0x38
global ADDR_SET_INTERIOR_OFFSET := 0xB72914
global SAMP_SZIP_OFFSET := 0x20
global SAMP_SZHOSTNAME_OFFSET := 0x121
global SAMP_INFO_SETTINGS_OFFSET := 0x3C5
global ERROR_OK                     := 0
global ERROR_PROCESS_NOT_FOUND      := 1
global ERROR_OPEN_PROCESS           := 2
global ERROR_INVALID_HANDLE         := 3
global ERROR_MODULE_NOT_FOUND       := 4
global ERROR_ENUM_PROCESS_MODULES   := 5
global ERROR_ZONE_NOT_FOUND         := 6
global ERROR_CITY_NOT_FOUND         := 7
global ERROR_READ_MEMORY            := 8
global ERROR_WRITE_MEMORY           := 9
global ERROR_ALLOC_MEMORY           := 10
global ERROR_FREE_MEMORY            := 11
global ERROR_WAIT_FOR_OBJECT        := 12
global ERROR_CREATE_THREAD          := 13
global ADDR_ZONECODE                := 0xA49AD4
global ADDR_POSITION_X              := 0xB6F2E4
global ADDR_POSITION_Y              := 0xB6F2E8
global ADDR_POSITION_Z              := 0xB6F2EC
global ADDR_CPED_PTR                := 0xB6F5F0
global ADDR_CPED_HPOFF              := 0x540
global ADDR_CPED_ARMOROFF           := 0x548
global ADDR_CPED_MONEY              := 0x0B7CE54
global ADDR_CPED_INTID              := 0xA4ACE8
global ADDR_CPED_SKINIDOFF          := 0x22
global ADDR_VEHICLE_PTR             := 0xBA18FC
global ADDR_VEHICLE_HPOFF           := 0x4C0
global ADDR_VEHICLE_DOORSTATE       := 0x4F8
global ADDR_VEHICLE_ENGINESTATE     := 0x428
global ADDR_VEHICLE_SIRENSTATE := 0x1069
global ADDR_VEHICLE_SIRENSTATE2 := 0x1300
global ADDR_VEHICLE_LIGHTSTATE      := 0x584
global ADDR_VEHICLE_MODEL           := 0x22
global ADDR_VEHICLE_TYPE            := 0x590
global ADDR_VEHICLE_DRIVER          := 0x460
global ADDR_VEHICLE_X               := 0x44
global ADDR_VEHICLE_Y               := 0x48
global ADDR_VEHICLE_Z               := 0x4C
global oAirplaneModels := [417, 425, 447, 460, 469, 476, 487, 488, 497, 511, 512, 513, 519, 520, 548, 553, 563, 577, 592, 593]
global oBikeModels := [481,509,510]
global ovehicleNames := ["Landstalker","Bravura","Buffalo","Linerunner","Perrenial","Sentinel","Dumper","Firetruck","Trashmaster","Stretch","Manana","Infernus","Voodoo","Pony","Mule","Cheetah","Ambulance","Leviathan","Moonbeam","Esperanto","Taxi","Washington","Bobcat","Whoopee","BFInjection","Hunter","Premier","Enforcer","Securicar","Banshee","Predator","Bus","Rhino","Barracks","Hotknife","Trailer","Previon","Coach","Cabbie","Stallion","Rumpo","RCBandit","Romero","Packer","Monster","Admiral","Squalo","Seasparrow","Pizzaboy","Tram","Trailer","Turismo","Speeder","Reefer","Tropic","Flatbed","Yankee","Caddy","Solair","Berkley'sRCVan","Skimmer","PCJ-600","Faggio","Freeway","RCBaron","RCRaider","Glendale","Oceanic","Sanchez","Sparrow","Patriot","Quad","Coastguard","Dinghy","Hermes","Sabre","Rustler","ZR-350","Walton","Regina","Comet","BMX","Burrito","Camper","Marquis","Baggage","Dozer","Maverick","NewsChopper","Rancher","FBIRancher","Virgo","Greenwood","Jetmax","Hotring","Sandking","BlistaCompact","PoliceMaverick","Boxvillde","Benson","Mesa","RCGoblin","HotringRacerA","HotringRacerB","BloodringBanger","Rancher","SuperGT","Elegant","Journey","Bike","MountainBike","Beagle","Cropduster","Stunt","Tanker","Roadtrain","Nebula","Majestic","Buccaneer","Shamal","hydra","FCR-900","NRG-500","HPV1000","CementTruck","TowTruck","Fortune","Cadrona","FBITruck","Willard","Forklift","Tractor","Combine","Feltzer","Remington","Slamvan","Blade","Freight","Streak","Vortex","Vincent","Bullet","Clover","Sadler","Firetruck","Hustler","Intruder","Primo","Cargobob","Tampa","Sunrise","Merit","Utility","Nevada","Yosemite","Windsor","Monster","Monster","Uranus","Jester","Sultan","Stratum","Elegy","Raindance","RCTiger","Flash","Tahoma","Savanna","Bandito","FreightFlat","StreakCarriage","Kart","Mower","Dune","Sweeper","Broadway","Tornado","AT-400","DFT-30","Huntley","Stafford","BF-400","NewsVan","Tug","Trailer","Emperor","Wayfarer","Euros","Hotdog","Club","FreightBox","Trailer","Andromada","Dodo","RCCam","Launch","PoliceCar","PoliceCar","PoliceCar","PoliceRanger","Picador","S.W.A.T","Alpha","Phoenix","GlendaleShit","SadlerShit","Luggage","Luggage","Stairs","Boxville","Tiller","UtilityTrailer"]
global oweaponNames := ["Fist","Brass Knuckles","Golf Club","Nightstick","Knife","Baseball Bat","Shovel","Pool Cue","Katana","Chainsaw","Purple Dildo","Dildo","Vibrator","Silver Vibrator","Flowers","Cane","Grenade","Tear Gas","Molotov Cocktail", "", "", "", "Пистолет","Пистолет с глушителем","Desert Eagle","Shotgun","Sawnoff Shotgun","Combat Shotgun","Micro SMG/Uzi","MP5","AK-47","M4","Tec-9","Country Rifle","Sniper Rifle","RPG","HS Rocket","Flamethrower","Minigun","Satchel Charge","Detonator","Spraycan","Fire Extinguisher","Camera","Night Vis Goggles","Thermal Goggles","Parachute"]
global oradiostationNames := ["Playback FM", "K Rose", "K-DST", "Bounce FM", "SF-UR", "Radio Los Santos", "Radio X", "CSR 103.9", "K-JAH West", "Master Sounds 98.3", "WCTR Talk Radio", "User Track Player", "Radio Off"]
global oweatherNames := ["EXTRASUNNY_LA", "SUNNY_LA", "EXTRASUNNY_SMOG_LA", "SUNNY_SMOG_LA", "CLOUDY_LA", "SUNNY_SF", "EXTRASUNNY_SF", "CLOUDY_SF", "RAINY_SF", "FOGGY_SF", "SUNNY_VEGAS", "EXTRASUNNY_VEGAS", "CLOUDY_VEGAS", "EXTRASUNNY_COUNTRYSIDE", "SUNNY_COUNTRYSIDE", "CLOUDY_COUNTRYSIDE", "RAINY_COUNTRYSIDE", "EXTRASUNNY_DESERT", "SUNNY_DESERT", "SANDSTORM_DESERT", "UNDERWATER", "EXTRACOLOURS_1", "EXTRACOLOURS_2"]
Global oWeaponIdForModel := {1:331, 2:333, 3:334, 4:335, 5:336, 6:337, 7:338, 8:339, 9:341, 10:321, 11:322, 12:323, 13:324, 14:325, 15:326, 16:342, 17:343, 18:344, 22:346, 23:347, 24:348, 25:349, 26:350, 27:351, 28:352, 29:353, 30:355, 31:356, 32:372, 33:357, 34:358, 35:359, 36:360, 37:361, 38:362, 39:363, 40:364, 41:365, 42:366, 43:367, 44:368, 45:369, 46:371}
global clist_erp := ["{ffffff}", "{089401}", "{56fb4e}", "{49e789}", "{2a9170}", "{9ed201}", "{279b1e}", "{51964d}", "{ff0606}", "{ff6600}", "{f45000}", "{be8a01}", "{b30000}", "{954f4f}", "{e7961d}", "{e6284e}", "{ff9db6}", "{110ce7}", "{0cd7e7}", "{139bec}", "{2c9197}", "{114d71}", "{8813e7}", "{b313e7}", "{758c9d}", "{ffde24}", "{ffee8a}", "{ddb201}", "{dda701}", "{b0b000}", "{868484}", "{b8b6b6}", "{333333}", "{fafafa}"]
global ADDR_SAMP_INCHAT_PTR             := 0x21a10c
global ADDR_SAMP_INCHAT_PTR_OFF         := 0x55
global ADDR_SAMP_USERNAME               := 0x219A6F
global FUNC_SAMP_SENDCMD                := 0x65c60
global FUNC_SAMP_SENDSAY                := 0x57f0
global FUNC_SAMP_ADDTOCHATWND           := 0x64520
global ADDR_SAMP_CHATMSG_PTR            := 0x21a0e4
global FUNC_SAMP_SHOWGAMETEXT           := 0x9c2c0
global FUNC_SAMP_PLAYAUDIOSTR           := 0x62da0
global FUNC_SAMP_STOPAUDIOSTR           := 0x629a0
global DIALOG_STYLE_MSGBOX			:= 0
global DIALOG_STYLE_INPUT 			:= 1
global DIALOG_STYLE_LIST			:= 2
global DIALOG_STYLE_PASSWORD		:= 3
global DIALOG_STYLE_TABLIST			:= 4
global DIALOG_STYLE_TABLIST_HEADERS	:= 5
global SAMP_DIALOG_LINENUMBER_OFFSET := 0x140
global SAMP_DIALOG_STRUCT_PTR					:= 0x21A0B8
global SAMP_DIALOG_PTR1_OFFSET				:= 0x1C
global SAMP_DIALOG_LINES_OFFSET 			:= 0x44C
global SAMP_DIALOG_INDEX_OFFSET				:= 0x443
global SAMP_DIALOG_BUTTON_HOVERING_OFFSET	:= 0x465
global SAMP_DIALOG_BUTTON_CLICKED_OFFSET	:= 0x466
global SAMP_DIALOG_PTR2_OFFSET 				:= 0x20
global SAMP_DIALOG_LINECOUNT_OFFSET			:= 0x150
global SAMP_DIALOG_OPEN_OFFSET				:= 0x28
global SAMP_DIALOG_STYLE_OFFSET				:= 0x2C
global SAMP_DIALOG_ID_OFFSET				:= 0x30
global SAMP_DIALOG_TEXT                     := 0x12D8F8
global SAMP_DIALOG_TEXT_PTR_OFFSET			:= 0x34
global SAMP_DIALOG_CAPTION_OFFSET			:= 0x40
global FUNC_SAMP_SHOWDIALOG				 	:= 0x6B9C0
global FUNC_SAMP_CLOSEDIALOG				:= 0x6C040
global SAMP_CHAT_SHOW                       := 0x21A0E8
global FUNC_UPDATESCOREBOARD                := 0x8A10
global SAMP_INFO_OFFSET                     := 0x21A0F8
global ADDR_SAMP_CRASHREPORT 				:= 0x5CF2C
global SAMP_PPOOLS_OFFSET                   := 0x3CD
global SAMP_PPOOL_PLAYER_OFFSET             := 0x18
global SAMP_SLOCALPLAYERID_OFFSET           := 0x4
global SAMP_ISTRLEN_LOCALPLAYERNAME_OFFSET  := 0x1A
global SAMP_SZLOCALPLAYERNAME_OFFSET        := 0xA
global SAMP_PSZLOCALPLAYERNAME_OFFSET       := 0xA
global SAMP_PREMOTEPLAYER_OFFSET            := 0x2E
global SAMP_ISTRLENNAME___OFFSET            := 0x1C
global SAMP_SZPLAYERNAME_OFFSET             := 0xC
global SAMP_PSZPLAYERNAME_OFFSET            := 0xC
global SAMP_ILOCALPLAYERPING_OFFSET         := 0x26
global SAMP_ILOCALPLAYERSCORE_OFFSET        := 0x2A
global SAMP_IPING_OFFSET                    := 0x28
global SAMP_ISCORE_OFFSET                   := 0x24
global SAMP_ISNPC_OFFSET                    := 0x4
global SAMP_PLAYER_MAX                      := 1004
global CheckpointCheck 						:= 0xC7DEEA
global rmaddrs 								:= [0xC7DEC8, 0xC7DECC, 0xC7DED0]
global SIZE_SAMP_CHATMSG := 0xFC
global hGTA := 0x0
global dwGTAPID := 0x0
global dwSAMP := 0x0
global pMemory := 0x0
global pParam1 := 0x0
global pParam2 := 0x0
global pParam3 := 0x0
global pParam4                         := 0x0
global pParam5                         := 0x0
global pInjectFunc := 0x0
global nZone := 1
global nCity := 1
global nCube := 1
global bInitZaC := 0
global iRefreshScoreboard := 0
global oScoreboardData := ""
global iRefreshHandles := 0
global iUpdateTick := 2500
#NoEnv
getPlayerAnim()
{
    if(!checkHandles())
    return false
    dwPointer := readDWORD(hGTA, dwSAMP + 0x13D190)
    anim := readMem(hGTA, dwPointer + 0x2F4C, 2, "byte")
    return anim
}
SkinInCop(skin)
{
    if skin in 165,166,280,281,282,283,284,285,286,288,310,311
    Return 1
    Return 0
}
GetGameShowText()
{
    Return readString(hGTA, 0x0BAAD40, 100)
}
RandomMessage(array)
{
    if (IsObject(array))
    {
        Random, random, 1, % array.MaxIndex()
        Return array[random]
    }
    Return array
}
noManyPanSpray(value)
{
    If(!checkHandles())
    return false
    If(value)
    writeMemory(hGTA, 0x96C009, 0x1)
    else
    writeMemory(hGTA, 0x96C009, 0x0)
}
GetCameraRotation()
{
    If(!checkHandles())
    return -1
    return readFloat(hGTA, 0xB6F178)
}
NightVision(value)
{
    If(!checkHandles())
    return false
    If (value)
    writeMemory(hGTA, 0xC402B8, 0x1)
    else
    writeMemory(hGTA, 0xC402B8, 0x0)
}
setCarNitro()
{
    If(!checkHandles())
    return -1
    return writeMemory(hGTA, 0x969165, 0x1)
}
ThermalVision(value)
{
    If(!checkHandles())
    return false
    If(value)
    writeMemory(hGTA, 0xC402B9, 0x1)
    else
    writeMemory(hGTA, 0xC402B9, 0x0)
}
UnderWaterDrive(value)
{
    If(!checkHandles())
    return false
    If(value)
    writeMemory(hGTA, 0x6C2759, 0x1)
    else
    writeMemory(hGTA, 0x6C2759, 0x0)
}
WaterDrive(value)
{
    If(!checkHandles())
    return false
    If(value)
    {
        writeMemory(hGTA, 0x969152, 0x1)
    }
    else
    {
        writeMemory(hGTA, 0x969152, 0x0)
    }
}
GetGravity()
{
    If(!checkHandles())
    return -1
    return readFloat(hGTA, 0x863984)
}
SetGravity(value)
{
    If(!checkHandles())
    return -1
    writeMemory(hGTA, 0x863984, value, 4, "float")
}
AntiPause()
{
    if(!checkHandles())
    return false
    writeBytes(hGTA, 0x747FB6, "01")
    writeBytes(hGTA, 0x74805A, "01")
    writeBytes(hGTA, 0x74542B, "90909090909090")
    writeBytes(hGTA, 0x74542C, "90909090909090")
    writeBytes(hGTA, 0x74542D, "909090909090")
    return
}
getKillStat(ByRef IsEnabled := "")
{
    if(!checkHandles())
    return false
    a := []
    klist := readDWORD(hGTA, dwSAMP + 0x21A0EC)
    isEnabled := readMem(hGTA, klist, 4, "int")
    klist += 4
    loop 5
    {
        szKiller := readString(hGTA, klist, 25)
        szVictim := readString(hGTA, (klist += 25), 25)
        clKillerColor := inttohex(readMem(hGTA, (klist += 25), 4, "uint"))
        clVictimColor := inttohex(readMem(hGTA, (klist += 4), 4, "uint"))
        byteType := Memory_ReadByte(hGTA, (klist += 4))
        klist++
        a.Insert([szKiller, szVictim, clKillerColor, clVictimColor, byteType])
    }
    return a
}
setPlayerWanted(level)
{
    if(!checkHandles())
    return -1
    return ProcessWriteMemory(level, 0x58DB60, "gta_sa.exe", "Byte", 1)
}
getPlayerFps(float := false)
{
    if(!checkHandles())
    return -1
    return (float ? ProcessReadMemory(0xB7CB50, "gta_sa.exe", "Float", 4):Round(ProcessReadMemory(0xB7CB50, "gta_sa.exe", "Float", 4)))
}
WallHack(tog := -1)
{
    if(!checkHandles())
    return -1
    byte := readMem(hGTA, dwSAMP + 0x70F1A, 1, "byte")
    if((tog == -1 && byte == 232) || tog == true || tog == 1)
    {
        writeBytes(hGTA, dwSAMP + 0x70F1A, "9090909090")
        writeBytes(hGTA, dwSAMP + 0x6FE0A, "9090909090")
        writeBytes(hGTA, dwSAMP + 0x70E24, "909090909090")
        writeBytes(hGTA, dwSAMP + 0x6FD14, "909090909090")
        return true
    }
    else if ((tog == -1 && byte == 144) || !tog)
    {
        writeBytes(hGTA, dwSAMP + 0x70F1A, "E8B1AD0300")
        writeBytes(hGTA, dwSAMP + 0x6FE0A, "E8C1BE0300")
        writeBytes(hGTA, dwSAMP + 0x70E24, "0F8A71010000")
        writeBytes(hGTA, dwSAMP + 0x6FD14, "0F8A50010000")
        return false
    }
    return -1
}
NOP_SetPlayerPos(tog := -1)
{
    if(!checkHandles())
    return -1
    dwAddress := dwSAMP+0x15970
    byte := readMem(hGTA, dwAddress, 1, "byte")
    if((tog == -1 && byte != 195) || tog == true || tog == 1)
    {
        writeBytes(hGTA, dwAddress, "C390")
        return true
    } else if((tog == -1 && byte == 195) || !tog)
    {
        writeBytes(hGTA, dwAddress, "E910")
        return false
    }
    return -1
}
CheckOpenDialog(text_error := "", text_edit := 0, wait := 2000, msg := 1)
{
    sleep, 100
    Time := A_TickCount
    while(!isDialogOpen())
    {
        if(A_TickCount - Time > 2000)
        {
            if (!msg)
            Return 1
            if (!text_edit)
            addChatMessageEx("00FF00", text_error "Диалог не открылся за " Floor(wait/1000) " с. `;( Повторите попытку!")
            else
            addChatMessageEx("00FF00", text_error text_edit)
            return 1
        }
    }
}
GetWeaponIDforModel(model)
{
    for k, v in oWeaponIdForModel
    if (v == model)
    return k
    return 0
}
getTargetPlayerWeaponModel(player)
{
    if(!checkHandles())
    return 0
    if (player is integer) and (player >= 0) and (player <= 999)
    player := getPedById(player)
    if(!player)
    return 0
    model := readMem(hGTA, player + 0x740, 2, "byte")
    if(model == 65535)
    return 0
    return model
}
toggleNoAnimations(tog := -1)
{
    if(!checkHandles())
    return -1
    byte := readMem(hGTA, dwSAMP + 0x16FA0, 1, "byte")
    if((tog == -1 && byte == 85) || tog == true || tog == 1)
    {
        writeMemory(hGTA, dwSAMP + 0x16FA0, 0xC3, 1, "byte")
        return true
    }
    else if((tog == -1 && byte == 195) || !tog)
    {
        writeMemory(hGTA, dwSAMP + 0x16FA0, 0x55, 1, "byte")
        return false
    }
    return -1
}
getTargetPlayerHealth(player)
{
    if(!checkHandles())
    return 0
    if (player is integer) and (player >= 0) and (player <= 999)
    player := getPedById(player)
    if(!player)
    return 0
    return readMem(hGTA, player + 0x540, 2, "byte")
}
getTargetPlayerArmour(player)
{
    if(!checkHandles())
    return 0
    if (player is integer) and (player >= 0) and (player <= 999)
    player := getPedById(player)
    if(!player)
    return 0
    return readMem(hGTA, player + 0x548, 2, "byte")
}
isInteger(num)
{
    return num^0 == num
}
setPlayerFreeze(status)
{
    if(!checkHandles())
    return -1
    dwCPed := readDWORD(hGTA, 0xB6F5F0)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    dwAddr := dwCPed + 0x42
    writeString(hGTA, dwAddr, status)
    if(ErrorLevel) {
        ErrorLevel := ERROR_WRITE_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return true
}
GetText(name, min := 1, max := 45, button := 0)
{
    text:=""
    for key, val in name
    {
        if (A_Index >= min && A_Index <= max)
        text .= val "`n"
        temp_A_Index := A_Index
    }
    text := Trim(text, "`n")
    if  (button)
    {
        if (min > 45)
        text .= " `nНазад"
        if (temp_A_Index > max)
        text .= "`nВперед"
    }
    text := Trim(text, "`n")
    return Array(text, min, max, temp_A_Index)
}
getChatLineEx(line := 0) {
    if(!checkHandles())
    return
    dwPtr := dwSAMP + ADDR_SAMP_CHATMSG_PTR
    dwAddress := readDWORD(hGTA, dwPtr)
    if(ErrorLevel)
    return
    msg := readString(hGTA, dwAddress + 0x152 + ( (99-line) * 0xFC), 0xFC)
    if(ErrorLevel)
    return
    Return
}
curl(method, adress, user_agent := "Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36 u01-05", error_log := 0, time_out := 0, package := "") {
    if (!RegExMatch(adress, "^http[s]?:\/\/.*\..*$")) {
        return error_log ? "Invalid URL adress (#1)" : false
    } else if (!DllCall("Wininet.dll\InternetGetConnectedState", "Str", 0x20, "Int", 0)) {
        return error_log ? "Not internet connection (#2)" : false
    }
    try {
        http := ComObjCreate("WinHttp.WinHttpRequest.5.1")
        http.Open(method, adress, false)
        http.SetRequestHeader("Referer", adress)
        http.SetRequestHeader("User-Agent", user_agent)
        http.SetRequestHeader("Content-Type", "application/x-www-form-urlencoded")
        http.SetRequestHeader("Pragma","no-cache")
        http.Send(package)
        http.WaitForResponse(time_out ? time_out : 0)
        if (!StrLen(http.ResponseText)) {
            return error_log ? "Empty response (#3)" : false
        } else {
            if (http.Status !== 200) {
                return error_log ? http.Status "(" http.StatusText ") (#4)" : false
            } else {
                ResponseText := RegExReplace(http.ResponseText, "<br>", "`n")
                ResponseText := RegExReplace(ResponseText, "<t>", "`t")
                ResponseText := RegExReplace(ResponseText, "<br \/>", "`n")
                return ResponseText
            }
        }
    } catch e {
        return error_log ? e.message "(#5)" : false
    }
}
get(url, user_agent := "", time_out := 5)
{
    if (!user_agent)
    user_agent := "Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 YaBrowser/17.6.1.744 Yowser/2.5 Safari/537.36"
    loop 5
    {
        ComObjError(false)
        whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
        whr.Open("GET", url)
        whr.WaitForResponse(time_out)
        whr.SetRequestHeader("Content-Type","application/x-www-form-urlencoded")
        whr.SetRequestHeader("User-Agent", user_agent)
        whr.Send()
        if(!strlen(whr.ResponseText))
        continue
        ResponseText := RegExReplace(whr.ResponseText, "<br>", "`n")
        ResponseText := RegExReplace(ResponseText, "<t>", "`t")
        ResponseText := RegExReplace(ResponseText, "<br \/>", "`n")
        return ResponseText
    }
}
post(url, send := "", user_agent := "", result := 0, time_out := 5)
{
    if (!user_agent)
    user_agent := "Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 YaBrowser/17.6.1.744 Yowser/2.5 Safari/537.36"
    try
    {
        hObject := ComObjCreate("WinHttp.WinHttpRequest.5.1")
        hObject.Open("POST", url)
        hObject.SetRequestHeader("Content-Type","application/x-www-form-urlencoded")
        hObject.SetRequestHeader("User-Agent", user_agent)
        hObject.Send(send)
        hObject.WaitForResponse(time_out)
    }
    catch ex
    return 0
    if (!result)
    return 1
    else if (result)
    {
        ResponseText := RegExReplace(hObject.ResponseText, "<br>", "`n")
        ResponseText := RegExReplace(ResponseText, "<t>", "`t")
        ResponseText := RegExReplace(ResponseText, "<br \/>", "`n")
        return ResponseText
    }
}
IsChatActive()
{
    if(!checkHandles())
    return -1
    dwChatInfo := readDWORD(hGTA, dwSAMP + SAMP_CHAT_SHOW)
    dwAddr := readDWORD(hGTA, dwChatInfo + 8)
    first_byte := Memory_ReadByte(hGTA, dwAddr + 4)
    second_byte := Memory_ReadByte(hGTA, dwAddr + 6)
    third_byte := Memory_ReadByte(hGTA, dwAddr + 60)
    if first_byte not between 0 and 1
    {
        if second_byte not between 0 and 1
        return third_byte
        return second_byte
    }
    return first_byte
}
ClearTextDialog()
{
    if(!checkHandles())
    return ""
    dwAddress := dwSAMP + SAMP_DIALOG_TEXT
    sUsername := writeString(hGTA, dwAddress, "")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    ErrorLevel := ERROR_OK
    return sUsername
}
setDialogIndex(index)
{
    dwPointer := getDialogStructPtr()
    if (ErrorLevel || !dwPointer)
    return false
    dwPointer := readDWORD(hGTA, dwPointer + SAMP_DIALOG_PTR2_OFFSET)
    if (ErrorLevel)
    {
        ErrorLevel := ERROR_READ_MEMORY
        return false
    }
    writeMemory(hGTA, dwPointer + 0x143, index - 1, 1, "Byte")
    sleep, 100
Send, {ENTER}
}
GetChatText() {
    if(!checkHandles())
    return -1
    dwAddress := dwSAMP + SAMP_DIALOG_TEXT
    sUsername := readString(hGTA, dwAddress, 256)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -2
    }
    ErrorLevel := ERROR_OK
    return sUsername
}
setimg(InData) {
    DllCall( "Crypt32.dll\CryptStringToBinary" ( A_IsUnicode ? "W" : "A" ), UInt,&InData
    , UInt,StrLen(InData), UInt,1, UInt,0, UIntP,Bytes, Int,0, Int,0, "CDECL Int" )
    VarSetCapacity( OutData, Req := Bytes * ( A_IsUnicode ? 2 : 1 ) )
    DllCall( "Crypt32.dll\CryptStringToBinary" ( A_IsUnicode ? "W" : "A" ), UInt,&InData
    , UInt,StrLen(InData), UInt,1, Str,OutData, UIntP,Req, Int,0, Int,0, "CDECL Int" )
    File := FileOpen(A_Temp "\Pic.png", "w"), File.length := 0, File.RawWrite(OutData, Bytes)
    File.Close(), VarSetcapacity( OutData, 0)
    Return A_Temp "\Pic.png"
}
WM_LBUTTONDOWN()
{
    WM_NCLBUTTONDOWN := 0xA1, HTCAPTION := 2
    PostMessage, WM_NCLBUTTONDOWN, HTCAPTION
}
rus()
{
    SendMessage, 0x50,, 0x4190419,, A
    return
}
eng()
{
    SendMessage, 0x50,, 0x4090409,, A
    return
}
save(chatlog)
{
    static logschat     := A_MyDocuments "\GTA San Andreas User Files\SAMP\ChatLogs\"
    static chat         := A_MyDocuments "\GTA San Andreas User Files\SAMP\chatlog.txt"
    FileCreateDir, % logschat A_MM "-" A_YYYY
    FileAppend, % chatlog, % logschat A_MM "-" A_YYYY "\" A_DD "." A_MM "." A_YYYY ".txt"
    FileDelete, % chat
}
Copy(Text, LocaleID=0x419)
{
    CF_TEXT:=1, CF_LOCALE:=16, GMEM_MOVEABLE:=2
    TextLen :=StrLen(Text)
    HmemText :=DllCall("GlobalAlloc", "UInt", GMEM_MOVEABLE, "UInt", TextLen+1)
    HmemLocale:=DllCall("GlobalAlloc", "UInt", GMEM_MOVEABLE, "UInt", 4)
    If(!HmemText || !HmemLocale)
    Return
    PtrText :=DllCall("GlobalLock", "UInt", HmemText)
    PtrLocale :=DllCall("GlobalLock", "UInt", HmemLocale)
    DllCall("msvcrt\memcpy", "UInt", PtrText, "Str", Text, "UInt", TextLen+1, "Cdecl")
    NumPut(LocaleID, PtrLocale+0)
    DllCall("GlobalUnlock", "UInt", HmemText)
    DllCall("GlobalUnlock", "UInt", HmemLocale)
    If not DllCall("OpenClipboard", "UInt", 0)
    {
        DllCall("GlobalFree", "UInt", HmemText)
        DllCall("GlobalFree", "UInt", HmemLocale)
        Return
    }
    DllCall("EmptyClipboard")
    DllCall("SetClipboardData", "UInt", CF_TEXT, "UInt", HmemText)
    DllCall("SetClipboardData", "UInt", CF_LOCALE, "UInt", HmemLocale)
    DllCall("CloseClipboard")
}
ClipGetText(CodePage=1251)
{
    CF_TEXT:=1, CF_UNICODETEXT:=13, Format:=0
    If not DllCall("OpenClipboard", "UInt", 0)
    Return
    Loop
    {
        Format:=DllCall("EnumClipboardFormats", "UInt", Format)
        If(Format=0 || Format=CF_TEXT || Format=CF_UNICODETEXT)
        Break
    }
    If(Format=0) {
        DllCall("CloseClipboard")
        Return
    }
    If(Format=CF_TEXT)
    {
        HmemText:=DllCall("GetClipboardData", "UInt", CF_TEXT)
        PtrText :=DllCall("GlobalLock", "UInt", HmemText)
        TextLen :=DllCall("msvcrt\strlen", "UInt", PtrText, "Cdecl")
        VarSetCapacity(Text, TextLen+1)
        DllCall("msvcrt\memcpy", "Str", Text, "UInt", PtrText, "UInt", TextLen+1, "Cdecl")
        DllCall("GlobalUnlock", "UInt", HmemText)
    }
    Else If(Format=CF_UNICODETEXT)
    {
        HmemTextW:=DllCall("GetClipboardData", "UInt", CF_UNICODETEXT)
        PtrTextW :=DllCall("GlobalLock", "UInt", HmemTextW)
        TextLen :=DllCall("msvcrt\wcslen", "UInt", PtrTextW, "Cdecl")
        VarSetCapacity(Text, TextLen+1)
        DllCall("WideCharToMultiByte", "UInt", CodePage, "UInt", 0, "UInt", PtrTextW
        , "Int", TextLen+1, "Str", Text, "Int", TextLen+1
        , "UInt", 0, "Int", 0)
        DllCall("GlobalUnlock", "UInt", HmemTextW)
    }
    DllCall("CloseClipboard")
    Return Text
}
getLastDamagePed(ByRef Ped := "", ByRef Weapon := "")
{
    if(!checkHandles())
    return -1
    if(!CPed := readDWORD(hGTA, ADDR_CPED_PTR))
    return -1
    if(!dwPed := readDWORD(hGTA, CPed + 0x764))
    return -1
    Ped := getIdByPed(dwPed)
    Weapon := readMem(hGTA, CPed + 0x760, 4, "int")
    return dwPed
}
setFireImmunity(state)
{
    if(!checkHandles())
    return
    writeMemory(hGTA, 0xB7CEE6, (state ? 1 : 0), 1, "byte")
}
setInfiniteRun(state)
{
    if(!checkHandles())
    return
    writeMemory(hGTA, 0xB7CEE4, (state ? 1 : 0), 1, "byte")
}
isMarkerSetup()
{
    if(!checkHandles())
    return -1
    return readMem(hGTA, 0xBA6774, 1, "byte")
}
getWeaponAmmo(ByRef Ammo := "", ByRef Clip := "", slot := -1)
{
    if(!checkHandles())
    return -1
    if(!CPed := readDWORD(hGTA, ADDR_CPED_PTR))
    return -1
    if slot not between 0 and 12
    {
        VarSetCapacity(slot, 1)
        DllCall("ReadProcessMemory", "UInt", hGTA, "UInt", CPed + 0x718, "Str", slot, "UInt", 1, "UInt*", 0)
        slot := NumGet(slot, 0, "short")
        if slot >= 12544
        slot -= 12544
    }
    struct := CPed + 0x5AC
    VarSetCapacity(Ammo, 4)
    VarSetCapacity(Clip, 4)
    DllCall("ReadProcessMemory", "UInt", hGTA, "UInt", struct + (0x1C * slot), "Str", Ammo, "UInt", 4, "UInt*", 0)
    DllCall("ReadProcessMemory", "UInt", hGTA, "UInt", struct + (0x1C * slot) - 0x4, "Str", Clip, "UInt", 4, "UInt*", 0)
    Ammo := NumGet(Ammo, 0, "int")
    Clip := NumGet(Clip, 0, "int")
    return Ammo
}
getWeaponSlotById(id)
{
    if id between 2 and 9
    slot := 1
    if id between 10 and 15
    slot := 10
    if id in 16,17,18,39
    slot := 8
    if id between 22 and 24
    slot := 2
    if id between 25 and 27
    slot := 3
    if id in 28,29,32
    slot := 4
    if id in 30,31
    slot := 5
    if id in 33,34
    slot := 6
    if id between 35 and 38
    slot := 7
    if id == 40
    slot := 12
    if id between 41 and 43
    slot := 9
    if id between 44 and 46
    slot := 11
}
isPlayerCrouch()
{
    if(!checkHandles())
    return -1
    if(!CPed := readDWORD(hGTA, ADDR_CPED_PTR))
    return -1
    state := readMem(hGTA, CPed + 0x46F, 1, "byte")
    if(state == 132)
    return 1
    if(state == 128)
    return 0
    return -1
}
setDialogState(tog)
{
    if(!checkHandles())
    return false
    dwPointer := getDialogStructPtr()
    if(ErrorLevel || !dwPointer)
    return false
    writeMemory(hGTA, dwPointer + 0x28, (tog ? 1 : 0), 1, "byte")
    if(!tog)
Send {f6}{esc}
    return true
}
toggleUnlimitedAmmo(tog := -1)
{
    if(!checkHandles())
    return -1
    byte := readMem(hGTA, 0x7428E6, 1, "byte")
    if((tog == -1 && byte == 255) || tog == true || tog == 1)
    {
        writeBytes(hGTA, 0x7428E6, "909090")
        return true
    } else if((tog == -1 && byte == 144) || !tog)
    {
        writeBytes(hGTA, 0x7428E6, "FF4E0C")
        return false
    }
    return -1
}
toggleNoReload(tog := -1)
{
    if(!checkHandles())
    return -1
    byte := readMem(hGTA, 0x7428B0, 1, "byte")
    if((tog == -1 && byte == 137) || tog == true || tog == 1)
    {
        writeBytes(hGTA, 0x7428B0, "909090")
        return true
    } else if((tog == -1 && byte == 144) || !tog)
    {
        writeBytes(hGTA, 0x7428B0, "894608")
        return false
    }
    return -1
}
toggleNoRecoil(tog := -1)
{
    if(!checkHandles())
    return -1
    byte := readMem(hGTA, 0x740450, 1, "byte")
    if((tog == -1 && byte == 216) || tog == true || tog == 1)
    {
        writeBytes(hGTA, 0x740450, "90909090909090909090")
        return true
    } else if((tog == -1 && byte == 144) || !tog)
    {
        writeBytes(hGTA, 0x740450, "D80D3C8B8500D84C241C")
        return false
    }
    return -1
}
getclist(server, color)
{
    if (server == "erp")
    {
        for k, v in clist_erp
        if (v == color)
        Return k-1
    }
}
toggleAntiBikeFall(tog := -1)
{
    if(!checkHandles())
    return -1
    byte := readMem(hGTA, 0x4BA3B9, 1, "byte")
    if((tog == -1 && byte == 15) || tog == true || tog == 1)
    {
        writeBytes(hGTA, 0x4BA3B9, "E9A703000090")
        return true
    } else if((tog == -1 && byte == 233) || !tog)
    {
        writeBytes(hGTA, 0x4BA3B9, "0F84A6030000")
        return false
    }
    return -1
}
toggleAntiCarEject(tog := -1)
{
    if(!checkHandles())
    return -1
    byte := readMem(hGTA, dwSAMP + 0x146E0, 1, "byte")
    if((tog == -1 && byte == 233) || tog == true || tog == 1)
    {
        writeBytes(hGTA, dwSAMP + 0x146E0, "C390909090")
        return true
    } else if((tog == -1 && byte == 195) || !tog)
    {
        writeBytes(hGTA, dwSAMP + 0x146E0, "E9D7722700")
        return false
    }
    return -1
}
toggleObjectDrawMode(tog := -1)
{
    if(!checkHandles())
    return -1
    byte := readMem(hGTA, dwSAMP + 0x69529, 1, "byte")
    if((tog == -1 && byte == 15) || tog == true || tog == 1)
    {
        writeBytes(hGTA, dwSAMP + 0x69529, "909090909090")
        return true
    } else if((tog == -1 && byte == 144) || !tog)
    {
        writeBytes(hGTA, dwSAMP + 0x69529, "0F84AE000000")
        return false
    }
    return -1
}
toggleMotionBlur(tog := -1)
{
    if(!checkHandles())
    return -1
    byte := readMem(hGTA, 0x704E8A, 1, "byte")
    if((tog == -1 && byte == 144) || tog == true || tog == 1)
    {
        writeBytes(hGTA, 0x704E8A, "E811E2FFFF")
        return true
    } else if((tog == -1 && byte == 232) || !tog)
    {
        writeBytes(hGTA, 0x704E8A, "9090909090")
        return false
    }
    return -1
}
writeBytes(handle, address, bytes)
{
    length := strlen(bytes) / 2
    VarSetCapacity(toInject, length, 0)
    Loop %length%
    {
        byte := "0x" substr(bytes, ((A_Index - 1) * 2) + 1, 2)
        NumPut(byte, toInject, A_Index - 1, "uchar")
    }
    return writeRaw(handle, address, &toInject, length)
}
setHP(hp) {
    if(!checkHandles())
    return -1
    dwCPedPtr := readDWORD(hGTA, ADDR_CPED_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    dwAddr := dwCPedPtr + ADDR_CPED_HPOFF
    writeFloat(hGTA, dwAddr, hp)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return true
}
getsexbyskin(skin := "")
{
    if (skin == "")
    skin := getSkinID()
    if skin in 1,2,3,4,5,6,7,8,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,32,33,34,35,36,37,42,43,44,45,46,47,48,49,50,51,52,57,58,59,60,61,62,66,67,68,70,71,72,73,79,80,81,82,83,84,86,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,132,133,134,135,136,137,142,143,144,146,147,149,153,154,155,156,158,159,160,161,162,163,164,165,166,167,168,170,171,173,174,175,176,177,179,180,181,182,183,184,185,186,187,188,189,200,202,203,204,206,208,209,210,212,213,217,220,221,222,223,227,228,229,230,234,235,236,239,240,241,242,247,248,249,250,252,253,254,255,258,259,260,261,262,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,299,300,301,302,303,304,305,310,311
    return 1
    if skin in 9,10,11,12,13,31,38,39,40,41,53,54,55,56,63,64,65,69,75,76,77,85,87,88,89,90,91,92,93,129,130,131,138,139,140,141,143,144,145,148,150,151,152,157,169,172,178,190,191,192,193,194,195,196,197,198,199,201,205,207,211,214,215,216,218,219,224,225,226,231,232,233,237,238,243,244,245,246,251,256,257,263,298,306,307,308,309
    return 2
    else
    return 0
}
getDialogLineNumber() {
    dwPointer := getDialogStructPtr()
    if (ErrorLevel || !dwPointer)
    return 0
    dwPointer := readDWORD(hGTA, dwPointer + SAMP_DIALOG_PTR2_OFFSET)
    if (ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    count := readMem(hGTA, dwPointer + SAMP_DIALOG_LINENUMBER_OFFSET, 4, "UInt")
    if (ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    return count//16777216+1
}
getServerHour() {
    if(!checkHandles())
    return -1
    dwGTA := getModuleBaseAddress("gta_sa.exe", hGTA)
    Hour := readMem(hGTA, 0xB70153, 1, "Int")
    if (Hour <= 9) {
        FixHour = 0%Hour%
        return FixHour
    }
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return Hour
}
getServerMinute() {
    if(!checkHandles())
    return -1
    dwGTA := getModuleBaseAddress("gta_sa.exe", hGTA)
    Minute := readMem(hGTA, 0xB70152, 1, "Int")
    if (Minute <= 9) {
        FixMinute = 0%Minute%
        return FixMinute
    }
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return Minute
}
getCameraCoordinates() {
    if(!checkHandles())
    return false
    fX := readFloat(hGTA, 0xB6F9CC)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    fY := readFloat(hGTA, 0xB6F9D0)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    fZ := readFloat(hGTA, 0xB6F9D4)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    ErrorLevel := ERROR_OK
    return [fX, fY, fZ]
}
getPlayerPosById(dwId) {
    dwId += 0
    dwId := Floor(dwId)
    if(dwId < 0 || dwId >= SAMP_PLAYER_MAX)
    return ""
    if(iRefreshScoreboard+iUpdateTick > A_TickCount)
    {
        if(oScoreboardData[dwId])
        {
            if(oScoreboardData[dwId].HasKey("PED"))
            return getPedCoordinates(oScoreboardData[dwId].PED)
            if(oScoreboardData[dwId].HasKey("MPOS"))
            return oScoreboardData[dwId].MPOS
        }
        return ""
    }
    if(!updateOScoreboardData())
    return ""
    if(oScoreboardData[dwId])
    {
        if(oScoreboardData[dwId].HasKey("PED"))
        return getPedCoordinates(oScoreboardData[dwId].PED)
        if(oScoreboardData[dwId].HasKey("MPOS"))
        return oScoreboardData[dwId].MPOS
    }
    return ""
}
HexToDecOne(Hex)
{
    if (InStr(Hex, "0x") != 1)
    Hex := "0x" Hex
    return, Hex + 0
}
HexToDecTwo(hex)
{
    VarSetCapacity(dec, 66, 0)
    , val := DllCall("msvcrt.dll\_wcstoui64", "Str", hex, "UInt", 0, "UInt", 16, "CDECL Int64")
    , DllCall("msvcrt.dll\_i64tow", "Int64", val, "Str", dec, "UInt", 10, "CDECL")
    return dec
}
hex2rgb(CR)
{
    NumPut((InStr(CR, "#") ? "0x" SubStr(CR, 2) : "0x") SubStr(CR, -5), (V := "000000"))
    return NumGet(V, 2, "UChar") "," NumGet(V, 1, "UChar") "," NumGet(V, 0, "UChar")
}
rgb2hex(R, G, B, H := 1)
{
    static U := A_IsUnicode ? "_wcstoui64" : "_strtoui64"
    static V := A_IsUnicode ? "_i64tow"    : "_i64toa"
    rgb := ((R << 16) + (G << 8) + B)
    H := ((H = 1) ? "#" : ((H = 2) ? "0x" : ""))
    VarSetCapacity(S, 66, 0)
    value := DllCall("msvcrt.dll\" U, "Str", rgb , "UInt", 0, "UInt", 10, "CDECL Int64")
    DllCall("msvcrt.dll\" V, "Int64", value, "Str", S, "UInt", 16, "CDECL")
    return H S
}
GetCoordsSamp(ByRef ResX, ByRef ResY)
{
    MouseGetPos, PosX, PosY
    PosXProc := (PosX*100)/A_ScreenWidth
    PosYProc := (PosY*100)/A_ScreenHeight
    ResX := PosXProc*8
    ResY := PosYProc*6
}
getVehicleIdServer(address=0x13C298, datatype="int", length=4, offset=0)
{
    if (isPlayerDriver() != "-1" or isPlayerInAnyVehicle() != "0")
    {
        Process, Exist, gta_sa.exe
        PID_GTA := ErrorLevel
        VarSetCapacity(me32, 548, 0)
        NumPut(548, me32)
        snapMod := DllCall("CreateToolhelp32Snapshot", "Uint", 0x00000008, "Uint", PID_GTA)
        If (snapMod = -1)
        Return 0
        If (DllCall("Module32First", "Uint", snapMod, "Uint", &me32))
        {
            Loop
            {
                If (!DllCall("lstrcmpi", "Str", "samp.dll", "UInt", &me32 + 32)) {
                    DllCall("CloseHandle", "UInt", snapMod)
                    key:= NumGet(&me32 + 20)
                    WinGet, PID_SAMP, PID, GTA:SA:MP
                    hwnd_samp := DllCall("OpenProcess","Uint",0x1F0FFF,"int",0,"int", PID_SAMP)
                    VarSetCapacity(readvalue,length, 0)
                    DllCall("ReadProcessMemory","Uint",hwnd_samp,"Uint",key+address+offset,"Str",readvalue,"Uint",length,"Uint *",0)
                    finalvalue := NumGet(readvalue,0,datatype)
                    DllCall("CloseHandle", "int", hwnd_samp)
                    return finalvalue
                }
            }
            Until !DllCall("Module32Next", "Uint", snapMod, "UInt", &me32)
        }
        DllCall("CloseHandle", "Uint", snapMod)
    }
    else
    Return 0
}
setPlayerName(playerid, newnick) {
    if(!checkHandles() || !strlen(newnick))
    return 0
    dwAddress := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET)
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    dwAddress := readDWORD(hGTA, dwAddress + SAMP_PPOOLS_OFFSET)
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    dwPlayers := readDWORD(hGTA, dwAddress + SAMP_PPOOL_PLAYER_OFFSET)
    if(ErrorLevel || dwPlayers==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    dwRemoteplayer := readDWORD(hGTA, dwPlayers+SAMP_PREMOTEPLAYER_OFFSET+playerid*4)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    if(dwRemoteplayer==0)
    return 0
    dwTemp := readMem(hGTA, dwRemoteplayer + SAMP_ISTRLENNAME___OFFSET, 4, "Int")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    sUsername := ""
    if(dwTemp <= 0xf)
    {
        sUsername := readString(hGTA, dwRemoteplayer+SAMP_SZPLAYERNAME_OFFSET, 16)
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        writeString(hGTA, dwRemoteplayer+SAMP_SZPLAYERNAME_OFFSET, newnick)
    }
    else {
        dwAddress := readDWORD(hGTA, dwRemoteplayer + SAMP_PSZPLAYERNAME_OFFSET)
        if(ErrorLevel || dwAddress==0) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        sUsername := readString(hGTA, dwAddress, 25)
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        writeString(hGTA, dwAddress, newnick)
    }
    ErrorLevel := ERROR_OK
    return 1
}
initZonesAndCities() {
    AddCity("Лас-Вентурас", 685.0, 476.093, -500.0, 3000.0, 3000.0, 500.0)
    AddCity("Сан-Фиерро", -3000.0, -742.306, -500.0, -1270.53, 1530.24, 500.0)
    AddCity("Сан-Фиерро", -1270.53, -402.481, -500.0, -1038.45, 832.495, 500.0)
    AddCity("Сан-Фиерро", -1038.45, -145.539, -500.0, -897.546, 376.632, 500.0)
    AddCity("Лос-Сантос", 480.0, -3000.0, -500.0, 3000.0, -850.0, 500.0)
    AddCity("Лос-Сантос", 80.0, -2101.61, -500.0, 1075.0, -1239.61, 500.0)
    AddCity("Тьерра-Робада", -1213.91, 596.349, -242.99, -480.539, 1659.68, 900.0)
    AddCity("Ред-Коунти", -1213.91, -768.027, -242.99, 2997.06, 596.349, 900.0)
    AddCity("Флинт-Коунти", -1213.91, -2892.97, -242.99, 44.6147, -768.027, 900.0)
    AddCity("Уэтстоун", -2997.47, -2892.97, -242.99, -1213.91, -1115.58, 900.0)
    AddZone("Avispa Country Club", -2667.810, -302.135, -28.831, -2646.400, -262.320, 71.169)
    AddZone("Easter Bay Airport", -1315.420, -405.388, 15.406, -1264.400, -209.543, 25.406)
    AddZone("Avispa Country Club", -2550.040, -355.493, 0.000, -2470.040, -318.493, 39.700)
    AddZone("Easter Bay Airport", -1490.330, -209.543, 15.406, -1264.400, -148.388, 25.406)
    AddZone("Garcia", -2395.140, -222.589, -5.3, -2354.090, -204.792, 200.000)
    AddZone("Shady Cabin", -1632.830, -2263.440, -3.0, -1601.330, -2231.790, 200.000)
    AddZone("East Los Santos", 2381.680, -1494.030, -89.084, 2421.030, -1454.350, 110.916)
    AddZone("LVA Freight Depot", 1236.630, 1163.410, -89.084, 1277.050, 1203.280, 110.916)
    AddZone("Blackfield Intersection", 1277.050, 1044.690, -89.084, 1315.350, 1087.630, 110.916)
    AddZone("Avispa Country Club", -2470.040, -355.493, 0.000, -2270.040, -318.493, 46.100)
    AddZone("Temple", 1252.330, -926.999, -89.084, 1357.000, -910.170, 110.916)
    AddZone("Unity Station", 1692.620, -1971.800, -20.492, 1812.620, -1932.800, 79.508)
    AddZone("LVA Freight Depot", 1315.350, 1044.690, -89.084, 1375.600, 1087.630, 110.916)
    AddZone("Los Flores", 2581.730, -1454.350, -89.084, 2632.830, -1393.420, 110.916)
    AddZone("Starfish Casino", 2437.390, 1858.100, -39.084, 2495.090, 1970.850, 60.916)
    AddZone("Easter Bay Chemicals", -1132.820, -787.391, 0.000, -956.476, -768.027, 200.000)
    AddZone("Downtown Los Santos", 1370.850, -1170.870, -89.084, 1463.900, -1130.850, 110.916)
    AddZone("Esplanade East", -1620.300, 1176.520, -4.5, -1580.010, 1274.260, 200.000)
    AddZone("Market Station", 787.461, -1410.930, -34.126, 866.009, -1310.210, 65.874)
    AddZone("Linden Station", 2811.250, 1229.590, -39.594, 2861.250, 1407.590, 60.406)
    AddZone("Montgomery Intersection", 1582.440, 347.457, 0.000, 1664.620, 401.750, 200.000)
    AddZone("Frederick Bridge", 2759.250, 296.501, 0.000, 2774.250, 594.757, 200.000)
    AddZone("Yellow Bell Station", 1377.480, 2600.430, -21.926, 1492.450, 2687.360, 78.074)
    AddZone("Downtown Los Santos", 1507.510, -1385.210, 110.916, 1582.550, -1325.310, 335.916)
    AddZone("Jefferson", 2185.330, -1210.740, -89.084, 2281.450, -1154.590, 110.916)
    AddZone("Mulholland", 1318.130, -910.170, -89.084, 1357.000, -768.027, 110.916)
    AddZone("Avispa Country Club", -2361.510, -417.199, 0.000, -2270.040, -355.493, 200.000)
    AddZone("Jefferson", 1996.910, -1449.670, -89.084, 2056.860, -1350.720, 110.916)
    AddZone("Julius Thruway West", 1236.630, 2142.860, -89.084, 1297.470, 2243.230, 110.916)
    AddZone("Jefferson", 2124.660, -1494.030, -89.084, 2266.210, -1449.670, 110.916)
    AddZone("Julius Thruway North", 1848.400, 2478.490, -89.084, 1938.800, 2553.490, 110.916)
    AddZone("Rodeo", 422.680, -1570.200, -89.084, 466.223, -1406.050, 110.916)
    AddZone("Cranberry Station", -2007.830, 56.306, 0.000, -1922.000, 224.782, 100.000)
    AddZone("Downtown Los Santos", 1391.050, -1026.330, -89.084, 1463.900, -926.999, 110.916)
    AddZone("Redsands West", 1704.590, 2243.230, -89.084, 1777.390, 2342.830, 110.916)
    AddZone("Little Mexico", 1758.900, -1722.260, -89.084, 1812.620, -1577.590, 110.916)
    AddZone("Blackfield Intersection", 1375.600, 823.228, -89.084, 1457.390, 919.447, 110.916)
    AddZone("Los Santos International", 1974.630, -2394.330, -39.084, 2089.000, -2256.590, 60.916)
    AddZone("Beacon Hill", -399.633, -1075.520, -1.489, -319.033, -977.516, 198.511)
    AddZone("Rodeo", 334.503, -1501.950, -89.084, 422.680, -1406.050, 110.916)
    AddZone("Richman", 225.165, -1369.620, -89.084, 334.503, -1292.070, 110.916)
    AddZone("Downtown Los Santos", 1724.760, -1250.900, -89.084, 1812.620, -1150.870, 110.916)
    AddZone("The Strip", 2027.400, 1703.230, -89.084, 2137.400, 1783.230, 110.916)
    AddZone("Downtown Los Santos", 1378.330, -1130.850, -89.084, 1463.900, -1026.330, 110.916)
    AddZone("Blackfield Intersection", 1197.390, 1044.690, -89.084, 1277.050, 1163.390, 110.916)
    AddZone("Conference Center", 1073.220, -1842.270, -89.084, 1323.900, -1804.210, 110.916)
    AddZone("Montgomery", 1451.400, 347.457, -6.1, 1582.440, 420.802, 200.000)
    AddZone("Foster Valley", -2270.040, -430.276, -1.2, -2178.690, -324.114, 200.000)
    AddZone("Blackfield Chapel", 1325.600, 596.349, -89.084, 1375.600, 795.010, 110.916)
    AddZone("Los Santos International", 2051.630, -2597.260, -39.084, 2152.450, -2394.330, 60.916)
    AddZone("Mulholland", 1096.470, -910.170, -89.084, 1169.130, -768.027, 110.916)
    AddZone("Yellow Bell Gol Course", 1457.460, 2723.230, -89.084, 1534.560, 2863.230, 110.916)
    AddZone("The Strip", 2027.400, 1783.230, -89.084, 2162.390, 1863.230, 110.916)
    AddZone("Jefferson", 2056.860, -1210.740, -89.084, 2185.330, -1126.320, 110.916)
    AddZone("Mulholland", 952.604, -937.184, -89.084, 1096.470, -860.619, 110.916)
    AddZone("Aldea Malvada", -1372.140, 2498.520, 0.000, -1277.590, 2615.350, 200.000)
    AddZone("Las Colinas", 2126.860, -1126.320, -89.084, 2185.330, -934.489, 110.916)
    AddZone("Las Colinas", 1994.330, -1100.820, -89.084, 2056.860, -920.815, 110.916)
    AddZone("Richman", 647.557, -954.662, -89.084, 768.694, -860.619, 110.916)
    AddZone("LVA Freight Depot", 1277.050, 1087.630, -89.084, 1375.600, 1203.280, 110.916)
    AddZone("Julius Thruway North", 1377.390, 2433.230, -89.084, 1534.560, 2507.230, 110.916)
    AddZone("Willowfield", 2201.820, -2095.000, -89.084, 2324.000, -1989.900, 110.916)
    AddZone("Julius Thruway North", 1704.590, 2342.830, -89.084, 1848.400, 2433.230, 110.916)
    AddZone("Temple", 1252.330, -1130.850, -89.084, 1378.330, -1026.330, 110.916)
    AddZone("Little Mexico", 1701.900, -1842.270, -89.084, 1812.620, -1722.260, 110.916)
    AddZone("Queens", -2411.220, 373.539, 0.000, -2253.540, 458.411, 200.000)
    AddZone("Las Venturas Airport", 1515.810, 1586.400, -12.500, 1729.950, 1714.560, 87.500)
    AddZone("Richman", 225.165, -1292.070, -89.084, 466.223, -1235.070, 110.916)
    AddZone("Temple", 1252.330, -1026.330, -89.084, 1391.050, -926.999, 110.916)
    AddZone("East Los Santos", 2266.260, -1494.030, -89.084, 2381.680, -1372.040, 110.916)
    AddZone("Julius Thruway East", 2623.180, 943.235, -89.084, 2749.900, 1055.960, 110.916)
    AddZone("Willowfield", 2541.700, -1941.400, -89.084, 2703.580, -1852.870, 110.916)
    AddZone("Las Colinas", 2056.860, -1126.320, -89.084, 2126.860, -920.815, 110.916)
    AddZone("Julius Thruway East", 2625.160, 2202.760, -89.084, 2685.160, 2442.550, 110.916)
    AddZone("Rodeo", 225.165, -1501.950, -89.084, 334.503, -1369.620, 110.916)
    AddZone("Las Brujas", -365.167, 2123.010, -3.0, -208.570, 2217.680, 200.000)
    AddZone("Julius Thruway East", 2536.430, 2442.550, -89.084, 2685.160, 2542.550, 110.916)
    AddZone("Rodeo", 334.503, -1406.050, -89.084, 466.223, -1292.070, 110.916)
    AddZone("Vinewood", 647.557, -1227.280, -89.084, 787.461, -1118.280, 110.916)
    AddZone("Rodeo", 422.680, -1684.650, -89.084, 558.099, -1570.200, 110.916)
    AddZone("Julius Thruway North", 2498.210, 2542.550, -89.084, 2685.160, 2626.550, 110.916)
    AddZone("Downtown Los Santos", 1724.760, -1430.870, -89.084, 1812.620, -1250.900, 110.916)
    AddZone("Rodeo", 225.165, -1684.650, -89.084, 312.803, -1501.950, 110.916)
    AddZone("Jefferson", 2056.860, -1449.670, -89.084, 2266.210, -1372.040, 110.916)
    AddZone("Hampton Barns", 603.035, 264.312, 0.000, 761.994, 366.572, 200.000)
    AddZone("Temple", 1096.470, -1130.840, -89.084, 1252.330, -1026.330, 110.916)
    AddZone("Kincaid Bridge", -1087.930, 855.370, -89.084, -961.950, 986.281, 110.916)
    AddZone("Verona Beach", 1046.150, -1722.260, -89.084, 1161.520, -1577.590, 110.916)
    AddZone("Commerce", 1323.900, -1722.260, -89.084, 1440.900, -1577.590, 110.916)
    AddZone("Mulholland", 1357.000, -926.999, -89.084, 1463.900, -768.027, 110.916)
    AddZone("Rodeo", 466.223, -1570.200, -89.084, 558.099, -1385.070, 110.916)
    AddZone("Mulholland", 911.802, -860.619, -89.084, 1096.470, -768.027, 110.916)
    AddZone("Mulholland", 768.694, -954.662, -89.084, 952.604, -860.619, 110.916)
    AddZone("Julius Thruway South", 2377.390, 788.894, -89.084, 2537.390, 897.901, 110.916)
    AddZone("Idlewood", 1812.620, -1852.870, -89.084, 1971.660, -1742.310, 110.916)
    AddZone("Ocean Docks", 2089.000, -2394.330, -89.084, 2201.820, -2235.840, 110.916)
    AddZone("Commerce", 1370.850, -1577.590, -89.084, 1463.900, -1384.950, 110.916)
    AddZone("Julius Thruway North", 2121.400, 2508.230, -89.084, 2237.400, 2663.170, 110.916)
    AddZone("Temple", 1096.470, -1026.330, -89.084, 1252.330, -910.170, 110.916)
    AddZone("Glen Park", 1812.620, -1449.670, -89.084, 1996.910, -1350.720, 110.916)
    AddZone("Easter Bay Airport", -1242.980, -50.096, 0.000, -1213.910, 578.396, 200.000)
    AddZone("Martin Bridge", -222.179, 293.324, 0.000, -122.126, 476.465, 200.000)
    AddZone("The Strip", 2106.700, 1863.230, -89.084, 2162.390, 2202.760, 110.916)
    AddZone("Willowfield", 2541.700, -2059.230, -89.084, 2703.580, -1941.400, 110.916)
    AddZone("Marina", 807.922, -1577.590, -89.084, 926.922, -1416.250, 110.916)
    AddZone("Las Venturas Airport", 1457.370, 1143.210, -89.084, 1777.400, 1203.280, 110.916)
    AddZone("Idlewood", 1812.620, -1742.310, -89.084, 1951.660, -1602.310, 110.916)
    AddZone("Esplanade East", -1580.010, 1025.980, -6.1, -1499.890, 1274.260, 200.000)
    AddZone("Downtown Los Santos", 1370.850, -1384.950, -89.084, 1463.900, -1170.870, 110.916)
    AddZone("The Mako Span", 1664.620, 401.750, 0.000, 1785.140, 567.203, 200.000)
    AddZone("Rodeo", 312.803, -1684.650, -89.084, 422.680, -1501.950, 110.916)
    AddZone("Pershing Square", 1440.900, -1722.260, -89.084, 1583.500, -1577.590, 110.916)
    AddZone("Mulholland", 687.802, -860.619, -89.084, 911.802, -768.027, 110.916)
    AddZone("Gant Bridge", -2741.070, 1490.470, -6.1, -2616.400, 1659.680, 200.000)
    AddZone("Las Colinas", 2185.330, -1154.590, -89.084, 2281.450, -934.489, 110.916)
    AddZone("Mulholland", 1169.130, -910.170, -89.084, 1318.130, -768.027, 110.916)
    AddZone("Julius Thruway North", 1938.800, 2508.230, -89.084, 2121.400, 2624.230, 110.916)
    AddZone("Commerce", 1667.960, -1577.590, -89.084, 1812.620, -1430.870, 110.916)
    AddZone("Rodeo", 72.648, -1544.170, -89.084, 225.165, -1404.970, 110.916)
    AddZone("Roca Escalante", 2536.430, 2202.760, -89.084, 2625.160, 2442.550, 110.916)
    AddZone("Rodeo", 72.648, -1684.650, -89.084, 225.165, -1544.170, 110.916)
    AddZone("Market", 952.663, -1310.210, -89.084, 1072.660, -1130.850, 110.916)
    AddZone("Las Colinas", 2632.740, -1135.040, -89.084, 2747.740, -945.035, 110.916)
    AddZone("Mulholland", 861.085, -674.885, -89.084, 1156.550, -600.896, 110.916)
    AddZone("King's", -2253.540, 373.539, -9.1, -1993.280, 458.411, 200.000)
    AddZone("Redsands East", 1848.400, 2342.830, -89.084, 2011.940, 2478.490, 110.916)
    AddZone("Downtown", -1580.010, 744.267, -6.1, -1499.890, 1025.980, 200.000)
    AddZone("Conference Center", 1046.150, -1804.210, -89.084, 1323.900, -1722.260, 110.916)
    AddZone("Richman", 647.557, -1118.280, -89.084, 787.461, -954.662, 110.916)
    AddZone("Ocean Flats", -2994.490, 277.411, -9.1, -2867.850, 458.411, 200.000)
    AddZone("Greenglass College", 964.391, 930.890, -89.084, 1166.530, 1044.690, 110.916)
    AddZone("Glen Park", 1812.620, -1100.820, -89.084, 1994.330, -973.380, 110.916)
    AddZone("LVA Freight Depot", 1375.600, 919.447, -89.084, 1457.370, 1203.280, 110.916)
    AddZone("Regular Tom", -405.770, 1712.860, -3.0, -276.719, 1892.750, 200.000)
    AddZone("Verona Beach", 1161.520, -1722.260, -89.084, 1323.900, -1577.590, 110.916)
    AddZone("East Los Santos", 2281.450, -1372.040, -89.084, 2381.680, -1135.040, 110.916)
    AddZone("Caligula's Palace", 2137.400, 1703.230, -89.084, 2437.390, 1783.230, 110.916)
    AddZone("Idlewood", 1951.660, -1742.310, -89.084, 2124.660, -1602.310, 110.916)
    AddZone("Pilgrim", 2624.400, 1383.230, -89.084, 2685.160, 1783.230, 110.916)
    AddZone("Idlewood", 2124.660, -1742.310, -89.084, 2222.560, -1494.030, 110.916)
    AddZone("Queens", -2533.040, 458.411, 0.000, -2329.310, 578.396, 200.000)
    AddZone("Downtown", -1871.720, 1176.420, -4.5, -1620.300, 1274.260, 200.000)
    AddZone("Commerce", 1583.500, -1722.260, -89.084, 1758.900, -1577.590, 110.916)
    AddZone("East Los Santos", 2381.680, -1454.350, -89.084, 2462.130, -1135.040, 110.916)
    AddZone("Marina", 647.712, -1577.590, -89.084, 807.922, -1416.250, 110.916)
    AddZone("Richman", 72.648, -1404.970, -89.084, 225.165, -1235.070, 110.916)
    AddZone("Vinewood", 647.712, -1416.250, -89.084, 787.461, -1227.280, 110.916)
    AddZone("East Los Santos", 2222.560, -1628.530, -89.084, 2421.030, -1494.030, 110.916)
    AddZone("Rodeo", 558.099, -1684.650, -89.084, 647.522, -1384.930, 110.916)
    AddZone("Easter Tunnel", -1709.710, -833.034, -1.5, -1446.010, -730.118, 200.000)
    AddZone("Rodeo", 466.223, -1385.070, -89.084, 647.522, -1235.070, 110.916)
    AddZone("Redsands East", 1817.390, 2202.760, -89.084, 2011.940, 2342.830, 110.916)
    AddZone("The Clown's Pocket", 2162.390, 1783.230, -89.084, 2437.390, 1883.230, 110.916)
    AddZone("Idlewood", 1971.660, -1852.870, -89.084, 2222.560, -1742.310, 110.916)
    AddZone("Montgomery Intersection", 1546.650, 208.164, 0.000, 1745.830, 347.457, 200.000)
    AddZone("Willowfield", 2089.000, -2235.840, -89.084, 2201.820, -1989.900, 110.916)
    AddZone("Temple", 952.663, -1130.840, -89.084, 1096.470, -937.184, 110.916)
    AddZone("Prickle Pine", 1848.400, 2553.490, -89.084, 1938.800, 2863.230, 110.916)
    AddZone("Los Santos International", 1400.970, -2669.260, -39.084, 2189.820, -2597.260, 60.916)
    AddZone("Garver Bridge", -1213.910, 950.022, -89.084, -1087.930, 1178.930, 110.916)
    AddZone("Garver Bridge", -1339.890, 828.129, -89.084, -1213.910, 1057.040, 110.916)
    AddZone("Kincaid Bridge", -1339.890, 599.218, -89.084, -1213.910, 828.129, 110.916)
    AddZone("Kincaid Bridge", -1213.910, 721.111, -89.084, -1087.930, 950.022, 110.916)
    AddZone("Verona Beach", 930.221, -2006.780, -89.084, 1073.220, -1804.210, 110.916)
    AddZone("Verdant Bluffs", 1073.220, -2006.780, -89.084, 1249.620, -1842.270, 110.916)
    AddZone("Vinewood", 787.461, -1130.840, -89.084, 952.604, -954.662, 110.916)
    AddZone("Vinewood", 787.461, -1310.210, -89.084, 952.663, -1130.840, 110.916)
    AddZone("Commerce", 1463.900, -1577.590, -89.084, 1667.960, -1430.870, 110.916)
    AddZone("Market", 787.461, -1416.250, -89.084, 1072.660, -1310.210, 110.916)
    AddZone("Rockshore West", 2377.390, 596.349, -89.084, 2537.390, 788.894, 110.916)
    AddZone("Julius Thruway North", 2237.400, 2542.550, -89.084, 2498.210, 2663.170, 110.916)
    AddZone("East Beach", 2632.830, -1668.130, -89.084, 2747.740, -1393.420, 110.916)
    AddZone("Fallow Bridge", 434.341, 366.572, 0.000, 603.035, 555.680, 200.000)
    AddZone("Willowfield", 2089.000, -1989.900, -89.084, 2324.000, -1852.870, 110.916)
    AddZone("Chinatown", -2274.170, 578.396, -7.6, -2078.670, 744.170, 200.000)
    AddZone("El Castillo del Diablo", -208.570, 2337.180, 0.000, 8.430, 2487.180, 200.000)
    AddZone("Ocean Docks", 2324.000, -2145.100, -89.084, 2703.580, -2059.230, 110.916)
    AddZone("Easter Bay Chemicals", -1132.820, -768.027, 0.000, -956.476, -578.118, 200.000)
    AddZone("The Visage", 1817.390, 1703.230, -89.084, 2027.400, 1863.230, 110.916)
    AddZone("Ocean Flats", -2994.490, -430.276, -1.2, -2831.890, -222.589, 200.000)
    AddZone("Richman", 321.356, -860.619, -89.084, 687.802, -768.027, 110.916)
    AddZone("Green Palms", 176.581, 1305.450, -3.0, 338.658, 1520.720, 200.000)
    AddZone("Richman", 321.356, -768.027, -89.084, 700.794, -674.885, 110.916)
    AddZone("Starfish Casino", 2162.390, 1883.230, -89.084, 2437.390, 2012.180, 110.916)
    AddZone("East Beach", 2747.740, -1668.130, -89.084, 2959.350, -1498.620, 110.916)
    AddZone("Jefferson", 2056.860, -1372.040, -89.084, 2281.450, -1210.740, 110.916)
    AddZone("Downtown Los Santos", 1463.900, -1290.870, -89.084, 1724.760, -1150.870, 110.916)
    AddZone("Downtown Los Santos", 1463.900, -1430.870, -89.084, 1724.760, -1290.870, 110.916)
    AddZone("Garver Bridge", -1499.890, 696.442, -179.615, -1339.890, 925.353, 20.385)
    AddZone("Julius Thruway South", 1457.390, 823.228, -89.084, 2377.390, 863.229, 110.916)
    AddZone("East Los Santos", 2421.030, -1628.530, -89.084, 2632.830, -1454.350, 110.916)
    AddZone("Greenglass College", 964.391, 1044.690, -89.084, 1197.390, 1203.220, 110.916)
    AddZone("Las Colinas", 2747.740, -1120.040, -89.084, 2959.350, -945.035, 110.916)
    AddZone("Mulholland", 737.573, -768.027, -89.084, 1142.290, -674.885, 110.916)
    AddZone("Ocean Docks", 2201.820, -2730.880, -89.084, 2324.000, -2418.330, 110.916)
    AddZone("East Los Santos", 2462.130, -1454.350, -89.084, 2581.730, -1135.040, 110.916)
    AddZone("Ganton", 2222.560, -1722.330, -89.084, 2632.830, -1628.530, 110.916)
    AddZone("Avispa Country Club", -2831.890, -430.276, -6.1, -2646.400, -222.589, 200.000)
    AddZone("Willowfield", 1970.620, -2179.250, -89.084, 2089.000, -1852.870, 110.916)
    AddZone("Esplanade North", -1982.320, 1274.260, -4.5, -1524.240, 1358.900, 200.000)
    AddZone("The High Roller", 1817.390, 1283.230, -89.084, 2027.390, 1469.230, 110.916)
    AddZone("Ocean Docks", 2201.820, -2418.330, -89.084, 2324.000, -2095.000, 110.916)
    AddZone("Last Dime Motel", 1823.080, 596.349, -89.084, 1997.220, 823.228, 110.916)
    AddZone("Bayside Marina", -2353.170, 2275.790, 0.000, -2153.170, 2475.790, 200.000)
    AddZone("King's", -2329.310, 458.411, -7.6, -1993.280, 578.396, 200.000)
    AddZone("El Corona", 1692.620, -2179.250, -89.084, 1812.620, -1842.270, 110.916)
    AddZone("Blackfield Chapel", 1375.600, 596.349, -89.084, 1558.090, 823.228, 110.916)
    AddZone("The Pink Swan", 1817.390, 1083.230, -89.084, 2027.390, 1283.230, 110.916)
    AddZone("Julius Thruway West", 1197.390, 1163.390, -89.084, 1236.630, 2243.230, 110.916)
    AddZone("Los Flores", 2581.730, -1393.420, -89.084, 2747.740, -1135.040, 110.916)
    AddZone("The Visage", 1817.390, 1863.230, -89.084, 2106.700, 2011.830, 110.916)
    AddZone("Prickle Pine", 1938.800, 2624.230, -89.084, 2121.400, 2861.550, 110.916)
    AddZone("Verona Beach", 851.449, -1804.210, -89.084, 1046.150, -1577.590, 110.916)
    AddZone("Robada Intersection", -1119.010, 1178.930, -89.084, -862.025, 1351.450, 110.916)
    AddZone("Linden Side", 2749.900, 943.235, -89.084, 2923.390, 1198.990, 110.916)
    AddZone("Ocean Docks", 2703.580, -2302.330, -89.084, 2959.350, -2126.900, 110.916)
    AddZone("Willowfield", 2324.000, -2059.230, -89.084, 2541.700, -1852.870, 110.916)
    AddZone("King's", -2411.220, 265.243, -9.1, -1993.280, 373.539, 200.000)
    AddZone("Commerce", 1323.900, -1842.270, -89.084, 1701.900, -1722.260, 110.916)
    AddZone("Mulholland", 1269.130, -768.027, -89.084, 1414.070, -452.425, 110.916)
    AddZone("Marina", 647.712, -1804.210, -89.084, 851.449, -1577.590, 110.916)
    AddZone("Battery Point", -2741.070, 1268.410, -4.5, -2533.040, 1490.470, 200.000)
    AddZone("The Four Dragons Casino", 1817.390, 863.232, -89.084, 2027.390, 1083.230, 110.916)
    AddZone("Blackfield", 964.391, 1203.220, -89.084, 1197.390, 1403.220, 110.916)
    AddZone("Julius Thruway North", 1534.560, 2433.230, -89.084, 1848.400, 2583.230, 110.916)
    AddZone("Yellow Bell Gol Course", 1117.400, 2723.230, -89.084, 1457.460, 2863.230, 110.916)
    AddZone("Idlewood", 1812.620, -1602.310, -89.084, 2124.660, -1449.670, 110.916)
    AddZone("Redsands West", 1297.470, 2142.860, -89.084, 1777.390, 2243.230, 110.916)
    AddZone("Doherty", -2270.040, -324.114, -1.2, -1794.920, -222.589, 200.000)
    AddZone("Hilltop Farm", 967.383, -450.390, -3.0, 1176.780, -217.900, 200.000)
    AddZone("Las Barrancas", -926.130, 1398.730, -3.0, -719.234, 1634.690, 200.000)
    AddZone("Pirates in Men's Pants", 1817.390, 1469.230, -89.084, 2027.400, 1703.230, 110.916)
    AddZone("City Hall", -2867.850, 277.411, -9.1, -2593.440, 458.411, 200.000)
    AddZone("Avispa Country Club", -2646.400, -355.493, 0.000, -2270.040, -222.589, 200.000)
    AddZone("The Strip", 2027.400, 863.229, -89.084, 2087.390, 1703.230, 110.916)
    AddZone("Hashbury", -2593.440, -222.589, -1.0, -2411.220, 54.722, 200.000)
    AddZone("Los Santos International", 1852.000, -2394.330, -89.084, 2089.000, -2179.250, 110.916)
    AddZone("Whitewood Estates", 1098.310, 1726.220, -89.084, 1197.390, 2243.230, 110.916)
    AddZone("Sherman Reservoir", -789.737, 1659.680, -89.084, -599.505, 1929.410, 110.916)
    AddZone("El Corona", 1812.620, -2179.250, -89.084, 1970.620, -1852.870, 110.916)
    AddZone("Downtown", -1700.010, 744.267, -6.1, -1580.010, 1176.520, 200.000)
    AddZone("Foster Valley", -2178.690, -1250.970, 0.000, -1794.920, -1115.580, 200.000)
    AddZone("Las Payasadas", -354.332, 2580.360, 2.0, -133.625, 2816.820, 200.000)
    AddZone("Valle Ocultado", -936.668, 2611.440, 2.0, -715.961, 2847.900, 200.000)
    AddZone("Blackfield Intersection", 1166.530, 795.010, -89.084, 1375.600, 1044.690, 110.916)
    AddZone("Ganton", 2222.560, -1852.870, -89.084, 2632.830, -1722.330, 110.916)
    AddZone("Easter Bay Airport", -1213.910, -730.118, 0.000, -1132.820, -50.096, 200.000)
    AddZone("Redsands East", 1817.390, 2011.830, -89.084, 2106.700, 2202.760, 110.916)
    AddZone("Esplanade East", -1499.890, 578.396, -79.615, -1339.890, 1274.260, 20.385)
    AddZone("Caligula's Palace", 2087.390, 1543.230, -89.084, 2437.390, 1703.230, 110.916)
    AddZone("Royal Casino", 2087.390, 1383.230, -89.084, 2437.390, 1543.230, 110.916)
    AddZone("Richman", 72.648, -1235.070, -89.084, 321.356, -1008.150, 110.916)
    AddZone("Starfish Casino", 2437.390, 1783.230, -89.084, 2685.160, 2012.180, 110.916)
    AddZone("Mulholland", 1281.130, -452.425, -89.084, 1641.130, -290.913, 110.916)
    AddZone("Downtown", -1982.320, 744.170, -6.1, -1871.720, 1274.260, 200.000)
    AddZone("Hankypanky Point", 2576.920, 62.158, 0.000, 2759.250, 385.503, 200.000)
    AddZone("K.A.C.C. Military Fuels", 2498.210, 2626.550, -89.084, 2749.900, 2861.550, 110.916)
    AddZone("Harry Gold Parkway", 1777.390, 863.232, -89.084, 1817.390, 2342.830, 110.916)
    AddZone("Bayside Tunnel", -2290.190, 2548.290, -89.084, -1950.190, 2723.290, 110.916)
    AddZone("Ocean Docks", 2324.000, -2302.330, -89.084, 2703.580, -2145.100, 110.916)
    AddZone("Richman", 321.356, -1044.070, -89.084, 647.557, -860.619, 110.916)
    AddZone("Randolph Industrial Estate", 1558.090, 596.349, -89.084, 1823.080, 823.235, 110.916)
    AddZone("East Beach", 2632.830, -1852.870, -89.084, 2959.350, -1668.130, 110.916)
    AddZone("Flint Water", -314.426, -753.874, -89.084, -106.339, -463.073, 110.916)
    AddZone("Blueberry", 19.607, -404.136, 3.8, 349.607, -220.137, 200.000)
    AddZone("Linden Station", 2749.900, 1198.990, -89.084, 2923.390, 1548.990, 110.916)
    AddZone("Glen Park", 1812.620, -1350.720, -89.084, 2056.860, -1100.820, 110.916)
    AddZone("Downtown", -1993.280, 265.243, -9.1, -1794.920, 578.396, 200.000)
    AddZone("Redsands West", 1377.390, 2243.230, -89.084, 1704.590, 2433.230, 110.916)
    AddZone("Richman", 321.356, -1235.070, -89.084, 647.522, -1044.070, 110.916)
    AddZone("Gant Bridge", -2741.450, 1659.680, -6.1, -2616.400, 2175.150, 200.000)
    AddZone("Lil' Probe Inn", -90.218, 1286.850, -3.0, 153.859, 1554.120, 200.000)
    AddZone("Flint Intersection", -187.700, -1596.760, -89.084, 17.063, -1276.600, 110.916)
    AddZone("Las Colinas", 2281.450, -1135.040, -89.084, 2632.740, -945.035, 110.916)
    AddZone("Sobell Rail Yards", 2749.900, 1548.990, -89.084, 2923.390, 1937.250, 110.916)
    AddZone("The Emerald Isle", 2011.940, 2202.760, -89.084, 2237.400, 2508.230, 110.916)
    AddZone("El Castillo del Diablo", -208.570, 2123.010, -7.6, 114.033, 2337.180, 200.000)
    AddZone("Santa Flora", -2741.070, 458.411, -7.6, -2533.040, 793.411, 200.000)
    AddZone("Playa del Seville", 2703.580, -2126.900, -89.084, 2959.350, -1852.870, 110.916)
    AddZone("Market", 926.922, -1577.590, -89.084, 1370.850, -1416.250, 110.916)
    AddZone("Queens", -2593.440, 54.722, 0.000, -2411.220, 458.411, 200.000)
    AddZone("Pilson Intersection", 1098.390, 2243.230, -89.084, 1377.390, 2507.230, 110.916)
    AddZone("Spinybed", 2121.400, 2663.170, -89.084, 2498.210, 2861.550, 110.916)
    AddZone("Pilgrim", 2437.390, 1383.230, -89.084, 2624.400, 1783.230, 110.916)
    AddZone("Blackfield", 964.391, 1403.220, -89.084, 1197.390, 1726.220, 110.916)
    AddZone("'The Big Ear'", -410.020, 1403.340, -3.0, -137.969, 1681.230, 200.000)
    AddZone("Dillimore", 580.794, -674.885, -9.5, 861.085, -404.790, 200.000)
    AddZone("El Quebrados", -1645.230, 2498.520, 0.000, -1372.140, 2777.850, 200.000)
    AddZone("Esplanade North", -2533.040, 1358.900, -4.5, -1996.660, 1501.210, 200.000)
    AddZone("Easter Bay Airport", -1499.890, -50.096, -1.0, -1242.980, 249.904, 200.000)
    AddZone("Fisher's Lagoon", 1916.990, -233.323, -100.000, 2131.720, 13.800, 200.000)
    AddZone("Mulholland", 1414.070, -768.027, -89.084, 1667.610, -452.425, 110.916)
    AddZone("East Beach", 2747.740, -1498.620, -89.084, 2959.350, -1120.040, 110.916)
    AddZone("San Andreas Sound", 2450.390, 385.503, -100.000, 2759.250, 562.349, 200.000)
    AddZone("Shady Creeks", -2030.120, -2174.890, -6.1, -1820.640, -1771.660, 200.000)
    AddZone("Market", 1072.660, -1416.250, -89.084, 1370.850, -1130.850, 110.916)
    AddZone("Rockshore West", 1997.220, 596.349, -89.084, 2377.390, 823.228, 110.916)
    AddZone("Prickle Pine", 1534.560, 2583.230, -89.084, 1848.400, 2863.230, 110.916)
    AddZone("Easter Basin", -1794.920, -50.096, -1.04, -1499.890, 249.904, 200.000)
    AddZone("Leafy Hollow", -1166.970, -1856.030, 0.000, -815.624, -1602.070, 200.000)
    AddZone("LVA Freight Depot", 1457.390, 863.229, -89.084, 1777.400, 1143.210, 110.916)
    AddZone("Prickle Pine", 1117.400, 2507.230, -89.084, 1534.560, 2723.230, 110.916)
    AddZone("Blueberry", 104.534, -220.137, 2.3, 349.607, 152.236, 200.000)
    AddZone("El Castillo del Diablo", -464.515, 2217.680, 0.000, -208.570, 2580.360, 200.000)
    AddZone("Downtown", -2078.670, 578.396, -7.6, -1499.890, 744.267, 200.000)
    AddZone("Rockshore East", 2537.390, 676.549, -89.084, 2902.350, 943.235, 110.916)
    AddZone("San Fierro Bay", -2616.400, 1501.210, -3.0, -1996.660, 1659.680, 200.000)
    AddZone("Paradiso", -2741.070, 793.411, -6.1, -2533.040, 1268.410, 200.000)
    AddZone("The Camel's Toe", 2087.390, 1203.230, -89.084, 2640.400, 1383.230, 110.916)
    AddZone("Old Venturas Strip", 2162.390, 2012.180, -89.084, 2685.160, 2202.760, 110.916)
    AddZone("Juniper Hill", -2533.040, 578.396, -7.6, -2274.170, 968.369, 200.000)
    AddZone("Juniper Hollow", -2533.040, 968.369, -6.1, -2274.170, 1358.900, 200.000)
    AddZone("Roca Escalante", 2237.400, 2202.760, -89.084, 2536.430, 2542.550, 110.916)
    AddZone("Julius Thruway East", 2685.160, 1055.960, -89.084, 2749.900, 2626.550, 110.916)
    AddZone("Verona Beach", 647.712, -2173.290, -89.084, 930.221, -1804.210, 110.916)
    AddZone("Foster Valley", -2178.690, -599.884, -1.2, -1794.920, -324.114, 200.000)
    AddZone("Arco del Oeste", -901.129, 2221.860, 0.000, -592.090, 2571.970, 200.000)
    AddZone("Fallen Tree", -792.254, -698.555, -5.3, -452.404, -380.043, 200.000)
    AddZone("The Farm", -1209.670, -1317.100, 114.981, -908.161, -787.391, 251.981)
    AddZone("The Sherman Dam", -968.772, 1929.410, -3.0, -481.126, 2155.260, 200.000)
    AddZone("Esplanade North", -1996.660, 1358.900, -4.5, -1524.240, 1592.510, 200.000)
    AddZone("Financial", -1871.720, 744.170, -6.1, -1701.300, 1176.420, 300.000)
    AddZone("Garcia", -2411.220, -222.589, -1.14, -2173.040, 265.243, 200.000)
    AddZone("Montgomery", 1119.510, 119.526, -3.0, 1451.400, 493.323, 200.000)
    AddZone("Creek", 2749.900, 1937.250, -89.084, 2921.620, 2669.790, 110.916)
    AddZone("Los Santos International", 1249.620, -2394.330, -89.084, 1852.000, -2179.250, 110.916)
    AddZone("Santa Maria Beach", 72.648, -2173.290, -89.084, 342.648, -1684.650, 110.916)
    AddZone("Mulholland Intersection", 1463.900, -1150.870, -89.084, 1812.620, -768.027, 110.916)
    AddZone("Angel Pine", -2324.940, -2584.290, -6.1, -1964.220, -2212.110, 200.000)
    AddZone("Verdant Meadows", 37.032, 2337.180, -3.0, 435.988, 2677.900, 200.000)
    AddZone("Octane Springs", 338.658, 1228.510, 0.000, 664.308, 1655.050, 200.000)
    AddZone("Come-A-Lot", 2087.390, 943.235, -89.084, 2623.180, 1203.230, 110.916)
    AddZone("Redsands West", 1236.630, 1883.110, -89.084, 1777.390, 2142.860, 110.916)
    AddZone("Santa Maria Beach", 342.648, -2173.290, -89.084, 647.712, -1684.650, 110.916)
    AddZone("Verdant Bluffs", 1249.620, -2179.250, -89.084, 1692.620, -1842.270, 110.916)
    AddZone("Las Venturas Airport", 1236.630, 1203.280, -89.084, 1457.370, 1883.110, 110.916)
    AddZone("Flint Range", -594.191, -1648.550, 0.000, -187.700, -1276.600, 200.000)
    AddZone("Verdant Bluffs", 930.221, -2488.420, -89.084, 1249.620, -2006.780, 110.916)
    AddZone("Palomino Creek", 2160.220, -149.004, 0.000, 2576.920, 228.322, 200.000)
    AddZone("Ocean Docks", 2373.770, -2697.090, -89.084, 2809.220, -2330.460, 110.916)
    AddZone("Easter Bay Airport", -1213.910, -50.096, -4.5, -947.980, 578.396, 200.000)
    AddZone("Whitewood Estates", 883.308, 1726.220, -89.084, 1098.310, 2507.230, 110.916)
    AddZone("Calton Heights", -2274.170, 744.170, -6.1, -1982.320, 1358.900, 200.000)
    AddZone("Easter Basin", -1794.920, 249.904, -9.1, -1242.980, 578.396, 200.000)
    AddZone("Los Santos Inlet", -321.744, -2224.430, -89.084, 44.615, -1724.430, 110.916)
    AddZone("Doherty", -2173.040, -222.589, -1.0, -1794.920, 265.243, 200.000)
    AddZone("Mount Chiliad", -2178.690, -2189.910, -47.917, -2030.120, -1771.660, 576.083)
    AddZone("Fort Carson", -376.233, 826.326, -3.0, 123.717, 1220.440, 200.000)
    AddZone("Foster Valley", -2178.690, -1115.580, 0.000, -1794.920, -599.884, 200.000)
    AddZone("Ocean Flats", -2994.490, -222.589, -1.0, -2593.440, 277.411, 200.000)
    AddZone("Fern Ridge", 508.189, -139.259, 0.000, 1306.660, 119.526, 200.000)
    AddZone("Bayside", -2741.070, 2175.150, 0.000, -2353.170, 2722.790, 200.000)
    AddZone("Las Venturas Airport", 1457.370, 1203.280, -89.084, 1777.390, 1883.110, 110.916)
    AddZone("Blueberry Acres", -319.676, -220.137, 0.000, 104.534, 293.324, 200.000)
    AddZone("Palisades", -2994.490, 458.411, -6.1, -2741.070, 1339.610, 200.000)
    AddZone("North Rock", 2285.370, -768.027, 0.000, 2770.590, -269.740, 200.000)
    AddZone("Hunter Quarry", 337.244, 710.840, -115.239, 860.554, 1031.710, 203.761)
    AddZone("Los Santos International", 1382.730, -2730.880, -89.084, 2201.820, -2394.330, 110.916)
    AddZone("Missionary Hill", -2994.490, -811.276, 0.000, -2178.690, -430.276, 200.000)
    AddZone("San Fierro Bay", -2616.400, 1659.680, -3.0, -1996.660, 2175.150, 200.000)
    AddZone("Restricted Area", -91.586, 1655.050, -50.000, 421.234, 2123.010, 250.000)
    AddZone("Mount Chiliad", -2997.470, -1115.580, -47.917, -2178.690, -971.913, 576.083)
    AddZone("Mount Chiliad", -2178.690, -1771.660, -47.917, -1936.120, -1250.970, 576.083)
    AddZone("Easter Bay Airport", -1794.920, -730.118, -3.0, -1213.910, -50.096, 200.000)
    AddZone("The Panopticon", -947.980, -304.320, -1.1, -319.676, 327.071, 200.000)
    AddZone("Shady Creeks", -1820.640, -2643.680, -8.0, -1226.780, -1771.660, 200.000)
    AddZone("Back o Beyond", -1166.970, -2641.190, 0.000, -321.744, -1856.030, 200.000)
    AddZone("Mount Chiliad", -2994.490, -2189.910, -47.917, -2178.690, -1115.580, 576.083)
    AddZone("Tierra Robada", -1213.910, 596.349, -242.990, -480.539, 1659.680, 900.000)
    AddZone("Flint County", -1213.910, -2892.970, -242.990, 44.615, -768.027, 900.000)
    AddZone("Whetstone", -2997.470, -2892.970, -242.990, -1213.910, -1115.580, 900.000)
    AddZone("Bone County", -480.539, 596.349, -242.990, 869.461, 2993.870, 900.000)
    AddZone("Tierra Robada", -2997.470, 1659.680, -242.990, -480.539, 2993.870, 900.000)
    AddZone("San Fierro", -2997.470, -1115.580, -242.990, -1213.910, 1659.680, 900.000)
    AddZone("Las Venturas", 869.461, 596.349, -242.990, 2997.060, 2993.870, 900.000)
    AddZone("Red County", -1213.910, -768.027, -242.990, 2997.060, 596.349, 900.000)
    AddZone("Los Santos", 44.615, -2892.970, -242.990, 2997.060, -768.027, 900.000)
    AddCube("A-1", -3000.000000,2750.000000,-500,-2750.000000,3000.000000,500)
    AddCube("A-2", -2750.000000,2750.000000,-500,-2500.000000,3000.000000,500)
    AddCube("A-3", -2500.000000,2750.000000,-500,-2250.000000,3000.000000,500)
    AddCube("A-4", -2250.000000,2750.000000,-500,-2000.000000,3000.000000,500)
    AddCube("A-5", -2000.000000,2750.000000,-500,-1750.000000,3000.000000,500)
    AddCube("A-6", -1750.000000,2750.000000,-500,-1500.000000,3000.000000,500)
    AddCube("A-7", -1500.000000,2750.000000,-500,-1250.000000,3000.000000,500)
    AddCube("A-8", -1250.000000,2750.000000,-500,-1000.000000,3000.000000,500)
    AddCube("A-9", -1000.000000,2750.000000,-500,-750.000000,3000.000000,500)
    AddCube("A-10", -750.000000,2750.000000,-500,-500.000000,3000.000000,500)
    AddCube("A-11", -500.000000,2750.000000,-500,-250.000000,3000.000000,500)
    AddCube("A-12", -250.000000,2750.000000,-500,0.000000,3000.000000,500)
    AddCube("A-13", 0.000000,2750.000000,-500,250.000000,3000.000000,500)
    AddCube("A-14", 250.000000,2750.000000,-500,500.000000,3000.000000,500)
    AddCube("A-15", 500.000000,2750.000000,-500,750.000000,3000.000000,500)
    AddCube("A-16", 750.000000,2750.000000,-500,1000.000000,3000.000000,500)
    AddCube("A-17", 1000.000000,2750.000000,-500,1250.000000,3000.000000,500)
    AddCube("A-18", 1250.000000,2750.000000,-500,1500.000000,3000.000000,500)
    AddCube("A-19", 1500.000000,2750.000000,-500,1750.000000,3000.000000,500)
    AddCube("A-20", 1750.000000,2750.000000,-500,2000.000000,3000.000000,500)
    AddCube("A-21", 2000.000000,2750.000000,-500,2250.000000,3000.000000,500)
    AddCube("A-22", 2250.000000,2750.000000,-500,2500.000000,3000.000000,500)
    AddCube("A-23", 2500.000000,2750.000000,-500,2750.000000,3000.000000,500)
    AddCube("A-24", 2750.000000,2750.000000,-500,3000.000000,3000.000000,500)
    AddCube("Б-1", -3000.000000,2500.000000,-500,-2750.000000,2750.000000,500)
    AddCube("Б-2", -2750.000000,2500.000000,-500,-2500.000000,2750.000000,500)
    AddCube("Б-3", -2500.000000,2500.000000,-500,-2250.000000,2750.000000,500)
    AddCube("Б-4", -2250.000000,2500.000000,-500,-2000.000000,2750.000000,500)
    AddCube("Б-5", -2000.000000,2500.000000,-500,-1750.000000,2750.000000,500)
    AddCube("Б-6", -1750.000000,2500.000000,-500,-1500.000000,2750.000000,500)
    AddCube("Б-7", -1500.000000,2500.000000,-500,-1250.000000,2750.000000,500)
    AddCube("Б-8", -1250.000000,2500.000000,-500,-1000.000000,2750.000000,500)
    AddCube("Б-9", -1000.000000,2500.000000,-500,-750.000000,2750.000000,500)
    AddCube("Б-10", -750.000000,2500.000000,-500,-500.000000,2750.000000,500)
    AddCube("Б-11", -500.000000,2500.000000,-500,-250.000000,2750.000000,500)
    AddCube("Б-12", -250.000000,2500.000000,-500,0.000000,2750.000000,500)
    AddCube("Б-13", 0.000000,2500.000000,-500,250.000000,2750.000000,500)
    AddCube("Б-14", 250.000000,2500.000000,-500,500.000000,2750.000000,500)
    AddCube("Б-15", 500.000000,2500.000000,-500,750.000000,2750.000000,500)
    AddCube("Б-16", 750.000000,2500.000000,-500,1000.000000,2750.000000,500)
    AddCube("Б-17", 1000.000000,2500.000000,-500,1250.000000,2750.000000,500)
    AddCube("Б-18", 1250.000000,2500.000000,-500,1500.000000,2750.000000,500)
    AddCube("Б-19", 1500.000000,2500.000000,-500,1750.000000,2750.000000,500)
    AddCube("Б-20", 1750.000000,2500.000000,-500,2000.000000,2750.000000,500)
    AddCube("Б-21", 2000.000000,2500.000000,-500,2250.000000,2750.000000,500)
    AddCube("Б-22", 2250.000000,2500.000000,-500,2500.000000,2750.000000,500)
    AddCube("Б-23", 2500.000000,2500.000000,-500,2750.000000,2750.000000,500)
    AddCube("Б-24", 2750.000000,2500.000000,-500,3000.000000,2750.000000,500)
    AddCube("В-1", -3000.000000,2250.000000,-500,-2750.000000,2500.000000,500)
    AddCube("В-2", -2750.000000,2250.000000,-500,-2500.000000,2500.000000,500)
    AddCube("В-3", -2500.000000,2250.000000,-500,-2250.000000,2500.000000,500)
    AddCube("В-4", -2250.000000,2250.000000,-500,-2000.000000,2500.000000,500)
    AddCube("В-5", -2000.000000,2250.000000,-500,-1750.000000,2500.000000,500)
    AddCube("В-6", -1750.000000,2250.000000,-500,-1500.000000,2500.000000,500)
    AddCube("В-7", -1500.000000,2250.000000,-500,-1250.000000,2500.000000,500)
    AddCube("В-8", -1250.000000,2250.000000,-500,-1000.000000,2500.000000,500)
    AddCube("В-9", -1000.000000,2250.000000,-500,-750.000000,2500.000000,500)
    AddCube("В-10", -750.000000,2250.000000,-500,-500.000000,2500.000000,500)
    AddCube("В-11", -500.000000,2250.000000,-500,-250.000000,2500.000000,500)
    AddCube("В-12", -250.000000,2250.000000,-500,0.000000,2500.000000,500)
    AddCube("В-13", 0.000000,2250.000000,-500,250.000000,2500.000000,500)
    AddCube("В-14", 250.000000,2250.000000,-500,500.000000,2500.000000,500)
    AddCube("В-15", 500.000000,2250.000000,-500,750.000000,2500.000000,500)
    AddCube("В-16", 750.000000,2250.000000,-500,1000.000000,2500.000000,500)
    AddCube("В-17", 1000.000000,2250.000000,-500,1250.000000,2500.000000,500)
    AddCube("В-18", 1250.000000,2250.000000,-500,1500.000000,2500.000000,500)
    AddCube("В-19", 1500.000000,2250.000000,-500,1750.000000,2500.000000,500)
    AddCube("В-20", 1750.000000,2250.000000,-500,2000.000000,2500.000000,500)
    AddCube("В-21", 2000.000000,2250.000000,-500,2250.000000,2500.000000,500)
    AddCube("В-22", 2250.000000,2250.000000,-500,2500.000000,2500.000000,500)
    AddCube("В-23", 2500.000000,2250.000000,-500,2750.000000,2500.000000,500)
    AddCube("В-24", 2750.000000,2250.000000,-500,3000.000000,2500.000000,500)
    AddCube("Г-1", -3000.000000,2000.000000,-500,-2750.000000,2250.000000,500)
    AddCube("Г-2", -2750.000000,2000.000000,-500,-2500.000000,2250.000000,500)
    AddCube("Г-3", -2500.000000,2000.000000,-500,-2250.000000,2250.000000,500)
    AddCube("Г-4", -2250.000000,2000.000000,-500,-2000.000000,2250.000000,500)
    AddCube("Г-5", -2000.000000,2000.000000,-500,-1750.000000,2250.000000,500)
    AddCube("Г-6", -1750.000000,2000.000000,-500,-1500.000000,2250.000000,500)
    AddCube("Г-7", -1500.000000,2000.000000,-500,-1250.000000,2250.000000,500)
    AddCube("Г-8", -1250.000000,2000.000000,-500,-1000.000000,2250.000000,500)
    AddCube("Г-9", -1000.000000,2000.000000,-500,-750.000000,2250.000000,500)
    AddCube("Г-10", -750.000000,2000.000000,-500,-500.000000,2250.000000,500)
    AddCube("Г-11", -500.000000,2000.000000,-500,-250.000000,2250.000000,500)
    AddCube("Г-12", -250.000000,2000.000000,-500,0.000000,2250.000000,500)
    AddCube("Г-13", 0.000000,2000.000000,-500,250.000000,2250.000000,500)
    AddCube("Г-14", 250.000000,2000.000000,-500,500.000000,2250.000000,500)
    AddCube("Г-15", 500.000000,2000.000000,-500,750.000000,2250.000000,500)
    AddCube("Г-16", 750.000000,2000.000000,-500,1000.000000,2250.000000,500)
    AddCube("Г-17", 1000.000000,2000.000000,-500,1250.000000,2250.000000,500)
    AddCube("Г-18", 1250.000000,2000.000000,-500,1500.000000,2250.000000,500)
    AddCube("Г-19", 1500.000000,2000.000000,-500,1750.000000,2250.000000,500)
    AddCube("Г-20", 1750.000000,2000.000000,-500,2000.000000,2250.000000,500)
    AddCube("Г-21", 2000.000000,2000.000000,-500,2250.000000,2250.000000,500)
    AddCube("Г-22", 2250.000000,2000.000000,-500,2500.000000,2250.000000,500)
    AddCube("Г-23", 2500.000000,2000.000000,-500,2750.000000,2250.000000,500)
    AddCube("Г-24", 2750.000000,2000.000000,-500,3000.000000,2250.000000,500)
    AddCube("Д-1", -3000.000000,1750.000000,-500,-2750.000000,2000.000000,500)
    AddCube("Д-2", -2750.000000,1750.000000,-500,-2500.000000,2000.000000,500)
    AddCube("Д-3", -2500.000000,1750.000000,-500,-2250.000000,2000.000000,500)
    AddCube("Д-4", -2250.000000,1750.000000,-500,-2000.000000,2000.000000,500)
    AddCube("Д-5", -2000.000000,1750.000000,-500,-1750.000000,2000.000000,500)
    AddCube("Д-6", -1750.000000,1750.000000,-500,-1500.000000,2000.000000,500)
    AddCube("Д-7", -1500.000000,1750.000000,-500,-1250.000000,2000.000000,500)
    AddCube("Д-8", -1250.000000,1750.000000,-500,-1000.000000,2000.000000,500)
    AddCube("Д-9", -1000.000000,1750.000000,-500,-750.000000,2000.000000,500)
    AddCube("Д-10", -750.000000,1750.000000,-500,-500.000000,2000.000000,500)
    AddCube("Д-11", -500.000000,1750.000000,-500,-250.000000,2000.000000,500)
    AddCube("Д-12", -250.000000,1750.000000,-500,0.000000,2000.000000,500)
    AddCube("Д-13", 0.000000,1750.000000,-500,250.000000,2000.000000,500)
    AddCube("Д-14", 250.000000,1750.000000,-500,500.000000,2000.000000,500)
    AddCube("Д-15", 500.000000,1750.000000,-500,750.000000,2000.000000,500)
    AddCube("Д-16", 750.000000,1750.000000,-500,1000.000000,2000.000000,500)
    AddCube("Д-17", 1000.000000,1750.000000,-500,1250.000000,2000.000000,500)
    AddCube("Д-18", 1250.000000,1750.000000,-500,1500.000000,2000.000000,500)
    AddCube("Д-19", 1500.000000,1750.000000,-500,1750.000000,2000.000000,500)
    AddCube("Д-20", 1750.000000,1750.000000,-500,2000.000000,2000.000000,500)
    AddCube("Д-21", 2000.000000,1750.000000,-500,2250.000000,2000.000000,500)
    AddCube("Д-22", 2250.000000,1750.000000,-500,2500.000000,2000.000000,500)
    AddCube("Д-23", 2500.000000,1750.000000,-500,2750.000000,2000.000000,500)
    AddCube("Д-24", 2750.000000,1750.000000,-500,3000.000000,2000.000000,500)
    AddCube("Ж-1", -3000.000000,1500.000000,-500,-2750.000000,1750.000000,500)
    AddCube("Ж-2", -2750.000000,1500.000000,-500,-2500.000000,1750.000000,500)
    AddCube("Ж-3", -2500.000000,1500.000000,-500,-2250.000000,1750.000000,500)
    AddCube("Ж-4", -2250.000000,1500.000000,-500,-2000.000000,1750.000000,500)
    AddCube("Ж-5", -2000.000000,1500.000000,-500,-1750.000000,1750.000000,500)
    AddCube("Ж-6", -1750.000000,1500.000000,-500,-1500.000000,1750.000000,500)
    AddCube("Ж-7", -1500.000000,1500.000000,-500,-1250.000000,1750.000000,500)
    AddCube("Ж-8", -1250.000000,1500.000000,-500,-1000.000000,1750.000000,500)
    AddCube("Ж-9", -1000.000000,1500.000000,-500,-750.000000,1750.000000,500)
    AddCube("Ж-10", -750.000000,1500.000000,-500,-500.000000,1750.000000,500)
    AddCube("Ж-11", -500.000000,1500.000000,-500,-250.000000,1750.000000,500)
    AddCube("Ж-12", -250.000000,1500.000000,-500,0.000000,1750.000000,500)
    AddCube("Ж-13", 0.000000,1500.000000,-500,250.000000,1750.000000,500)
    AddCube("Ж-14", 250.000000,1500.000000,-500,500.000000,1750.000000,500)
    AddCube("Ж-15", 500.000000,1500.000000,-500,750.000000,1750.000000,500)
    AddCube("Ж-16", 750.000000,1500.000000,-500,1000.000000,1750.000000,500)
    AddCube("Ж-17", 1000.000000,1500.000000,-500,1250.000000,1750.000000,500)
    AddCube("Ж-18", 1250.000000,1500.000000,-500,1500.000000,1750.000000,500)
    AddCube("Ж-19", 1500.000000,1500.000000,-500,1750.000000,1750.000000,500)
    AddCube("Ж-20", 1750.000000,1500.000000,-500,2000.000000,1750.000000,500)
    AddCube("Ж-21", 2000.000000,1500.000000,-500,2250.000000,1750.000000,500)
    AddCube("Ж-22", 2250.000000,1500.000000,-500,2500.000000,1750.000000,500)
    AddCube("Ж-23", 2500.000000,1500.000000,-500,2750.000000,1750.000000,500)
    AddCube("Ж-24", 2750.000000,1500.000000,-500,3000.000000,1750.000000,500)
    AddCube("З-1", -3000.000000,1250.000000,-500,-2750.000000,1500.000000,500)
    AddCube("З-2", -2750.000000,1250.000000,-500,-2500.000000,1500.000000,500)
    AddCube("З-3", -2500.000000,1250.000000,-500,-2250.000000,1500.000000,500)
    AddCube("З-4", -2250.000000,1250.000000,-500,-2000.000000,1500.000000,500)
    AddCube("З-5", -2000.000000,1250.000000,-500,-1750.000000,1500.000000,500)
    AddCube("З-6", -1750.000000,1250.000000,-500,-1500.000000,1500.000000,500)
    AddCube("З-7", -1500.000000,1250.000000,-500,-1250.000000,1500.000000,500)
    AddCube("З-8", -1250.000000,1250.000000,-500,-1000.000000,1500.000000,500)
    AddCube("З-9", -1000.000000,1250.000000,-500,-750.000000,1500.000000,500)
    AddCube("З-10", -750.000000,1250.000000,-500,-500.000000,1500.000000,500)
    AddCube("З-11", -500.000000,1250.000000,-500,-250.000000,1500.000000,500)
    AddCube("З-12", -250.000000,1250.000000,-500,0.000000,1500.000000,500)
    AddCube("З-13", 0.000000,1250.000000,-500,250.000000,1500.000000,500)
    AddCube("З-14", 250.000000,1250.000000,-500,500.000000,1500.000000,500)
    AddCube("З-15", 500.000000,1250.000000,-500,750.000000,1500.000000,500)
    AddCube("З-16", 750.000000,1250.000000,-500,1000.000000,1500.000000,500)
    AddCube("З-17", 1000.000000,1250.000000,-500,1250.000000,1500.000000,500)
    AddCube("З-18", 1250.000000,1250.000000,-500,1500.000000,1500.000000,500)
    AddCube("З-19", 1500.000000,1250.000000,-500,1750.000000,1500.000000,500)
    AddCube("З-20", 1750.000000,1250.000000,-500,2000.000000,1500.000000,500)
    AddCube("З-21", 2000.000000,1250.000000,-500,2250.000000,1500.000000,500)
    AddCube("З-22", 2250.000000,1250.000000,-500,2500.000000,1500.000000,500)
    AddCube("З-23", 2500.000000,1250.000000,-500,2750.000000,1500.000000,500)
    AddCube("З-24", 2750.000000,1250.000000,-500,3000.000000,1500.000000,500)
    AddCube("И-1", -3000.000000,1000.000000,-500,-2750.000000,1250.000000,500)
    AddCube("И-2", -2750.000000,1000.000000,-500,-2500.000000,1250.000000,500)
    AddCube("И-3", -2500.000000,1000.000000,-500,-2250.000000,1250.000000,500)
    AddCube("И-4", -2250.000000,1000.000000,-500,-2000.000000,1250.000000,500)
    AddCube("И-5", -2000.000000,1000.000000,-500,-1750.000000,1250.000000,500)
    AddCube("И-6", -1750.000000,1000.000000,-500,-1500.000000,1250.000000,500)
    AddCube("И-7", -1500.000000,1000.000000,-500,-1250.000000,1250.000000,500)
    AddCube("И-8", -1250.000000,1000.000000,-500,-1000.000000,1250.000000,500)
    AddCube("И-9", -1000.000000,1000.000000,-500,-750.000000,1250.000000,500)
    AddCube("И-10", -750.000000,1000.000000,-500,-500.000000,1250.000000,500)
    AddCube("И-11", -500.000000,1000.000000,-500,-250.000000,1250.000000,500)
    AddCube("И-12", -250.000000,1000.000000,-500,0.000000,1250.000000,500)
    AddCube("И-13", 0.000000,1000.000000,-500,250.000000,1250.000000,500)
    AddCube("И-14", 250.000000,1000.000000,-500,500.000000,1250.000000,500)
    AddCube("И-15", 500.000000,1000.000000,-500,750.000000,1250.000000,500)
    AddCube("И-16", 750.000000,1000.000000,-500,1000.000000,1250.000000,500)
    AddCube("И-17", 1000.000000,1000.000000,-500,1250.000000,1250.000000,500)
    AddCube("И-18", 1250.000000,1000.000000,-500,1500.000000,1250.000000,500)
    AddCube("И-19", 1500.000000,1000.000000,-500,1750.000000,1250.000000,500)
    AddCube("И-20", 1750.000000,1000.000000,-500,2000.000000,1250.000000,500)
    AddCube("И-21", 2000.000000,1000.000000,-500,2250.000000,1250.000000,500)
    AddCube("И-22", 2250.000000,1000.000000,-500,2500.000000,1250.000000,500)
    AddCube("И-23", 2500.000000,1000.000000,-500,2750.000000,1250.000000,500)
    AddCube("И-24", 2750.000000,1000.000000,-500,3000.000000,1250.000000,500)
    AddCube("К-1", -3000.000000,750.000000,-500,-2750.000000,1000.000000,500)
    AddCube("К-2", -2750.000000,750.000000,-500,-2500.000000,1000.000000,500)
    AddCube("К-3", -2500.000000,750.000000,-500,-2250.000000,1000.000000,500)
    AddCube("К-4", -2250.000000,750.000000,-500,-2000.000000,1000.000000,500)
    AddCube("К-5", -2000.000000,750.000000,-500,-1750.000000,1000.000000,500)
    AddCube("К-6", -1750.000000,750.000000,-500,-1500.000000,1000.000000,500)
    AddCube("К-7", -1500.000000,750.000000,-500,-1250.000000,1000.000000,500)
    AddCube("К-8", -1250.000000,750.000000,-500,-1000.000000,1000.000000,500)
    AddCube("К-9", -1000.000000,750.000000,-500,-750.000000,1000.000000,500)
    AddCube("К-10", -750.000000,750.000000,-500,-500.000000,1000.000000,500)
    AddCube("К-11", -500.000000,750.000000,-500,-250.000000,1000.000000,500)
    AddCube("К-12", -250.000000,750.000000,-500,0.000000,1000.000000,500)
    AddCube("К-13", 0.000000,750.000000,-500,250.000000,1000.000000,500)
    AddCube("К-14", 250.000000,750.000000,-500,500.000000,1000.000000,500)
    AddCube("К-15", 500.000000,750.000000,-500,750.000000,1000.000000,500)
    AddCube("К-16", 750.000000,750.000000,-500,1000.000000,1000.000000,500)
    AddCube("К-17", 1000.000000,750.000000,-500,1250.000000,1000.000000,500)
    AddCube("К-18", 1250.000000,750.000000,-500,1500.000000,1000.000000,500)
    AddCube("К-19", 1500.000000,750.000000,-500,1750.000000,1000.000000,500)
    AddCube("К-20", 1750.000000,750.000000,-500,2000.000000,1000.000000,500)
    AddCube("К-21", 2000.000000,750.000000,-500,2250.000000,1000.000000,500)
    AddCube("К-22", 2250.000000,750.000000,-500,2500.000000,1000.000000,500)
    AddCube("К-23", 2500.000000,750.000000,-500,2750.000000,1000.000000,500)
    AddCube("К-24", 2750.000000,750.000000,-500,3000.000000,1000.000000,500)
    AddCube("Л-1", -3000.000000,500.000000,-500,-2750.000000,750.000000,500)
    AddCube("Л-2", -2750.000000,500.000000,-500,-2500.000000,750.000000,500)
    AddCube("Л-3", -2500.000000,500.000000,-500,-2250.000000,750.000000,500)
    AddCube("Л-4", -2250.000000,500.000000,-500,-2000.000000,750.000000,500)
    AddCube("Л-5", -2000.000000,500.000000,-500,-1750.000000,750.000000,500)
    AddCube("Л-6", -1750.000000,500.000000,-500,-1500.000000,750.000000,500)
    AddCube("Л-7", -1500.000000,500.000000,-500,-1250.000000,750.000000,500)
    AddCube("Л-8", -1250.000000,500.000000,-500,-1000.000000,750.000000,500)
    AddCube("Л-9", -1000.000000,500.000000,-500,-750.000000,750.000000,500)
    AddCube("Л-10", -750.000000,500.000000,-500,-500.000000,750.000000,500)
    AddCube("Л-11", -500.000000,500.000000,-500,-250.000000,750.000000,500)
    AddCube("Л-12", -250.000000,500.000000,-500,0.000000,750.000000,500)
    AddCube("Л-13", 0.000000,500.000000,-500,250.000000,750.000000,500)
    AddCube("Л-14", 250.000000,500.000000,-500,500.000000,750.000000,500)
    AddCube("Л-15", 500.000000,500.000000,-500,750.000000,750.000000,500)
    AddCube("Л-16", 750.000000,500.000000,-500,1000.000000,750.000000,500)
    AddCube("Л-17", 1000.000000,500.000000,-500,1250.000000,750.000000,500)
    AddCube("Л-18", 1250.000000,500.000000,-500,1500.000000,750.000000,500)
    AddCube("Л-19", 1500.000000,500.000000,-500,1750.000000,750.000000,500)
    AddCube("Л-20", 1750.000000,500.000000,-500,2000.000000,750.000000,500)
    AddCube("Л-21", 2000.000000,500.000000,-500,2250.000000,750.000000,500)
    AddCube("Л-22", 2250.000000,500.000000,-500,2500.000000,750.000000,500)
    AddCube("Л-23", 2500.000000,500.000000,-500,2750.000000,750.000000,500)
    AddCube("Л-24", 2750.000000,500.000000,-500,3000.000000,750.000000,500)
    AddCube("М-1", -3000.000000,250.000000,-500,-2750.000000,500.000000,500)
    AddCube("М-2", -2750.000000,250.000000,-500,-2500.000000,500.000000,500)
    AddCube("М-3", -2500.000000,250.000000,-500,-2250.000000,500.000000,500)
    AddCube("М-4", -2250.000000,250.000000,-500,-2000.000000,500.000000,500)
    AddCube("М-5", -2000.000000,250.000000,-500,-1750.000000,500.000000,500)
    AddCube("М-6", -1750.000000,250.000000,-500,-1500.000000,500.000000,500)
    AddCube("М-7", -1500.000000,250.000000,-500,-1250.000000,500.000000,500)
    AddCube("М-8", -1250.000000,250.000000,-500,-1000.000000,500.000000,500)
    AddCube("М-9", -1000.000000,250.000000,-500,-750.000000,500.000000,500)
    AddCube("М-10", -750.000000,250.000000,-500,-500.000000,500.000000,500)
    AddCube("М-11", -500.000000,250.000000,-500,-250.000000,500.000000,500)
    AddCube("М-12", -250.000000,250.000000,-500,0.000000,500.000000,500)
    AddCube("М-13", 0.000000,250.000000,-500,250.000000,500.000000,500)
    AddCube("М-14", 250.000000,250.000000,-500,500.000000,500.000000,500)
    AddCube("М-15", 500.000000,250.000000,-500,750.000000,500.000000,500)
    AddCube("М-16", 750.000000,250.000000,-500,1000.000000,500.000000,500)
    AddCube("М-17", 1000.000000,250.000000,-500,1250.000000,500.000000,500)
    AddCube("М-18", 1250.000000,250.000000,-500,1500.000000,500.000000,500)
    AddCube("М-19", 1500.000000,250.000000,-500,1750.000000,500.000000,500)
    AddCube("М-20", 1750.000000,250.000000,-500,2000.000000,500.000000,500)
    AddCube("М-21", 2000.000000,250.000000,-500,2250.000000,500.000000,500)
    AddCube("М-22", 2250.000000,250.000000,-500,2500.000000,500.000000,500)
    AddCube("М-23", 2500.000000,250.000000,-500,2750.000000,500.000000,500)
    AddCube("М-24", 2750.000000,250.000000,-500,3000.000000,500.000000,500)
    AddCube("Н-1", -3000.000000,0.000000,-500,-2750.000000,250.000000,500)
    AddCube("Н-2", -2750.000000,0.000000,-500,-2500.000000,250.000000,500)
    AddCube("Н-3", -2500.000000,0.000000,-500,-2250.000000,250.000000,500)
    AddCube("Н-4", -2250.000000,0.000000,-500,-2000.000000,250.000000,500)
    AddCube("Н-5", -2000.000000,0.000000,-500,-1750.000000,250.000000,500)
    AddCube("Н-6", -1750.000000,0.000000,-500,-1500.000000,250.000000,500)
    AddCube("Н-7", -1500.000000,0.000000,-500,-1250.000000,250.000000,500)
    AddCube("Н-8", -1250.000000,0.000000,-500,-1000.000000,250.000000,500)
    AddCube("Н-9", -1000.000000,0.000000,-500,-750.000000,250.000000,500)
    AddCube("Н-10", -750.000000,0.000000,-500,-500.000000,250.000000,500)
    AddCube("Н-11", -500.000000,0.000000,-500,-250.000000,250.000000,500)
    AddCube("Н-12", -250.000000,0.000000,-500,0.000000,250.000000,500)
    AddCube("Н-13", 0.000000,0.000000,-500,250.000000,250.000000,500)
    AddCube("Н-14", 250.000000,0.000000,-500,500.000000,250.000000,500)
    AddCube("Н-15", 500.000000,0.000000,-500,750.000000,250.000000,500)
    AddCube("Н-16", 750.000000,0.000000,-500,1000.000000,250.000000,500)
    AddCube("Н-17", 1000.000000,0.000000,-500,1250.000000,250.000000,500)
    AddCube("Н-18", 1250.000000,0.000000,-500,1500.000000,250.000000,500)
    AddCube("Н-19", 1500.000000,0.000000,-500,1750.000000,250.000000,500)
    AddCube("Н-20", 1750.000000,0.000000,-500,2000.000000,250.000000,500)
    AddCube("Н-21", 2000.000000,0.000000,-500,2250.000000,250.000000,500)
    AddCube("Н-22", 2250.000000,0.000000,-500,2500.000000,250.000000,500)
    AddCube("Н-23", 2500.000000,0.000000,-500,2750.000000,250.000000,500)
    AddCube("Н-24", 2750.000000,0.000000,-500,3000.000000,250.000000,500)
    AddCube("О-1", -3000.000000,-250.000000,-500,-2750.000000,0.000000,500)
    AddCube("О-2", -2750.000000,-250.000000,-500,-2500.000000,0.000000,500)
    AddCube("О-3", -2500.000000,-250.000000,-500,-2250.000000,0.000000,500)
    AddCube("О-4", -2250.000000,-250.000000,-500,-2000.000000,0.000000,500)
    AddCube("О-5", -2000.000000,-250.000000,-500,-1750.000000,0.000000,500)
    AddCube("О-6", -1750.000000,-250.000000,-500,-1500.000000,0.000000,500)
    AddCube("О-7", -1500.000000,-250.000000,-500,-1250.000000,0.000000,500)
    AddCube("О-8", -1250.000000,-250.000000,-500,-1000.000000,0.000000,500)
    AddCube("О-9", -1000.000000,-250.000000,-500,-750.000000,0.000000,500)
    AddCube("О-10", -750.000000,-250.000000,-500,-500.000000,0.000000,500)
    AddCube("О-11", -500.000000,-250.000000,-500,-250.000000,0.000000,500)
    AddCube("О-12", -250.000000,-250.000000,-500,0.000000,0.000000,500)
    AddCube("О-13", 0.000000,-250.000000,-500,250.000000,0.000000,500)
    AddCube("О-14", 250.000000,-250.000000,-500,500.000000,0.000000,500)
    AddCube("О-15", 500.000000,-250.000000,-500,750.000000,0.000000,500)
    AddCube("О-16", 750.000000,-250.000000,-500,1000.000000,0.000000,500)
    AddCube("О-17", 1000.000000,-250.000000,-500,1250.000000,0.000000,500)
    AddCube("О-18", 1250.000000,-250.000000,-500,1500.000000,0.000000,500)
    AddCube("О-19", 1500.000000,-250.000000,-500,1750.000000,0.000000,500)
    AddCube("О-20", 1750.000000,-250.000000,-500,2000.000000,0.000000,500)
    AddCube("О-21", 2000.000000,-250.000000,-500,2250.000000,0.000000,500)
    AddCube("О-22", 2250.000000,-250.000000,-500,2500.000000,0.000000,500)
    AddCube("О-23", 2500.000000,-250.000000,-500,2750.000000,0.000000,500)
    AddCube("О-24", 2750.000000,-250.000000,-500,3000.000000,0.000000,500)
    AddCube("П-1", -3000.000000,-500.000000,-500,-2750.000000,-250.000000,500)
    AddCube("П-2", -2750.000000,-500.000000,-500,-2500.000000,-250.000000,500)
    AddCube("П-3", -2500.000000,-500.000000,-500,-2250.000000,-250.000000,500)
    AddCube("П-4", -2250.000000,-500.000000,-500,-2000.000000,-250.000000,500)
    AddCube("П-5", -2000.000000,-500.000000,-500,-1750.000000,-250.000000,500)
    AddCube("П-6", -1750.000000,-500.000000,-500,-1500.000000,-250.000000,500)
    AddCube("П-7", -1500.000000,-500.000000,-500,-1250.000000,-250.000000,500)
    AddCube("П-8", -1250.000000,-500.000000,-500,-1000.000000,-250.000000,500)
    AddCube("П-9", -1000.000000,-500.000000,-500,-750.000000,-250.000000,500)
    AddCube("П-10", -750.000000,-500.000000,-500,-500.000000,-250.000000,500)
    AddCube("П-11", -500.000000,-500.000000,-500,-250.000000,-250.000000,500)
    AddCube("П-12", -250.000000,-500.000000,-500,0.000000,-250.000000,500)
    AddCube("П-13", 0.000000,-500.000000,-500,250.000000,-250.000000,500)
    AddCube("П-14", 250.000000,-500.000000,-500,500.000000,-250.000000,500)
    AddCube("П-15", 500.000000,-500.000000,-500,750.000000,-250.000000,500)
    AddCube("П-16", 750.000000,-500.000000,-500,1000.000000,-250.000000,500)
    AddCube("П-17", 1000.000000,-500.000000,-500,1250.000000,-250.000000,500)
    AddCube("П-18", 1250.000000,-500.000000,-500,1500.000000,-250.000000,500)
    AddCube("П-19", 1500.000000,-500.000000,-500,1750.000000,-250.000000,500)
    AddCube("П-20", 1750.000000,-500.000000,-500,2000.000000,-250.000000,500)
    AddCube("П-21", 2000.000000,-500.000000,-500,2250.000000,-250.000000,500)
    AddCube("П-22", 2250.000000,-500.000000,-500,2500.000000,-250.000000,500)
    AddCube("П-23", 2500.000000,-500.000000,-500,2750.000000,-250.000000,500)
    AddCube("П-24", 2750.000000,-500.000000,-500,3000.000000,-250.000000,500)
    AddCube("Р-1", -3000.000000,-750.000000,-500,-2750.000000,-500.000000,500)
    AddCube("Р-2", -2750.000000,-750.000000,-500,-2500.000000,-500.000000,500)
    AddCube("Р-3", -2500.000000,-750.000000,-500,-2250.000000,-500.000000,500)
    AddCube("Р-4", -2250.000000,-750.000000,-500,-2000.000000,-500.000000,500)
    AddCube("Р-5", -2000.000000,-750.000000,-500,-1750.000000,-500.000000,500)
    AddCube("Р-6", -1750.000000,-750.000000,-500,-1500.000000,-500.000000,500)
    AddCube("Р-7", -1500.000000,-750.000000,-500,-1250.000000,-500.000000,500)
    AddCube("Р-8", -1250.000000,-750.000000,-500,-1000.000000,-500.000000,500)
    AddCube("Р-9", -1000.000000,-750.000000,-500,-750.000000,-500.000000,500)
    AddCube("Р-10", -750.000000,-750.000000,-500,-500.000000,-500.000000,500)
    AddCube("Р-11", -500.000000,-750.000000,-500,-250.000000,-500.000000,500)
    AddCube("Р-12", -250.000000,-750.000000,-500,0.000000,-500.000000,500)
    AddCube("Р-13", 0.000000,-750.000000,-500,250.000000,-500.000000,500)
    AddCube("Р-14", 250.000000,-750.000000,-500,500.000000,-500.000000,500)
    AddCube("Р-15", 500.000000,-750.000000,-500,750.000000,-500.000000,500)
    AddCube("Р-16", 750.000000,-750.000000,-500,1000.000000,-500.000000,500)
    AddCube("Р-17", 1000.000000,-750.000000,-500,1250.000000,-500.000000,500)
    AddCube("Р-18", 1250.000000,-750.000000,-500,1500.000000,-500.000000,500)
    AddCube("Р-19", 1500.000000,-750.000000,-500,1750.000000,-500.000000,500)
    AddCube("Р-20", 1750.000000,-750.000000,-500,2000.000000,-500.000000,500)
    AddCube("Р-21", 2000.000000,-750.000000,-500,2250.000000,-500.000000,500)
    AddCube("Р-22", 2250.000000,-750.000000,-500,2500.000000,-500.000000,500)
    AddCube("Р-23", 2500.000000,-750.000000,-500,2750.000000,-500.000000,500)
    AddCube("Р-24", 2750.000000,-750.000000,-500,3000.000000,-500.000000,500)
    AddCube("С-1", -3000.000000,-1000.000000,-500,-2750.000000,-750.000000,500)
    AddCube("С-2", -2750.000000,-1000.000000,-500,-2500.000000,-750.000000,500)
    AddCube("С-3", -2500.000000,-1000.000000,-500,-2250.000000,-750.000000,500)
    AddCube("С-4", -2250.000000,-1000.000000,-500,-2000.000000,-750.000000,500)
    AddCube("С-5", -2000.000000,-1000.000000,-500,-1750.000000,-750.000000,500)
    AddCube("С-6", -1750.000000,-1000.000000,-500,-1500.000000,-750.000000,500)
    AddCube("С-7", -1500.000000,-1000.000000,-500,-1250.000000,-750.000000,500)
    AddCube("С-8", -1250.000000,-1000.000000,-500,-1000.000000,-750.000000,500)
    AddCube("С-9", -1000.000000,-1000.000000,-500,-750.000000,-750.000000,500)
    AddCube("С-10", -750.000000,-1000.000000,-500,-500.000000,-750.000000,500)
    AddCube("С-11", -500.000000,-1000.000000,-500,-250.000000,-750.000000,500)
    AddCube("С-12", -250.000000,-1000.000000,-500,0.000000,-750.000000,500)
    AddCube("С-13", 0.000000,-1000.000000,-500,250.000000,-750.000000,500)
    AddCube("С-14", 250.000000,-1000.000000,-500,500.000000,-750.000000,500)
    AddCube("С-15", 500.000000,-1000.000000,-500,750.000000,-750.000000,500)
    AddCube("С-16", 750.000000,-1000.000000,-500,1000.000000,-750.000000,500)
    AddCube("С-17", 1000.000000,-1000.000000,-500,1250.000000,-750.000000,500)
    AddCube("С-18", 1250.000000,-1000.000000,-500,1500.000000,-750.000000,500)
    AddCube("С-19", 1500.000000,-1000.000000,-500,1750.000000,-750.000000,500)
    AddCube("С-20", 1750.000000,-1000.000000,-500,2000.000000,-750.000000,500)
    AddCube("С-21", 2000.000000,-1000.000000,-500,2250.000000,-750.000000,500)
    AddCube("С-22", 2250.000000,-1000.000000,-500,2500.000000,-750.000000,500)
    AddCube("С-23", 2500.000000,-1000.000000,-500,2750.000000,-750.000000,500)
    AddCube("С-24", 2750.000000,-1000.000000,-500,3000.000000,-750.000000,500)
    AddCube("Т-1", -3000.000000,-1250.000000,-500,-2750.000000,-1000.000000,500)
    AddCube("Т-2", -2750.000000,-1250.000000,-500,-2500.000000,-1000.000000,500)
    AddCube("Т-3", -2500.000000,-1250.000000,-500,-2250.000000,-1000.000000,500)
    AddCube("Т-4", -2250.000000,-1250.000000,-500,-2000.000000,-1000.000000,500)
    AddCube("Т-5", -2000.000000,-1250.000000,-500,-1750.000000,-1000.000000,500)
    AddCube("Т-6", -1750.000000,-1250.000000,-500,-1500.000000,-1000.000000,500)
    AddCube("Т-7", -1500.000000,-1250.000000,-500,-1250.000000,-1000.000000,500)
    AddCube("Т-8", -1250.000000,-1250.000000,-500,-1000.000000,-1000.000000,500)
    AddCube("Т-9", -1000.000000,-1250.000000,-500,-750.000000,-1000.000000,500)
    AddCube("Т-10", -750.000000,-1250.000000,-500,-500.000000,-1000.000000,500)
    AddCube("Т-11", -500.000000,-1250.000000,-500,-250.000000,-1000.000000,500)
    AddCube("Т-12", -250.000000,-1250.000000,-500,0.000000,-1000.000000,500)
    AddCube("Т-13", 0.000000,-1250.000000,-500,250.000000,-1000.000000,500)
    AddCube("Т-14", 250.000000,-1250.000000,-500,500.000000,-1000.000000,500)
    AddCube("Т-15", 500.000000,-1250.000000,-500,750.000000,-1000.000000,500)
    AddCube("Т-16", 750.000000,-1250.000000,-500,1000.000000,-1000.000000,500)
    AddCube("Т-17", 1000.000000,-1250.000000,-500,1250.000000,-1000.000000,500)
    AddCube("Т-18", 1250.000000,-1250.000000,-500,1500.000000,-1000.000000,500)
    AddCube("Т-19", 1500.000000,-1250.000000,-500,1750.000000,-1000.000000,500)
    AddCube("Т-20", 1750.000000,-1250.000000,-500,2000.000000,-1000.000000,500)
    AddCube("Т-21", 2000.000000,-1250.000000,-500,2250.000000,-1000.000000,500)
    AddCube("Т-22", 2250.000000,-1250.000000,-500,2500.000000,-1000.000000,500)
    AddCube("Т-23", 2500.000000,-1250.000000,-500,2750.000000,-1000.000000,500)
    AddCube("Т-24", 2750.000000,-1250.000000,-500,3000.000000,-1000.000000,500)
    AddCube("У-1", -3000.000000,-1500.000000,-500,-2750.000000,-1250.000000,500)
    AddCube("У-2", -2750.000000,-1500.000000,-500,-2500.000000,-1250.000000,500)
    AddCube("У-3", -2500.000000,-1500.000000,-500,-2250.000000,-1250.000000,500)
    AddCube("У-4", -2250.000000,-1500.000000,-500,-2000.000000,-1250.000000,500)
    AddCube("У-5", -2000.000000,-1500.000000,-500,-1750.000000,-1250.000000,500)
    AddCube("У-6", -1750.000000,-1500.000000,-500,-1500.000000,-1250.000000,500)
    AddCube("У-7", -1500.000000,-1500.000000,-500,-1250.000000,-1250.000000,500)
    AddCube("У-8", -1250.000000,-1500.000000,-500,-1000.000000,-1250.000000,500)
    AddCube("У-9", -1000.000000,-1500.000000,-500,-750.000000,-1250.000000,500)
    AddCube("У-10", -750.000000,-1500.000000,-500,-500.000000,-1250.000000,500)
    AddCube("У-11", -500.000000,-1500.000000,-500,-250.000000,-1250.000000,500)
    AddCube("У-12", -250.000000,-1500.000000,-500,0.000000,-1250.000000,500)
    AddCube("У-13", 0.000000,-1500.000000,-500,250.000000,-1250.000000,500)
    AddCube("У-14", 250.000000,-1500.000000,-500,500.000000,-1250.000000,500)
    AddCube("У-15", 500.000000,-1500.000000,-500,750.000000,-1250.000000,500)
    AddCube("У-16", 750.000000,-1500.000000,-500,1000.000000,-1250.000000,500)
    AddCube("У-17", 1000.000000,-1500.000000,-500,1250.000000,-1250.000000,500)
    AddCube("У-18", 1250.000000,-1500.000000,-500,1500.000000,-1250.000000,500)
    AddCube("У-19", 1500.000000,-1500.000000,-500,1750.000000,-1250.000000,500)
    AddCube("У-20", 1750.000000,-1500.000000,-500,2000.000000,-1250.000000,500)
    AddCube("У-21", 2000.000000,-1500.000000,-500,2250.000000,-1250.000000,500)
    AddCube("У-22", 2250.000000,-1500.000000,-500,2500.000000,-1250.000000,500)
    AddCube("У-23", 2500.000000,-1500.000000,-500,2750.000000,-1250.000000,500)
    AddCube("У-24", 2750.000000,-1500.000000,-500,3000.000000,-1250.000000,500)
    AddCube("Ф-1", -3000.000000,-1750.000000,-500,-2750.000000,-1500.000000,500)
    AddCube("Ф-2", -2750.000000,-1750.000000,-500,-2500.000000,-1500.000000,500)
    AddCube("Ф-3", -2500.000000,-1750.000000,-500,-2250.000000,-1500.000000,500)
    AddCube("Ф-4", -2250.000000,-1750.000000,-500,-2000.000000,-1500.000000,500)
    AddCube("Ф-5", -2000.000000,-1750.000000,-500,-1750.000000,-1500.000000,500)
    AddCube("Ф-6", -1750.000000,-1750.000000,-500,-1500.000000,-1500.000000,500)
    AddCube("Ф-7", -1500.000000,-1750.000000,-500,-1250.000000,-1500.000000,500)
    AddCube("Ф-8", -1250.000000,-1750.000000,-500,-1000.000000,-1500.000000,500)
    AddCube("Ф-9", -1000.000000,-1750.000000,-500,-750.000000,-1500.000000,500)
    AddCube("Ф-10", -750.000000,-1750.000000,-500,-500.000000,-1500.000000,500)
    AddCube("Ф-11", -500.000000,-1750.000000,-500,-250.000000,-1500.000000,500)
    AddCube("Ф-12", -250.000000,-1750.000000,-500,0.000000,-1500.000000,500)
    AddCube("Ф-13", 0.000000,-1750.000000,-500,250.000000,-1500.000000,500)
    AddCube("Ф-14", 250.000000,-1750.000000,-500,500.000000,-1500.000000,500)
    AddCube("Ф-15", 500.000000,-1750.000000,-500,750.000000,-1500.000000,500)
    AddCube("Ф-16", 750.000000,-1750.000000,-500,1000.000000,-1500.000000,500)
    AddCube("Ф-17", 1000.000000,-1750.000000,-500,1250.000000,-1500.000000,500)
    AddCube("Ф-18", 1250.000000,-1750.000000,-500,1500.000000,-1500.000000,500)
    AddCube("Ф-19", 1500.000000,-1750.000000,-500,1750.000000,-1500.000000,500)
    AddCube("Ф-20", 1750.000000,-1750.000000,-500,2000.000000,-1500.000000,500)
    AddCube("Ф-21", 2000.000000,-1750.000000,-500,2250.000000,-1500.000000,500)
    AddCube("Ф-22", 2250.000000,-1750.000000,-500,2500.000000,-1500.000000,500)
    AddCube("Ф-23", 2500.000000,-1750.000000,-500,2750.000000,-1500.000000,500)
    AddCube("Ф-24", 2750.000000,-1750.000000,-500,3000.000000,-1500.000000,500)
    AddCube("Х-1", -3000.000000,-2000.000000,-500,-2750.000000,-1750.000000,500)
    AddCube("Х-2", -2750.000000,-2000.000000,-500,-2500.000000,-1750.000000,500)
    AddCube("Х-3", -2500.000000,-2000.000000,-500,-2250.000000,-1750.000000,500)
    AddCube("Х-4", -2250.000000,-2000.000000,-500,-2000.000000,-1750.000000,500)
    AddCube("Х-5", -2000.000000,-2000.000000,-500,-1750.000000,-1750.000000,500)
    AddCube("Х-6", -1750.000000,-2000.000000,-500,-1500.000000,-1750.000000,500)
    AddCube("Х-7", -1500.000000,-2000.000000,-500,-1250.000000,-1750.000000,500)
    AddCube("Х-8", -1250.000000,-2000.000000,-500,-1000.000000,-1750.000000,500)
    AddCube("Х-9", -1000.000000,-2000.000000,-500,-750.000000,-1750.000000,500)
    AddCube("Х-10", -750.000000,-2000.000000,-500,-500.000000,-1750.000000,500)
    AddCube("Х-11", -500.000000,-2000.000000,-500,-250.000000,-1750.000000,500)
    AddCube("Х-12", -250.000000,-2000.000000,-500,0.000000,-1750.000000,500)
    AddCube("Х-13", 0.000000,-2000.000000,-500,250.000000,-1750.000000,500)
    AddCube("Х-14", 250.000000,-2000.000000,-500,500.000000,-1750.000000,500)
    AddCube("Х-15", 500.000000,-2000.000000,-500,750.000000,-1750.000000,500)
    AddCube("Х-16", 750.000000,-2000.000000,-500,1000.000000,-1750.000000,500)
    AddCube("Х-17", 1000.000000,-2000.000000,-500,1250.000000,-1750.000000,500)
    AddCube("Х-18", 1250.000000,-2000.000000,-500,1500.000000,-1750.000000,500)
    AddCube("Х-19", 1500.000000,-2000.000000,-500,1750.000000,-1750.000000,500)
    AddCube("Х-20", 1750.000000,-2000.000000,-500,2000.000000,-1750.000000,500)
    AddCube("Х-21", 2000.000000,-2000.000000,-500,2250.000000,-1750.000000,500)
    AddCube("Х-22", 2250.000000,-2000.000000,-500,2500.000000,-1750.000000,500)
    AddCube("Х-23", 2500.000000,-2000.000000,-500,2750.000000,-1750.000000,500)
    AddCube("Х-24", 2750.000000,-2000.000000,-500,3000.000000,-1750.000000,500)
    AddCube("Ц-1", -3000.000000,-2250.000000,-500,-2750.000000,-2000.000000,500)
    AddCube("Ц-2", -2750.000000,-2250.000000,-500,-2500.000000,-2000.000000,500)
    AddCube("Ц-3", -2500.000000,-2250.000000,-500,-2250.000000,-2000.000000,500)
    AddCube("Ц-4", -2250.000000,-2250.000000,-500,-2000.000000,-2000.000000,500)
    AddCube("Ц-5", -2000.000000,-2250.000000,-500,-1750.000000,-2000.000000,500)
    AddCube("Ц-6", -1750.000000,-2250.000000,-500,-1500.000000,-2000.000000,500)
    AddCube("Ц-7", -1500.000000,-2250.000000,-500,-1250.000000,-2000.000000,500)
    AddCube("Ц-8", -1250.000000,-2250.000000,-500,-1000.000000,-2000.000000,500)
    AddCube("Ц-9", -1000.000000,-2250.000000,-500,-750.000000,-2000.000000,500)
    AddCube("Ц-10", -750.000000,-2250.000000,-500,-500.000000,-2000.000000,500)
    AddCube("Ц-11", -500.000000,-2250.000000,-500,-250.000000,-2000.000000,500)
    AddCube("Ц-12", -250.000000,-2250.000000,-500,0.000000,-2000.000000,500)
    AddCube("Ц-13", 0.000000,-2250.000000,-500,250.000000,-2000.000000,500)
    AddCube("Ц-14", 250.000000,-2250.000000,-500,500.000000,-2000.000000,500)
    AddCube("Ц-15", 500.000000,-2250.000000,-500,750.000000,-2000.000000,500)
    AddCube("Ц-16", 750.000000,-2250.000000,-500,1000.000000,-2000.000000,500)
    AddCube("Ц-17", 1000.000000,-2250.000000,-500,1250.000000,-2000.000000,500)
    AddCube("Ц-18", 1250.000000,-2250.000000,-500,1500.000000,-2000.000000,500)
    AddCube("Ц-19", 1500.000000,-2250.000000,-500,1750.000000,-2000.000000,500)
    AddCube("Ц-20", 1750.000000,-2250.000000,-500,2000.000000,-2000.000000,500)
    AddCube("Ц-21", 2000.000000,-2250.000000,-500,2250.000000,-2000.000000,500)
    AddCube("Ц-22", 2250.000000,-2250.000000,-500,2500.000000,-2000.000000,500)
    AddCube("Ц-23", 2500.000000,-2250.000000,-500,2750.000000,-2000.000000,500)
    AddCube("Ц-24", 2750.000000,-2250.000000,-500,3000.000000,-2000.000000,500)
    AddCube("Ч-1", -3000.000000,-2500.000000,-500,-2750.000000,-2250.000000,500)
    AddCube("Ч-2", -2750.000000,-2500.000000,-500,-2500.000000,-2250.000000,500)
    AddCube("Ч-3", -2500.000000,-2500.000000,-500,-2250.000000,-2250.000000,500)
    AddCube("Ч-4", -2250.000000,-2500.000000,-500,-2000.000000,-2250.000000,500)
    AddCube("Ч-5", -2000.000000,-2500.000000,-500,-1750.000000,-2250.000000,500)
    AddCube("Ч-6", -1750.000000,-2500.000000,-500,-1500.000000,-2250.000000,500)
    AddCube("Ч-7", -1500.000000,-2500.000000,-500,-1250.000000,-2250.000000,500)
    AddCube("Ч-8", -1250.000000,-2500.000000,-500,-1000.000000,-2250.000000,500)
    AddCube("Ч-9", -1000.000000,-2500.000000,-500,-750.000000,-2250.000000,500)
    AddCube("Ч-10", -750.000000,-2500.000000,-500,-500.000000,-2250.000000,500)
    AddCube("Ч-11", -500.000000,-2500.000000,-500,-250.000000,-2250.000000,500)
    AddCube("Ч-12", -250.000000,-2500.000000,-500,0.000000,-2250.000000,500)
    AddCube("Ч-13", 0.000000,-2500.000000,-500,250.000000,-2250.000000,500)
    AddCube("Ч-14", 250.000000,-2500.000000,-500,500.000000,-2250.000000,500)
    AddCube("Ч-15", 500.000000,-2500.000000,-500,750.000000,-2250.000000,500)
    AddCube("Ч-16", 750.000000,-2500.000000,-500,1000.000000,-2250.000000,500)
    AddCube("Ч-17", 1000.000000,-2500.000000,-500,1250.000000,-2250.000000,500)
    AddCube("Ч-18", 1250.000000,-2500.000000,-500,1500.000000,-2250.000000,500)
    AddCube("Ч-19", 1500.000000,-2500.000000,-500,1750.000000,-2250.000000,500)
    AddCube("Ч-20", 1750.000000,-2500.000000,-500,2000.000000,-2250.000000,500)
    AddCube("Ч-21", 2000.000000,-2500.000000,-500,2250.000000,-2250.000000,500)
    AddCube("Ч-22", 2250.000000,-2500.000000,-500,2500.000000,-2250.000000,500)
    AddCube("Ч-23", 2500.000000,-2500.000000,-500,2750.000000,-2250.000000,500)
    AddCube("Ч-24", 2750.000000,-2500.000000,-500,3000.000000,-2250.000000,500)
    AddCube("Ш-1", -3000.000000,-2750.000000,-500,-2750.000000,-2500.000000,500)
    AddCube("Ш-2", -2750.000000,-2750.000000,-500,-2500.000000,-2500.000000,500)
    AddCube("Ш-3", -2500.000000,-2750.000000,-500,-2250.000000,-2500.000000,500)
    AddCube("Ш-4", -2250.000000,-2750.000000,-500,-2000.000000,-2500.000000,500)
    AddCube("Ш-5", -2000.000000,-2750.000000,-500,-1750.000000,-2500.000000,500)
    AddCube("Ш-6", -1750.000000,-2750.000000,-500,-1500.000000,-2500.000000,500)
    AddCube("Ш-7", -1500.000000,-2750.000000,-500,-1250.000000,-2500.000000,500)
    AddCube("Ш-8", -1250.000000,-2750.000000,-500,-1000.000000,-2500.000000,500)
    AddCube("Ш-9", -1000.000000,-2750.000000,-500,-750.000000,-2500.000000,500)
    AddCube("Ш-10", -750.000000,-2750.000000,-500,-500.000000,-2500.000000,500)
    AddCube("Ш-11", -500.000000,-2750.000000,-500,-250.000000,-2500.000000,500)
    AddCube("Ш-12", -250.000000,-2750.000000,-500,0.000000,-2500.000000,500)
    AddCube("Ш-13", 0.000000,-2750.000000,-500,250.000000,-2500.000000,500)
    AddCube("Ш-14", 250.000000,-2750.000000,-500,500.000000,-2500.000000,500)
    AddCube("Ш-15", 500.000000,-2750.000000,-500,750.000000,-2500.000000,500)
    AddCube("Ш-16", 750.000000,-2750.000000,-500,1000.000000,-2500.000000,500)
    AddCube("Ш-17", 1000.000000,-2750.000000,-500,1250.000000,-2500.000000,500)
    AddCube("Ш-18", 1250.000000,-2750.000000,-500,1500.000000,-2500.000000,500)
    AddCube("Ш-19", 1500.000000,-2750.000000,-500,1750.000000,-2500.000000,500)
    AddCube("Ш-20", 1750.000000,-2750.000000,-500,2000.000000,-2500.000000,500)
    AddCube("Ш-21", 2000.000000,-2750.000000,-500,2250.000000,-2500.000000,500)
    AddCube("Ш-22", 2250.000000,-2750.000000,-500,2500.000000,-2500.000000,500)
    AddCube("Ш-23", 2500.000000,-2750.000000,-500,2750.000000,-2500.000000,500)
    AddCube("Ш-24", 2750.000000,-2750.000000,-500,3000.000000,-2500.000000,500)
    AddCube("Я-1", -3000.000000,-3000.000000,-500,-2750.000000,-2750.000000,500)
    AddCube("Я-2", -2750.000000,-3000.000000,-500,-2500.000000,-2750.000000,500)
    AddCube("Я-3", -2500.000000,-3000.000000,-500,-2250.000000,-2750.000000,500)
    AddCube("Я-4", -2250.000000,-3000.000000,-500,-2000.000000,-2750.000000,500)
    AddCube("Я-5", -2000.000000,-3000.000000,-500,-1750.000000,-2750.000000,500)
    AddCube("Я-6", -1750.000000,-3000.000000,-500,-1500.000000,-2750.000000,500)
    AddCube("Я-7", -1500.000000,-3000.000000,-500,-1250.000000,-2750.000000,500)
    AddCube("Я-8", -1250.000000,-3000.000000,-500,-1000.000000,-2750.000000,500)
    AddCube("Я-9", -1000.000000,-3000.000000,-500,-750.000000,-2750.000000,500)
    AddCube("Я-10", -750.000000,-3000.000000,-500,-500.000000,-2750.000000,500)
    AddCube("Я-11", -500.000000,-3000.000000,-500,-250.000000,-2750.000000,500)
    AddCube("Я-12", -250.000000,-3000.000000,-500,0.000000,-2750.000000,500)
    AddCube("Я-13", 0.000000,-3000.000000,-500,250.000000,-2750.000000,500)
    AddCube("Я-14", 250.000000,-3000.000000,-500,500.000000,-2750.000000,500)
    AddCube("Я-15", 500.000000,-3000.000000,-500,750.000000,-2750.000000,500)
    AddCube("Я-16", 750.000000,-3000.000000,-500,1000.000000,-2750.000000,500)
    AddCube("Я-17", 1000.000000,-3000.000000,-500,1250.000000,-2750.000000,500)
    AddCube("Я-18", 1250.000000,-3000.000000,-500,1500.000000,-2750.000000,500)
    AddCube("Я-19", 1500.000000,-3000.000000,-500,1750.000000,-2750.000000,500)
    AddCube("Я-20", 1750.000000,-3000.000000,-500,2000.000000,-2750.000000,500)
    AddCube("Я-21", 2000.000000,-3000.000000,-500,2250.000000,-2750.000000,500)
    AddCube("Я-22", 2250.000000,-3000.000000,-500,2500.000000,-2750.000000,500)
    AddCube("Я-23", 2500.000000,-3000.000000,-500,2750.000000,-2750.000000,500)
    AddCube("Я-24", 2750.000000,-3000.000000,-500,3000.000000,-2750.000000,500)
}
HexToDec(str)
{
    local newStr := ""
static comp := {0:0, 1:1, 2:2, 3:3, 4:4, 5:5, 6:6, 7:7, 8:8, 9:9, "a":10, "b":11, "c":12, "d":13, "e":14, "f":15}
    StringLower, str, str
    str := RegExReplace(str, "^0x|[^a-f0-9]+", "")
    Loop, % StrLen(str)
    newStr .= SubStr(str, (StrLen(str)-A_Index)+1, 1)
    newStr := StrSplit(newStr, "")
    local ret := 0
    for i,char in newStr
    ret += comp[char]*(16**(i-1))
    return ret
}
calculateCube(posX, posY, posZ) {
    if ( bInitZaC == 0 )
    {
        initZonesAndCities()
        bInitZaC := 1
    }
    Loop % nCube-1
    {
        if (posX >= cube%A_Index%_x1) && (posY >= cube%A_Index%_y1) && (posZ >= cube%A_Index%_z1) && (posX <= cube%A_Index%_x2) && (posY <= cube%A_Index%_y2) && (posZ <= cube%A_Index%_z2)
        {
            ErrorLevel := ERROR_OK
            return cube%A_Index%_name
        }
    }
    ErrorLevel := ERROR_CUBE_NOT_FOUND
    return "Unbekannt"
}
AddCube(sName, x1, y1, z1, x2, y2, z2) {
    global
    cube%nCube%_name := sName
    cube%nCube%_x1 := x1
    cube%nCube%_y1 := y1
    cube%nCube%_z1 := z1
    cube%nCube%_x2 := x2
    cube%nCube%_y2 := y2
    cube%nCube%_z2 := z2
    nCube := nCube + 1
}
getPlayerCube()
{
    aktPos := getCoordinates()
    return calculateCube(aktPos[1], aktPos[2], aktPos[3])
}
addChatMessageEx(Color, wText) {
    wText := "" wText
    if(!checkHandles())
    return false
    VarSetCapacity(data2, 4, 0)
    NumPut(HexToDec(Color),data2,0,"Int")
    Addrr := readDWORD(hGTA, dwSAMP+ADDR_SAMP_CHATMSG_PTR)
    VarSetCapacity(data1, 4, 0)
    NumPut(readDWORD(hGTA, Addrr + 0x12A), data1,0,"Int")
    WriteRaw(hGTA, Addrr + 0x12A, &data2, 4)
    dwFunc := dwSAMP + FUNC_SAMP_ADDTOCHATWND
    dwChatInfo := readDWORD(hGTA, dwSAMP + ADDR_SAMP_CHATMSG_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return false
    }
    callWithParams(hGTA, dwFunc, [["p", dwChatInfo], ["s", wText]], true)
    WriteRaw(hGTA, Addrr + 0x12A, &data1, 4)
    ErrorLevel := ERROR_OK
    return true
}
connect(IP) {
    setIP(IP)
    restartGameEx()
    disconnectEx()
    Sleep 1000
    setrestart()
    Return
}
WriteProcessMemory(title,addresse,wert,size)
{
    VarSetCapacity(idvar,32,0)
    VarSetCapacity(processhandle,32,0)
    VarSetCapacity(value, 32, 0)
    NumPut(wert,value,0,Uint)
    address=%addresse%
    WinGet ,idvar,PID,%title%
    processhandle:=DllCall("OpenProcess","Uint",0x38,"int",0,"int",idvar)
    Bvar:=DllCall("WriteProcessMemory","Uint",processhandle,"Uint",address+0,"Uint",&value,"Uint",size,"Uint",0)
}
setCoordinates(x, y, z, Interior) {
    if(!checkHandles())
    return False
    dwAddress := readMem(hGTA, ADDR_SET_POSITION)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        Return False
    }
    dwAddress := readMem(hGTA, dwAddress + ADDR_SET_POSITION_OFFSET)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        Return False
    }
    Sleep 100
    writeByte(hGTA, ADDR_SET_INTERIOR_OFFSET, Interior)
    if(ErrorLevel) {
        ErrorLevel := ERROR_WRITE_MEMORY
        Return False
    }
    writeFloat(hGTA, dwAddress + ADDR_SET_POSITION_X_OFFSET, x)
    if(ErrorLevel) {
        ErrorLevel := ERROR_WRITE_MEMORY
        Return False
    }
    writeFloat(hGTA, dwAddress + ADDR_SET_POSITION_Y_OFFSET, y)
    if(ErrorLevel) {
        ErrorLevel := ERROR_WRITE_MEMORY
        Return False
    }
    writeFloat(hGTA, dwAddress + ADDR_SET_POSITION_Z_OFFSET, z)
    if(ErrorLevel) {
        ErrorLevel := ERROR_WRITE_MEMORY
        Return False
    }
    Return True
}
colorhud(colorhud)
{
    VarSetCapacity(idvar,32,0)
    VarSetCapacity(processhandle,32,0)
    VarSetCapacity(value, 32, 0)
    NumPut(colorhud,value,0,Uint)
    address=0xBAB230
    WinGet ,idvar,PID,GTA:SA:MP
    processhandle:=DllCall("OpenProcess","Uint",0x38,"int",0,"int",idvar)
    Bvar:=DllCall("WriteProcessMemory","Uint",processhandle,"Uint",address+0,"Uint",&value,"Uint","4","Uint",0)
}
getIP() {
    if(!checkHandles())
    return ""
    dwAddress := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET)
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    ipAddr := readString(hGTA, dwAddress + SAMP_SZIP_OFFSET, 257)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    return ipAddr
}
setIP(IP) {
    if(!checkHandles())
    return False
    dwAddress := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET)
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return False
    }
    writeString(hGTA, dwAddress + SAMP_SZIP_OFFSET, IP)
    if(ErrorLevel) {
        ErrorLevel := ERROR_WRITE_MEMORY
        return False
    }
    return True
}
getHostname() {
    if(!checkHandles())
    return ""
    dwAddress := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET)
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    hostname := readString(hGTA, dwAddress + SAMP_SZHOSTNAME_OFFSET, 259)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    return hostname
}
setUsername(Username) {
    if(!checkHandles())
    return False
    dwAddress := dwSAMP + ADDR_SAMP_USERNAME
    writeString(hGTA, dwAddress, Username)
    if(ErrorLevel) {
        ErrorLevel := ERROR_WRITE_MEMORY
        return False
    }
    ErrorLevel := ERROR_OK
    return True
}
setChatLine(line, msg) {
    if(!checkHandles())
    return -1
    dwPtr := dwSAMP + ADDR_SAMP_CHATMSG_PTR
    dwAddress := readDWORD(hGTA,dwPtr)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    writeString(hGTA, dwAddress + 0x152 + ( (99-line) * 0xFC), msg)
    if(ErrorLevel) {
        ErrorLevel := ERROR_WRITE_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return True
}
getTagNameDistance() {
    if(!checkHandles())
    return -1
    dwSAMPInfo := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    dwSAMPInfoSettings := readDWORD(hGTA, dwSAMPInfo + SAMP_INFO_SETTINGS_OFFSET)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    distance := readFloat(hGTA, dwSAMPInfoSettings + 0x27)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return distance
}
setTagNameDistance(status, distance) {
    if(!checkHandles())
    return -1
    status := status ? 1 : 0
    dwSAMPInfo := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    dwSAMPInfoSettings := readDWORD(hGTA, dwSAMPInfo + SAMP_INFO_SETTINGS_OFFSET)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    writeByte(hGTA, dwSAMPInfoSettings + 0x38, 1)
    if(ErrorLevel) {
        ErrorLevel := ERROR_WRITE_MEMORY
        return -1
    }
    writeByte(hGTA, dwSAMPInfoSettings + 0x2F, status)
    if(ErrorLevel) {
        ErrorLevel := ERROR_WRITE_MEMORY
        return -1
    }
    writeFloat(hGTA, dwSAMPInfoSettings + 0x27, distance)
    if(ErrorLevel) {
        ErrorLevel := ERROR_WRITE_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return
}
setTime(hour)
{
    if(!checkHandles())
    return
    VarSetCapacity(nop, 6, 0)
    Loop 6 {
        NumPut(0x90, nop, A_INDEX-1, "UChar")
    }
    writeRaw(hGTA, 0x52D168, &nop, 6)
    VarSetCapacity(time, 1, 0)
    NumPut(hour, time, 0, "Int")
    writeRaw(hGTA, 0xB70153, &time, 1)
}
setWeather(id)
{
    if(!checkHandles())
    return
    VarSetCapacity(weather, 1, 0)
    NumPut(id, weather, 0, "Int")
    writeRaw(hGTA, 0xC81320, &weather, 1)
    if(ErrorLevel)
    return false
    return true
}
getSkinID() {
    if(!checkHandles())
    return -1
    dwAddress := readDWORD(hGTA, 0xB6F3B8)
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    id := readMem(hGTA, dwAddress + 0x22, 2, "UShort")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return id
}
getDialogTitle()
{
    if(!checkHandles())
    return ""
    dwAddress := readDWORD(hGTA, dwSAMP + 0x21A0B8)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    text := readString(hGTA, dwAddress + 0x40, 128)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    ErrorLevel := ERROR_OK
    return text
}
getPlayerColor(id)
{
    id += 0
    if(!checkHandles())
    return -1
    color := readDWORD(hGTA, dwSAMP + 0x216378 + 4*id)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    return color
}
setPlayerColor(id,color)
{
    id += 0
    color +=0
    if(!checkHandles())
    return
    VarSetCapacity(bla, 4, 0)
    NumPut(color,bla,0,"UInt")
    writeRaw(hGTA, dwSAMP + 0x216378 + 4*id, &bla, 4)
}
colorToStr(color)
{
    color += 0
    color >>= 8
    color &= 0xffffff
    SetFormat, IntegerFast, hex
    color += 0
    color .= ""
    StringTrimLeft, color, color, 2
    SetFormat, IntegerFast, d
    if (StrLen(color) == 5)
    color := "0"color
return "{" color "}"
}
GetInterior()
{
    dwAddress := readDWORD(hGTA, ADDR_SET_INTERIOR_OFFSET)
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return False
    }
    return True
}
getWeaponId()
{
    If(!checkHandles())
    return 0
    c := readDWORD(hGTA, ADDR_CPED_PTR)
    If(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    id := readMem(hGTA, c + 0x740)
    If(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    return id
}
writeFloat(hProcess, dwAddress, wFloat) {
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return false
    }
    wFloat := FloatToHex(wFloat)
    dwRet := DllCall(   "WriteProcessMemory"
    , "UInt", hProcess
    , "UInt", dwAddress
    , "UInt *", wFloat
    , "UInt", 4
    , "UInt *", 0)
    ErrorLevel := ERROR_OK
    return true
}
writeByte(hProcess, dwAddress, wInt) {
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return false
    }
    wInt := IntToHex(wInt)
    dwRet := DllCall(     "WriteProcessMemory"
    , "UInt", hProcess
    , "UInt", dwAddress
    , "UInt *", wInt
    , "UInt", 1
    , "UInt *", 0)
}
FloatToHex(value) {
    format := A_FormatInteger
    SetFormat, Integer, H
    result := DllCall("MulDiv", Float, value, Int, 1, Int, 1, UInt)
    SetFormat, Integer, %format%
    return, result
}
IntToHex(int)
{
    CurrentFormat := A_FormatInteger
    SetFormat, integer, hex
    int += 0
    SetFormat, integer, %CurrentFormat%
    return int
}
disconnectEx() {
    if(!checkHandles())
    return 0
    dwAddress := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET)
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    dwAddress := readDWORD(hGTA, dwAddress + 0x3c9)
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    ecx := dwAddress
    dwAddress := readDWORD(hGTA, dwAddress)
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    VarSetCapacity(injectData, 24, 0)
    NumPut(0xB9, injectData, 0, "UChar")
    NumPut(ecx, injectData, 1, "UInt")
    NumPut(0xB8, injectData, 5, "UChar")
    NumPut(dwAddress, injectData, 6, "UInt")
    NumPut(0x68, injectData, 10, "UChar")
    NumPut(0, injectData, 11, "UInt")
    NumPut(0x68, injectData, 15, "UChar")
    NumPut(500, injectData, 16, "UInt")
    NumPut(0x50FF, injectData, 20, "UShort")
    NumPut(0x08, injectData, 22, "UChar")
    NumPut(0xC3, injectData, 23, "UChar")
    writeRaw(hGTA, pInjectFunc, &injectData, 24)
    if(ErrorLevel)
    return false
    hThread := createRemoteThread(hGTA, 0, 0, pInjectFunc, 0, 0, 0)
    if(ErrorLevel)
    return false
    waitForSingleObject(hThread, 0xFFFFFFFF)
    closeProcess(hThread)
    return true
}
setrestart()
{
    VarSetCapacity(old, 4, 0)
    dwAddress := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET)
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    NumPut(9,old,0,"Int")
    writeRaw(hGTA, dwAddress + 957, &old, 4)
}
restartGameEx() {
    if(!checkHandles())
    return -1
    dwAddress := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET)
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    dwFunc := dwSAMP + 0xA060
    VarSetCapacity(injectData, 11, 0)
    NumPut(0xB9, injectData, 0, "UChar")
    NumPut(dwAddress, injectData, 1, "UInt")
    NumPut(0xE8, injectData, 5, "UChar")
    offset := dwFunc - (pInjectFunc + 10)
    NumPut(offset, injectData, 6, "Int")
    NumPut(0xC3, injectData, 10, "UChar")
    writeRaw(hGTA, pInjectFunc, &injectData, 11)
    if(ErrorLevel)
    return false
    hThread := createRemoteThread(hGTA, 0, 0, pInjectFunc, 0, 0, 0)
    if(ErrorLevel)
    return false
    waitForSingleObject(hThread, 0xFFFFFFFF)
    closeProcess(hThread)
    return true
}
getIdsInAnyVehicle()
{
    if (isPlayerInAnyVehicle())
    {
        cVeh := readDWORD(hGTA, 0xB79530)
        ids := []
        index := 0
        Loop, 8
        {
            playerId := getIdByPed(readDWORD(hGTA, cVeh + (1120 + index)))
            ids[A_Index] := playerId
            index := 4 * A_Index
        }
        return ids
    }
    return -1
}
isPlayerInStreamById(player_id, radius := 150)
{
    NAME := ""
    check := []
    p := getStreamedInPlayersInfo()
    if (!p)
    return 0
    For i, o in p
    {
        if (Floor(getDist(getCoordinates(), o.POS)) <= radius)
        {
            NAME .= o.NAME ", "
        }
    }
    NAME .= getusername() ", "
    NAME := Trim(NAME, ", ")
    if (IsObject(player_id))
    {
        for k, v in player_id
        {
            Loop, Parse, % NAME, % ",", % " ,.`n`r"
            {
                if (A_LoopField == getPlayerNameById(v))
                {
                    i := 1
                    break
                }
            }
            if (i)
            {
                check[v] := 1
            }
            else
            {
                check[v] := 0
            }
        }
        return check
    }
    else if (!IsObject(player_id))
    {
        if (!getPlayerNameById(player_id))
        return -1
        Loop, Parse, % NAME, % ",", % " ,.`n`r"
        {
            if (A_LoopField == getPlayerNameById(player_id))
            {
                return 1
            }
        }
        return 0
    }
}
IsSAMPAvailable() {
    if(!checkHandles())
    return false
    dwChatInfo := readDWORD(hGTA, dwSAMP + ADDR_SAMP_CHATMSG_PTR)
    if(dwChatInfo == 0 || dwChatInfo == "ERROR")
    {
        return false
    }
    else
    {
        return true
    }
}
isInChat() {
    if(!checkHandles())
    return -1
    dwPtr := dwSAMP + ADDR_SAMP_INCHAT_PTR
    dwAddress := readDWORD(hGTA, dwPtr) + ADDR_SAMP_INCHAT_PTR_OFF
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    dwInChat := readDWORD(hGTA, dwAddress)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    if(dwInChat > 0) {
        return true
    } else {
        return false
    }
}
getUsername() {
    if(!checkHandles())
    return ""
    dwAddress := dwSAMP + ADDR_SAMP_USERNAME
    sUsername := readString(hGTA, dwAddress, 25)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    ErrorLevel := ERROR_OK
    return sUsername
}
getId() {
    s:=getUsername()
    return getPlayerIdByName(s)
}
SendChat(wText) {
    wText := "" wText
    if(!checkHandles())
    return false
    dwFunc:=0
    if(SubStr(wText, 1, 1) == "/") {
        dwFunc := dwSAMP + FUNC_SAMP_SENDCMD
    } else {
        dwFunc := dwSAMP + FUNC_SAMP_SENDSAY
    }
    callWithParams(hGTA, dwFunc, [["s", wText]], false)
    ErrorLevel := ERROR_OK
    return true
}
ProcessReadMemory(address, processIDorName, type := "Int", numBytes := 4) {
    VarSetCapacity(buf, numBytes, 0)
    Process Exist, %processIDorName%
    if !processID := ErrorLevel
    return -1
    if !processHandle := DllCall("OpenProcess", "Int", 24, "UInt", 0, "UInt", processID, "Ptr")
    return -1
    result := DllCall("ReadProcessMemory", "Ptr", processHandle, "Ptr", address, "Ptr", &buf, "Ptr", numBytes, "PtrP", numBytesRead, "UInt")
    if !DllCall("CloseHandle", "Ptr", processHandle, "UInt") && !result
    return -1
    if !result
    return -1
    if !numBytesRead
    return -1
    return (type = "Str") ? StrGet(&buf, numBytes) : NumGet(buf, type)
}
ProcessWriteMemory(data, address, processIDorName, type := "Int", numBytes := 4) {
    VarSetCapacity(buf, numBytes, 0)
    (type = "Str") ? StrPut(data, &buf, numBytes) : NumPut(data, buf, type)
    Process Exist, %processIDorName%
    if !processID := ErrorLevel
    return
    if !processHandle := DllCall("OpenProcess", "Int", 40, "UInt", 0, "UInt", processID, "Ptr")
    throw Exception("Failed to open process.`n`nError code:`t" . A_LastError)
    result := DllCall("WriteProcessMemory", "Ptr", processHandle, "Ptr", address, "Ptr", &buf, "Ptr", numBytes, "UInt", 0, "UInt")
    if !DllCall("CloseHandle", "Ptr", processHandle, "UInt") && !result
    throw Exception("Failed to close process handle.`n`nError code:`t" . A_LastError)
    if !result
    return
    return result
}
addChatMessage(wText) {
    wText := "" wText
    if(!checkHandles())
    return false
    dwFunc := dwSAMP + FUNC_SAMP_ADDTOCHATWND
    dwChatInfo := readDWORD(hGTA, dwSAMP + ADDR_SAMP_CHATMSG_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return false
    }
    callWithParams(hGTA, dwFunc, [["p", dwChatInfo], ["s", wText]], true)
    ErrorLevel := ERROR_OK
    return true
}
showGameText(wText, dwTime, dwSize) {
    wText := "" wText
    dwTime += 0
    dwTime := Floor(dwTime)
    dwSize += 0
    dwSize := Floor(dwSize)
    if(!checkHandles())
    return false
    dwFunc := dwSAMP + FUNC_SAMP_SHOWGAMETEXT
    callWithParams(hGTA, dwFunc, [["s", wText], ["i", dwTime], ["i", dwSize]], false)
    ErrorLevel := ERROR_OK
    return true
}
playAudioStream(wUrl) {
    wUrl := "" wUrl
    if(!checkHandles())
    return false
    dwFunc := dwSAMP + FUNC_SAMP_PLAYAUDIOSTR
    patchRadio()
    callWithParams(hGTA, dwFunc, [["s", wUrl], ["i", 0], ["i", 0], ["i", 0], ["i", 0], ["i", 0]], false)
    unPatchRadio()
    ErrorLevel := ERROR_OK
    return true
}
stopAudioStream() {
    if(!checkHandles())
    return false
    dwFunc := dwSAMP + FUNC_SAMP_STOPAUDIOSTR
    patchRadio()
    callWithParams(hGTA, dwFunc, [["i", 1]], false)
    unPatchRadio()
    ErrorLevel := ERROR_OK
    return true
}
patchRadio()
{
    if(!checkHandles())
    return false
    VarSetCapacity(nop, 4, 0)
    NumPut(0x90909090,nop,0,"UInt")
    dwFunc := dwSAMP + FUNC_SAMP_PLAYAUDIOSTR
    writeRaw(hGTA, dwFunc, &nop, 4)
    writeRaw(hGTA, dwFunc+4, &nop, 1)
    dwFunc := dwSAMP + FUNC_SAMP_STOPAUDIOSTR
    writeRaw(hGTA, dwFunc, &nop, 4)
    writeRaw(hGTA, dwFunc+4, &nop, 1)
    return true
}
unPatchRadio()
{
    if(!checkHandles())
    return false
    VarSetCapacity(old, 4, 0)
    dwFunc := dwSAMP + FUNC_SAMP_PLAYAUDIOSTR
    NumPut(0x74003980,old,0,"UInt")
    writeRaw(hGTA, dwFunc, &old, 4)
    NumPut(0x39,old,0,"UChar")
    writeRaw(hGTA, dwFunc+4, &old, 1)
    dwFunc := dwSAMP + FUNC_SAMP_STOPAUDIOSTR
    NumPut(0x74003980,old,0,"UInt")
    writeRaw(hGTA, dwFunc, &old, 4)
    NumPut(0x09,old,0,"UChar")
    writeRaw(hGTA, dwFunc+4, &old, 1)
    return true
}
blockChatInput() {
    if(!checkHandles())
    return false
    VarSetCapacity(nop, 2, 0)
    dwFunc := dwSAMP + FUNC_SAMP_SENDSAY
    NumPut(0x04C2,nop,0,"Short")
    writeRaw(hGTA, dwFunc, &nop, 2)
    dwFunc := dwSAMP + FUNC_SAMP_SENDCMD
    writeRaw(hGTA, dwFunc, &nop, 2)
    return true
}
unBlockChatInput() {
    if(!checkHandles())
    return false
    VarSetCapacity(nop, 2, 0)
    dwFunc := dwSAMP + FUNC_SAMP_SENDSAY
    NumPut(0xA164,nop,0,"Short")
    writeRaw(hGTA, dwFunc, &nop, 2)
    dwFunc := dwSAMP + FUNC_SAMP_SENDCMD
    writeRaw(hGTA, dwFunc, &nop, 2)
    return true
}
getServerName() {
    if(!checkHandles())
    return -1
    dwAdress := readMem(hGTA, dwSAMP + 0x21A0F8, 4, "int")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    if(!dwAdress)
    return -1
    ServerName := readString(hGTA, dwAdress + 0x121, 200)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return ServerName
}
getServerIP() {
    if(!checkHandles())
    return -1
    dwAdress := readMem(hGTA, dwSAMP + 0x21A0F8, 4, "int")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    if(!dwAdress)
    return -1
    ServerIP := readString(hGTA, dwAdress + 0x20, 100)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return ServerIP
}
getServerPort() {
    if(!checkHandles())
    return -1
    dwAdress := readMem(hGTA, dwSAMP + 0x21A0F8, 4, "int")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    if(!dwAdress)
    return -1
    ServerPort := readMem(hGTA, dwAdress + 0x225, 4, "int")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return ServerPort
}
getWeatherID() {
    if(!checkHandles())
    return -1
    dwGTA := getModuleBaseAddress("gta_sa.exe", hGTA)
    WeatherID := readMem(hGTA, dwGTA + 0xC81320, 2, "byte")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return WeatherID
}
getWeatherName() {
    if(isPlayerInAnyVehicle() == 0)
    return -1
    if(id >= 0 && id < 23)
    {
        return oweatherNames[id-1]
    }
    return ""
}
isTargetDriverbyId(dwId)
{
    if(!checkHandles())
    return -1
    dwPedPointer := getPedById(dwId)
    dwAddrVPtr := getVehiclePointerByPed(dwPedPointer)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    dwVal := readDWORD(hGTA, dwAddrVPtr + ADDR_VEHICLE_DRIVER)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return (dwVal == dwPedPointer)
}
getTargetPed() {
    if(!checkHandles())
    return 0
    dwAddress := readDWORD(hGTA, 0xB6F3B8)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    if(!dwAddress)
    return 0
    dwAddress := readDWORD(hGTA, dwAddress+0x79C)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    ErrorLevel := ERROR_OK
    return dwAddress
}
calcScreenCoors(fX,fY,fZ)
{
    if(!checkHandles())
    return false
    dwM := 0xB6FA2C
    m_11 := readFloat(hGTA, dwM + 0*4)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return false
    }
    m_12 := readFloat(hGTA, dwM + 1*4)
    m_13 := readFloat(hGTA, dwM + 2*4)
    m_21 := readFloat(hGTA, dwM + 4*4)
    m_22 := readFloat(hGTA, dwM + 5*4)
    m_23 := readFloat(hGTA, dwM + 6*4)
    m_31 := readFloat(hGTA, dwM + 8*4)
    m_32 := readFloat(hGTA, dwM + 9*4)
    m_33 := readFloat(hGTA, dwM + 10*4)
    m_41 := readFloat(hGTA, dwM + 12*4)
    m_42 := readFloat(hGTA, dwM + 13*4)
    m_43 := readFloat(hGTA, dwM + 14*4)
    dwLenX := readDWORD(hGTA, 0xC17044)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return false
    }
    dwLenY := readDWORD(hGTA, 0xC17048)
    frX := fZ * m_31 + fY * m_21 + fX * m_11 + m_41
    frY := fZ * m_32 + fY * m_22 + fX * m_12 + m_42
    frZ := fZ * m_33 + fY * m_23 + fX * m_13 + m_43
    fRecip := 1.0/frZ
    frX *= fRecip * dwLenX
    frY *= fRecip * dwLenY
    if(frX<=dwLenX && frY<=dwLenY && frZ>1)
    return [frX,frY,frZ]
}
ConvertCarColor(Color)
{
    ArrayRGB := ["0xF5F5F5FF", "0x2A77A1FF", "0x840410FF", "0x263739FF", "0x86446EFF", "0xD78E10FF", "0x4C75B7FF", "0xBDBEC6FF", "0x5E7072FF", "0x46597AFF", "0x656A79FF", "0x5D7E8DFF", "0x58595AFF", "0xD6DAD6FF", "0x9CA1A3FF", "0x335F3FFF", "0x730E1AFF", "0x7B0A2AFF", "0x9F9D94FF", "0x3B4E78FF", "0x732E3EFF", "0x691E3BFF", "0x96918CFF", "0x515459FF", "0x3F3E45FF", "0xA5A9A7FF", "0x635C5AFF", "0x3D4A68FF", "0x979592FF", "0x421F21FF", "0x5F272BFF", "0x8494ABFF", "0x767B7CFF", "0x646464FF", "0x5A5752FF", "0x252527FF", "0x2D3A35FF", "0x93A396FF", "0x6D7A88FF", "0x221918FF", "0x6F675FFF", "0x7C1C2AFF", "0x5F0A15FF", "0x193826FF", "0x5D1B20FF", "0x9D9872FF", "0x7A7560FF", "0x989586FF", "0xADB0B0FF", "0x848988FF", "0x304F45FF", "0x4D6268FF", "0x162248FF", "0x272F4BFF", "0x7D6256FF", "0x9EA4ABFF", "0x9C8D71FF", "0x6D1822FF", "0x4E6881FF", "0x9C9C98FF", "0x917347FF", "0x661C26FF", "0x949D9FFF", "0xA4A7A5FF", "0x8E8C46FF", "0x341A1EFF", "0x6A7A8CFF", "0xAAAD8EFF", "0xAB988FFF", "0x851F2EFF", "0x6F8297FF", "0x585853FF", "0x9AA790FF", "0x601A23FF", "0x20202CFF", "0xA4A096FF", "0xAA9D84FF", "0x78222BFF", "0x0E316DFF", "0x722A3FFF", "0x7B715EFF", "0x741D28FF", "0x1E2E32FF", "0x4D322FFF", "0x7C1B44FF", "0x2E5B20FF", "0x395A83FF", "0x6D2837FF", "0xA7A28FFF", "0xAFB1B1FF", "0x364155FF", "0x6D6C6EFF", "0x0F6A89FF", "0x204B6BFF", "0x2B3E57FF", "0x9B9F9DFF", "0x6C8495FF", "0x4D8495FF", "0xAE9B7FFF", "0x406C8FFF", "0x1F253BFF", "0xAB9276FF", "0x134573FF", "0x96816CFF", "0x64686AFF", "0x105082FF", "0xA19983FF", "0x385694FF", "0x525661FF", "0x7F6956FF", "0x8C929AFF", "0x596E87FF", "0x473532FF", "0x44624FFF", "0x730A27FF", "0x223457FF", "0x640D1BFF", "0xA3ADC6FF", "0x695853FF", "0x9B8B80FF", "0x620B1CFF", "0x5B5D5EFF", "0x624428FF", "0x731827FF", "0x1B376DFF", "0xEC6AAEFF", "0x000000FF"]
    ArrayRGBNew := ["0x177517FF", "0x210606FF", "0x125478FF", "0x452A0DFF", "0x571E1EFF", "0x010701FF", "0x25225AFF", "0x2C89AAFF", "0x8A4DBDFF", "0x35963AFF", "0xB7B7B7FF", "0x464C8DFF", "0x84888CFF", "0x817867FF", "0x817A26FF", "0x6A506FFF", "0x583E6FFF", "0x8CB972FF", "0x824F78FF", "0x6D276AFF", "0x1E1D13FF", "0x1E1306FF", "0x1F2518FF", "0x2C4531FF", "0x1E4C99FF", "0x2E5F43FF", "0x1E9948FF", "0x1E9999FF", "0x999976FF", "0x7C8499FF", "0x992E1EFF", "0x2C1E08FF", "0x142407FF", "0x993E4DFF", "0x1E4C99FF", "0x198181FF", "0x1A292AFF", "0x16616FFF", "0x1B6687FF", "0x6C3F99FF", "0x481A0EFF", "0x7A7399FF", "0x746D99FF", "0x53387EFF", "0x222407FF", "0x3E190CFF", "0x46210EFF", "0x991E1EFF", "0x8D4C8DFF", "0x805B80FF", "0x7B3E7EFF", "0x3C1737FF", "0x733517FF", "0x781818FF", "0x83341AFF", "0x8E2F1CFF", "0x7E3E53FF", "0x7C6D7CFF", "0x020C02FF", "0x072407FF", "0x163012FF", "0x16301BFF", "0x642B4FFF", "0x368452FF", "0x999590FF", "0x818D96FF", "0x99991EFF", "0x7F994CFF", "0x839292FF", "0x788222FF", "0x2B3C99FF", "0x3A3A0BFF", "0x8A794EFF", "0x0E1F49FF", "0x15371CFF", "0x15273AFF", "0x375775FF", "0x060820FF", "0x071326FF", "0x20394BFF", "0x2C5089FF", "0x15426CFF", "0x103250FF", "0x241663FF", "0x692015FF", "0x8C8D94FF", "0x516013FF", "0x090F02FF", "0x8C573AFF", "0x52888EFF", "0x995C52FF", "0x99581EFF", "0x993A63FF", "0x998F4EFF", "0x99311EFF", "0x0D1842FF", "0x521E1EFF", "0x42420DFF", "0x4C991EFF", "0x082A1DFF", "0x96821DFF", "0x197F19FF", "0x3B141FFF", "0x745217FF", "0x893F8DFF", "0x7E1A6CFF", "0x0B370BFF", "0x27450DFF", "0x071F24FF", "0x784573FF", "0x8A653AFF", "0x732617FF", "0x319490FF", "0x56941DFF", "0x59163DFF", "0x1B8A2FFF", "0x38160BFF", "0x041804FF", "0x355D8EFF", "0x2E3F5BFF", "0x561A28FF", "0x4E0E27FF", "0x706C67FF", "0x3B3E42FF", "0x2E2D33FF", "0x7B7E7DFF", "0x4A4442FF", "0x28344EFF"]
    if (Color > 0) and (Color < 128)
    RGB := ArrayRGB[Color]
    if (Color > 127) and (Color < 256)
    {
        RGB := ArrayRGBNew[Color + 127]
    }
    StringLeft, RGBTemp, RGB, 8
    StringRight, RGB, RGBTemp, 6
    if Color = 0
    RGB := "000000"
    return RGB
}
getPedById(dwId) {
    dwId += 0
    dwId := Floor(dwId)
    if(dwId < 0 || dwId >= SAMP_PLAYER_MAX)
    return 0
    if(iRefreshScoreboard+iUpdateTick > A_TickCount)
    {
        if(oScoreboardData[dwId])
        {
            if(oScoreboardData[dwId].HasKey("PED"))
            return oScoreboardData[dwId].PED
        }
        return 0
    }
    if(!updateOScoreboardData())
    return 0
    if(oScoreboardData[dwId])
    {
        if(oScoreboardData[dwId].HasKey("PED"))
        return oScoreboardData[dwId].PED
    }
    return 0
}
getIdByPed(dwPed) {
    dwPed += 0
    dwPed := Floor(dwPed)
    if(!dwPed)
    return -1
    if(iRefreshScoreboard+iUpdateTick > A_TickCount)
    {
        For i, o in oScoreboardData
        {
            if(o.HasKey("PED"))
            {
                if(o.PED==dwPed)
                return i
            }
        }
        return -1
    }
    if(!updateOScoreboardData())
    return -1
    For i, o in oScoreboardData
    {
        if(o.HasKey("PED"))
        {
            if(o.PED==dwPed)
            return i
        }
    }
    return -1
}
IsInAFK()
{
    res := ProcessReadMemory(0xBA6748 + 0x5C, "gta_sa.exe")
    if (res==-1)
    return -1
    WinGet, win, MinMax, GTA:SA:MP
    if ((res=0) and (win=-1)) or res=1
    return 1
    return 0
}
getStreamedInPlayersInfo() {
    r:=[]
    if(iRefreshScoreboard+iUpdateTick > A_TickCount)
    {
        For i, o in oScoreboardData
        {
            if(o.HasKey("PED"))
            {
                p := getPedCoordinates(o.PED)
                if(p)
                {
                    o.POS := p
                    r[i] := o
                }
            }
        }
        return r
    }
    if(!updateOScoreboardData())
    return ""
    For i, o in oScoreboardData
    {
        if(o.HasKey("PED"))
        {
            p := getPedCoordinates(o.PED)
            if(p)
            {
                o.POS := p
                r[i] := o
            }
        }
    }
    return r
}
callFuncForAllStreamedInPlayers(cfunc,dist=0x7fffffff) {
    cfunc := "" cfunc
    dist += 0
    if(!IsFunc(cfunc))
    return false
    p := getStreamedInPlayersInfo()
    if(!p)
    return false
    if(dist<0x7fffffff)
    {
        lpos := getCoordinates()
        if(!lpos)
        return false
        For i, o in p
        {
            if(dist>getDist(lpos,o.POS))
            %cfunc%(o)
        }
    }
    else
    {
        For i, o in p
        %cfunc%(o)
    }
    return true
}
getDist(pos1,pos2) {
    if(!pos1 || !pos2)
    return 0
    return Sqrt((pos1[1]-pos2[1])*(pos1[1]-pos2[1])+(pos1[2]-pos2[2])*(pos1[2]-pos2[2])+(pos1[3]-pos2[3])*(pos1[3]-pos2[3]))
}
getDist2D(pos1, pos2)
{
    if(!pos1 || !pos2)
    return 0
    return Sqrt((pos1[1]-pos2[1])*(pos1[1]-pos2[1])+(pos1[2]-pos2[2])*(pos1[2]-pos2[2]))
}
getClosestPlayerPed() {
    dist := 0x7fffffff
    p := getStreamedInPlayersInfo()
    if(!p)
    return -1
    lpos := getCoordinates()
    if(!lpos)
    return -1
    id := -1
    For i, o in p
    {
        t:=getDist(lpos,o.POS)
        if(t<dist)
        {
            dist := t
            id := i
        }
    }
    PED := getPedById(id)
    return PED
}
getClosestPlayerId() {
    dist := 0x7fffffff
    p := getStreamedInPlayersInfo()
    if(!p)
    return -1
    lpos := getCoordinates()
    if(!lpos)
    return -1
    id := -1
    For i, o in p
    {
        t:=getDist(lpos,o.POS)
        if(t<dist)
        {
            dist := t
            id := i
        }
    }
    return id
}
CountOnlinePlayers()
{
    if(!checkHandles())
    return -1
    dwOnline := readDWORD(hGTA, dwSAMP + 0x21A0B4)
    if(ErrorLevel)
    {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    dwAddr := dwOnline + 0x4
    OnlinePlayers := readDWORD(hGTA, dwAddr)
    if(ErrorLevel)
    {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return OnlinePlayers
}
getPedCoordinates(dwPED) {
    dwPED += 0
    dwPED := Floor(dwPED)
    if(!dwPED)
    return ""
    if(!checkHandles())
    return ""
    dwAddress := readDWORD(hGTA, dwPED + 0x14)
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    fX := readFloat(hGTA, dwAddress + 0x30)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    fY := readFloat(hGTA, dwAddress + 0x34)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    fZ := readFloat(hGTA, dwAddress + 0x38)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    ErrorLevel := ERROR_OK
    return [fX, fY, fZ]
}
getTargetPos(dwId) {
    dwId += 0
    dwId := Floor(dwId)
    if(dwId < 0 || dwId >= SAMP_PLAYER_MAX)
    return ""
    if(iRefreshScoreboard+iUpdateTick > A_TickCount)
    {
        if(oScoreboardData[dwId])
        {
            if(oScoreboardData[dwId].HasKey("PED"))
            return getPedCoordinates(oScoreboardData[dwId].PED)
            if(oScoreboardData[dwId].HasKey("MPOS"))
            return oScoreboardData[dwId].MPOS
        }
        return ""
    }
    if(!updateOScoreboardData())
    return ""
    if(oScoreboardData[dwId])
    {
        if(oScoreboardData[dwId].HasKey("PED"))
        return getPedCoordinates(oScoreboardData[dwId].PED)
        if(oScoreboardData[dwId].HasKey("MPOS"))
        return oScoreboardData[dwId].MPOS
    }
    return ""
}
getTargetPlayerSkinIdByPed(dwPED) {
    if(!checkHandles())
    return -1
    dwAddr := dwPED + ADDR_CPED_SKINIDOFF
    SkinID := readMem(hGTA, dwAddr, 2, "byte")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return SkinID
}
getTargetPlayerSkinIdById(dwId) {
    if(!checkHandles())
    return -1
    dwPED := getPedById(dwId)
    dwAddr := dwPED + ADDR_CPED_SKINIDOFF
    SkinID := readMem(hGTA, dwAddr, 2, "byte")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return SkinID
}
NearPlayerInCar(dist)
{
    TempDist := 100
    if not dist dist := TempDist
    p := getStreamedInPlayersInfo()
    if(!p)
    return
    lpos := getCoordinates()
    if(!lpos)
    return
    For i, o in p
    {
        t:=getDist(lpos,o.POS)
        if(t<=dist)
        {
            if (t < TempDist) and ( t > 5 ) and getTargetVehicleModelNameById(i)
            {
                TempId := i
                TempDist := t
            }
        }
    }
    return TempId
}
getVehiclePointerByPed(dwPED) {
    dwPED += 0
    dwPED := Floor(dwPED)
    if(!dwPED)
    return 0
    if(!checkHandles())
    return 0
    dwAddress := readDWORD(hGTA, dwPED + 0x58C)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    ErrorLevel := ERROR_OK
    return dwAddress
}
getVehiclePointerById(dwId) {
    if(!dwId)
    return 0
    if(!checkHandles())
    return 0
    dwPed_By_Id := getPedById(dwId)
    dwAddress := readDWORD(hGTA, dwPed_By_Id + 0x58C)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    ErrorLevel := ERROR_OK
    return dwAddress
}
isTargetInAnyVehicleByPed(dwPED)
{
    if(!checkHandles())
    return -1
    dwVehiclePointer := getVehiclePointerByPed(dwPedPointer)
    if(dwVehiclePointer > 0)
    {
        return 1
    }
    else if(dwVehiclePointer <= 0)
    {
        return 0
    }
    else
    {
        return -1
    }
}
isTargetInAnyVehiclebyId(dwId)
{
    if(!checkHandles())
    return -1
    dwPedPointer := getPedById(dwId)
    dwVehiclePointer := getVehiclePointerByPed(dwPedPointer)
    if(dwVehiclePointer > 0)
    {
        return 1
    }
    else if(dwVehiclePointer <= 0)
    {
        return 0
    }
    else
    {
        return -1
    }
}
getTargetVehicleHealthByPed(dwPed) {
    if(!checkHandles())
    return -1
    dwVehPtr := getVehiclePointerByPed(dwPed)
    dwAddr := dwVehPtr + ADDR_VEHICLE_HPOFF
    fHealth := readFloat(hGTA, dwAddr)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return Round(fHealth)
}
getTargetVehicleHealthById(dwId) {
    if(!checkHandles())
    return -1
    dwVehPtr := getVehiclePointerById(dwId)
    dwAddr := dwVehPtr + ADDR_VEHICLE_HPOFF
    fHealth := readFloat(hGTA, dwAddr)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return Round(fHealth)
}
getTargetVehicleTypeByPed(dwPED) {
    if(!checkHandles())
    return 0
    dwAddr := getVehiclePointerByPed(dwPED)
    if(!dwAddr)
    return 0
    cVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_TYPE, 1, "Char")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    ErrorLevel := ERROR_OK
    if(!cVal)
    {
        mid := getVehicleModelId()
        Loop % oAirplaneModels.MaxIndex()
        {
            if(oAirplaneModels[A_Index]==mid)
            return 5
        }
        return 1
    }
    else if(cVal==5)
    return 2
    else if(cVal==6)
    return 3
    else if(cVal==9)
    {
        mid := getVehicleModelId()
        Loop % oBikeModels.MaxIndex()
        {
            if(oBikeModels[A_Index]==mid)
            return 6
        }
        return 4
    }
    return 0
}
getTargetVehicleTypeById(dwId) {
    if(!checkHandles())
    return 0
    dwAddr := getVehiclePointerById(dwId)
    if(!dwAddr)
    return 0
    cVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_TYPE, 1, "Char")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    ErrorLevel := ERROR_OK
    if(!cVal)
    {
        mid := getVehicleModelId()
        Loop % oAirplaneModels.MaxIndex()
        {
            if(oAirplaneModels[A_Index]==mid)
            return 5
        }
        return 1
    }
    else if(cVal==5)
    return 2
    else if(cVal==6)
    return 3
    else if(cVal==9)
    {
        mid := getVehicleModelId()
        Loop % oBikeModels.MaxIndex()
        {
            if(oBikeModels[A_Index]==mid)
            return 6
        }
        return 4
    }
    return 0
}
getTargetVehicleModelIdByPed(dwPED) {
    if(!checkHandles())
    return 0
    dwAddr := getVehiclePointerByPed(dwPED)
    if(!dwAddr)
    return 0
    sVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_MODEL, 2, "Short")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    ErrorLevel := ERROR_OK
    return sVal
}
getTargetVehicleModelIdById(dwId) {
    if(!checkHandles())
    return 0
    dwAddr := getVehiclePointerById(dwId)
    if(!dwAddr)
    return 0
    sVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_MODEL, 2, "Short")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    ErrorLevel := ERROR_OK
    return sVal
}
getTargetVehicleModelNameByPed(dwPED) {
    id := getTargetVehicleModelIdByPed(dwPED)
    if(id > 399 && id < 612)
    {
        return ovehicleNames[id-399]
    }
    return ""
}
getTargetVehicleModelNameById(dwId) {
    id := getTargetVehicleModelIdById(dwId)
    if(id > 399 && id < 612)
    {
        return ovehicleNames[id-399]
    }
    return ""
}
getTargetVehicleLightStateByPed(dwPED) {
    if(!checkHandles())
    return -1
    dwAddr := getVehiclePointerByPed(dwPED)
    if(!dwAddr)
    return -1
    dwVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_LIGHTSTATE, 4, "Int")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return (dwVal>0)
}
getTargetVehicleLightStateById(dwId) {
    if(!checkHandles())
    return -1
    dwAddr := getVehiclePointerById(dwId)
    if(!dwAddr)
    return -1
    dwVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_LIGHTSTATE, 4, "Int")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return (dwVal>0)
}
getTargetVehicleLockStateByPed(dwPED) {
    if(!checkHandles())
    return -1
    dwAddr := getVehiclePointerByPed(dwPED)
    if(!dwAddr)
    return -1
    dwVal := readDWORD(hGTA, dwAddr + ADDR_VEHICLE_DOORSTATE)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return (dwVal==2)
}
getTargetVehicleLockStateById(dwId) {
    if(!checkHandles())
    return -1
    dwAddr := getVehiclePointerById(dwId)
    if(!dwAddr)
    return -1
    dwVal := readDWORD(hGTA, dwAddr + ADDR_VEHICLE_DOORSTATE)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return (dwVal==2)
}
getTargetVehicleColor1byPed(dwPED) {
    if(!checkHandles())
    return 0
    dwAddr := getVehiclePointerByPed(dwPED)
    if(!dwAddr)
    return 0
    sVal := readMem(hGTA, dwAddr + 1076, 1, "byte")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    ErrorLevel := ERROR_OK
    return sVal
}
getTargetVehicleColor1byId(dwId) {
    if(!checkHandles())
    return 0
    dwAddr := getVehiclePointerById(dwId)
    if(!dwAddr)
    return 0
    sVal := readMem(hGTA, dwAddr + 1076, 1, "byte")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    ErrorLevel := ERROR_OK
    return sVal
}
getTargetVehicleColor2byPed(dwPED) {
    if(!checkHandles())
    return 0
    dwAddr := getVehiclePointerByPed(dwPED)
    if(!dwAddr)
    return 0
    sVal := readMem(hGTA, dwAddr + 1077, 1, "byte")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    ErrorLevel := ERROR_OK
    return sVal
}
getTargetVehicleColor2byId(dwId) {
    if(!checkHandles())
    return 0
    dwAddr := getVehiclePointerById(dwId)
    if(!dwAddr)
    return 0
    sVal := readMem(hGTA, dwAddr + 1077, 1, "byte")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    ErrorLevel := ERROR_OK
    return sVal
}
getTargetVehicleSpeedByPed(dwPED) {
    if(!checkHandles())
    return -1
    dwAddr := getVehiclePointerByPed(dwPED)
    fSpeedX := readMem(hGTA, dwAddr + ADDR_VEHICLE_X, 4, "float")
    fSpeedY := readMem(hGTA, dwAddr + ADDR_VEHICLE_Y, 4, "float")
    fSpeedZ := readMem(hGTA, dwAddr + ADDR_VEHICLE_Z, 4, "float")
    fVehicleSpeed :=  sqrt((fSpeedX * fSpeedX) + (fSpeedY * fSpeedY) + (fSpeedZ * fSpeedZ))
    fVehicleSpeed := (fVehicleSpeed * 100) * 1.43
    return fVehicleSpeed
}
getTargetVehicleSpeedById(dwId) {
    if(!checkHandles())
    return -1
    dwAddr := getVehiclePointerById(dwId)
    fSpeedX := readMem(hGTA, dwAddr + ADDR_VEHICLE_X, 4, "float")
    fSpeedY := readMem(hGTA, dwAddr + ADDR_VEHICLE_Y, 4, "float")
    fSpeedZ := readMem(hGTA, dwAddr + ADDR_VEHICLE_Z, 4, "float")
    fVehicleSpeed :=  sqrt((fSpeedX * fSpeedX) + (fSpeedY * fSpeedY) + (fSpeedZ * fSpeedZ))
    fVehicleSpeed := (fVehicleSpeed * 100) * 1.43
    return fVehicleSpeed
}
getPlayerNameById(dwId) {
    dwId += 0
    dwId := Floor(dwId)
    if(dwId < 0 || dwId >= SAMP_PLAYER_MAX)
    return ""
    if(iRefreshScoreboard+iUpdateTick > A_TickCount)
    {
        if(oScoreboardData[dwId])
        return oScoreboardData[dwId].NAME
        return ""
    }
    if(!updateOScoreboardData())
    return ""
    if(oScoreboardData[dwId])
    return oScoreboardData[dwId].NAME
    return ""
}
getPlayerIdByName(wName) {
    wName := "" wName
    if(StrLen(wName) < 1 || StrLen(wName) > 24)
    return -1
    if(iRefreshScoreboard+iUpdateTick > A_TickCount)
    {
        For i, o in oScoreboardData
        {
            if(InStr(o.NAME,wName)==1)
            return i
        }
        return -1
    }
    if(!updateOScoreboardData())
    return -1
    For i, o in oScoreboardData
    {
        if(InStr(o.NAME,wName)==1)
        return i
    }
    return -1
}
getPlayerScoreById(dwId) {
    dwId += 0
    dwId := Floor(dwId)
    if(dwId < 0 || dwId >= SAMP_PLAYER_MAX)
    return ""
    if(iRefreshScoreboard+iUpdateTick > A_TickCount)
    {
        if(oScoreboardData[dwId])
        return oScoreboardData[dwId].SCORE
        return ""
    }
    if(!updateOScoreboardData())
    return ""
    if(oScoreboardData[dwId])
    return oScoreboardData[dwId].SCORE
    return ""
}
getPlayerPingById(dwId) {
    dwId += 0
    dwId := Floor(dwId)
    if(dwId < 0 || dwId >= SAMP_PLAYER_MAX)
    return -1
    if(iRefreshScoreboard+iUpdateTick > A_TickCount)
    {
        if(oScoreboardData[dwId])
        return oScoreboardData[dwId].PING
        return -1
    }
    if(!updateOScoreboardData())
    return -1
    if(oScoreboardData[dwId])
    return oScoreboardData[dwId].PING
    return -1
}
isNPCById(dwId) {
    dwId += 0
    dwId := Floor(dwId)
    if(dwId < 0 || dwId >= SAMP_PLAYER_MAX)
    return -1
    if(iRefreshScoreboard+iUpdateTick > A_TickCount)
    {
        if(oScoreboardData[dwId])
        return oScoreboardData[dwId].ISNPC
        return -1
    }
    if(!updateOScoreboardData())
    return -1
    if(oScoreboardData[dwId])
    return oScoreboardData[dwId].ISNPC
    return -1
}
updateScoreboardDataEx() {
    if(!checkHandles())
    return false
    dwAddress := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET)
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return false
    }
    dwFunc := dwSAMP + FUNC_UPDATESCOREBOARD
    VarSetCapacity(injectData, 11, 0)
    NumPut(0xB9, injectData, 0, "UChar")
    NumPut(dwAddress, injectData, 1, "UInt")
    NumPut(0xE8, injectData, 5, "UChar")
    offset := dwFunc - (pInjectFunc + 10)
    NumPut(offset, injectData, 6, "Int")
    NumPut(0xC3, injectData, 10, "UChar")
    writeRaw(hGTA, pInjectFunc, &injectData, 11)
    if(ErrorLevel)
    return false
    hThread := createRemoteThread(hGTA, 0, 0, pInjectFunc, 0, 0, 0)
    if(ErrorLevel)
    return false
    waitForSingleObject(hThread, 0xFFFFFFFF)
    closeProcess(hThread)
    return true
}
updateOScoreboardData() {
    if(!checkHandles())
    return 0
    oScoreboardData := []
    if(!updateScoreboardDataEx())
    return 0
    iRefreshScoreboard := A_TickCount
    dwAddress := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET)
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    dwAddress := readDWORD(hGTA, dwAddress + SAMP_PPOOLS_OFFSET)
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    dwPlayers := readDWORD(hGTA, dwAddress + SAMP_PPOOL_PLAYER_OFFSET)
    if(ErrorLevel || dwPlayers==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    wID := readMem(hGTA, dwPlayers + SAMP_SLOCALPLAYERID_OFFSET, 2, "Short")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    dwPing := readMem(hGTA, dwPlayers + SAMP_ILOCALPLAYERPING_OFFSET, 4, "Int")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    dwScore := readMem(hGTA, dwPlayers + SAMP_ILOCALPLAYERSCORE_OFFSET, 4, "Int")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    dwTemp := readMem(hGTA, dwPlayers + SAMP_ISTRLEN_LOCALPLAYERNAME_OFFSET, 4, "Int")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    sUsername := ""
    if(dwTemp <= 0xf) {
        sUsername := readString(hGTA, dwPlayers + SAMP_SZLOCALPLAYERNAME_OFFSET, 16)
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
    }
    else {
        dwAddress := readDWORD(hGTA, dwPlayers + SAMP_PSZLOCALPLAYERNAME_OFFSET)
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        sUsername := readString(hGTA, dwAddress, 25)
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
    }
    oScoreboardData[wID] := Object("NAME", sUsername, "ID", wID, "PING", dwPing, "SCORE", dwScore, "ISNPC", 0)
    Loop, % SAMP_PLAYER_MAX
    {
        i := A_Index-1
        dwRemoteplayer := readDWORD(hGTA, dwPlayers+SAMP_PREMOTEPLAYER_OFFSET+i*4)
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        if(dwRemoteplayer==0)
        continue
        dwPing := readMem(hGTA, dwRemoteplayer + SAMP_IPING_OFFSET, 4, "Int")
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        dwScore := readMem(hGTA, dwRemoteplayer + SAMP_ISCORE_OFFSET, 4, "Int")
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        dwIsNPC := readMem(hGTA, dwRemoteplayer + SAMP_ISNPC_OFFSET, 4, "Int")
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        dwTemp := readMem(hGTA, dwRemoteplayer + SAMP_ISTRLENNAME___OFFSET, 4, "Int")
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        sUsername := ""
        if(dwTemp <= 0xf)
        {
            sUsername := readString(hGTA, dwRemoteplayer+SAMP_SZPLAYERNAME_OFFSET, 16)
            if(ErrorLevel) {
                ErrorLevel := ERROR_READ_MEMORY
                return 0
            }
        }
        else {
            dwAddress := readDWORD(hGTA, dwRemoteplayer + SAMP_PSZPLAYERNAME_OFFSET)
            if(ErrorLevel || dwAddress==0) {
                ErrorLevel := ERROR_READ_MEMORY
                return 0
            }
            sUsername := readString(hGTA, dwAddress, 25)
            if(ErrorLevel) {
                ErrorLevel := ERROR_READ_MEMORY
                return 0
            }
        }
        o := Object("NAME", sUsername, "ID", i, "PING", dwPing, "SCORE", dwScore, "ISNPC", dwIsNPC)
        oScoreboardData[i] := o
        dwRemoteplayerData := readDWORD(hGTA, dwRemoteplayer + 0x0)
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        if(dwRemoteplayerData==0)
        continue
        dwAddress := readDWORD(hGTA, dwRemoteplayerData + 489)
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        if(dwAddress)
        {
            ix := readMem(hGTA, dwRemoteplayerData + 493, 4, "Int")
            if(ErrorLevel) {
                ErrorLevel := ERROR_READ_MEMORY
                return 0
            }
            iy := readMem(hGTA, dwRemoteplayerData + 497, 4, "Int")
            if(ErrorLevel) {
                ErrorLevel := ERROR_READ_MEMORY
                return 0
            }
            iz := readMem(hGTA, dwRemoteplayerData + 501, 4, "Int")
            if(ErrorLevel) {
                ErrorLevel := ERROR_READ_MEMORY
                return 0
            }
            o.MPOS := [ix, iy, iz]
        }
        dwpSAMP_Actor := readDWORD(hGTA, dwRemoteplayerData + 0x0)
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        if(dwpSAMP_Actor==0)
        continue
        dwPed := readDWORD(hGTA, dwpSAMP_Actor + 676)
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        if(dwPed==0)
        continue
        o.PED := dwPed
        fHP := readFloat(hGTA, dwRemoteplayerData + 444)
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        fARMOR := readFloat(hGTA, dwRemoteplayerData + 440)
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        o.HP := fHP
        o.ARMOR := fARMOR
    }
    ErrorLevel := ERROR_OK
    return 1
}
GetChatLine(Line, ByRef Output, timestamp=0, color=0){
    chatindex := 0
    FileRead, file, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
    loop, Parse, file, `n, `r
    {
        if(A_LoopField)
        chatindex := A_Index
    }
    loop, Parse, file, `n, `r
    {
        if(A_Index = chatindex - line){
            output := A_LoopField
            break
        }
    }
    file := ""
    if(!timestamp)
output := RegExReplace(output, "U)^\[\d{2}:\d{2}:\d{2}\]")
    if(!color)
output := RegExReplace(output, "Ui)\{[a-f0-9]{6}\}")
    return
}
getPlayerHealth() {
    if(!checkHandles())
    return -1
    dwCPedPtr := readDWORD(hGTA, ADDR_CPED_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    dwAddr := dwCPedPtr + ADDR_CPED_HPOFF
    fHealth := readFloat(hGTA, dwAddr)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return Round(fHealth)
}
getPlayerArmor() {
    if(!checkHandles())
    return -1
    dwCPedPtr := readDWORD(hGTA, ADDR_CPED_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    dwAddr := dwCPedPtr + ADDR_CPED_ARMOROFF
    fHealth := readFloat(hGTA, dwAddr)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return Round(fHealth)
}
getPlayerInteriorId() {
    if(!checkHandles())
    return -1
    iid := readMem(hGTA, ADDR_CPED_INTID, 4, "Int")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return iid
}
getPlayerSkinID() {
    if(!checkHandles())
    return -1
    dwCPedPtr := readDWORD(hGTA, ADDR_CPED_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    dwAddr := dwCPedPtr + ADDR_CPED_SKINIDOFF
    SkinID := readMem(hGTA, dwAddr, 2, "byte")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return SkinID
}
getPlayerMoney() {
    if(!checkHandles())
    return ""
    money := readMem(hGTA, ADDR_CPED_MONEY, 4, "Int")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    ErrorLevel := ERROR_OK
    return money
}
getPlayerWanteds()
{
    if(!checkHandles())
    return -1
    return ProcessReadMemory(0x58DB60, "gta_sa.exe", "Byte", 1)
}
getPlayerWeaponId() {
    if(!checkHandles())
    return 0
    WaffenId := readMem(hGTA, 0xBAA410, 4, "byte")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    return WaffenId
}
getPlayerWeaponName() {
    id := getPlayerWeaponId()
    if(id >= 0 && id < 44)
    {
        return oweaponNames[id+1]
    }
    return ""
}
getPlayerState() {
    if(!checkHandles())
    return -1
    dwCPedPtr := readDWORD(hGTA, ADDR_CPED_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    State := readDWORD(hGTA, dwCPedPtr + 0x530)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return State
}
IsPlayerInMenu() {
    if(!checkHandles())
    return -1
    IsInMenu := readMem(hGTA, 0xBA67A4, 4, "byte")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return IsInMenu
}
getPlayerMapPosX() {
    if(!checkHandles())
    return -1
    MapPosX := readFloat(hGTA, 0xBA67B8)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return MapPosX
}
getPlayerMapPosY() {
    if(!checkHandles())
    return -1
    MapPosY := readFloat(hGTA, 0xBA67BC)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return MapPosY
}
getPlayerMapZoom() {
    if(!checkHandles())
    return -1
    MapZoom := readFloat(hGTA, 0xBA67AC)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return MapZoom
}
IsPlayerFreezed() {
    if(!checkHandles())
    return -1
    dwGTA := getModuleBaseAddress("gta_sa.exe", hGTA)
    IPF := readMem(hGTA, dwGTA + 0x690495, 2, "byte")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return IPF
}
isPlayerInAnyVehicle()
{
    if(!checkHandles())
    return -1
    dwVehPtr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    return (dwVehPtr > 0)
}
isPlayerDriver() {
    if(!checkHandles())
    return -1
    dwAddr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    if(!dwAddr)
    return -1
    dwCPedPtr := readDWORD(hGTA, ADDR_CPED_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    dwVal := readDWORD(hGTA, dwAddr + ADDR_VEHICLE_DRIVER)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return (dwVal==dwCPedPtr)
}
getVehicleHealth() {
    if(!checkHandles())
    return -1
    dwVehPtr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    dwAddr := dwVehPtr + ADDR_VEHICLE_HPOFF
    fHealth := readFloat(hGTA, dwAddr)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return Round(fHealth)
}
getVehicleType() {
    if(!checkHandles())
    return 0
    dwAddr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    if(!dwAddr)
    return 0
    cVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_TYPE, 1, "Char")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    ErrorLevel := ERROR_OK
    if(!cVal)
    {
        mid := getVehicleModelId()
        Loop % oAirplaneModels.MaxIndex()
        {
            if(oAirplaneModels[A_Index]==mid)
            return 5
        }
        return 1
    }
    else if(cVal==5)
    return 2
    else if(cVal==6)
    return 3
    else if(cVal==9)
    {
        mid := getVehicleModelId()
        Loop % oBikeModels.MaxIndex()
        {
            if(oBikeModels[A_Index]==mid)
            return 6
        }
        return 4
    }
    return 0
}
getVehicleModelId() {
    if(!checkHandles())
    return 0
    dwAddr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    if(!dwAddr)
    return 0
    sVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_MODEL, 2, "Short")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    ErrorLevel := ERROR_OK
    return sVal
}
getVehicleModelName() {
    id:=getVehicleModelId()
    if(id > 399 && id < 612)
    {
        return ovehicleNames[id-399]
    }
    return ""
}
getVehicleLightState() {
    if(!checkHandles())
    return -1
    dwAddr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    if(!dwAddr)
    return -1
    dwVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_LIGHTSTATE, 4, "Int")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return (dwVal>0)
}
getVehicleEngineState() {
    if(!checkHandles())
    return -1
    dwAddr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    if(!dwAddr)
    return -1
    cVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_ENGINESTATE, 1, "Char")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return (cVal==24 || cVal==56 || cVal==88 || cVal==120)
}
getVehicleSirenState() {
    if(!checkHandles())
    return -1
    dwAddr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    if(!dwAddr)
    return -1
    cVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_SIRENSTATE, 1, "Char")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return (cVal==-48)
}
getVehicleLockState() {
    if(!checkHandles())
    return -1
    dwAddr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    if(!dwAddr)
    return -1
    dwVal := readDWORD(hGTA, dwAddr + ADDR_VEHICLE_DOORSTATE)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return (dwVal==2)
}
getVehicleColor1() {
    if(!checkHandles())
    return 0
    dwAddr := readDWORD(hGTA, 0xBA18FC)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    if(!dwAddr)
    return 0
    sVal := readMem(hGTA, dwAddr + 1076, 1, "byte")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    ErrorLevel := ERROR_OK
    return sVal
}
getVehicleColor2() {
    if(!checkHandles())
    return 0
    dwAddr := readDWORD(hGTA, 0xBA18FC)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    if(!dwAddr)
    return 0
    sVal := readMem(hGTA, dwAddr + 1077, 1, "byte")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    ErrorLevel := ERROR_OK
    return sVal
}
getVehicleSpeed() {
    if(!checkHandles())
    return -1
    dwAddr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    fSpeedX := readMem(hGTA, dwAddr + ADDR_VEHICLE_X, 4, "float")
    fSpeedY := readMem(hGTA, dwAddr + ADDR_VEHICLE_Y, 4, "float")
    fSpeedZ := readMem(hGTA, dwAddr + ADDR_VEHICLE_Z, 4, "float")
    fVehicleSpeed :=  sqrt((fSpeedX * fSpeedX) + (fSpeedY * fSpeedY) + (fSpeedZ * fSpeedZ))
    fVehicleSpeed := (fVehicleSpeed * 100) * 1.43
    return fVehicleSpeed
}
getPlayerRadiostationID() {
    if(!checkHandles())
    return -1
    if(isPlayerInAnyVehicle() == 0)
    return -1
    dwGTA := getModuleBaseAddress("gta_sa.exe", hGTA)
    RadioStationID := readMem(hGTA, dwGTA + 0x4CB7E1, 1, "byte")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    return RadioStationID
}
getPlayerRadiostationName() {
    if(isPlayerInAnyVehicle() == 0)
    return -1
    id := getPlayerRadiostationID()
    if(id == 0)
    return -1
    if(id >= 0 && id < 14)
    {
        return oradiostationNames[id]
    }
    return ""
}
setCheckpoint(fX, fY, fZ, fSize ) {
    if(!checkHandles())
    return false
    dwFunc := dwSAMP + 0x9D340
    dwAddress := readDWORD(hGTA, dwSAMP + ADDR_SAMP_INCHAT_PTR)
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return false
    }
    VarSetCapacity(buf, 16, 0)
    NumPut(fX, buf, 0, "Float")
    NumPut(fY, buf, 4, "Float")
    NumPut(fZ, buf, 8, "Float")
    NumPut(fSize, buf, 12, "Float")
    writeRaw(hGTA, pParam1, &buf, 16)
    dwLen := 31
    VarSetCapacity(injectData, dwLen, 0)
    NumPut(0xB9, injectData, 0, "UChar")
    NumPut(dwAddress, injectData, 1, "UInt")
    NumPut(0x68, injectData, 5, "UChar")
    NumPut(pParam1+12, injectData, 6, "UInt")
    NumPut(0x68, injectData, 10, "UChar")
    NumPut(pParam1, injectData, 11, "UInt")
    NumPut(0xE8, injectData, 15, "UChar")
    offset := dwFunc - (pInjectFunc + 20)
    NumPut(offset, injectData, 16, "Int")
    NumPut(0x05C7, injectData, 20, "UShort")
    NumPut(dwAddress+0x24, injectData, 22, "UInt")
    NumPut(1, injectData, 26, "UInt")
    NumPut(0xC3, injectData, 30, "UChar")
    writeRaw(hGTA, pInjectFunc, &injectData, dwLen)
    if(ErrorLevel)
    return false
    hThread := createRemoteThread(hGTA, 0, 0, pInjectFunc, 0, 0, 0)
    if(ErrorLevel)
    return false
    waitForSingleObject(hThread, 0xFFFFFFFF)
    closeProcess(hThread)
    ErrorLevel := ERROR_OK
    return true
}
disableCheckpoint()
{
    if(!checkHandles())
    return false
    dwAddress := readDWORD(hGTA, dwSAMP + ADDR_SAMP_INCHAT_PTR)
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return false
    }
    VarSetCapacity(enablecp, 4, 0)
    NumPut(0,enablecp,0,"Int")
    writeRaw(hGTA, dwAddress+0x24, &enablecp, 4)
    ErrorLevel := ERROR_OK
    return true
}
IsMarkerCreated(){
    If(!checkHandles())
    return false
    active := readMem(hGTA, CheckpointCheck, 1, "byte")
    If(!active)
    return 0
    else return 1
}
CoordsFromRedmarker(){
    if(!checkhandles())
    return false
    for i, v in rmaddrs
    f%i% := readFloat(hGTA, v)
    return [f1, f2, f3]
}
getCoordinates() {
    if(!checkHandles())
    return ""
    fX := readFloat(hGTA, ADDR_POSITION_X)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    fY := readFloat(hGTA, ADDR_POSITION_Y)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    fZ := readFloat(hGTA, ADDR_POSITION_Z)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    ErrorLevel := ERROR_OK
    return [fX, fY, fZ]
}
GetPlayerPos(ByRef fX,ByRef fY,ByRef fZ) {
    if(!checkHandles())
    return 0
    fX := readFloat(hGTA, ADDR_POSITION_X)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    fY := readFloat(hGTA, ADDR_POSITION_Y)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    fZ := readFloat(hGTA, ADDR_POSITION_Z)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    ErrorLevel := ERROR_OK
}
getDialogStructPtr() {
    if (!checkHandles()) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return false
    }
    dwPointer := readDWORD(hGTA, dwSAMP + SAMP_DIALOG_STRUCT_PTR)
    if (ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return false
    }
    ErrorLevel := ERROR_OK
    return dwPointer
}
isDialogOpen() {
    dwPointer := getDialogStructPtr()
    if (ErrorLevel || !dwPointer)
    return false
    dwIsOpen := readMem(hGTA, dwPointer + SAMP_DIALOG_OPEN_OFFSET, 4, "UInt")
    if (ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return false
    }
    ErrorLevel := ERROR_OK
    return dwIsOpen ? true : false
}
getDialogStyle() {
    dwPointer := getDialogStructPtr()
    if (ErrorLevel || !dwPointer)
    return -1
    style := readMem(hGTA, dwPointer + SAMP_DIALOG_STYLE_OFFSET, 4, "UInt")
    if (ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return style
}
getDialogID() {
    dwPointer := getDialogStructPtr()
    if (ErrorLevel || !dwPointer)
    return -1
    id := readMem(hGTA, dwPointer + SAMP_DIALOG_ID_OFFSET, 4, "UInt")
    if (ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return id
}
setDialogID(id) {
    dwPointer := getDialogStructPtr()
    if (ErrorLevel || !dwPointer)
    return false
    writeMemory(hGTA, dwPointer + SAMP_DIALOG_ID_OFFSET, id, "UInt", 4)
    if (ErrorLevel) {
        ErrorLevel := ERROR_WRITE_MEMORY
        return false
    }
    ErrorLevel := ERROR_OK
    return true
}
getDialogIndex() {
    dwPointer := getDialogStructPtr()
    if (ErrorLevel || !dwPointer)
    return 0
    dwPointer := readDWORD(hGTA, dwPointer + SAMP_DIALOG_PTR1_OFFSET)
    if (ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    index := readMem(hGTA, dwPointer + SAMP_DIALOG_INDEX_OFFSET, 1, "Byte")
    if (ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    ErrorLevel := ERROR_OK
    return index + 1
}
getDialogCaption() {
    dwPointer := getDialogStructPtr()
    if (ErrorLevel || !dwPointer)
    return ""
    text := readString(hGTA, dwPointer + SAMP_DIALOG_CAPTION_OFFSET, 64)
    if (ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    ErrorLevel := ERROR_OK
    return text
}
getDialogTextSize(dwAddress) {
    i := 0
    Loop, 4096 {
        i := A_Index - 1
        byte := Memory_ReadByte(hGTA, dwAddress + i)
        if (!byte)
        break
    }
    return i
}
getDialogText() {
    dwPointer := getDialogStructPtr()
    if (ErrorLevel || !dwPointer)
    return ""
    dwPointer := readDWORD(hGTA, dwPointer + SAMP_DIALOG_TEXT_PTR_OFFSET)
    if (ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    text := readString(hGTA, dwPointer, 4096)
    if (ErrorLevel) {
        text := readString(hGTA, dwPointer, getDialogTextSize(dwPointer))
        if (ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return ""
        }
    }
    ErrorLevel := ERROR_OK
    return text
}
getDialogLineCount() {
    dwPointer := getDialogStructPtr()
    if (ErrorLevel || !dwPointer)
    return 0
    dwPointer := readDWORD(hGTA, dwPointer + SAMP_DIALOG_PTR2_OFFSET)
    if (ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    count := readMem(hGTA, dwPointer + SAMP_DIALOG_LINECOUNT_OFFSET, 4, "UInt")
    if (ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    ErrorLevel := ERROR_OK
    return count
}
getDialogLine__(index) {
    if (getDialogLineCount > index)
    return ""
    dwPointer := getDialogStructPtr()
    if (ErrorLevel || !dwPointer)
    return ""
    dwPointer := readDWORD(hGTA, dwPointer + SAMP_DIALOG_PTR1_OFFSET)
    if (ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    dwPointer := readDWORD(hGTA, dwPointer + SAMP_DIALOG_LINES_OFFSET)
    if (ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    dwLineAddress := readDWORD(hGTA, dwPointer + (index - 1) * 0x4)
    line := readString(hGTA, dwLineAddress, 128)
    ErrorLevel := ERROR_OK
    return line
}
getDialogLine(index) {
    lines := getDialogLines()
    if (index > lines.Length())
    return ""
    if (getDialogStyle() == DIALOG_STYLE_TABLIST_HEADERS)
    index++
    return lines[index]
}
getDialogLines() {
    text := getDialogText()
    if (text == "")
    return -1
    lines := StrSplit(text, "`n")
    return lines
}
isDialogButtonSelected(btn := 1) {
    dwPointer := getDialogStructPtr()
    if (ErrorLevel || !dwPointer)
    return false
    dwPointer := readDWORD(hGTA, dwPointer + SAMP_DIALOG_PTR2_OFFSET)
    if (ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    offset := (btn == 1 ? 0x165 : 0x2C5)
    sel := readMem(hGTA, dwPointer + offset, 1, "Byte")
    if (ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return false
    }
    ErrorLevel := ERROR_OK
    return sel
}
isDialogButton1Selected() {
    return isDialogButtonSelected(1)
}
isDialogButton2Selected() {
    return isDialogButtonSelected(2)
}
getDialogLines__() {
    count := getDialogLineCount()
    dwPointer := getDialogStructPtr()
    if (ErrorLevel || !dwPointer)
    return -1
    dwPointer := readDWORD(hGTA, dwPointer + SAMP_DIALOG_PTR1_OFFSET)
    if (ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    dwPointer := readDWORD(hGTA, dwPointer + SAMP_DIALOG_LINES_OFFSET)
    if (ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    lines := []
    Loop %count% {
        dwLineAddress := readDWORD(hGTA, dwPointer + (A_Index - 1) * 0x4)
        lines[A_Index] := readString(hGTA, dwLineAddress, 128)
    }
    ErrorLevel := ERROR_OK
    return lines
}
showDialog(style, caption, text, button1, button2 := "", id := 1) {
    Sleep, 200
    AntiCrash()
    style += 0
    style := Floor(style)
    id += 0
    id := Floor(id)
    caption := "" caption
    text := "" text
    button1 := "" button1
    button2 := "" button2
    if (id < 0 || id > 32767 || style < 0 || style > 5 || StrLen(caption) > 64 || StrLen(text) > 4096 || StrLen(button1) > 10 || StrLen(button2) > 10)
    return false
    if (!checkHandles())
    return false
    dwFunc := dwSAMP + FUNC_SAMP_SHOWDIALOG
    dwAddress := readDWORD(hGTA, dwSAMP + SAMP_DIALOG_STRUCT_PTR)
    if (ErrorLevel || !dwAddress) {
        ErrorLevel := ERROR_READ_MEMORY
        return false
    }
    writeString(hGTA, pParam5, caption)
    if (ErrorLevel)
    return false
    writeString(hGTA, pParam1, text)
    if (ErrorLevel)
    return false
    writeString(hGTA, pParam5 + 512, button1)
    if (ErrorLevel)
    return false
    writeString(hGTA, pParam5+StrLen(caption) + 1, button2)
    if (ErrorLevel)
    return false
    dwLen := 5 + 7 * 5 + 5 + 1
    VarSetCapacity(injectData, dwLen, 0)
    NumPut(0xB9, injectData, 0, "UChar")
    NumPut(dwAddress, injectData, 1, "UInt")
    NumPut(0x68, injectData, 5, "UChar")
    NumPut(1, injectData, 6, "UInt")
    NumPut(0x68, injectData, 10, "UChar")
    NumPut(pParam5 + StrLen(caption) + 1, injectData, 11, "UInt")
    NumPut(0x68, injectData, 15, "UChar")
    NumPut(pParam5 + 512, injectData, 16, "UInt")
    NumPut(0x68, injectData, 20, "UChar")
    NumPut(pParam1, injectData, 21, "UInt")
    NumPut(0x68, injectData, 25, "UChar")
    NumPut(pParam5, injectData, 26, "UInt")
    NumPut(0x68, injectData, 30, "UChar")
    NumPut(style, injectData, 31, "UInt")
    NumPut(0x68, injectData, 35, "UChar")
    NumPut(id, injectData, 36, "UInt")
    NumPut(0xE8, injectData, 40, "UChar")
    offset := dwFunc - (pInjectFunc + 45)
    NumPut(offset, injectData, 41, "Int")
    NumPut(0xC3, injectData, 45, "UChar")
    writeRaw(hGTA, pInjectFunc, &injectData, dwLen)
    if (ErrorLevel)
    return false
    hThread := createRemoteThread(hGTA, 0, 0, pInjectFunc, 0, 0, 0)
    if (ErrorLevel)
    return false
    waitForSingleObject(hThread, 0xFFFFFFFF)
    closeProcess(hThread)
    AntiCrash()
    return true
}
calculateZone(posX, posY, posZ) {
    if ( bInitZaC == 0 )
    {
        initZonesAndCities()
        bInitZaC := 1
    }
    Loop % nZone-1
    {
        if (posX >= zone%A_Index%_x1) && (posY >= zone%A_Index%_y1) && (posZ >= zone%A_Index%_z1) && (posX <= zone%A_Index%_x2) && (posY <= zone%A_Index%_y2) && (posZ <= zone%A_Index%_z2)
        {
            ErrorLevel := ERROR_OK
            return zone%A_Index%_name
        }
    }
    ErrorLevel := ERROR_ZONE_NOT_FOUND
    return "Неизвестно"
}
calculateCity(posX, posY, posZ) {
    if ( bInitZaC == 0 )
    {
        initZonesAndCities()
        bInitZaC := 1
    }
    smallestCity := "Неизвестно"
    currentCitySize := 0
    smallestCitySize := 0
    Loop % nCity-1
    {
        if (posX >= city%A_Index%_x1) && (posY >= city%A_Index%_y1) && (posZ >= city%A_Index%_z1) && (posX <= city%A_Index%_x2) && (posY <= city%A_Index%_y2) && (posZ <= city%A_Index%_z2)
        {
            currentCitySize := ((city%A_Index%_x2 - city%A_Index%_x1) * (city%A_Index%_y2 - city%A_Index%_y1) * (city%A_Index%_z2 - city%A_Index%_z1))
            if (smallestCity == "Неизвестно") || (currentCitySize < smallestCitySize)
            {
                smallestCity := city%A_Index%_name
                smallestCitySize := currentCitySize
            }
        }
    }
    if(smallestCity == "Неизвестно") {
        ErrorLevel := ERROR_CITY_NOT_FOUND
    } else {
        ErrorLevel := ERROR_OK
    }
    return smallestCity
}
AddZone(sName, x1, y1, z1, x2, y2, z2) {
    global
    zone%nZone%_name := sName
    zone%nZone%_x1 := x1
    zone%nZone%_y1 := y1
    zone%nZone%_z1 := z1
    zone%nZone%_x2 := x2
    zone%nZone%_y2 := y2
    zone%nZone%_z2 := z2
    nZone := nZone + 1
}
AddCity(sName, x1, y1, z1, x2, y2, z2) {
    global
    city%nCity%_name := sName
    city%nCity%_x1 := x1
    city%nCity%_y1 := y1
    city%nCity%_z1 := z1
    city%nCity%_x2 := x2
    city%nCity%_y2 := y2
    city%nCity%_z2 := z2
    nCity := nCity + 1
}
IsPlayerInRangeOfPoint(_posX, _posY, _posZ, _posRadius)
{
    GetPlayerPos(posX, posY, posZ)
    X := posX -_posX
    Y := posY -_posY
    Z := posZ -_posZ
    if(((X < _posRadius) && (X > -_posRadius)) && ((Y < _posRadius) && (Y > -_posRadius)) && ((Z < _posRadius) && (Z > -_posRadius)))
    return TRUE
    return FALSE
}
IsPlayerInRangeOfPoint2D(_posX, _posY, _posRadius)
{
    GetPlayerPos(posX, posY, posZ)
    X := posX - _posX
    Y := posY - _posY
    if(((X < _posRadius) && (X > -_posRadius)) && ((Y < _posRadius) && (Y > -_posRadius)))
    return TRUE
    return FALSE
}
getPlayerZone()
{
    aktPos := getCoordinates()
    return calculateZone(aktPos[1], aktPos[2], aktPos[3])
}
getPlayerCity()
{
    aktPos := getCoordinates()
    return calculateCity(aktPos[1], aktPos[2], aktPos[3])
}
AntiCrash(){
    If(!checkHandles())
    return false
    cReport := ADDR_SAMP_CRASHREPORT
    writeMemory(hGTA, dwSAMP + cReport, 0x90909090, 4)
    cReport += 0x4
    writeMemory(hGTA, dwSAMP + cReport, 0x90, 1)
    cReport += 0x9
    writeMemory(hGTA, dwSAMP + cReport, 0x90909090, 4)
    cReport += 0x4
    writeMemory(hGTA, dwSAMP + cReport, 0x90, 1)
}
writeMemory(hProcess,address,writevalue,length=4, datatype="int") {
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return false
    }
    VarSetCapacity(finalvalue,length, 0)
    NumPut(writevalue,finalvalue,0,datatype)
    dwRet :=  DllCall(  "WriteProcessMemory"
    ,"Uint",hProcess
    ,"Uint",address
    ,"Uint",&finalvalue
    ,"Uint",length
    ,"Uint",0)
    if(dwRet == 0) {
        ErrorLevel := ERROR_WRITE_MEMORY
        return false
    }
    ErrorLevel := ERROR_OK
    return true
}
checkHandles() {
    if(iRefreshHandles+500>A_TickCount)
    return true
    iRefreshHandles:=A_TickCount
    if(!refreshGTA() || !refreshSAMP() || !refreshMemory()) {
        return false
    } else {
        return true
    }
    return true
}
refreshGTA() {
    newPID := getPID("GTA:SA:MP")
    if(!newPID) {
        if(hGTA) {
            virtualFreeEx(hGTA, pMemory, 0, 0x8000)
            closeProcess(hGTA)
            hGTA := 0x0
        }
        dwGTAPID := 0
        hGTA := 0x0
        dwSAMP := 0x0
        pMemory := 0x0
        return false
    }
    if(!hGTA || (dwGTAPID != newPID)) {
        hGTA := openProcess(newPID)
        if(ErrorLevel) {
            dwGTAPID := 0
            hGTA := 0x0
            dwSAMP := 0x0
            pMemory := 0x0
            return false
        }
        dwGTAPID := newPID
        dwSAMP := 0x0
        pMemory := 0x0
        return true
    }
    return true
}
refreshSAMP() {
    if(dwSAMP)
    return true
    dwSAMP := getModuleBaseAddress("samp.dll", hGTA)
    if(!dwSAMP)
    return false
    return true
}
refreshMemory() {
    if(!pMemory) {
        pMemory     := virtualAllocEx(hGTA, 6144, 0x1000 | 0x2000, 0x40)
        if(ErrorLevel) {
            pMemory := 0x0
            return false
        }
        pParam1     := pMemory
        pParam2     := pMemory + 1024
        pParam3     := pMemory + 2048
        pParam4     := pMemory + 3072
        pParam5     := pMemory + 4096
        pInjectFunc := pMemory + 5120
    }
    return true
}
getPID(szWindow) {
    local dwPID := 0
    WinGet, dwPID, PID, %szWindow%
    return dwPID
}
openProcess(dwPID, dwRights = 0x1F0FFF) {
    hProcess := DllCall("OpenProcess"
    , "UInt", dwRights
    , "int",  0
    , "UInt", dwPID
    , "Uint")
    if(hProcess == 0) {
        ErrorLevel := ERROR_OPEN_PROCESS
        return 0
    }
    ErrorLevel := ERROR_OK
    return hProcess
}
closeProcess(hProcess) {
    if(hProcess == 0) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return 0
    }
    dwRet := DllCall(    "CloseHandle"
    , "Uint", hProcess
    , "UInt")
    ErrorLevel := ERROR_OK
}
getModuleBaseAddress(sModule, hProcess) {
    if(!sModule) {
        ErrorLevel := ERROR_MODULE_NOT_FOUND
        return 0
    }
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return 0
    }
    dwSize = 1024*4
    VarSetCapacity(hMods, dwSize)
    VarSetCapacity(cbNeeded, 4)
    dwRet := DllCall(    "Psapi.dll\EnumProcessModules"
    , "UInt", hProcess
    , "UInt", &hMods
    , "UInt", dwSize
    , "UInt*", cbNeeded
    , "UInt")
    if(dwRet == 0) {
        ErrorLevel := ERROR_ENUM_PROCESS_MODULES
        return 0
    }
    dwMods := cbNeeded / 4
    i := 0
    VarSetCapacity(hModule, 4)
    VarSetCapacity(sCurModule, 260)
    while(i < dwMods) {
        hModule := NumGet(hMods, i*4)
        DllCall("Psapi.dll\GetModuleFileNameEx"
        , "UInt", hProcess
        , "UInt", hModule
        , "Str", sCurModule
        , "UInt", 260)
        SplitPath, sCurModule, sFilename
        if(sModule == sFilename) {
            ErrorLevel := ERROR_OK
            return hModule
        }
        i := i + 1
    }
    ErrorLevel := ERROR_MODULE_NOT_FOUND
    return 0
}
readString(hProcess, dwAddress, dwLen) {
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return 0
    }
    VarSetCapacity(sRead, dwLen)
    dwRet := DllCall(    "ReadProcessMemory"
    , "UInt", hProcess
    , "UInt", dwAddress
    , "Str", sRead
    , "UInt", dwLen
    , "UInt*", 0
    , "UInt")
    if(dwRet == 0) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    ErrorLevel := ERROR_OK
    if A_IsUnicode
    return __ansiToUnicode(sRead)
    return sRead
}
readFloat(hProcess, dwAddress) {
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return 0
    }
    VarSetCapacity(dwRead, 4)
    dwRet := DllCall(    "ReadProcessMemory"
    , "UInt",  hProcess
    , "UInt",  dwAddress
    , "Str",   dwRead
    , "UInt",  4
    , "UInt*", 0
    , "UInt")
    if(dwRet == 0) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    ErrorLevel := ERROR_OK
    return NumGet(dwRead, 0, "Float")
}
readDWORD(hProcess, dwAddress) {
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return 0
    }
    VarSetCapacity(dwRead, 4)
    dwRet := DllCall(    "ReadProcessMemory"
    , "UInt",  hProcess
    , "UInt",  dwAddress
    , "Str",   dwRead
    , "UInt",  4
    , "UInt*", 0)
    if(dwRet == 0) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    ErrorLevel := ERROR_OK
    return NumGet(dwRead, 0, "UInt")
}
readMem(hProcess, dwAddress, dwLen=4, type="UInt") {
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return 0
    }
    VarSetCapacity(dwRead, dwLen)
    dwRet := DllCall(    "ReadProcessMemory"
    , "UInt",  hProcess
    , "UInt",  dwAddress
    , "Str",   dwRead
    , "UInt",  dwLen
    , "UInt*", 0)
    if(dwRet == 0) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    ErrorLevel := ERROR_OK
    return NumGet(dwRead, 0, type)
}
writeString(hProcess, dwAddress, wString) {
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return false
    }
    sString := wString
    if A_IsUnicode
    sString := __unicodeToAnsi(wString)
    dwRet := DllCall(    "WriteProcessMemory"
    , "UInt", hProcess
    , "UInt", dwAddress
    , "Str", sString
    , "UInt", StrLen(wString) + 1
    , "UInt", 0
    , "UInt")
    if(dwRet == 0) {
        ErrorLEvel := ERROR_WRITE_MEMORY
        return false
    }
    ErrorLevel := ERROR_OK
    return true
}
writeRaw(hProcess, dwAddress, pBuffer, dwLen) {
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return false
    }
    dwRet := DllCall(    "WriteProcessMemory"
    , "UInt", hProcess
    , "UInt", dwAddress
    , "UInt", pBuffer
    , "UInt", dwLen
    , "UInt", 0
    , "UInt")
    if(dwRet == 0) {
        ErrorLEvel := ERROR_WRITE_MEMORY
        return false
    }
    ErrorLevel := ERROR_OK
    return true
}
Memory_ReadByte(process_handle, address) {
    VarSetCapacity(value, 1, 0)
    DllCall("ReadProcessMemory", "UInt", process_handle, "UInt", address, "Str", value, "UInt", 1, "UInt *", 0)
    return, NumGet(value, 0, "Byte")
}
callWithParams(hProcess, dwFunc, aParams, bCleanupStack = true) {
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return false
    }
    validParams := 0
    i := aParams.MaxIndex()
    dwLen := i * 5    + 5    + 1
    if(bCleanupStack)
    dwLen += 3
    VarSetCapacity(injectData, i * 5    + 5       + 3       + 1, 0)
    i_ := 1
    while(i > 0) {
        if(aParams[i][1] != "") {
            dwMemAddress := 0x0
            if(aParams[i][1] == "p") {
                dwMemAddress := aParams[i][2]
            } else if(aParams[i][1] == "s") {
                if(i_>3)
                return false
                dwMemAddress := pParam%i_%
                writeString(hProcess, dwMemAddress, aParams[i][2])
                if(ErrorLevel)
                return false
                i_ += 1
            } else if(aParams[i][1] == "i") {
                dwMemAddress := aParams[i][2]
            } else {
                return false
            }
            NumPut(0x68, injectData, validParams * 5, "UChar")
            NumPut(dwMemAddress, injectData, validParams * 5 + 1, "UInt")
            validParams += 1
        }
        i -= 1
    }
    offset := dwFunc - ( pInjectFunc + validParams * 5 + 5 )
    NumPut(0xE8, injectData, validParams * 5, "UChar")
    NumPut(offset, injectData, validParams * 5 + 1, "Int")
    if(bCleanupStack) {
        NumPut(0xC483, injectData, validParams * 5 + 5, "UShort")
        NumPut(validParams*4, injectData, validParams * 5 + 7, "UChar")
        NumPut(0xC3, injectData, validParams * 5 + 8, "UChar")
    } else {
        NumPut(0xC3, injectData, validParams * 5 + 5, "UChar")
    }
    writeRaw(hGTA, pInjectFunc, &injectData, dwLen)
    if(ErrorLevel)
    return false
    hThread := createRemoteThread(hGTA, 0, 0, pInjectFunc, 0, 0, 0)
    if(ErrorLevel)
    return false
    waitForSingleObject(hThread, 0xFFFFFFFF)
    closeProcess(hThread)
    return true
}
virtualAllocEx(hProcess, dwSize, flAllocationType, flProtect) {
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return 0
    }
    dwRet := DllCall(    "VirtualAllocEx"
    , "UInt", hProcess
    , "UInt", 0
    , "UInt", dwSize
    , "UInt", flAllocationType
    , "UInt", flProtect
    , "UInt")
    if(dwRet == 0) {
        ErrorLEvel := ERROR_ALLOC_MEMORY
        return 0
    }
    ErrorLevel := ERROR_OK
    return dwRet
}
virtualFreeEx(hProcess, lpAddress, dwSize, dwFreeType) {
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return 0
    }
    dwRet := DllCall(    "VirtualFreeEx"
    , "UInt", hProcess
    , "UInt", lpAddress
    , "UInt", dwSize
    , "UInt", dwFreeType
    , "UInt")
    if(dwRet == 0) {
        ErrorLEvel := ERROR_FREE_MEMORY
        return 0
    }
    ErrorLevel := ERROR_OK
    return dwRet
}
createRemoteThread(hProcess, lpThreadAttributes, dwStackSize, lpStartAddress, lpParameter, dwCreationFlags, lpThreadId) {
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return 0
    }
    dwRet := DllCall(    "CreateRemoteThread"
    , "UInt", hProcess
    , "UInt", lpThreadAttributes
    , "UInt", dwStackSize
    , "UInt", lpStartAddress
    , "UInt", lpParameter
    , "UInt", dwCreationFlags
    , "UInt", lpThreadId
    , "UInt")
    if(dwRet == 0) {
        ErrorLEvel := ERROR_ALLOC_MEMORY
        return 0
    }
    ErrorLevel := ERROR_OK
    return dwRet
}
waitForSingleObject(hThread, dwMilliseconds) {
    if(!hThread) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return 0
    }
    dwRet := DllCall(    "WaitForSingleObject"
    , "UInt", hThread
    , "UInt", dwMilliseconds
    , "UInt")
    if(dwRet == 0xFFFFFFFF) {
        ErrorLEvel := ERROR_WAIT_FOR_OBJECT
        return 0
    }
    ErrorLevel := ERROR_OK
    return dwRet
}
__ansiToUnicode(sString, nLen = 0) {
    If !nLen
    {
        nLen := DllCall("MultiByteToWideChar"
        , "Uint", 0
        , "Uint", 0
        , "Uint", &sString
        , "int",  -1
        , "Uint", 0
        , "int",  0)
    }
    VarSetCapacity(wString, nLen * 2)
    DllCall("MultiByteToWideChar"
    , "Uint", 0
    , "Uint", 0
    , "Uint", &sString
    , "int",  -1
    , "Uint", &wString
    , "int",  nLen)
    return wString
}
__unicodeToAnsi(wString, nLen = 0) {
    pString := wString + 1 > 65536 ? wString : &wString
    If !nLen
    {
        nLen := DllCall("WideCharToMultiByte"
        , "Uint", 0
        , "Uint", 0
        , "Uint", pString
        , "int",  -1
        , "Uint", 0
        , "int",  0
        , "Uint", 0
        , "Uint", 0)
    }
    VarSetCapacity(sString, nLen)
    DllCall("WideCharToMultiByte"
    , "Uint", 0
    , "Uint", 0
    , "Uint", pString
    , "int",  -1
    , "str",  sString
    , "int",  nLen
    , "Uint", 0
    , "Uint", 0)
    return sString
}
Utf8ToAnsi(ByRef Utf8String, CodePage = 1251)
{
    If (NumGet(Utf8String) & 0xFFFFFF) = 0xBFBBEF
    BOM = 3
    Else
    BOM = 0
    UniSize := DllCall("MultiByteToWideChar", "UInt", 65001, "UInt", 0
    , "UInt", &Utf8String + BOM, "Int", -1
    , "Int", 0, "Int", 0)
    VarSetCapacity(UniBuf, UniSize * 2)
    DllCall("MultiByteToWideChar", "UInt", 65001, "UInt", 0
    , "UInt", &Utf8String + BOM, "Int", -1
    , "UInt", &UniBuf, "Int", UniSize)
    AnsiSize := DllCall("WideCharToMultiByte", "UInt", CodePage, "UInt", 0
    , "UInt", &UniBuf, "Int", -1
    , "Int", 0, "Int", 0
    , "Int", 0, "Int", 0)
    VarSetCapacity(AnsiString, AnsiSize)
    DllCall("WideCharToMultiByte", "UInt", CodePage, "UInt", 0
    , "UInt", &UniBuf, "Int", -1
    , "Str", AnsiString, "Int", AnsiSize
    , "Int", 0, "Int", 0)
    Return AnsiString
}
class CommandProcessor {
    StatusProcessor := false
CommandArray := {}
    TempText := ""
    TempCmd := ""
    SetStatusProcessor(status) {
        this.StatusProcessor := status
    }
    RegisterCommand(cmd, metka) {
        ObjRawSet(this.CommandArray, cmd, metka)
    }
    DeleteCommand(cmd) {
        this.CommandArray.Delete(cmd)
    }
}
splitStringLimit(text, limit)
{
    out := []
    index := 1
    if text Contains % "``n"
    {
        for k, v in StrSplit(text, "``n")
        {
            for key, value in splitStringLimit(v, limit)
            out[index] := value, index++
        }
        return out
    }
    for k, v in StrSplit(text, A_Space)
    {
        if (A_Index == 1)
        out[index] := v
        Else
        {
            if (StrLen(out[index] " " v) <= limit)
            out[index] .= " " v
            Else
            index++, out[index] := v
        }
    }
    return out
}
RelToAbs(root, dir, s = "\") {
    pr := SubStr(root, 1, len := InStr(root, s, "", InStr(root, s . s) + 2) - 1)
    , root := SubStr(root, len + 1), sk := 0
    If InStr(root, s, "", 0) = StrLen(root)
    StringTrimRight, root, root, 1
    If InStr(dir, s, "", 0) = StrLen(dir)
    StringTrimRight, dir, dir, 1
    Loop, Parse, dir, %s%
    {
        If A_LoopField = ..
        StringLeft, root, root, InStr(root, s, "", 0) - 1
        Else If A_LoopField =
        root =
        Else If A_LoopField != .
        Continue
        StringReplace, dir, dir, %A_LoopField%%s%
    }
    Return, pr . root . s . dir
}
GetPlayerCPed_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "API_GetPlayerCPed")
GetPlayerHealth_func 	:= DllCall("GetProcAddress", UInt, hModule, Str, "API_GetPlayerHealth")
GetPlayerArmor_func 	:= DllCall("GetProcAddress", UInt, hModule, Str, "API_GetPlayerArmor")
GetPlayerMoney_func 	:= DllCall("GetProcAddress", UInt, hModule, Str, "API_GetPlayerMoney")
GetPlayerWanteds_func 	:= DllCall("GetProcAddress", UInt, hModule, Str, "API_GetPlayerWanteds")
GetPlayerPosition_func 	:= DllCall("GetProcAddress", UInt, hModule, Str, "API_GetPlayerPosition")
IsPlayerInRangeOfPoint_func := DllCall("GetProcAddress", UInt, hModule, Str, "API_IsPlayerInRangeOfPoint")
IsPlayerInRangeOfPoint2D_func := DllCall("GetProcAddress", UInt, hModule, Str, "API_IsPlayerInRangeOfPoint2D")
IsPlayerInAnyInterior_func := DllCall("GetProcAddress", UInt, hModule, Str, "API_IsPlayerInAnyInterior")
IsPlayerFrozen_func := DllCall("GetProcAddress", UInt, hModule, Str, "API_IsPlayerFrozen")
GetPlayerWeaponSlot_func 	:= DllCall("GetProcAddress", UInt, hModule, Str, "API_GetPlayerWeaponSlot")
GetPlayerWeaponId_func 	:= DllCall("GetProcAddress", UInt, hModule, Str, "API_GetPlayerWeaponId")
GetPlayerWeaponName_func 	:= DllCall("GetProcAddress", UInt, hModule, Str, "API_GetPlayerWeaponName")
GetPlayerWeaponClip_func 	:= DllCall("GetProcAddress", UInt, hModule, Str, "API_GetPlayerWeaponClip")
GetPlayerWeaponTotalClip_func 	:= DllCall("GetProcAddress", UInt, hModule, Str, "API_GetPlayerWeaponTotalClip")
GetPlayerWeaponState_func 	:= DllCall("GetProcAddress", UInt, hModule, Str, "API_GetPlayerWeaponState")
GetPlayerState_func 	:= DllCall("GetProcAddress", UInt, hModule, Str, "API_GetPlayerState")
GetVehiclePointer_func 	:= DllCall("GetProcAddress", UInt, hModule, Str, "API_GetVehiclePointer")
GetVehicleModelId_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "API_GetVehicleModelId")
GetVehicleModelName_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "API_GetVehicleModelName")
GetVehicleModelNameById_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "API_GetVehicleModelNameById")
GetVehicleType_func 	:= DllCall("GetProcAddress", UInt, hModule, Str, "API_GetVehicleType")
GetVehicleHealth_func 	:= DllCall("GetProcAddress", UInt, hModule, Str, "API_GetVehicleHealth")
GetVehicleRadioStation_func := DllCall("GetProcAddress", UInt, hModule, Str, "API_GetVehicleRadioStation")
GetVehicleRadioStationName_func := DllCall("GetProcAddress", UInt, hModule, Str, "API_GetVehicleRadioStationName")
GetVehicleFreeSeats_func := DllCall("GetProcAddress", UInt, hModule, Str, "API_GetVehicleFreeSeats")
GetVehicleSpeed_func := DllCall("GetProcAddress", UInt, hModule, Str, "API_GetVehicleSpeed")
GetVehicleFirstColor_func := DllCall("GetProcAddress", UInt, hModule, Str, "API_GetVehicleFirstColor")
GetVehicleSecondColor_func := DllCall("GetProcAddress", UInt, hModule, Str, "API_GetVehicleSecondColor")
GetVehicleColor_func := DllCall("GetProcAddress", UInt, hModule, Str, "API_GetVehicleColor")
GetVehicleColorRGB_func := DllCall("GetProcAddress", UInt, hModule, Str, "API_GetVehicleColorRGB")
GetVehicleColorARGB_func := DllCall("GetProcAddress", UInt, hModule, Str, "API_GetVehicleColorARGB")
IsPlayerInAnyVehicle_func := DllCall("GetProcAddress", UInt, hModule, Str, "API_IsPlayerInAnyVehicle")
IsPlayerDriver_func 	:= DllCall("GetProcAddress", UInt, hModule, Str, "API_IsPlayerDriver")
IsPlayerPassenger_func 	:= DllCall("GetProcAddress", UInt, hModule, Str, "API_IsPlayerPassenger")
IsVehicleSeatUsed_func 	:= DllCall("GetProcAddress", UInt, hModule, Str, "API_IsVehicleSeatUsed")
IsVehicleLocked_func 	:= DllCall("GetProcAddress", UInt, hModule, Str, "API_IsVehicleLocked")
IsVehicleSirenEnabled_func 	:= DllCall("GetProcAddress", UInt, hModule, Str, "API_IsVehicleSirenEnabled")
IsVehicleHornEnabled_func 	:= DllCall("GetProcAddress", UInt, hModule, Str, "API_IsVehicleHornEnabled")
IsVehicleAlternateSirenEnabled_func 	:= DllCall("GetProcAddress", UInt, hModule, Str, "API_IsVehicleAlternateSirenEnabled")
IsVehicleEngineEnabled_func := DllCall("GetProcAddress", UInt, hModule, Str, "API_IsVehicleEngineEnabled")
IsVehicleLightEnabled_func := DllCall("GetProcAddress", UInt, hModule, Str, "API_IsVehicleLightEnabled")
IsPlayerInCar_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "API_IsPlayerInCar")
IsPlayerInPlane_func 	:= DllCall("GetProcAddress", UInt, hModule, Str, "API_IsPlayerInPlane")
IsPlayerInBoat_func 	:= DllCall("GetProcAddress", UInt, hModule, Str, "API_IsPlayerInBoat")
IsPlayerInTrain_func 	:= DllCall("GetProcAddress", UInt, hModule, Str, "API_IsPlayerInTrain")
IsPlayerInBike_func 	:= DllCall("GetProcAddress", UInt, hModule, Str, "API_IsPlayerInBike")
TextCreate_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "API_TextCreate")
TextDestroy_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "API_TextDestroy")
TextSetShadow_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "API_TextSetShadow")
TextSetShown_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "API_TextSetShown")
TextSetColor_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "API_TextSetColor")
TextSetPos_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "API_TextSetPos")
TextSetString_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "API_TextSetString")
TextUpdate_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "API_TextUpdate")
BoxCreate_func 			:= DllCall("GetProcAddress", UInt, hModule, Str, "API_BoxCreate")
BoxDestroy_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "API_BoxDestroy")
BoxSetShown_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "API_BoxSetShown")
BoxSetBorder_func		:= DllCall("GetProcAddress", UInt, hModule, Str, "API_BoxSetBorder")
BoxSetBorderColor_func 	:= DllCall("GetProcAddress", UInt, hModule, Str, "API_BoxSetBorderColor")
BoxSetColor_func		:= DllCall("GetProcAddress", UInt, hModule, Str, "API_BoxSetColor")
BoxSetHeight_func		:= DllCall("GetProcAddress", UInt, hModule, Str, "API_BoxSetHeight")
BoxSetPos_func			:= DllCall("GetProcAddress", UInt, hModule, Str, "API_BoxSetPos")
BoxSetWidth_func		:= DllCall("GetProcAddress", UInt, hModule, Str, "API_BoxSetWidth")
LineCreate_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "API_LineCreate")
LineDestroy_func		:= DllCall("GetProcAddress", UInt, hModule, Str, "API_LineDestroy")
LineSetShown_func		:= DllCall("GetProcAddress", UInt, hModule, Str, "API_LineSetShown")
LineSetColor_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "API_LineSetColor")
LineSetWidth_func		:= DllCall("GetProcAddress", UInt, hModule, Str, "API_LineSetWidth")
LineSetPos_func			:= DllCall("GetProcAddress", UInt, hModule, Str, "API_LineSetPos")
ImageCreate_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "API_ImageCreate")
ImageDestroy_func		:= DllCall("GetProcAddress", UInt, hModule, Str, "API_ImageDestroy")
ImageSetShown_func		:= DllCall("GetProcAddress", UInt, hModule, Str, "API_ImageSetShown")
ImageSetAlign_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "API_ImageSetAlign")
ImageSetPos_func		:= DllCall("GetProcAddress", UInt, hModule, Str, "API_ImageSetPos")
ImageSetRotation_func	:= DllCall("GetProcAddress", UInt, hModule, Str, "API_ImageSetRotation")
DestroyAllVisual_func	:= DllCall("GetProcAddress", UInt, hModule, Str, "API_DestroyAllVisual")
ShowAllVisual_func		:= DllCall("GetProcAddress", UInt, hModule, Str, "API_ShowAllVisual")
HideAllVisual_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "API_HideAllVisual")
SetCallbackPointer_func 	:= DllCall("GetProcAddress", UInt, hModule, Str, "API_SetCallbackPointer")
UnSetCallbackPointer_func 	:= DllCall("GetProcAddress", UInt, hModule, Str, "API_UnSetCallbackPointer")
SetListenCallback_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "API_SetListenCallback")
UnSetListenCallback_func 	:= DllCall("GetProcAddress", UInt, hModule, Str, "API_UnSetListenCallback")
UnSetListenCallbackAll_func := DllCall("GetProcAddress", UInt, hModule, Str, "API_UnSetListenCallbackAll")
UpdateServerData_func			:= DllCall("GetProcAddress", UInt, hModule, Str, "API_UpdateServerData")
GetPlayerNameById_func			:= DllCall("GetProcAddress", UInt, hModule, Str, "API_GetPlayerNameById")
GetPlayerIdByName_func			:= DllCall("GetProcAddress", UInt, hModule, Str, "API_GetPlayerIdByName")
GetPlayerCPed()
{
    global GetPlayerCPed_func
    res :=DllCall(GetPlayerCPed_func)
    return res
}
GetPlayerHealthDLL()
{
    global GetPlayerHealth_func
    res := DllCall(GetPlayerHealth_func)
    return res
}
GetPlayerArmorDLL()
{
    global GetPlayerArmor_func
    res := DllCall(GetPlayerArmor_func)
    return res
}
GetPlayerMoneyDLL()
{
    global GetPlayerMoney_func
    res := DllCall(GetPlayerMoney_func)
    return res
}
GetPlayerWantedsDLL()
{
    global GetPlayerWanteds_func
    res := DllCall(GetPlayerWanteds_func)
    return res
}
GetPlayerPositionDLL(ByRef flo_posX, ByRef flo_posY, ByRef flo_posZ, ByRef flo_Rotation)
{
    global GetPlayerPosition_func
    res := DllCall(GetPlayerPosition_func, FloatP, flo_posX, FloatP, flo_posY, FloatP, flo_posZ,  FloatP, flo_Rotation)
    return res
}
IsPlayerInRangeOfPointDLL(flo_posX, flo_posY, flo_posZ, flo_posRadius)
{
    global IsPlayerInRangeOfPoint_func
    res := DllCall(IsPlayerInRangeOfPoint_func, Float, flo_posX, Float, flo_posY, Float, flo_posZ, Float, flo_posRadius)
    return res
}
IsPlayerInRangeOfPoint2DDLL(flo_posX, flo_posY, flo_posRadius)
{
    global IsPlayerInRangeOfPoint2D_func
    res := DllCall(IsPlayerInRangeOfPoint2D_func, Float, flo_posX, Float, flo_posY, Float, flo_posRadius)
    return res
}
IsPlayerInAnyInteriorDLL()
{
    global IsPlayerInAnyInterior_func
    res := DllCall(IsPlayerInAnyInterior_func)
    return res
}
IsPlayerFrozenDLL()
{
    global IsPlayerFrozen_func
    res := DllCall(IsPlayerFrozen_func)
    return res
}
GetPlayerWeaponSlotDLL()
{
    global GetPlayerWeaponSlot_func
    res := DllCall(GetPlayerWeaponSlot_func)
    return res
}
GetPlayerWeaponIdDLL(int_WeaponSlot)
{
    global GetPlayerWeaponId_func
    res := DllCall(GetPlayerWeaponId_func, Int, int_WeaponSlot)
    return res
}
GetPlayerWeaponNameDLL(int_WeaponSlot, ByRef str_WeapName)
{
    global GetPlayerWeaponName_func
    VarSetCapacity(str_WeapName, 32)
    res := DllCall(GetPlayerWeaponName_func, Int, int_WeaponSlot, StrP, str_WeapName)
    return res
}
GetPlayerWeaponClipDLL(int_WeaponSlot)
{
    global GetPlayerWeaponClip_func
    res := DllCall(GetPlayerWeaponClip_func, Int, int_WeaponSlot)
    return res
}
GetPlayerWeaponTotalClipDLL(int_WeaponSlot)
{
    global GetPlayerWeaponTotalClip_func
    res := DllCall(GetPlayerWeaponTotalClip_func, Int, int_WeaponSlot)
    return res
}
GetPlayerWeaponStateDLL()
{
    global GetPlayerWeaponState_func
    res := DllCall(GetPlayerWeaponState_func)
    return res
}
GetPlayerStateDLL()
{
    global GetPlayerState_func
    res := DllCall(GetPlayerState_func)
    return res
}
GetVehiclePointerDLL()
{
    global GetVehiclePointer_func
    res := DllCall(GetVehiclePointer_func)
    return res
}
GetVehicleModelIdDLL()
{
    global GetVehicleModelId_func
    res := DllCall(GetVehicleModelId_func)
    return res
}
GetVehicleModelNameDLL(ByRef str_VehicleName)
{
    global GetVehicleModelName_func
    VarSetCapacity(str_VehicleName, 32)
    res := DllCall(GetVehicleModelName_func, StrP, str_VehicleName)
    return res
}
GetVehicleModelNameByIdDLL(int_VehicleId, ByRef str_VehicleName)
{
    global GetVehicleModelNameById_func
    VarSetCapacity(str_VehicleName, 32)
    res := DllCall(GetVehicleModelNameById_func, Int, int_VehicleId, StrP, str_VehicleName)
    return res
}
GetVehicleTypeDLL()
{
    global GetVehicleType_func
    res := DllCall(GetVehicleType_func)
    return res
}
GetVehicleHealthDLL()
{
    global GetVehicleHealth_func
    res := DllCall(GetVehicleHealth_func)
    return res
}
GetVehicleRadioStationDLL()
{
    global GetVehicleRadioStation_func
    res := DllCall(GetVehicleRadioStation_func)
    return res
}
GetVehicleRadioStationNameDLL(ByRef str_RadioName)
{
    global GetVehicleRadioStationName_func
    VarSetCapacity(str_RadioName, 32)
    res := DllCall(GetVehicleRadioStationName_func, StrP, str_RadioName)
    return res
}
GetVehicleFreeSeatsDLL(ByRef int_SeatFL, ByRef int_SeatFR, ByRef int_SeatBL, ByRef int_SeatBR)
{
    global GetVehicleFreeSeats_func
    res := DllCall(GetVehicleFreeSeats_func, IntP, int_SeatFL, IntP, int_SeatFR, IntP, int_SeatBL, IntP, int_SeatBR)
    return res
}
GetVehicleSpeedDLL(float_SpeedMult)
{
    global GetVehicleSpeed_func
    res := DllCall(GetVehicleSpeed_func, Float, float_SpeedMult)
    return res
}
GetVehicleFirstColorDLL()
{
    global GetVehicleFirstColor_func
    res := DllCall(GetVehicleFirstColor_func)
    return res
}
GetVehicleSecondColorDLL()
{
    global GetVehicleSecondColor_func
    res := DllCall(GetVehicleSecondColor_func)
    return res
}
GetVehicleColorDLL(ByRef int_ColorFirst, ByRef int_ColorSecond)
{
    global GetVehicleColor_func
    res := DllCall(GetVehicleColor_func, IntP, int_ColorFirst, IntP, int_ColorSecond)
    return res
}
GetVehicleColorRGBDLL(int_Color, ByRef uint_ColorRGB)
{
    global GetVehicleColorRGB_func
    res := DllCall(GetVehicleColorRGB_func, Int, int_Color, UIntP, uint_ColorRGB)
    return res
}
GetVehicleColorARGBDLL(int_Color, ByRef uint_ColorARGB)
{
    global GetVehicleColorARGB_func
    res := DllCall(GetVehicleColorARGB_func, Int, int_Color, UIntP, uint_ColorARGB)
    return res
}
IsPlayerInAnyVehicleDLL()
{
    global IsPlayerInAnyVehicle_func
    res := DllCall(IsPlayerInAnyVehicle_func)
    return res
}
IsPlayerDriverDLL()
{
    global IsPlayerDriver_func
    res := DllCall(IsPlayerDriver_func)
    return res
}
IsPlayerPassengerDLL()
{
    global IsPlayerPassenger_func
    res := DllCall(IsPlayerPassenger_func)
    return res
}
IsVehicleSeatUsedDLL(int_SeatId)
{
    global IsVehicleSeatUsed_func
    res := DllCall(IsVehicleSeatUsed_func, int, int_SeatId)
    return res
}
IsVehicleLockedDLL()
{
    global IsVehicleLocked_func
    res := DllCall(IsVehicleLocked_func)
    return res
}
IsVehicleSirenEnabledDLL()
{
    global IsVehicleSirenEnabled_func
    res := DllCall(IsVehicleSirenEnabled_func)
    return res
}
IsVehicleHornEnabledDLL()
{
    global IsVehicleHornEnabled_func
    res := DllCall(IsVehicleHornEnabled_func)
    return res
}
IsVehicleAlternateSirenEnabledDLL()
{
    global IsVehicleAlternateSirenEnabled_func
    res := DllCall(IsVehicleAlternateSirenEnabled_func)
    return res
}
IsVehicleEngineEnabledDLL()
{
    global IsVehicleEngineEnabled_func
    res := DllCall(IsVehicleEngineEnabled_func)
    return res
}
IsVehicleLightEnabledDLL()
{
    global IsVehicleLightEnabled_func
    res := DllCall(IsVehicleLightEnabled_func)
    return res
}
IsPlayerInCarDLL()
{
    global IsPlayerInCar_func
    res := DllCall(IsPlayerInCar_func)
    return res
}
IsPlayerInPlaneDLL()
{
    global IsPlayerInPlane_func
    res := DllCall(IsPlayerInPlane_func)
    return res
}
IsPlayerInBoatDLL()
{
    global IsPlayerInBoat_func
    res := DllCall(IsPlayerInBoat_func)
    return res
}
IsPlayerInTrainDLL()
{
    global IsPlayerInTrain_func
    res := DllCall(IsPlayerInTrain_func)
    return res
}
IsPlayerInBikeDLL()
{
    global IsPlayerInBike_func
    res := DllCall(IsPlayerInBike_func)
    return res
}
TextCreate(Font, fontsize, bold, italic, x, y, color, text, shadow, show)
{
    global TextCreate_func
    res := DllCall(TextCreate_func,Str,Font,Int,fontsize,UChar,bold,UChar,italic,Int,x,Int,y,UInt,color,Str,text,UChar,shadow,UChar,show)
    return res
}
TextDestroy(id)
{
    global TextDestroy_func
    res := DllCall(TextDestroy_func,Int,id)
    return res
}
TextSetShadow(id, shadow)
{
    global TextSetShadow_func
    res := DllCall(TextSetShadow_func,Int,id,UChar,shadow)
    return res
}
TextSetShown(id, show)
{
    global TextSetShown_func
    res := DllCall(TextSetShown_func,Int,id,UChar,show)
    return res
}
TextSetColor(id,color)
{
    global TextSetColor_func
    res := DllCall(TextSetColor_func,Int,id,UInt,color)
    return res
}
TextSetPos(id,x,y)
{
    global TextSetPos_func
    res := DllCall(TextSetPos_func,Int,id,Int,x,Int,y)
    return res
}
TextSetString(id,Text)
{
    global TextSetString_func
    res := DllCall(TextSetString_func,Int,id,Str,Text)
    return res
}
TextUpdate(id,Font,Fontsize,bold,italic)
{
    global TextUpdate_func
    res := DllCall(TextUpdate_func,Int,id,Str,Font,int,Fontsize,UChar,bold,UChar,italic)
    return res
}
BoxCreate(x,y,width,height,Color,show)
{
    global BoxCreate_func
    res := DllCall(BoxCreate_func,Int,x,Int,y,Int,width,Int,height,UInt,Color,UChar,show)
    return res
}
BoxDestroy(id)
{
    global BoxDestroy_func
    res := DllCall(BoxDestroy_func,Int,id)
    return res
}
BoxSetShown(id,Show)
{
    global BoxSetShown_func
    res := DllCall(BoxSetShown_func,Int,id,UChar,Show)
    return res
}
BoxSetBorder(id,height,Show)
{
    global BoxSetBorder_func
    res := DllCall(BoxSetBorder_func,Int,id,Int,height,Int,Show)
    return res
}
BoxSetBorderColor(id,Color)
{
    global BoxSetBorderColor_func
    res := DllCall(BoxSetBorderColor_func,Int,id,UInt,Color)
    return res
}
BoxSetColor(id,Color)
{
    global BoxSetColor_func
    res := DllCall(BoxSetColor_func,Int,id,UInt,Color)
    return res
}
BoxSetHeight(id,height)
{
    global BoxSetHeight_func
    res := DllCall(BoxSetHeight_func,Int,id,Int,height)
    return res
}
BoxSetPos(id,x,y)
{
    global BoxSetPos_func
    res := DllCall(BoxSetPos_func,Int,id,Int,x,Int,y)
    return res
}
BoxSetWidth(id,width)
{
    global BoxSetWidth_func
    res := DllCall(BoxSetWidth_func,Int,id,Int,width)
    return res
}
LineCreate(x1,y1,x2,y2,width,color,show)
{
    global LineCreate_func
    res := DllCall(LineCreate_func,Int,x1,Int,y1,Int,x2,Int,y2,Int,Width,UInt,color,UChar,show)
    return res
}
LineDestroy(id)
{
    global LineDestroy_func
    res := DllCall(LineDestroy_func,Int,id)
    return res
}
LineSetShown(id,show)
{
    global LineSetShown_func
    res := DllCall(LineSetShown_func,Int,id,UChar,show)
    return res
}
LineSetColor(id,color)
{
    global LineSetColor_func
    res := DllCall(LineSetColor_func,Int,id,UInt,color)
    return res
}
LineSetWidth(id, width)
{
    global LineSetWidth_func
    res := DllCall(LineSetWidth_func,Int,id,Int,width)
    return res
}
LineSetPos(id,x1,y1,x2,y2)
{
    global LineSetPos_func
    res := DllCall(LineSetPos_func,Int,id,Int,x1,Int,y1,Int,x2,Int,y2)
    return res
}
ImageCreate(path, x, y, rotation, align, show)
{
    global ImageCreate_func
    res := DllCall(ImageCreate_func, Str, path, Int, x, Int, y, Int, rotation, Int, align, UChar, show)
    return res
}
ImageDestroy(id)
{
    global ImageDestroy_func
    res := DllCall(ImageDestroy_func,Int,id)
    return res
}
ImageSetShown(id,show)
{
    global ImageSetShown_func
    res := DllCall(ImageSetShown_func,Int,id,UChar,show)
    return res
}
ImageSetAlign(id,align)
{
    global ImageSetAlign_func
    res := DllCall(ImageSetAlign_func,Int,id,Int,align)
    return res
}
ImageSetPos(id, x, y)
{
    global ImageSetPos_func
    res := DllCall(ImageSetPos_func,Int,id,Int,x, Int, y)
    return res
}
ImageSetRotation(id, rotation)
{
    global ImageSetRotation_func
    res := DllCall(ImageSetRotation_func,Int,id,Int, rotation)
    return res
}
DestroyAllVisual()
{
    global DestroyAllVisual_func
    res := DllCall(DestroyAllVisual_func)
    return res
}
ShowAllVisual()
{
    global ShowAllVisual_func
    res := DllCall(ShowAllVisual_func)
    return res
}
HideAllVisual()
{
    global HideAllVisual_func
    res := DllCall(HideAllVisual_func )
    return res
}
SetListenCallback(int_Id)
{
    global SetListenCallback_func
    res := DllCall(SetListenCallback_func, Int, int_Id)
    return res
}
UnSetCallbackPointer()
{
    global UnSetCallbackPointer_func
    res := DllCall(UnSetCallbackPointer_func)
    return res
}
SetCallbackPointer(int_Id)
{
    global SetCallbackPointer_func
    res := DllCall(SetCallbackPointer_func, Int, int_Id)
    return res
}
UnSetListenCallback(int_Id)
{
    global UnSetListenCallback_func
    res := DllCall(UnSetListenCallback_func, Int, int_Id)
    return res
}
UnSetListenCallbackAll()
{
    global UnSetListenCallbackAll_func
    res := DllCall(UnSetListenCallbackAll_func)
    return res
}
GetCallbackHealParams(ptr_HealStruct, ByRef iOldHeal, ByRef iNewHeal)
{
    ioldHeal := NumGet(ptr_HealStruct+0, "int")
    inewHeal := NumGet(ptr_HealStruct+4, "int")
}
GetCallbackArmorParams(ptr_ArmorStruct, ByRef iOldArmor, ByRef iNewArmor)
{
    ioldArmor := NumGet(ptr_ArmorStruct+0, "int")
    inewArmor := NumGet(ptr_ArmorStruct+4, "int")
}
GetCallbackPositionParams(ptr_PositionStruct, ByRef fOldPosX, ByRef fOldPosY, ByRef fOldPosZ, ByRef fOldPosR, ByRef fNewPosX, ByRef fNewPosY, ByRef fNewPosZ, ByRef fNewPosR)
{
    fOldPosX := NumGet(ptr_PositionStruct+0, "float")
    fOldPosY := NumGet(ptr_PositionStruct+4, "float")
    fOldPosZ := NumGet(ptr_PositionStruct+8, "float")
    fOldPosR := NumGet(ptr_PositionStruct+12, "float")
    fNewPosX := NumGet(ptr_PositionStruct+16, "float")
    fNewPosY := NumGet(ptr_PositionStruct+20, "float")
    fNewPosZ := NumGet(ptr_PositionStruct+24, "float")
    fNewPosR := NumGet(ptr_PositionStruct+28, "float")
}
GetCallbackEnterExitParams(ptr_EnterExitStruct, ByRef iOldInteriorState, ByRef iNewInteriorState)
{
    iOldInteriorState := NumGet(ptr_EnterExitStruct+0, "int")
    iNewInteriorState := NumGet(ptr_EnterExitStruct+4, "int")
}
GetCallbackVehicleEnterExitParams(ptr_VehicleEnterExitStruct, ByRef iOldVehicleEnterExit, ByRef iNewVehicleEnterExit)
{
    iOldVehicleEnterExit := NumGet(ptr_VehicleEnterExitStruct+0, "int")
    iNewVehicleEnterExit := NumGet(ptr_VehicleEnterExitStruct+4, "int")
}
GetCallbackVehicleHealthParams(ptr_VehicleHealthStruct, ByRef iOldVehicleHealth, ByRef iNewVehicleHealth)
{
    iOldVehicleHealth := NumGet(ptr_VehicleHealthStruct+0, "int")
    iNewVehicleHealth := NumGet(ptr_VehicleHealthStruct+4, "int")
}
GetCallbackVehicleEngineParams(ptr_VehicleEngineStruct, ByRef iOldVehicleEngine, ByRef iNewVehicleEngine)
{
    iOldVehicleEngine := NumGet(ptr_VehicleEngineStruct+0, "int")
    iNewVehicleEngine := NumGet(ptr_VehicleEngineStruct+4, "int")
}
GetCallbackVehicleLockParams(ptr_VehicleLockStruct, ByRef iOldVehicleLock, ByRef iNewVehicleLock)
{
    iOldVehicleLock := NumGet(ptr_VehicleLockStruct+0, "int")
    iNewVehicleLock := NumGet(ptr_VehicleLockStruct+4, "int")
}
GetCallbackVehicleSpeedParams(ptr_VehicleSpeedStruct, ByRef iOldVehicleSpeed, ByRef iNewVehicleSpeed)
{
    iOldVehicleSpeed := NumGet(ptr_VehicleSpeedStruct+0, "int")
    iNewVehicleSpeed := NumGet(ptr_VehicleSpeedStruct+4, "int")
}
GetCallbackWeaponSwitchParams(ptr_WeaponSwitchStruct, ByRef iOldWeaponId, ByRef iNewWeaponId)
{
    iOldWeaponId := NumGet(ptr_WeaponSwitchStruct+0, "int")
    iNewWeaponId := NumGet(ptr_WeaponSwitchStruct+4, "int")
}
GetCallbackWeaponClipParams(ptr_WeaponClipStruct, ByRef iOldWeaponClip, ByRef iNewWeaponClip)
{
    iOldWeaponClip := NumGet(ptr_WeaponClipStruct+0, "int")
    iNewWeaponClip := NumGet(ptr_WeaponClipStruct+4, "int")
}
GetCallbackWeaponTotalClipParams(ptr_WeaponTotalClipStruct, ByRef iOldWeaponTotalClip, ByRef iNewWeaponTotalClip)
{
    iOldWeaponTotalClip := NumGet(ptr_WeaponTotalClipStruct+0, "int")
    iNewWeaponTotalClip := NumGet(ptr_WeaponTotalClipStruct+4, "int")
}
GetCallbackChatlogParams(ptr_ChatlogStruct, ByRef string)
{
    VarSetCapacity(string, 256, 0)
    string := StrGet(ptr_ChatlogStruct)
}
UpdateServerData()
{
    global UpdateServerData_func
    res := DllCall(UpdateServerData_func)
    return res
}
Utf8ToAnsi1(ByRef Utf8String, CodePage = 1251)
{
    If (NumGet(Utf8String) & 0xFFFFFF) = 0xBFBBEF
    BOM = 3
    Else
    BOM = 0
    UniSize := DllCall("MultiByteToWideChar", "UInt", 65001, "UInt", 0
    , "UInt", &Utf8String + BOM, "Int", -1
    , "Int", 0, "Int", 0)
    VarSetCapacity(UniBuf, UniSize * 2)
    DllCall("MultiByteToWideChar", "UInt", 65001, "UInt", 0
    , "UInt", &Utf8String + BOM, "Int", -1
    , "UInt", &UniBuf, "Int", UniSize)
    AnsiSize := DllCall("WideCharToMultiByte", "UInt", CodePage, "UInt", 0
    , "UInt", &UniBuf, "Int", -1
    , "Int", 0, "Int", 0
    , "Int", 0, "Int", 0)
    VarSetCapacity(AnsiString, AnsiSize)
    DllCall("WideCharToMultiByte", "UInt", CodePage, "UInt", 0
    , "UInt", &UniBuf, "Int", -1
    , "Str", AnsiString, "Int", AnsiSize
    , "Int", 0, "Int", 0)
    Return AnsiString
}
LineResult()
{
    if (!isDialogOpen())
    return false
    if (getDialogStyle() = 0 || getDialogStyle() = 1 || getDialogStyle() = 3)
    return false
    while (!GetKeyState("LButton", "P") && !GetKeyState("Enter", "P") && !GetKeyState("Esc", "P"))
    continue
    if (GetKeyState("Enter", "P"))
    return getDialogLineNumber()
    else if (GetKeyState("Esc", "P"))
    return false
    else{
        KeyWait, LButton
        KeyWait, LButton, D T0.25
        if (ErrorLevel)
        return LineResult()
        else
        return getDialogLineNumber()
    }
}
ifNotExist Healer v1.0.exe
filedelete, Healer v 1.0.exe
ifNotExist % A_appdata    "\MZ"
FileCreateDir % A_appdata    "\MZ"
ifNotExist % A_appdata    "\MZ\bind"
FileCreateDir % A_appdata    "\MZ\bind"
ifNotExist % A_appdata    "\MZ\help"
FileCreateDir % A_appdata    "\MZ\help"
ifNotExist % A_appdata    "\MZ\config.ini"
FileAppend,[global]`nsleep=2100`n[vac]`n1=600`n2=700`n3=800`n4=900, % A_appdata    "\MZ\config.ini"
ifNotExist % A_appdata "\MZ\RolePlay"
FileCreateDir % A_appdata "\MZ\RolePlay"
ifNotExist % A_appdata    "\MZ\RolePlay\invite.txt"
FileAppend,,"\MZ\RolePlay\invite.txt"
ifNotExist % A_appdata "\MZ\RolePlay\fraps.txt"
FileAppend,/me нажал на пуговицу`n/do Нагрудная камера активирована,% A_appdata "\MZ\RolePlay\fraps.txt"
ifNotExist % A_appdata "\MZ\RolePlay\heal"
FileCreateDir % A_appdata "\MZ\RolePlay\heal"
ifNotExist % A_appdata "\MZ\RolePlay\Operations"
FileCreateDir % A_appdata "\MZ\RolePlay\Operations"
ifNotExist % A_appdata "\MZ\RolePlay\heal\Головная боль.txt"
FileAppend,150`nЯ выпишу Вам препарат`n/do Мед. сумка в руке.`n/me открыл мед.сумку и достал из нее необходимый препарат`n/me передал препарат пациенту 'Анальгин'`n/anim 11 5,% A_appdata "\MZ\RolePlay\heal\Головная боль.txt"
ifNotExist % A_appdata "\MZ\RolePlay\heal\Боль в животе.txt"
FileAppend,100`nЯ выпишу Вам препарат`n/do Мед. сумка в руке.`n/me открыл мед.сумку и достал из нее необходимый препарат`n/me передал препарат пациенту 'Анальгин'`n/anim 11 5,% A_appdata "\MZ\RolePlay\heal\Боль в животе.txt"
ifNotExist % A_appdata "\MZ\RolePlay\heal\Зубная боль.txt"
FileAppend,100`nЯ выпишу Вам препарат`n/do Мед. сумка в руке.`n/me открыл мед.сумку и достал из нее необходимый препарат`n/me передал препарат пациенту 'Анальгин'`n/anim 11 5,% A_appdata "\MZ\RolePlay\heal\Зубная боль.txt"
ifNotExist % A_appdata "\MZ\RolePlay\Medcard.txt"
FileAppend,/me подошёл к шкафу`n/me открыл дверцы`n/do Шкаф открыт.`n/me достал папку с медицинскими картами`n/me положил папку на стол`n/me начал заполнять новую медицинскую карту`n/me записал результаты осмотра и поставил печать "Здоров" `n/do Медицинская карта заполнена.`n/me передал медицинскую карту,% A_appdata "\MZ\RolePlay\Medcard.txt"
ifNotExist % A_appdata "\MZ\RolePlay\Inject.txt"
FileAppend,/do Чемоданчик с шприцом-пистолетом на столе.`n/me открыл(а) чемоданчик и достал(а) шприц-пистолет из лотка.`n/do Капсулы с раствором от болезни в ящике.`n/me открыл(а) ящик и достал(а) капсулу с раствором`n/me вставил(а) капсулу с раствором в слот для лекарства`n/do Шприц-пистолет готов к использованию.`n/me взял(а) со стола ватку со спиртом`n/me протер(ла) место укола на плече ваткой`n/me приложил(а) шприц-пистолет к месту укола и нажал(а) на поршень`n/do Раствор введен внутрь.,% A_appdata "\MZ\RolePlay\Inject.txt"
ifNotExist % A_appdata "\MZ\RolePlay\goto.txt"
FileAppend,Здравствуйте!`nПрошу пройти за мной. Я Вам помогу!,% A_appdata "\MZ\RolePlay\goto.txt"
loop 4
IniRead, vac_%a_index% , % A_appdata "\MZ\config.ini" , vac, %a_index% , 500
IniRead, prefixf , % A_appdata "\MZ\config.ini" , global, prefixf , not
IniRead, prefixr , % A_appdata "\MZ\config.ini" , global, prefixr , not
ifNotExist % A_appdata "\MZ\RolePlay\Operations\artrit.txt"
{
    downllen := "https://raw.githubusercontent.com/FOsborn/TH/master/artrit.txt"
    URLDownloadToFile, %downllen%, % A_appdata "\MZ\RolePlay\Operations\Артрит.txt"
}
ifNotExist % A_appdata "\MZ\RolePlay\setskin.txt"
{
    downllen := "https://raw.githubusercontent.com/FOsborn/TH/master/setskin.txt"
    URLDownloadToFile, %downllen%, % A_appdata "\MZ\RolePlay\setskin.txt"
}
ifNotExist % A_appdata "\MZ\RolePlay\Operations\gastrit.txt"
{
    downllen := "https://raw.githubusercontent.com/FOsborn/TH/master/gastrit.txt"
    URLDownloadToFile, %downllen%, % A_appdata "\MZ\RolePlay\Operations\Гастрит.txt"
}
ifNotExist % A_appdata "\MZ\RolePlay\Operations\revmatizm.txt"
{
    downllen := "https://raw.githubusercontent.com/FOsborn/TH/master/revmatizm.txt"
    URLDownloadToFile, %downllen%, % A_appdata "\MZ\RolePlay\Operations\Ревматизм.txt"
}
ifNotExist % A_appdata "\MZ\RolePlay\fwarn.txt"
{
    downllen := "https://raw.githubusercontent.com/FOsborn/TH/master/fwarn.txt"
    URLDownloadToFile, %downllen%, % A_appdata "\MZ\RolePlay\fwarn.txt"
}
ifNotExist % A_appdata "\MZ\RolePlay\invite.txt"
{
    downllen := "https://raw.githubusercontent.com/FOsborn/TH/master/invite.txt"
    URLDownloadToFile, %downllen%, % A_appdata "\MZ\RolePlay\invite.txt"
}
ifNotExist % A_appdata "\MZ\RolePlay\uninvite.txt"
{
    downllen := "https://raw.githubusercontent.com/FOsborn/TH/master/uninvite.txt"
    URLDownloadToFile, %downllen%, % A_appdata "\MZ\RolePlay\uninvite.txt"
}
IniRead, sleep , % A_appdata "\MZ\config.ini" , global, sleep , 2200
CommandProcessor := new CommandProcessor()
CommandProcessor.SetStatusProcessor(true)
CommandProcessor.RegisterCommand("/invite"	         	,"kp")
CommandProcessor.RegisterCommand("/fwarn"            	,"kp")
CommandProcessor.RegisterCommand("/lack"            	,"kp")
CommandProcessor.RegisterCommand("/fraps"            	,"kp")
CommandProcessor.RegisterCommand("/uninvite"           	,"kp")
CommandProcessor.RegisterCommand("/setskin"            	,"kp")
CommandProcessor.RegisterCommand("/healer"            	,"kp")
CommandProcessor.RegisterCommand("/r"               	,"kp")
CommandProcessor.RegisterCommand("/f"               	,"kp")
SplashTextoff
message := RandomMessage(["Сумочка медикаментов открыта","Скрипт готов к работе","Уиии, я стартанул =)","Тебе привет от Freak'a Osborn'a","Ути бозе мой, кто это меня запустил =)"])
msgbox 64,HEALER, %message%`n/healer - панель помощи
return
kp:
chatInput := CommandProcessor.TempText
chatCMD   := CommandProcessor.TempCmd
chatInput := RegExReplace(chatInput,chatCMD,"")
if ( chatCMD == "/f" || chatCMD == "/F" || chatCMD == "/r" || chatCMD == "/R" )
{
    if ( regexreplace(chatinput," ") == "" || (chatcmd == "/f"? prefixf : prefixr) ==""  )
    sendchat(chatcmd chatinput)
    else
    {
        if (prefixf=="not")
        prefixf:=""
        if (prefixr=="not")
        prefixr:=""
        sendchat(chatcmd " " (chatcmd == "/f"? prefixf : prefixr)  chatinput)
    }
    return
}
else if (chatCMD == "/healer" || chatCND == "/HEALER" )
{
text:= ["{00FFFF}Список пропатченных команд",
,"   {00FFFF}•{FFFFFF} /setskin`t[setskin.txt]"
,"   {00FFFF}•{FFFFFF} /fwarn`t[fwarn.txt]"
,"   {00FFFF}•{FFFFFF} /invite`t[invite.txt]"
,"   {00FFFF}•{FFFFFF} /uninvite`t[uninvite.txt]"
,"   {00FFFF}•{FFFFFF} /m	edcard`t[Medcard.txt]"
    ,""
,"{00FFFF}Список новых команд"
,"   {00FFFF}•{FFFFFF} /lack`tЧекер отсутствующих"
,"   {00FFFF}•{FFFFFF} /fraps`tРП отыгровка перед фрапсом"
,"   {00FFFF}•{FFFFFF} /healer`tОкно помощи"
    ,""
,"{00FFFF}Список биндов"
,"   {00FFFF}•{FFFFFF} F11`tЛичные отыгровки и шпоры"
,"   {00FFFF}•{FFFFFF} ПКМ(выделяем пациента)+F2`tПанель взаимодействия с пациентами"
,"{00FFFF}Список чит-кодов"
,"   {00FFFF}•{FFFFFF} PERM`tПодтвердить права 9+ ранга"
    ,""
    ,""
,"{00FFFF}Скрипт создан по заказу:{FFFFFF} Lorenso Smitch"
,"{00FFFF}Автор скрипта:{FFFFFF} Freak Osborn (ZAKO) "
,"{00FFFF}Поддержка: {FFFFFF}vk.com/mslotvinsky"]
showDialog(0, "{00FFFF}Healer By ZAKO",GetText(text)[1], "Ok")
}
else if (chatCMD == "/fraps" || chatCND == "/FRAPS" )
{
    loop, read, % A_appdata "\MZ\RolePlay\fraps.txt"
    {
        sendchat(A_LoopReadLine)
        sleep %sleep%
    }
addchatmessage("{00FFFF}Врубай фрапс!")
}
else if (chatCMD == "/setskin" || chatCND == "/SETSKIN" )
{
    loop, read, % A_appdata "\MZ\RolePlay\setskin.txt"
    {
        sendchat(A_LoopReadLine)
        sleep %sleep%
    }
    sendchat("/setskin " chatinput)
}
else if (chatCMD == "/lack" || chatCND == "/lack" )
{
    out_count:=0
    sendchat("/find")
    while (isdialogopen()==0)
    continue
    Loop
    {
        if ( getDialogStyle() == 0)
        break
    }
array := {"inStream": [], "inNotStream": []}
    for k, v in GetDialogLines()
    {
        line := getdialogline(a_index)
    if (RegExMatch(line, "{FFFFFF}(?<id>\d{1,3})\s+(?<lvl>\d+)\s+(?<phoneNumber>\d{4,7})\s+(?<rankNum>\d{1,2})\s+(?<warn>[0-3])\/3\s+(?<nick>[A-Za-z_]{4,24})(?:\{ffa800\}\[AFK: (?<afk>\d+)\]\{FFFFFF\})?", out_))
        {
            if (!isPlayerInStreamById(out_id))
        array.inNotStream.Push({"nick": out_nick, "id": out_id, "afk": out_afk, "phoneNumber": out_phonenumber, "rankNum": out_ranknum, "warn": out_warn})
            Else
        array.inStream.Push({"nick": out_nick, "id": out_id, "afk": out_afk, "phoneNumber": out_phonenumber, "rankNum": out_ranknum, "warn": out_warn})
        }
    }
sendinput, {esc}
    for k, v in array.inNotStream
    text .= v.nick
    if (!text)
    {
    addChatMessageEx("{FFFF00}","{FFA500}SMS: {FFFF00}Все тут, отсутствующих нет! {FFA500}| {FFFF00}Отправитель: Freak_Osborn (тел. 454747)")
        return
    }
showDialog(5, "{00FFFF}Выберите действие","{00FFFF}Что будем делать с отсутвующими?`n{00FFFF}* {FFFFFF}Перечислить в рацию /f`n{00FFFF}* {FFFFFF}Перечислить в рацию /r`n{00FFFF}* {FFFFFF}Написать всем в SMS`n{00FFFF}* {FFFFFF}Перечислить в чат`n{00FFFF}* {FFFFFF}Вывести в окно`n{00FFFF}* {FFFFFF}Раздать выговоры", "Далее")
    line:= lineresult()
    if ( line == 1 || line == 2 )
    {
        for k, v in array.inNotStream
        {
            if (v.nick != getusername())
            {
                if ( line == 1 )
                SendChat("/f " prefixf " " regexreplace(v.nick,"_"," ")", где Вы находитесь?")
                else
                SendChat("/r " prefixr " "  regexreplace(v.nick,"_"," ")", где Вы находитесь?")
                sleep, 1000
            }
        }
    }
    if ( line == 3 )
    {
    showDialog(1, "{00FFFF}Введите текст","", "Начать")
        while(IsDialogOpen())
        continue
        post := GetChatText()
        for k, v in array.inNotStream
        {
            if (v.afk < 20)
            {
                SendChat("/sms " v.phoneNumber " " post)
                sleep 500
            }
        }
    }
    if ( line == 4 )
    {
        sendchat("/do КПК в руках.")
        sleep 2100
        sendchat("/me зашел во вкладку 'Сотрудники'.")
        sleep 2100
        sendchat("/todo Итак, среди нас нет:*выявив отсутствующих")
        sleep 2100
        for k, v in array.inNotStream
        {
            SendChat(regexreplace(v.nick,"_"," ")". Номер бейджа: " v.id ".")
            sleep 2000
        }
    }
    if ( line == 5 )
    {
        text := ""
        for k, v in array.inNotStream
        {
            if ( getusername() != v.nick )
            text.= "`n" v.nick " [" v.id "]`t" v.phoneNumber "`t[" v.rankNum "/10]`t[" v.warn "/3]"
        }
    showDialog(5, "{00FFFF}Отсутствующие","{0FFFFF}Ник [ID]`t{0FFFFF}Телефон`t{0FFFFF}Ранг`t{0FFFFF}Выговоры`n" text, "Ok")
    }
    if ( line == 6 )
    {
    showDialog(1, "{00FFFF}Введите причину","", "Начать")
        while(IsDialogOpen())
        continue
        post := GetChatText()
        for k, v in array.inNotStream
        {
        showDialog(5, "{FFFFFF}Подтверждение","{FFFFFF}Выдаем выговор {00FFFF}" v.nick "[" v.id "]{FFFFFF} по причине: {00FFFF}" post "{FFFFFF}?`n{00FF00}Выдаем!`n{FF0000}Обойдётся!", "Далее")
            line := lineresult()
            if ( line == 1 )
            {
                loop, read, % A_appdata "\MZ\RolePlay\fwarn.txt"
                {
                    sendchat(A_LoopReadLine)
                    sleep %sleep%
                }
                SendChat("/fwarn " v.id " " post)
            }
        }
    }
}
if ( regexreplace(chatinput," ") == "" )
sendchat(chatCMD)
else
{
    if ( chatCMD == "/invite" || chatCMD == "/INVITE" )
    {
        loop, read, % A_appdata "\MZ\RolePlay\invite.txt"
        {
            sendchat(A_LoopReadLine)
            sleep %sleep%
        }
    }
    else if ( chatCMD == "/uninvite" || chatCMD== "/UNINVIRE" )
    {
        loop, read, % A_appdata "\MZ\RolePlay\uninvite.txt"
        {
            sendchat(A_LoopReadLine)
            sleep %sleep%
        }
    }
    else if ( chatCMD == "/" || chatCMD== "/UNINVIRE" )
    {
        loop, read, % A_appdata "\MZ\RolePlay\uninvite.txt"
        {
            sendchat(A_LoopReadLine)
            sleep %sleep%
        }
    }
    else if ( chatCMD== "/fwarn" || chatCMD== "/FWARN" )
    {
        loop, read, % A_appdata "\MZ\RolePlay\fwarn.txt"
        {
            sendchat(A_LoopReadLine)
            sleep %sleep%
        }
    }
    sendchat(chatCMD chatinput)
}
return
f2::
id := getIdByPed(getTargetPed())
if ( id != -1 )
{
    if ( perm == 1 )
    {
    text := ["• {50F364}Позвать за собой"
    ,"• {50F364}Лечение"
    ,"• {50F364}Операция"
    ,"• {50F364}Выдача мед.карты"
    ,"• {50F364}Вакцинация"
    ,"• {50F364}Уколы"
    ,"• {50F364}Инвайт"
    ,"• {50F364}Увал"
    ,"• {50F364}Выговор"]
    }
    else
    {
    text := ["• {50F364}Позвать за собой"
    ,"• {50F364}Лечение"
    ,"• {50F364}Операция"
    ,"• {50F364}Выдача мед.карты"
    ,"• {50F364}Вакцинация"
    ,"• {50F364}Уколы"]
    }
showDialog(5,"{ffffff}Взаимодействия" ,"{ffffff}Выберите действие`n" gettext(text) [1],"Начать")
    line:=lineresult()
    if ( line == 1 )
    {
        loop, read, % A_appdata "\MZ\RolePlay\goto.txt"
        {
            sendchat(A_LoopReadLine)
            sleep %sleep%
        }
    }
    else if ( line == 2 )
    {
        text := []
        Loop, files, % A_appdata "\MZ\RolePlay\Heal\*.txt"
        text.Push(RegExReplace(A_LoopFileName, ".txt$"))
        showDialog(2, "Выбор лечения", GetText(text)[1], "Start")
        line := LineResult()
        line := getDialogLine(line)
        line := line ".txt"
        loop, read, % A_appdata "\MZ\RolePlay\Heal\" line
        {
            if ( a_index == 1 )
            price := A_LoopReadLine
            else
            {
                sendchat(A_LoopReadLine)
                sleep %sleep%
            }
        }
        sendchat("/heal " id " " price)
    }
    else if ( line == 3 )
    {
        text := []
        Loop, files, % A_appdata "\MZ\RolePlay\Operations\*.txt"
        text.Push(RegExReplace(A_LoopFileName, ".txt$"))
        showDialog(2, "Выбор операции", GetText(text)[1], "Start")
        line := LineResult()
        line := getDialogLine(line)
        line := line ".txt"
        loop, read, % A_appdata "\MZ\RolePlay\Operations\" line
        {
            sendchat(A_LoopReadLine)
            sleep %sleep%
        }
    }
    else if ( line == 4 )
    {
        loop, read, % A_appdata "\MZ\RolePlay\Medcard.txt"
        {
            sendchat(A_LoopReadLine)
            sleep %sleep%
        }
        sendchat("/medcard " id)
    }
    else if ( line == 5 || line == 6 )
    {
        loop, read, % A_appdata "\MZ\RolePlay\Inject.txt"
        {
            sendchat(A_LoopReadLine)
            sleep %sleep%
        }
        if ( line == 6 )
        sendchat("/inject " id)
        else if ( line == 5 )
        {
            showDialog(2, "Выбор вакцины","Грипп`nАнгина`nБронхит`nЭбола", "Start")
            line := lineresult()
            IniRead, price , % A_appdata "\MZ\config.ini" , vac, %line% , 500
            sleep %sleep%
            sendchat("/vac " id " " line " " price)
        }
    }
    else if ( line == 7 )
    {
        loop, read, % A_appdata "\MZ\RolePlay\invite.txt"
        {
            sendchat(A_LoopReadLine)
            sleep %sleep%
        }
        sendchat("/invite " id)
    }
    else if ( line == 8 || line == 9 )
    {
        if ( line == 8 )
        loop, read, % A_appdata "\MZ\RolePlay\uninvite.txt"
        {
            sendchat(A_LoopReadLine)
            sleep %sleep%
        }
        else
        loop, read, % A_appdata "\MZ\RolePlay\fwarn.txt"
        {
            sendchat(A_LoopReadLine)
            sleep %sleep%
        }
        showDialog(1, "Введите причину","", "Далее")
        while(IsDialogOpen())
        continue
        reasone := GetChatText()
        if ( line == 8 )
        sendchat("/uninvite " id " " reasone)
        else
        sendchat("/fwarn " id " " reasone)
    }
}
return
direct:
run, % A_appdata "\MZ"
return
vk:
run, https://vk.com/mslotvinsky
return
off:
exitapp
return
:?*:perm::
:?*:зукь::
sendchat("/stats")
while (isdialogopen()!=1)
continue
perm := getdialogline(23)
if ( perm == "{FFFFFF}Ранг: 				{0099ff}8")
{
    perm := 1
addchatmessage("{00FFFF}[PERM] - {FFFFFF}Вы авторизовались как заместитель главного врача")
}
else  if ( perm == "{FFFFFF}Ранг: 				{0099ff}9")
{
    perm := 1
addchatmessage("{00FFFF}[PERM] - {FFFFFF}Вы авторизовались как заместитель главного врача")
}
else if ( perm =="{FFFFFF}Ранг: 				{0099ff}10" )
{
    perm := 1
addchatmessage("{00FFFF}[PERM] - {FFFFFF}Вы авторизовались как глав.врач")
}
else if (perm =="{FFFFFF}Ранг: 				{0099ff}11")
{
    perm := 1
addchatmessage("{00FFFF}[PERM] - {FFFFFF}Вы авторизовались как министр здравоохранения")
}
else
addchatmessage("{00FFFF}[PERM] - {FFFFFF}Ваш ранг ниже 9")
sendinput, {esc}
return
F11::
text := []
showDialog(2, "{00FFFF}Сделайте выбор","РП отыгровки`nШпоры", "Далее")
line:= lineresult()
if ( line == 1 )
{
    Loop, files, % A_appdata "\MZ\bind\*.txt"
    text.Push(RegExReplace(A_LoopFileName, ".txt$"))
    showDialog(2, "Выбор бинда", GetText(text)[1], "Start")
    line := LineResult()
    line := getDialogLine(line)
    line := line ".txt"
    loop, read, % A_appdata "\MZ\bind\" line
    {
        if ( a_index == 1 )
        sleep_list:= A_LoopReadLine
        else
        {
            sendchat(A_LoopReadLine)
            sleep %sleep_list%
        }
    }
}
else
{
    Loop, files, % A_appdata "\MZ\help\*.txt"
    text.Push(RegExReplace(A_LoopFileName, ".txt$"))
    showDialog(2, "Выбор бинда", GetText(text)[1], "Start")
    line := LineResult()
    line := getDialogLine(line)
    line := line ".txt"
    text := ""
    loop, read, % A_appdata "\MZ\help\" line
    text .= A_LoopReadLine "`n"
    showDialog(0, RegExReplace(line,".txt"), text, "Ok")
}
return
~NumpadEnter::
~Enter::
if(CommandProcessor.StatusProcessor)
{
    if(IsChatActive() == 1)
    {
        blockChatInput()
        while(IsChatActive() == 1)
        continue
        unBlockChatInput()
        TextChat := GetChatText()
        if(SubStr(TextChat, 1, 1) == "/")
        {
            InputCMD := StrSplit(TextChat, A_Space)
            InputCMD := InputCMD[1]
            CommandProcessor.TempCmd := InputCMD
            CommandProcessor.TempText := TextChat
            if(CommandProcessor.CommandArray.HasKey(InputCMD))
            {
                ClearTextDialog()
                SetTimer, % CommandProcessor.CommandArray[InputCMD], -1
            }
            else
            {
                SendChat(TextChat)
                ClearTextDialog()
            }
        }
        else
        {
            if(TextChat != "")
            {
                CommandProcessor.TempText := TextChat
                sendchat((accent != "" and  accent !="off" ? accent " " textchat :textchat))
                ClearTextDialog()
            }
        }
    }
}
return
guipoint:
Gui, Font, S13 CDefault, Verdana
Gui, Add, Edit, x12 y40 w160 h30 vPrefixf, %prefixf%
Gui, Add, Edit, x12 y90 w160 h30 vPrefixr, %prefixr%
Gui, Add, Edit, x12 y140 w160 h30 vsleep, %sleep%
Gui, Add, Hotkey, x12 y190 w160 h30 vkey, %key%
Gui, Font, S6 CDefault, Verdana
Gui, Add, Text, x102 y30 w80 h10 , Префикс /f
Gui, Add, Text, x102 y80 w80 h10 , Префикс /r
Gui, Add, Text, x102 y130 w70 h10 , Задержка
Gui, Add, Text, x12 y180 w210 h10 , Клавиша взаимодействия
Gui, Font, S9 CDefault, Verdana
Gui, Add, Button, x132 y230 w100 h20 gsave, сохранить
Gui, Font, S13 CDefault, Verdana
Gui, Add, Edit, x272 y40 w70 h30 vvac_1, %vac_1%
Gui, Add, Edit, x272 y90 w70 h30 vvac_2, %vac_2%
Gui, Add, Edit, x272 y140 w70 h30 vvac_3, %vac_3%
Gui, Add, Edit, x272 y190 w70 h30 vvac_4, %vac_4%
Gui, Add, Text, x42 y0 w130 h20 , Основное
Gui, Add, Text, x262 y0 w80 h20 , Вакцины
Gui, Font, S15 CDefault, Verdana
Gui, Add, Text, x252 y40 w20 h30 , 1
Gui, Add, Text, x252 y90 w20 h30 , 2
Gui, Add, Text, x252 y140 w20 h30 , 3
Gui, Add, Text, x252 y190 w20 h30 , 4
Gui, Show, x505 y215 h262 w369, Настройки
Return
save:
Gui, Submit, NoHide
if ( vac_1 > 1000 || vac_2 > 1000 || vac_3 > 1000 || vac_4 > 1000 )
msgbox Цена вакцин не может быть больше 1000$
else
{
    loop 4
    IniWrite, % vac_%a_index%, % A_appdata "\MZ\config.ini",vac,%a_index%
    iniwrite, %key%, % A_appdata "\MZ\config.ini", global, Key
    IniWrite, %prefixf%, % A_appdata "\MZ\config.ini", global, prefixf
    IniWrite, %prefixr%, % A_appdata "\MZ\config.ini", global, prefixr
    IniWrite, %sleep%, % A_appdata "\MZ\config.ini", global, sleep
    msgbox,Настройки сохранены
}
return
GuiClose:
gui, destroy
TrayTip,Я не закрылся,Если че... я еще тут, 10,17
return
