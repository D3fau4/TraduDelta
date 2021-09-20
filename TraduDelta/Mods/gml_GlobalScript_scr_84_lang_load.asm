.localvar 2 arguments
.localvar 1 name 21861
.localvar 2 orig_filename 21862
.localvar 3 new_filename 21863
.localvar 4 filename 21864
.localvar 5 type 21865
.localvar 6 orig_map 21866
.localvar 7 new_map 21867
.localvar 8 new_date 21868
.localvar 9 orig_date 21869

:[0]
b [12]

> gml_Script_scr_84_lang_load (locals=9, argc=0)
:[1]
push.s "lang_"@11987
pushglb.v global.lang
add.v.s
push.s ".json"@11988
add.s.v
pop.v.v local.name
pushbltn.v builtin.working_directory
push.s "lang/"@11990
add.s.v
pushloc.v local.name
add.v.v
pop.v.v local.orig_filename
pushbltn.v builtin.working_directory
push.s "lang-new/"@11992
add.s.v
pushloc.v local.name
add.v.v
pop.v.v local.new_filename
pushloc.v local.orig_filename
pop.v.v local.filename
push.s "orig"@11994
pop.v.s local.type
push.s "{}"@11975
conv.s.v
call.i json_decode(argc=1)
pop.v.v local.orig_map
call.i gml_Script_is_english(argc=0)
conv.v.b
not.b
bf [10]

:[2]
push.s "loading lang: "@11996
pushloc.v local.orig_filename
add.v.s
call.i show_debug_message(argc=1)
popz.v
pushloc.v local.orig_filename
call.i gml_Script_scr_84_load_map_json(argc=1)
pop.v.v local.orig_map
pushloc.v local.new_filename
call.i file_exists(argc=1)
conv.v.b
bf [6]

:[3]
pushloc.v local.new_filename
call.i gml_Script_scr_84_load_map_json(argc=1)
pop.v.v local.new_map
push.s "date"@11998
conv.s.v
pushloc.v local.new_map
call.i ds_map_find_value(argc=2)
call.i real(argc=1)
pop.v.v local.new_date
push.s "date"@11998
conv.s.v
pushloc.v local.orig_map
call.i ds_map_find_value(argc=2)
call.i real(argc=1)
pop.v.v local.orig_date
push.s "orig_date: "@12001
pushloc.v local.orig_date
call.i string(argc=1)
add.v.s
call.i show_debug_message(argc=1)
popz.v
push.s " new_date: "@12002
pushloc.v local.new_date
call.i string(argc=1)
add.v.s
call.i show_debug_message(argc=1)
popz.v
pushloc.v local.new_date
pushloc.v local.orig_date
cmp.v.v GT
bf [5]

:[4]
push.s "using new language file"@12003
conv.s.v
call.i show_debug_message(argc=1)
popz.v
pushloc.v local.orig_map
call.i ds_map_destroy(argc=1)
popz.v
pushloc.v local.new_map
pop.v.v local.orig_map
pushloc.v local.new_filename
pop.v.v local.filename
push.s "new("@12004
pushloc.v local.new_date
call.i string(argc=1)
add.v.s
push.s ")"@12005
add.s.v
pop.v.v local.type
b [6]

:[5]
push.s "using orig language file"@12006
conv.s.v
call.i show_debug_message(argc=1)
popz.v

:[6]
pushglb.v global.lang_map
call.i ds_map_destroy(argc=1)
popz.v
pushloc.v local.orig_map
pop.v.v global.lang_map
call.i gml_Script_is_english(argc=0)
conv.v.b
not.b
bf [10]

:[7]
pushglb.v global.lang
push.s "ja"@6044
cmp.s.v EQ
bf [9]

:[8]
pushi.e 1
pop.v.i global.jp_data_loaded

:[9]
push.s "loaded: "@12008
pushloc.v local.filename
add.v.s
push.s ", entries: "@12009
add.s.v
pushglb.v global.lang_map
call.i ds_map_size(argc=1)
call.i string(argc=1)
add.v.v
call.i show_debug_message(argc=1)
popz.v

:[10]
pushloc.v local.type
ret.v

:[11]
exit.i

:[12]
push.i gml_Script_scr_84_lang_load
conv.i.v
pushi.e -1
conv.i.v
call.i method(argc=2)
dup.v 0
pushi.e -1
pop.v.v [stacktop]self.scr_84_lang_load
popz.v

:[end]