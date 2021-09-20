.localvar 2 arguments
.localvar 11936 _locale 3619
.localvar 11938 _lang 3620
.localvar 11946 fm 3624
.localvar 11948 sm 3625
.localvar 11965 sndm 3626

:[0]
b [18]

> gml_Script_scr_84_init_localization (locals=5, argc=0)
:[1]
call.i os_get_language(argc=0)
pop.v.v local._locale
pushbltn.v builtin.os_type
pushi.e 21
cmp.i.v EQ
bf [3]

:[2]
pushi.e 2
conv.i.v
pushi.e 1
conv.i.v
call.i switch_language_get_desired_language(argc=0)
call.i gml_Script_substr(argc=3)
pop.v.v local._lang
b [7]

:[3]
pushi.e 2
conv.i.v
pushi.e 1
conv.i.v
pushloc.v local._locale
call.i gml_Script_substr(argc=3)
push.s "ja"@6044
cmp.s.v NEQ
bf [5]

:[4]
push.s "en"@9324
conv.s.v
b [6]

:[5]
push.s "ja"@6044
conv.s.v

:[6]
pop.v.v local._lang

:[7]
pushloc.v local._lang
pop.v.v global.lang
push.s "true_config.ini"@11939
conv.s.v
call.i gml_Script_ossafe_file_exists(argc=1)
conv.v.b
bf [9]

:[8]
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

:[9]
push.s "lang_loaded"@11942
conv.s.v
call.i variable_global_exists(argc=1)
conv.v.b
not.b
bf [11]

:[10]
push.s ""@4766
pop.v.s global.lang_loaded

:[11]
pushglb.v global.lang_loaded
pushglb.v global.lang
cmp.v.v NEQ
bf [17]

:[12]
pushglb.v global.lang
pop.v.v global.lang_loaded
push.s "lang_map"@11925
conv.s.v
call.i variable_global_exists(argc=1)
conv.v.b
bf [14]

:[13]
pushglb.v global.lang_map
call.i ds_map_destroy(argc=1)
popz.v
pushglb.v global.font_map
call.i ds_map_destroy(argc=1)
popz.v
pushglb.v global.chemg_sprite_map
call.i ds_map_destroy(argc=1)
popz.v
pushglb.v global.chemg_sound_map
call.i ds_map_destroy(argc=1)
popz.v

:[14]
call.i ds_map_create(argc=0)
pop.v.v global.lang_map
call.i ds_map_create(argc=0)
pop.v.v global.font_map
call.i ds_map_create(argc=0)
pop.v.v global.lang_missing_map
call.i ds_map_create(argc=0)
pop.v.v global.chemg_sprite_map
call.i ds_map_create(argc=0)
pop.v.v global.chemg_sound_map
call.i gml_Script_scr_84_lang_load(argc=0)
popz.v
call.i gml_Script_scr_ascii_input_names(argc=0)
popz.v
push.s ""@4766
pop.v.s global.chemg_last_get_font
pushglb.v global.lang
push.s "ja"@6044
cmp.s.v EQ
bf [16]

:[15]
pushglb.v global.font_map
pop.v.v local.fm
pushi.e 10
conv.i.v
push.s "main"@6036
conv.s.v
pushloc.v local.fm
call.i ds_map_add(argc=3)
popz.v
pushi.e 8
conv.i.v
push.s "mainbig"@6038
conv.s.v
pushloc.v local.fm
call.i ds_map_add(argc=3)
popz.v
pushi.e 12
conv.i.v
push.s "tinynoelle"@6040
conv.s.v
pushloc.v local.fm
call.i ds_map_add(argc=3)
popz.v
pushi.e 7
conv.i.v
push.s "dotumche"@6041
conv.s.v
pushloc.v local.fm
call.i ds_map_add(argc=3)
popz.v
pushi.e 6
conv.i.v
push.s "comicsans"@6039
conv.s.v
pushloc.v local.fm
call.i ds_map_add(argc=3)
popz.v
pushi.e 9
conv.i.v
push.s "small"@11947
conv.s.v
pushloc.v local.fm
call.i ds_map_add(argc=3)
popz.v
pushglb.v global.chemg_sprite_map
pop.v.v local.sm
pushi.e 2254
conv.i.v
push.s "spr_bnamekris"@6717
conv.s.v
pushloc.v local.sm
call.i ds_map_add(argc=3)
popz.v
pushi.e 2255
conv.i.v
push.s "spr_bnameralsei"@6719
conv.s.v
pushloc.v local.sm
call.i ds_map_add(argc=3)
popz.v
pushi.e 2256
conv.i.v
push.s "spr_bnamesusie"@6718
conv.s.v
pushloc.v local.sm
call.i ds_map_add(argc=3)
popz.v
pushi.e 2257
conv.i.v
push.s "spr_btact"@6705
conv.s.v
pushloc.v local.sm
call.i ds_map_add(argc=3)
popz.v
pushi.e 2258
conv.i.v
push.s "spr_btdefend"@6709
conv.s.v
pushloc.v local.sm
call.i ds_map_add(argc=3)
popz.v
pushi.e 2259
conv.i.v
push.s "spr_btfight"@6703
conv.s.v
pushloc.v local.sm
call.i ds_map_add(argc=3)
popz.v
pushi.e 2260
conv.i.v
push.s "spr_btitem"@6707
conv.s.v
pushloc.v local.sm
call.i ds_map_add(argc=3)
popz.v
pushi.e 2262
conv.i.v
push.s "spr_btspare"@6708
conv.s.v
pushloc.v local.sm
call.i ds_map_add(argc=3)
popz.v
pushi.e 2261
conv.i.v
push.s "spr_bttech"@6706
conv.s.v
pushloc.v local.sm
call.i ds_map_add(argc=3)
popz.v
pushi.e 2457
conv.i.v
push.s "spr_darkmenudesc"@11949
conv.s.v
pushloc.v local.sm
call.i ds_map_add(argc=3)
popz.v
pushi.e 2359
conv.i.v
push.s "spr_dmenu_captions"@11950
conv.s.v
pushloc.v local.sm
call.i ds_map_add(argc=3)
popz.v
pushi.e 3244
conv.i.v
push.s "spr_quitmessage"@11951
conv.s.v
pushloc.v local.sm
call.i ds_map_add(argc=3)
popz.v
pushi.e 2327
conv.i.v
push.s "spr_thrashbody_b"@11952
conv.s.v
pushloc.v local.sm
call.i ds_map_add(argc=3)
popz.v
pushi.e 2325
conv.i.v
push.s "spr_thrashfoot_b"@11953
conv.s.v
pushloc.v local.sm
call.i ds_map_add(argc=3)
popz.v
pushi.e 2479
conv.i.v
push.s "spr_fieldmuslogo"@11954
conv.s.v
pushloc.v local.sm
call.i ds_map_add(argc=3)
popz.v
pushi.e 3269
conv.i.v
push.s "spr_werewire_zzt_text"@11955
conv.s.v
pushloc.v local.sm
call.i ds_map_add(argc=3)
popz.v
pushi.e 175
conv.i.v
push.s "spr_face_queen"@6082
conv.s.v
pushloc.v local.sm
call.i ds_map_add(argc=3)
popz.v
pushi.e 247
conv.i.v
push.s "spr_city_mice_sign_01"@11956
conv.s.v
pushloc.v local.sm
call.i ds_map_add(argc=3)
popz.v
pushi.e 2814
conv.i.v
push.s "spr_city_mice_sign_02"@11957
conv.s.v
pushloc.v local.sm
call.i ds_map_add(argc=3)
popz.v
pushi.e 3176
conv.i.v
push.s "spr_city_mice_sign_03"@11958
conv.s.v
pushloc.v local.sm
call.i ds_map_add(argc=3)
popz.v
pushi.e 865
conv.i.v
push.s "spr_bnamenoelle"@6720
conv.s.v
pushloc.v local.sm
call.i ds_map_add(argc=3)
popz.v
pushi.e 3307
conv.i.v
push.s "spr_bnamethrash"@6716
conv.s.v
pushloc.v local.sm
call.i ds_map_add(argc=3)
popz.v
pushi.e 2995
conv.i.v
push.s "spr_cutscene_27_tender_goodbye"@11959
conv.s.v
pushloc.v local.sm
call.i ds_map_add(argc=3)
popz.v
pushi.e 3276
conv.i.v
push.s "spr_ch2_cityscreen"@11960
conv.s.v
pushloc.v local.sm
call.i ds_map_add(argc=3)
popz.v
pushi.e 3070
conv.i.v
push.s "spr_battlemsg"@11961
conv.s.v
pushloc.v local.sm
call.i ds_map_add(argc=3)
popz.v
pushi.e 2111
conv.i.v
push.s "spr_queenscreen"@11962
conv.s.v
pushloc.v local.sm
call.i ds_map_add(argc=3)
popz.v
pushi.e 3153
conv.i.v
push.s "spr_acrade_retire"@11963
conv.s.v
pushloc.v local.sm
call.i ds_map_add(argc=3)
popz.v
pushi.e 3317
conv.i.v
push.s "spr_sneo_playback"@11964
conv.s.v
pushloc.v local.sm
call.i ds_map_add(argc=3)
popz.v
pushglb.v global.chemg_sound_map
pop.v.v local.sndm
b [17]

:[16]
pushglb.v global.font_map
pop.v.v local.fm
pushi.e 3
conv.i.v
push.s "main"@6036
conv.s.v
pushloc.v local.fm
call.i ds_map_add(argc=3)
popz.v
pushi.e 2
conv.i.v
push.s "mainbig"@6038
conv.s.v
pushloc.v local.fm
call.i ds_map_add(argc=3)
popz.v
pushi.e 0
conv.i.v
push.s "tinynoelle"@6040
conv.s.v
pushloc.v local.fm
call.i ds_map_add(argc=3)
popz.v
pushi.e 1
conv.i.v
push.s "dotumche"@6041
conv.s.v
pushloc.v local.fm
call.i ds_map_add(argc=3)
popz.v
pushi.e 4
conv.i.v
push.s "comicsans"@6039
conv.s.v
pushloc.v local.fm
call.i ds_map_add(argc=3)
popz.v
pushi.e 5
conv.i.v
push.s "small"@11947
conv.s.v
pushloc.v local.fm
call.i ds_map_add(argc=3)
popz.v
pushglb.v global.chemg_sprite_map
pop.v.v local.sm
pushi.e 2231
conv.i.v
push.s "spr_bnamekris"@6717
conv.s.v
pushloc.v local.sm
call.i ds_map_add(argc=3)
popz.v
pushi.e 2232
conv.i.v
push.s "spr_bnameralsei"@6719
conv.s.v
pushloc.v local.sm
call.i ds_map_add(argc=3)
popz.v
pushi.e 2234
conv.i.v
push.s "spr_bnamesusie"@6718
conv.s.v
pushloc.v local.sm
call.i ds_map_add(argc=3)
popz.v
pushi.e 2236
conv.i.v
push.s "spr_btact"@6705
conv.s.v
pushloc.v local.sm
call.i ds_map_add(argc=3)
popz.v
pushi.e 2238
conv.i.v
push.s "spr_btdefend"@6709
conv.s.v
pushloc.v local.sm
call.i ds_map_add(argc=3)
popz.v
pushi.e 2239
conv.i.v
push.s "spr_btfight"@6703
conv.s.v
pushloc.v local.sm
call.i ds_map_add(argc=3)
popz.v
pushi.e 2244
conv.i.v
push.s "spr_btitem"@6707
conv.s.v
pushloc.v local.sm
call.i ds_map_add(argc=3)
popz.v
pushi.e 2240
conv.i.v
push.s "spr_btspare"@6708
conv.s.v
pushloc.v local.sm
call.i ds_map_add(argc=3)
popz.v
pushi.e 2246
conv.i.v
push.s "spr_bttech"@6706
conv.s.v
pushloc.v local.sm
call.i ds_map_add(argc=3)
popz.v
pushi.e 2447
conv.i.v
push.s "spr_darkmenudesc"@11949
conv.s.v
pushloc.v local.sm
call.i ds_map_add(argc=3)
popz.v
pushi.e 2347
conv.i.v
push.s "spr_dmenu_captions"@11950
conv.s.v
pushloc.v local.sm
call.i ds_map_add(argc=3)
popz.v
pushi.e 2539
conv.i.v
push.s "spr_quitmessage"@11951
conv.s.v
pushloc.v local.sm
call.i ds_map_add(argc=3)
popz.v
pushi.e 2327
conv.i.v
push.s "spr_thrashbody_b"@11952
conv.s.v
pushloc.v local.sm
call.i ds_map_add(argc=3)
popz.v
pushi.e 2325
conv.i.v
push.s "spr_thrashfoot_b"@11953
conv.s.v
pushloc.v local.sm
call.i ds_map_add(argc=3)
popz.v
pushi.e 2479
conv.i.v
push.s "spr_fieldmuslogo"@11954
conv.s.v
pushloc.v local.sm
call.i ds_map_add(argc=3)
popz.v
pushi.e 1736
conv.i.v
push.s "spr_werewire_zzt_text"@11955
conv.s.v
pushloc.v local.sm
call.i ds_map_add(argc=3)
popz.v
pushi.e 642
conv.i.v
push.s "spr_face_queen"@6082
conv.s.v
pushloc.v local.sm
call.i ds_map_add(argc=3)
popz.v
pushi.e 3072
conv.i.v
push.s "spr_city_mice_sign_01"@11956
conv.s.v
pushloc.v local.sm
call.i ds_map_add(argc=3)
popz.v
pushi.e 3073
conv.i.v
push.s "spr_city_mice_sign_02"@11957
conv.s.v
pushloc.v local.sm
call.i ds_map_add(argc=3)
popz.v
pushi.e 3074
conv.i.v
push.s "spr_city_mice_sign_03"@11958
conv.s.v
pushloc.v local.sm
call.i ds_map_add(argc=3)
popz.v
pushi.e 2235
conv.i.v
push.s "spr_bnamenoelle"@6720
conv.s.v
pushloc.v local.sm
call.i ds_map_add(argc=3)
popz.v
pushi.e 2233
conv.i.v
push.s "spr_bnamethrash"@6716
conv.s.v
pushloc.v local.sm
call.i ds_map_add(argc=3)
popz.v
pushi.e 373
conv.i.v
push.s "spr_cutscene_27_tender_goodbye"@11959
conv.s.v
pushloc.v local.sm
call.i ds_map_add(argc=3)
popz.v
pushi.e 3057
conv.i.v
push.s "spr_ch2_cityscreen"@11960
conv.s.v
pushloc.v local.sm
call.i ds_map_add(argc=3)
popz.v
pushi.e 2523
conv.i.v
push.s "spr_battlemsg"@11961
conv.s.v
pushloc.v local.sm
call.i ds_map_add(argc=3)
popz.v
pushi.e 37
conv.i.v
push.s "spr_queenscreen"@11962
conv.s.v
pushloc.v local.sm
call.i ds_map_add(argc=3)
popz.v
pushi.e 2188
conv.i.v
push.s "spr_acrade_retire"@11963
conv.s.v
pushloc.v local.sm
call.i ds_map_add(argc=3)
popz.v
pushi.e 3270
conv.i.v
push.s "spr_sneo_playback"@11964
conv.s.v
pushloc.v local.sm
call.i ds_map_add(argc=3)
popz.v
pushglb.v global.chemg_sound_map
pop.v.v local.sndm

:[17]
exit.i

:[18]
push.i gml_Script_scr_84_init_localization
conv.i.v
pushi.e -1
conv.i.v
call.i method(argc=2)
dup.v 0
pushi.e -1
pop.v.v [stacktop]self.scr_84_init_localization
popz.v

:[end]