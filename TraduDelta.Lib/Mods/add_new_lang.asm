.localvar 2 arguments

:[0]
b [7]

> gml_Script_scr_change_language (locals=1, argc=0)
:[1]
pushglb.v global.lang
push.s "en"@9324
cmp.s.v EQ
bf [3]

:[2]
push.s "ja"@6049
pop.v.s global.lang
b [6]

:[3]
pushglb.v global.lang
push.s "{LENGUAGE}"@FFFFFF
cmp.s.v EQ
bf [5]

:[4]
push.s "en"@9324
pop.v.s global.lang
b [6]

:[5]
push.s "{LENGUAGE}"@FFFFFF
pop.v.s global.lang

:[6]
push.s "true_config.ini"@11944
conv.s.v
call.i gml_Script_ossafe_ini_open(argc=1)
popz.v
pushglb.v global.lang
push.s "LANG"@11945
conv.s.v
push.s "LANG"@11945
conv.s.v
call.i ini_write_string(argc=3)
popz.v
call.i gml_Script_ossafe_ini_close(argc=0)
popz.v
call.i gml_Script_ossafe_savedata_save(argc=0)
popz.v
call.i gml_Script_scr_84_init_localization(argc=0)
popz.v
exit.i

:[7]
push.i gml_Script_scr_change_language
conv.i.v
pushi.e -1
conv.i.v
call.i method(argc=2)
dup.v 0
pushi.e -1
pop.v.v [stacktop]self.scr_change_language
popz.v

:[end]