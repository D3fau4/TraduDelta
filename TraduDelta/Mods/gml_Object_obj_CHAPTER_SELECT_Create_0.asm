.localvar 2 arguments
.localvar 14461 load_chapter 6217
.localvar 11419 _id 6218
.localvar 11936 _locale 6249
.localvar 11938 _lang 6250
.localvar 14502 is_fullscreen 6251

:[0]
pushbltn.v builtin.os_type
pushi.e 21
cmp.i.v EQ
bt [2]

:[1]
pushbltn.v builtin.os_type
pushi.e 14
cmp.i.v EQ
b [3]

:[2]
push.e 1

:[3]
pop.v.b global.is_console
pushi.e 0
pop.v.i global.chapter_debug_init
pushi.e -1
pop.v.i global.savedata_async_id
pushi.e 0
pop.v.i global.savedata_async_load
pushi.e 0
pop.v.i global.savedata_error
push.s ""@4766
pop.v.s global.savedata_debuginfo
push.s "{TITLE}"@FFFF00
conv.s.v
call.i window_set_caption(argc=1)
popz.v
pushi.e 1645
conv.i.v
call.i instance_exists(argc=1)
conv.v.b
bf [7]

:[4]
pushi.e 1645
pushenv [6]

:[5]
call.i instance_destroy(argc=0)
popz.v

:[6]
popenv [5]

:[7]
pushi.e 1131
conv.i.v
call.i instance_exists(argc=1)
conv.v.b
bf [11]

:[8]
pushi.e 1131
pushenv [10]

:[9]
call.i instance_destroy(argc=0)
popz.v

:[10]
popenv [9]

:[11]
pushi.e 1665
conv.i.v
call.i instance_exists(argc=1)
conv.v.b
bf [15]

:[12]
pushi.e 1665
pushenv [14]

:[13]
call.i instance_destroy(argc=0)
popz.v

:[14]
popenv [13]

:[15]
push.s "chapter_return"@13950
conv.s.v
call.i variable_global_exists(argc=1)
conv.v.b
bf [21]

:[16]
push.s ""@4766
pop.v.s global.lang_loaded
pushglb.v global.chapter_return
pop.v.v local.load_chapter
pushi.e -1
pop.v.i global.chapter_return
call.i gml_Script_snd_free_all(argc=0)
popz.v
pushloc.v local.load_chapter
pushi.e 1
cmp.i.v EQ
bf [19]

:[17]
pushi.e 280
conv.i.v
call.i room_goto(argc=1)
popz.v
exit.i

:[18]
b [21]

:[19]
pushloc.v local.load_chapter
pushi.e 2
cmp.i.v EQ
bf [21]

:[20]
pushi.e 10
conv.i.v
call.i room_goto(argc=1)
popz.v
exit.i

:[21]
pushbltn.v builtin.os_type
pushi.e 21
cmp.i.v EQ
bf [23]

:[22]
push.s "switchlogin"@14462
conv.s.v
call.i variable_global_exists(argc=1)
conv.v.b
not.b
b [24]

:[23]
push.e 0

:[24]
bf [29]

:[25]
pushi.e -1
pop.v.i local._id

:[26]
pushloc.v local._id
pushi.e 0
cmp.i.v LT
bf [28]

:[27]
pushi.e 0
conv.i.v
pushi.e 0
conv.i.v
pushi.e 1
conv.i.v
call.i switch_accounts_select_account(argc=3)
pop.v.v local._id
b [26]

:[28]
pushloc.v local._id
pop.v.v global.switchlogin
pushglb.v global.switchlogin
call.i switch_accounts_open_user(argc=1)
popz.v

:[29]
pushglb.v global.is_console
pop.v.v self.first_time
pushi.e 0
pop.v.i self.init_loaded
call.i display_get_height(argc=0)
pop.v.v self.display_height
call.i display_get_width(argc=0)
pop.v.v self.display_width
pushi.e 1
pop.v.i self.window_size_multiplier
pushi.e 2
pop.v.i self._ww

:[30]
push.v self._ww
pushi.e 6
cmp.i.v LT
bf [37]

:[31]
push.v self.display_width
pushi.e 640
push.v self._ww
mul.v.i
cmp.v.v GT
bf [33]

:[32]
push.v self.display_height
pushi.e 480
push.v self._ww
mul.v.i
cmp.v.v GT
b [34]

:[33]
push.e 0

:[34]
bf [36]

:[35]
push.v self._ww
pop.v.v self.window_size_multiplier

:[36]
push.v self._ww
pushi.e 1
add.i.v
pop.v.v self._ww
b [30]

:[37]
push.v self.window_size_multiplier
pushi.e 1
cmp.i.v GT
bf [39]

:[38]
pushi.e 480
push.v self.window_size_multiplier
mul.v.i
pushi.e 640
push.v self.window_size_multiplier
mul.v.i
call.i window_set_size(argc=2)
popz.v
push.i 68062
setowner.e
pushi.e 1
conv.i.v
pushi.e -1
pushi.e 0
pop.v.v [array]self.alarm

:[39]
pushglb.v global.is_console
conv.v.b
bf [41]

:[40]
pushi.e 1
conv.i.v
call.i application_surface_enable(argc=1)
popz.v
pushi.e 0
conv.i.v
call.i application_surface_draw_enable(argc=1)
popz.v

:[41]
pushi.e 1
pop.v.i global.debug
push.s "init"@9735
pop.v.s self.con
pushi.e 0
pop.v.i self.file_found
pushi.e 0
pop.v.i self.highestUncompletedChapter
pushi.e 0
pop.v.i self.highestCompletedChapter
push.s "0"@3355
pop.v.s self.stringset
push.s "Yes"@5478
pop.v.s self.yes
push.s "No"@2313
pop.v.s self.no
pushi.e 0
pop.v.i self.mpos
pushi.e 0
pop.v.i self.chapterselectinit
pushi.e 0
pop.v.i self.timer
pushi.e 0
pop.v.i self.drawcolor
pushbltn.v builtin.room_height
pushi.e 2
conv.i.d
div.d.v
pop.v.v self.yy
pushbltn.v builtin.room_width
pushi.e 2
conv.i.d
div.d.v
pop.v.v self.xx
pushi.e 10
pop.v.i self.fademax
push.v self.fademax
pop.v.v self.fade
pushi.e 0
pop.v.i self.chaptertoload
pushi.e 0
pop.v.i self.chaptertoload_temp
pushbltn.v builtin.os_type
pushi.e 21
cmp.i.v EQ
bt [43]

:[42]
pushbltn.v builtin.os_type
pushi.e 14
cmp.i.v EQ
b [44]

:[43]
push.e 1

:[44]
pop.v.b self.console
pushi.e 2
pop.v.i self.latestAvailableChapter
push.i 167826
setowner.e
push.s " - - "@14486
conv.s.v
pushi.e -1
pushi.e 0
pop.v.v [array]self.chapname
push.s "The Beginning"@14488
conv.s.v
pushi.e -1
pushi.e 1
pop.v.v [array]self.chapname
push.s "A Cyber's World"@14489
conv.s.v
pushi.e -1
pushi.e 2
pop.v.v [array]self.chapname
push.s " - - "@14486
conv.s.v
pushi.e -1
pushi.e 3
pop.v.v [array]self.chapname
push.s " - - "@14486
conv.s.v
pushi.e -1
pushi.e 4
pop.v.v [array]self.chapname
push.s " - - "@14486
conv.s.v
pushi.e -1
pushi.e 5
pop.v.v [array]self.chapname
push.s " - - "@14486
conv.s.v
pushi.e -1
pushi.e 6
pop.v.v [array]self.chapname
push.s " - - "@14486
conv.s.v
pushi.e -1
pushi.e 7
pop.v.v [array]self.chapname
pushi.e 3
pop.v.i self.text_font
pushi.e 0
pop.v.i self.roominit
pushi.e 1
pop.v.i self.scale
pushi.e 1
pop.v.i self.fadeout
pushi.e 1
pop.v.i self.xscale
pushi.e 1
pop.v.i self.yscale
pushi.e 0
pop.v.i self.spr_aftereffect
pushi.e 0
pop.v.i self.confirm_choice_index
pushi.e 0
pop.v.i self.move_noise
pushi.e 0
pop.v.i self.select_noise
pushi.e 0
pop.v.i self.i

:[45]
push.v self.i
pushi.e 10
cmp.i.v LT
bf [47]

:[46]
push.i 231990
setowner.e
pushi.e 0
conv.i.v
pushi.e -5
push.v self.i
conv.v.i
pop.v.v [array]self.input_pressed
push.i 231992
setowner.e
pushi.e 0
conv.i.v
pushi.e -5
push.v self.i
conv.v.i
pop.v.v [array]self.input_held
push.i 231993
setowner.e
pushi.e 0
conv.i.v
pushi.e -5
push.v self.i
conv.v.i
pop.v.v [array]self.input_released
push.v self.i
pushi.e 1
add.i.v
pop.v.v self.i
b [45]

:[47]
pushglb.v global.is_console
conv.v.b
bf [53]

:[48]
pushbltn.v builtin.os_type
pushi.e 21
cmp.i.v EQ
bf [50]

:[49]
call.i switch_controller_support_set_defaults(argc=0)
popz.v
pushi.e 1
conv.i.v
call.i switch_controller_support_set_singleplayer_only(argc=1)
popz.v
pushi.e 7
conv.i.v
call.i switch_controller_set_supported_styles(argc=1)
popz.v

:[50]
pushbltn.v builtin.os_type
pushi.e 14
cmp.i.v EQ
bf [52]

:[51]
pushi.e 0
conv.i.v
call.i ps4_touchpad_mouse_enable(argc=1)
popz.v

:[52]
call.i gml_Script_ossafe_savedata_load(argc=0)
popz.v
b [end]

:[53]
call.i os_get_language(argc=0)
pop.v.v local._locale
pushi.e 2
conv.i.v
pushi.e 1
conv.i.v
pushloc.v local._locale
call.i gml_Script_substr(argc=3)
push.s "ja"@6044
cmp.s.v NEQ
bf [55]

:[54]
push.s "en"@9324
conv.s.v
b [56]

:[55]
push.s "ja"@6044
conv.s.v

:[56]
pop.v.v local._lang
pushloc.v local._lang
pop.v.v global.lang
push.s "true_config.ini"@11939
conv.s.v
call.i gml_Script_ossafe_file_exists(argc=1)
conv.v.b
bf [58]

:[57]
push.s "true_config.ini"@11939
conv.s.v
call.i gml_Script_ossafe_ini_open(argc=1)
popz.v
pushloc.v local._lang
push.s "LANG"@11940
conv.s.v
push.s "LANG"@11940
conv.s.v
call.i ini_read_string(argc=3)
pop.v.v global.lang
pushi.e 0
conv.i.v
push.s "FULLSCREEN"@14500
conv.s.v
push.s "SCREEN"@14501
conv.s.v
call.i ini_read_real(argc=3)
pop.v.v local.is_fullscreen
pushloc.v local.is_fullscreen
call.i window_set_fullscreen(argc=1)
popz.v
call.i gml_Script_ossafe_ini_close(argc=0)
popz.v

:[58]
pushglb.v global.lang
push.s "en"@9324
cmp.s.v EQ
bf [60]

:[59]
pushi.e 3
conv.i.v
b [61]

:[60]
pushi.e 10
conv.i.v

:[61]
pop.v.v self.text_font
pushglb.v global.lang
push.s "en"@9324
cmp.s.v EQ
bf [63]

:[62]
push.s "Yes"@5478
conv.s.v
b [64]

:[63]
push.s "はい"@14504
conv.s.v

:[64]
pop.v.v self.yes
pushglb.v global.lang
push.s "en"@9324
cmp.s.v EQ
bf [66]

:[65]
push.s "No"@2313
conv.s.v
b [67]

:[66]
push.s "いいえ"@14505
conv.s.v

:[67]
pop.v.v self.no
push.i 167826
setowner.e
pushglb.v global.lang
push.s "en"@9324
cmp.s.v EQ
bf [69]

:[68]
push.s "The Beginning"@14488
conv.s.v
b [70]

:[69]
push.s "はじまり"@14506
conv.s.v

:[70]
pushi.e -1
pushi.e 1
pop.v.v [array]self.chapname
pushglb.v global.lang
push.s "en"@9324
cmp.s.v EQ
bf [72]

:[71]
push.s "A Cyber's World"@14489
conv.s.v
b [73]

:[72]
push.s "サイバーワールド"@14507
conv.s.v

:[73]
pushi.e -1
pushi.e 2
pop.v.v [array]self.chapname
pushglb.v global.lang
push.s "{LENGUAGE}"@FFFFFF
cmp.s.v EQ
bf [78]

:[74]
pushglb.v global.lang
push.s "{LENGUAGE}"@FFFFFF
cmp.s.v EQ
bf [76]

:[75]
pushi.e 3
conv.i.v
b [77]

:[76]
pushi.e 10
conv.i.v

:[77]
pop.v.v self.text_font
push.s "{yes}"@FFFF07
pop.v.s self.yes
push.s "{no}"@FFFF08
pop.v.s self.no
push.s "{chapter1title}"@FFFF01
pushi.e -1
pushi.e 1
pop.v.s [array]self.chapname
push.s "{chapter2title}"@FFFF02
pushi.e -1
pushi.e 2
pop.v.s [array]self.chapname

:[78]
call.i gml_Script_scr_controls_default(argc=0)
popz.v
pushi.e 1
conv.i.v
call.i audio_group_load(argc=1)
popz.v
pushi.e 1
pop.v.i self.init_loaded

:[end]