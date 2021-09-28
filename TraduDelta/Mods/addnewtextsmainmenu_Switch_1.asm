.localvar 2 arguments
.localvar 11846 json 6259
.localvar 11936 _locale 6260
.localvar 11938 _lang 6261

:[0]
push.s "id"@6223
conv.s.v
pushbltn.v builtin.async_load
call.i ds_map_find_value(argc=2)
pushglb.v global.savedata_async_id
cmp.v.v EQ
bf [end]

:[1]
pushi.e -1
pop.v.i global.savedata_async_id
pushglb.v global.savedata_async_load
conv.v.b
bf [end]

:[2]
pushi.e 0
pop.v.i global.savedata_async_load
push.s "status"@14514
conv.s.v
pushbltn.v builtin.async_load
call.i ds_map_find_value(argc=2)
pushi.e 0
cmp.i.v LT
bf [4]

:[3]
pushi.e 1
pop.v.i global.savedata_error
push.s "load failed: "@14515
push.s "status"@14514
conv.s.v
pushbltn.v builtin.async_load
call.i ds_map_find_value(argc=2)
call.i string(argc=1)
add.v.s
pop.v.v global.savedata_debuginfo
call.i ds_map_create(argc=0)
pop.v.v global.savedata
b [45]

:[4]
pushi.e 0
pop.v.i global.savedata_error
push.s "load succeeded"@14516
pop.v.s global.savedata_debuginfo
pushi.e 11
conv.i.v
pushglb.v global.savedata_buffer
call.i buffer_read(argc=2)
pop.v.v local.json
pushloc.v local.json
call.i json_decode(argc=1)
pop.v.v global.savedata
pushglb.v global.savedata_buffer
call.i buffer_delete(argc=1)
popz.v
pushbltn.v builtin.undefined
pop.v.v global.savedata_buffer
push.s "en"@9324
pop.v.s global.lang
call.i os_get_language(argc=0)
pop.v.v local._locale
pushbltn.v builtin.os_type
pushi.e 21
cmp.i.v EQ
bf [6]

:[5]
pushi.e 2
conv.i.v
pushi.e 1
conv.i.v
call.i switch_language_get_desired_language(argc=0)
call.i gml_Script_substr(argc=3)
pop.v.v local._lang
b [10]

:[6]
pushi.e 2
conv.i.v
pushi.e 1
conv.i.v
pushloc.v local._locale
call.i gml_Script_substr(argc=3)
push.s "ja"@6044
cmp.s.v NEQ
bf [8]

:[7]
push.s "en"@9324
conv.s.v
b [9]

:[8]
push.s "ja"@6044
conv.s.v

:[9]
pop.v.v local._lang

:[10]
pushloc.v local._lang
pop.v.v global.lang
push.s "true_config.ini"@11939
conv.s.v
call.i gml_Script_ossafe_file_exists(argc=1)
conv.v.b
bf [12]

:[11]
pushi.e 0
pop.v.i self.first_time
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
call.i gml_Script_ossafe_ini_close(argc=0)
popz.v

:[12]
pushglb.v global.lang
push.s "en"@9324
cmp.s.v EQ
bf [14]

:[13]
pushi.e 3
conv.i.v
b [15]

:[14]
pushi.e 10
conv.i.v

:[15]
pop.v.v self.text_font
pushglb.v global.lang
push.s "en"@9324
cmp.s.v EQ
bf [17]

:[16]
push.s "Yes"@5478
conv.s.v
b [18]

:[17]
push.s "はい"@14504
conv.s.v

:[18]
pop.v.v self.yes
pushglb.v global.lang
push.s "en"@9324
cmp.s.v EQ
bf [20]

:[19]
push.s "No"@2313
conv.s.v
b [21]

:[20]
push.s "いいえ"@14505
conv.s.v

:[21]
pop.v.v self.no
push.i 167826
setowner.e
pushglb.v global.lang
push.s "en"@9324
cmp.s.v EQ
bf [23]

:[22]
push.s "The Beginning"@14488
conv.s.v
b [24]

:[23]
push.s "はじまり"@14506
conv.s.v

:[24]
pushi.e -1
pushi.e 1
pop.v.v [array]self.chapname
pushglb.v global.lang
push.s "en"@9324
cmp.s.v EQ
bf [26]

:[25]
push.s "A Cyber's World"@14489
conv.s.v
b [27]

:[26]
push.s "サイバーワールド"@14507
conv.s.v

:[27]
pushi.e -1
pushi.e 2
pop.v.v [array]self.chapname
push.s "dr.ini"@9572
conv.s.v
call.i gml_Script_ossafe_file_exists(argc=1)
conv.v.b
bf [29]

:[28]
pushi.e 0
pop.v.i self.first_time

:[29]
push.s "filech1_0"@13906
conv.s.v
call.i gml_Script_ossafe_file_exists_ch1(argc=1)
conv.v.b
bf [31]

:[30]
pushi.e 0
pop.v.i self.first_time

:[31]
push.s "filech1_1"@13908
conv.s.v
call.i gml_Script_ossafe_file_exists_ch1(argc=1)
conv.v.b
bf [33]

:[32]
pushi.e 0
pop.v.i self.first_time

:[33]
push.s "filech1_2"@13910
conv.s.v
call.i gml_Script_ossafe_file_exists_ch1(argc=1)
conv.v.b
bf [35]

:[34]
pushi.e 0
pop.v.i self.first_time

:[35]
push.s "filech1_3"@13963
conv.s.v
call.i gml_Script_ossafe_file_exists_ch1(argc=1)
conv.v.b
bf [37]

:[36]
pushi.e 0
pop.v.i self.first_time

:[37]
push.s "filech1_4"@13964
conv.s.v
call.i gml_Script_ossafe_file_exists_ch1(argc=1)
conv.v.b
bf [39]

:[38]
pushi.e 0
pop.v.i self.first_time

:[39]
push.s "filech1_5"@13965
conv.s.v
call.i gml_Script_ossafe_file_exists_ch1(argc=1)
conv.v.b
bf [41]

:[40]
pushi.e 0
pop.v.i self.first_time

:[41]
push.s "store_prompt"@14517
conv.s.v
call.i variable_global_exists(argc=1)
conv.v.b
bf [44]

:[42]
pushglb.v global.store_prompt
conv.v.b
bf [44]

:[43]
pushi.e 0
pop.v.i self.first_time

:[44]
call.i gml_Script_scr_controls_default(argc=0)
popz.v
pushi.e 1
conv.i.v
call.i audio_group_load(argc=1)
popz.v
pushi.e 1
pop.v.i self.init_loaded

:[45]
push.s "********** "@14518
pushglb.v global.savedata_debuginfo
call.i string(argc=1)
add.v.s
call.i show_debug_message(argc=1)
popz.v

:[end]