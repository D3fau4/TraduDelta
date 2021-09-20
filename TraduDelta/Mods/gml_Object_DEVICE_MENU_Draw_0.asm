.localvar 2 arguments
.localvar 1 NOWNAME 21867
.localvar 2 NOWTIME 21868
.localvar 3 filefound 21869
.localvar 4 NOWPLACE 21870
.localvar 5 languagex 21871

:[0]
push.s "main"@6036
conv.s.v
call.i gml_Script_scr_84_set_draw_font(argc=1)
popz.v
push.v self.TYPE
pushi.e 1
cmp.i.v EQ
bf [2]

:[1]
push.v self.SUBTYPE
pushi.e 0
cmp.i.v EQ
b [3]

:[2]
push.e 0

:[3]
bf [5]

:[4]
push.d 0.03
push.v self.BG_SINER
pushi.e 20
conv.i.d
div.d.v
call.i sin(argc=1)
push.d 0.04
mul.d.v
add.v.d
push.i 16777215
conv.i.v
pushi.e 0
conv.i.v
pushi.e 2
conv.i.v
pushi.e 2
conv.i.v
pushi.e 48
conv.i.v
pushi.e 43
conv.i.v
pushi.e 1
conv.i.v
pushi.e 2270
conv.i.v
call.i draw_sprite_ext(argc=9)
popz.v
push.d 0.03
push.v self.BG_SINER
pushi.e 20
conv.i.d
div.d.v
call.i sin(argc=1)
push.d 0.04
mul.d.v
add.v.d
push.i 16777215
conv.i.v
pushi.e 0
conv.i.v
pushi.e 2
conv.i.v
pushi.e 2
conv.i.v
pushi.e 48
conv.i.v
pushi.e 47
conv.i.v
pushi.e 1
conv.i.v
pushi.e 2270
conv.i.v
call.i draw_sprite_ext(argc=9)
popz.v
push.d 0.03
push.v self.BG_SINER
pushi.e 20
conv.i.d
div.d.v
call.i sin(argc=1)
push.d 0.04
mul.d.v
add.v.d
push.i 16777215
conv.i.v
pushi.e 0
conv.i.v
pushi.e 2
conv.i.v
pushi.e 2
conv.i.v
pushi.e 52
conv.i.v
pushi.e 43
conv.i.v
pushi.e 1
conv.i.v
pushi.e 2270
conv.i.v
call.i draw_sprite_ext(argc=9)
popz.v
push.d 0.03
push.v self.BG_SINER
pushi.e 20
conv.i.d
div.d.v
call.i sin(argc=1)
push.d 0.04
mul.d.v
add.v.d
push.i 16777215
conv.i.v
pushi.e 0
conv.i.v
pushi.e 2
conv.i.v
pushi.e 2
conv.i.v
pushi.e 52
conv.i.v
pushi.e 47
conv.i.v
pushi.e 1
conv.i.v
pushi.e 2270
conv.i.v
call.i draw_sprite_ext(argc=9)
popz.v
push.d 0.25
conv.d.v
push.i 16777215
conv.i.v
pushi.e 0
conv.i.v
pushi.e 2
conv.i.v
pushi.e 2
conv.i.v
pushi.e 50
conv.i.v
pushi.e 45
conv.i.v
pushi.e 1
conv.i.v
pushi.e 2270
conv.i.v
call.i draw_sprite_ext(argc=9)
popz.v
push.v self.BG_SINER
push.e 1
add.i.v
pop.v.v self.BG_SINER

:[5]
push.v self.BGMADE
pushi.e 1
cmp.i.v EQ
bf [7]

:[6]
push.v self.SUBTYPE
pushi.e 1
cmp.i.v EQ
b [8]

:[7]
push.e 0

:[8]
bf [22]

:[9]
push.v self.ANIM_SINER
pushi.e 1
add.i.v
pop.v.v self.ANIM_SINER
push.v self.ANIM_SINER_B
pushi.e 1
add.i.v
pop.v.v self.ANIM_SINER_B
push.v self.BG_SINER
pushi.e 1
add.i.v
pop.v.v self.BG_SINER
push.v self.BG_ALPHA
push.d 0.5
cmp.d.v LT
bf [11]

:[10]
push.v self.BG_ALPHA
push.d 0.04
push.v self.BG_ALPHA
pushi.e 14
conv.i.d
div.d.v
sub.v.d
add.v.v
pop.v.v self.BG_ALPHA

:[11]
push.v self.BG_ALPHA
push.d 0.5
cmp.d.v GT
bf [13]

:[12]
push.d 0.5
pop.v.d self.BG_ALPHA

:[13]
pushi.e 240
pop.v.i self.__WAVEHEIGHT
pushi.e 320
pop.v.i self.__WAVEWIDTH
pushi.e 0
pop.v.i self.i

:[14]
push.v self.i
push.v self.__WAVEHEIGHT
pushi.e 50
sub.i.v
cmp.v.v LT
bf [19]

:[15]
push.v self.BGMAGNITUDE
push.v self.i
push.v self.__WAVEHEIGHT
div.v.v
mul.v.v
push.d 1.3
mul.d.v
pop.v.v self.__WAVEMINUS
push.v self.__WAVEMINUS
push.v self.BGMAGNITUDE
cmp.v.v GT
bf [17]

:[16]
pushi.e 0
pop.v.i self.__WAVEMAG
b [18]

:[17]
push.v self.BGMAGNITUDE
push.v self.__WAVEMINUS
sub.v.v
pop.v.v self.__WAVEMAG

:[18]
push.v self.BG_ALPHA
push.d 0.8
mul.d.v
push.v self.image_blend
pushi.e 1
conv.i.v
pushi.e 1
conv.i.v
pushi.e -10
push.v self.i
add.v.i
push.v self.BG_ALPHA
pushi.e 20
mul.i.v
sub.v.v
push.v self.i
pushi.e 8
conv.i.d
div.d.v
push.v self.BG_SINER
pushi.e 30
conv.i.d
div.d.v
add.v.v
call.i sin(argc=1)
push.v self.__WAVEMAG
mul.v.v
pushi.e 1
conv.i.v
push.v self.__WAVEWIDTH
push.v self.i
pushi.e 0
conv.i.v
pushi.e 2825
conv.i.v
call.i gml_Script_draw_background_part_ext(argc=11)
popz.v
push.v self.BG_ALPHA
push.d 0.8
mul.d.v
push.v self.image_blend
pushi.e 1
conv.i.v
pushi.e 1
conv.i.v
pushi.e -10
push.v self.i
add.v.i
push.v self.BG_ALPHA
pushi.e 20
mul.i.v
sub.v.v
push.v self.i
pushi.e 8
conv.i.d
div.d.v
push.v self.BG_SINER
pushi.e 30
conv.i.d
div.d.v
add.v.v
call.i sin(argc=1)
neg.v
push.v self.__WAVEMAG
mul.v.v
pushi.e 1
conv.i.v
push.v self.__WAVEWIDTH
push.v self.i
pushi.e 0
conv.i.v
pushi.e 2825
conv.i.v
call.i gml_Script_draw_background_part_ext(argc=11)
popz.v
push.v self.i
pushi.e 1
add.i.v
pop.v.v self.i
b [14]

:[19]
push.v self.ANIM_SINER_B
pushi.e 10
conv.i.d
div.d.v
call.i sin(argc=1)
push.d 0.6
mul.d.v
push.d 0.25
sub.d.v
pop.v.v self.T_SINER_ADD
push.v self.T_SINER_ADD
pushi.e 0
cmp.i.v GTE
bf [21]

:[20]
push.v self.TRUE_ANIM_SINER
push.v self.T_SINER_ADD
add.v.v
pop.v.v self.TRUE_ANIM_SINER

:[21]
push.v self.BG_ALPHA
push.d 0.46
mul.d.v
push.v self.image_blend
pushi.e 0
conv.i.v
pushi.e 1
conv.i.v
pushi.e 1
conv.i.v
pushi.e 10
push.v self.BG_ALPHA
pushi.e 20
mul.i.v
sub.v.i
push.v self.__WAVEHEIGHT
add.v.v
pushi.e 70
sub.i.v
pushi.e 0
conv.i.v
push.v self.ANIM_SINER
pushi.e 12
conv.i.d
div.d.v
pushi.e 2517
conv.i.v
call.i draw_sprite_ext(argc=9)
popz.v
push.v self.BG_ALPHA
push.d 0.56
mul.d.v
push.v self.image_blend
pushi.e 0
conv.i.v
pushi.e 1
conv.i.v
pushi.e 1
conv.i.v
pushi.e 10
push.v self.BG_ALPHA
pushi.e 20
mul.i.v
sub.v.i
push.v self.__WAVEHEIGHT
add.v.v
pushi.e 70
sub.i.v
pushi.e 0
conv.i.v
push.v self.ANIM_SINER
pushi.e 12
conv.i.d
div.d.v
push.d 0.4
add.d.v
pushi.e 2517
conv.i.v
call.i draw_sprite_ext(argc=9)
popz.v
push.v self.BG_ALPHA
push.d 0.7
mul.d.v
push.v self.image_blend
pushi.e 0
conv.i.v
pushi.e 1
conv.i.v
pushi.e 1
conv.i.v
pushi.e 10
push.v self.BG_ALPHA
pushi.e 20
mul.i.v
sub.v.i
push.v self.__WAVEHEIGHT
add.v.v
pushi.e 70
sub.i.v
pushi.e 0
conv.i.v
push.v self.ANIM_SINER
pushi.e 12
conv.i.d
div.d.v
push.d 0.8
add.d.v
pushi.e 2517
conv.i.v
call.i draw_sprite_ext(argc=9)
popz.v

:[22]
push.v self.MENU_NO
pushi.e 0
cmp.i.v GTE
bf [149]

:[23]
pushi.e 0
pop.v.i self.i

:[24]
push.v self.i
pushi.e 3
cmp.i.v LT
bf [149]

:[25]
pushi.e 0
pop.v.i self.CONT_THIS
push.v self.MENU_NO
pop.v.v self.PREV_MENU
push.v self.MENU_NO
pushi.e 1
cmp.i.v EQ
bf [27]

:[26]
pushi.e 0
pop.v.i self.PREV_MENU

:[27]
push.v self.MENU_NO
pushi.e 4
cmp.i.v EQ
bf [29]

:[28]
pushi.e 3
pop.v.i self.PREV_MENU

:[29]
push.v self.MENU_NO
pushi.e 6
cmp.i.v EQ
bf [31]

:[30]
pushi.e 5
pop.v.i self.PREV_MENU

:[31]
push.v self.MENU_NO
pushi.e 7
cmp.i.v EQ
bf [33]

:[32]
pushi.e 5
pop.v.i self.PREV_MENU

:[33]
push.v self.MENU_NO
pushi.e 11
cmp.i.v EQ
bf [35]

:[34]
pushi.e 10
pop.v.i self.PREV_MENU

:[35]
pushi.e -1
pushi.e 0
push.v [array]self.MENUCOORD
push.v self.i
cmp.v.v EQ
bf [37]

:[36]
push.v self.MENU_NO
pushi.e 1
cmp.i.v EQ
b [38]

:[37]
push.e 0

:[38]
bf [40]

:[39]
pushi.e 1
pop.v.i self.CONT_THIS

:[40]
pushi.e -1
pushi.e 3
push.v [array]self.MENUCOORD
push.v self.i
cmp.v.v EQ
bf [42]

:[41]
push.v self.MENU_NO
pushi.e 4
cmp.i.v EQ
b [43]

:[42]
push.e 0

:[43]
bf [45]

:[44]
pushi.e 4
pop.v.i self.CONT_THIS

:[45]
pushi.e -1
pushi.e 5
push.v [array]self.MENUCOORD
push.v self.i
cmp.v.v EQ
bf [47]

:[46]
push.v self.MENU_NO
pushi.e 6
cmp.i.v EQ
b [48]

:[47]
push.e 0

:[48]
bf [50]

:[49]
pushi.e 6
pop.v.i self.CONT_THIS

:[50]
pushi.e -1
pushi.e 5
push.v [array]self.MENUCOORD
push.v self.i
cmp.v.v EQ
bf [52]

:[51]
push.v self.MENU_NO
pushi.e 7
cmp.i.v EQ
b [53]

:[52]
push.e 0

:[53]
bf [55]

:[54]
pushi.e 7
pop.v.i self.CONT_THIS

:[55]
pushi.e -1
pushi.e 10
push.v [array]self.MENUCOORD
push.v self.i
cmp.v.v EQ
bf [57]

:[56]
push.v self.MENU_NO
pushi.e 11
cmp.i.v EQ
b [58]

:[57]
push.e 0

:[58]
bf [60]

:[59]
pushi.e 11
pop.v.i self.CONT_THIS

:[60]
pushi.e 55
pop.v.i self.BOX_X1
pushi.e 55
push.v self.YL
push.v self.YS
add.v.v
push.v self.i
mul.v.v
add.v.i
pop.v.v self.BOX_Y1
pushi.e 55
push.v self.XL
add.v.i
pop.v.v self.BOX_X2
pushi.e 55
push.v self.YL
push.v self.YS
add.v.v
push.v self.i
mul.v.v
add.v.i
push.v self.YL
add.v.v
pop.v.v self.BOX_Y2
push.d 0.5
conv.d.v
call.i draw_set_alpha(argc=1)
popz.v
pushi.e 0
conv.i.v
call.i draw_set_color(argc=1)
popz.v
pushi.e 0
conv.i.v
push.v self.BOX_Y2
push.v self.BOX_X2
push.v self.BOX_Y1
push.v self.BOX_X1
call.i draw_rectangle(argc=5)
popz.v
pushi.e 1
conv.i.v
call.i draw_set_alpha(argc=1)
popz.v
push.v self.COL_A
call.i draw_set_color(argc=1)
popz.v
push.v self.MENU_NO
pushi.e 0
cmp.i.v GTE
bf [63]

:[61]
pushi.e -1
push.v self.PREV_MENU
conv.v.i
push.v [array]self.MENUCOORD
push.v self.i
cmp.v.v EQ
bf [63]

:[62]
push.v self.COL_B
call.i draw_set_color(argc=1)
popz.v

:[63]
push.v self.MENU_NO
pushi.e 3
cmp.i.v EQ
bt [65]

:[64]
push.v self.MENU_NO
pushi.e 4
cmp.i.v EQ
b [66]

:[65]
push.e 1

:[66]
bf [69]

:[67]
pushi.e -1
pushi.e 2
push.v [array]self.MENUCOORD
push.v self.i
cmp.v.v EQ
bf [69]

:[68]
push.v self.COL_PLUS
call.i draw_set_color(argc=1)
popz.v

:[69]
push.v self.MENU_NO
pushi.e 7
cmp.i.v EQ
bf [71]

:[70]
pushi.e -1
pushi.e 5
push.v [array]self.MENUCOORD
push.v self.i
cmp.v.v EQ
b [72]

:[71]
push.e 0

:[72]
bf [74]

:[73]
pushi.e 255
conv.i.v
call.i draw_set_color(argc=1)
popz.v

:[74]
pushi.e 1
conv.i.v
push.v self.BOX_Y2
push.v self.BOX_X2
push.v self.BOX_Y1
push.v self.BOX_X1
call.i draw_rectangle(argc=5)
popz.v
push.v self.TYPE
pushi.e 1
cmp.i.v EQ
bf [78]

:[75]
pushi.e 0
pop.v.i self.j

:[76]
push.v self.j
pushi.e 4
cmp.i.v LT
bf [78]

:[77]
pushi.e 1
conv.i.v
push.v self.BOX_Y2
push.d 0.5
push.v self.j
mul.v.d
add.v.v
push.v self.BOX_X2
push.d 0.5
push.v self.j
mul.v.d
add.v.v
push.v self.BOX_Y1
push.d 0.5
push.v self.j
mul.v.d
sub.v.v
push.v self.BOX_X1
push.d 0.5
push.v self.j
mul.v.d
sub.v.v
call.i draw_rectangle(argc=5)
popz.v
push.v self.j
pushi.e 1
add.i.v
pop.v.v self.j
b [76]

:[78]
push.v self.CONT_THIS
pushi.e 4
cmp.i.v LT
bt [80]

:[79]
push.v self.CONT_THIS
pushi.e 11
cmp.i.v EQ
b [81]

:[80]
push.e 1

:[81]
bf [108]

:[82]
pushi.e -1
push.v self.i
conv.v.i
push.v [array]self.NAME
pop.v.v local.NOWNAME
pushi.e -1
push.v self.i
conv.v.i
push.v [array]self.TIME_STRING
pop.v.v local.NOWTIME
push.v self.MENU_NO
pushi.e 10
cmp.i.v EQ
bt [84]

:[83]
push.v self.MENU_NO
pushi.e 11
cmp.i.v EQ
b [85]

:[84]
push.e 1

:[85]
bf [101]

:[86]
pushi.e 0
pop.v.i local.filefound
push.v self.INCOMPLETE_LOAD
pushi.e 0
cmp.i.v EQ
bf [88]

:[87]
pushi.e -1
push.v self.i
conv.v.i
push.v [array]self.COMPLETEFILE_PREV
pushi.e 1
cmp.i.v EQ
b [89]

:[88]
push.e 0

:[89]
bf [91]

:[90]
pushi.e 1
pop.v.i local.filefound

:[91]
push.v self.INCOMPLETE_LOAD
pushi.e 1
cmp.i.v EQ
bf [93]

:[92]
pushi.e -1
push.v self.i
conv.v.i
push.v [array]self.INCOMPLETEFILE_PREV
pushi.e 1
cmp.i.v EQ
b [94]

:[93]
push.e 0

:[94]
bf [96]

:[95]
pushi.e 1
pop.v.i local.filefound

:[96]
pushloc.v local.filefound
conv.v.b
bf [98]

:[97]
pushi.e -1
push.v self.i
conv.v.i
push.v [array]self.COMPLETEFILE_PREV_NAME
pop.v.v local.NOWNAME
pushi.e -1
push.v self.i
conv.v.i
push.v [array]self.COMPLETETIME_STRING
pop.v.v local.NOWTIME
b [101]

:[98]
push.v self.INCOMPLETE_LOAD
conv.v.b
bf [100]

:[99]
push.s "DEVICE_MENU_slash_Draw_0_gml_130_0"@29302
conv.s.v
push.s "FILE not found."@29303
conv.s.v
call.i gml_Script_stringsetloc(argc=2)
pop.v.v local.NOWNAME
b [101]

:[100]
push.s "DEVICE_MENU_slash_Draw_0_gml_125_0"@29304
conv.s.v
push.s "Completion FILE not found."@29305
conv.s.v
call.i gml_Script_stringsetloc(argc=2)
pop.v.v local.NOWNAME
push.s " "@210
pop.v.s local.NOWTIME

:[101]
pushglb.v global.lang
push.s "en"@9324
cmp.s.v EQ
bf [106]

:[102]
pushloc.v local.NOWNAME
call.i gml_Script_scr_kana_check(argc=1)
conv.v.b
bf [104]

:[103]
pushi.e 10
conv.i.v
call.i draw_set_font(argc=1)
popz.v
b [105]

:[104]
pushi.e 3
conv.i.v
call.i draw_set_font(argc=1)
popz.v

:[105]
b [107]

:[106]
pushi.e 10
conv.i.v
call.i draw_set_font(argc=1)
popz.v

:[107]
pushloc.v local.NOWNAME
push.v self.BOX_Y1
pushi.e 5
add.i.v
push.v self.BOX_X1
pushi.e 25
add.i.v
call.i gml_Script_draw_text_shadow(argc=3)
popz.v
push.s "main"@6036
conv.s.v
call.i gml_Script_scr_84_set_draw_font(argc=1)
popz.v
pushi.e 2
conv.i.v
call.i draw_set_halign(argc=1)
popz.v
pushloc.v local.NOWTIME
push.v self.BOX_Y1
pushi.e 5
add.i.v
push.v self.BOX_X1
pushi.e 180
add.i.v
call.i gml_Script_draw_text_shadow(argc=3)
popz.v
pushi.e 0
conv.i.v
call.i draw_set_halign(argc=1)
popz.v

:[108]
push.v self.CONT_THIS
pushi.e 1
cmp.i.v GTE
bf [138]

:[109]
push.v self.TYPE
pushi.e 0
cmp.i.v EQ
bf [120]

:[110]
push.v self.MENU_NO
pushi.e 1
cmp.i.v EQ
bf [113]

:[111]
push.s "DEVICE_MENU_slash_Draw_0_gml_115_0"@29306
conv.s.v
push.s " "@210
conv.s.v
call.i gml_Script_stringsetloc(argc=2)
pop.v.v self.SELTEXT_C
push.s "DEVICE_MENU_slash_Draw_0_gml_116_0"@29308
conv.s.v
push.s "CONTINUE"@29141
conv.s.v
call.i gml_Script_stringsetloc(argc=2)
pop.v.v self.SELTEXT_A
push.s "DEVICE_MENU_slash_Draw_0_gml_116_1"@29310
conv.s.v
push.s "BACK"@29311
conv.s.v
call.i gml_Script_stringsetloc(argc=2)
pop.v.v self.SELTEXT_B
pushi.e -1
pushi.e -1
pushi.e 0
push.v [array]self.MENUCOORD
conv.v.i
push.v [array]self.FILE
pushi.e 0
cmp.i.v EQ
bf [113]

:[112]
push.s "DEVICE_MENU_slash_Draw_0_gml_117_0"@29313
conv.s.v
push.s "BEGIN"@29314
conv.s.v
call.i gml_Script_stringsetloc(argc=2)
pop.v.v self.SELTEXT_A
push.s "DEVICE_MENU_slash_Draw_0_gml_117_1"@29315
conv.s.v
push.s "BACK"@29311
conv.s.v
call.i gml_Script_stringsetloc(argc=2)
pop.v.v self.SELTEXT_B

:[113]
push.v self.MENU_NO
pushi.e 4
cmp.i.v EQ
bf [115]

:[114]
push.s "DEVICE_MENU_slash_Draw_0_gml_119_0"@29316
conv.s.v
push.s "OVERWRITE"@29317
conv.s.v
call.i gml_Script_stringsetloc(argc=2)
pop.v.v self.SELTEXT_A
push.s "DEVICE_MENU_slash_Draw_0_gml_119_1"@29318
conv.s.v
push.s "DO NOT"@28782
conv.s.v
call.i gml_Script_stringsetloc(argc=2)
pop.v.v self.SELTEXT_B
push.s "DEVICE_MENU_slash_Draw_0_gml_119_2"@29319
conv.s.v
push.s "IT WILL BE SUBSUMED."@29320
conv.s.v
call.i gml_Script_stringsetloc(argc=2)
pop.v.v self.SELTEXT_C

:[115]
push.v self.MENU_NO
pushi.e 6
cmp.i.v EQ
bf [117]

:[116]
push.s "DEVICE_MENU_slash_Draw_0_gml_120_0"@29321
conv.s.v
push.s "YES"@28806
conv.s.v
call.i gml_Script_stringsetloc(argc=2)
pop.v.v self.SELTEXT_A
push.s "DEVICE_MENU_slash_Draw_0_gml_120_1"@29322
conv.s.v
push.s "NO"@28804
conv.s.v
call.i gml_Script_stringsetloc(argc=2)
pop.v.v self.SELTEXT_B
push.s "DEVICE_MENU_slash_Draw_0_gml_120_2"@29323
conv.s.v
push.s "TRULY ERASE IT?"@29324
conv.s.v
call.i gml_Script_stringsetloc(argc=2)
pop.v.v self.SELTEXT_C

:[117]
push.v self.MENU_NO
pushi.e 7
cmp.i.v EQ
bf [119]

:[118]
push.s "DEVICE_MENU_slash_Draw_0_gml_121_0"@29325
conv.s.v
push.s "ERASE"@28831
conv.s.v
call.i gml_Script_stringsetloc(argc=2)
pop.v.v self.SELTEXT_A
push.s "DEVICE_MENU_slash_Draw_0_gml_121_1"@29326
conv.s.v
push.s "DO NOT"@28782
conv.s.v
call.i gml_Script_stringsetloc(argc=2)
pop.v.v self.SELTEXT_B
push.s "DEVICE_MENU_slash_Draw_0_gml_121_2"@29327
conv.s.v
push.s "THEN IT WILL BE DESTROYED."@29328
conv.s.v
call.i gml_Script_stringsetloc(argc=2)
pop.v.v self.SELTEXT_C

:[119]
b [131]

:[120]
push.v self.MENU_NO
pushi.e 1
cmp.i.v EQ
bf [123]

:[121]
push.s "DEVICE_MENU_slash_Draw_0_gml_127_0"@29329
conv.s.v
push.s " "@210
conv.s.v
call.i gml_Script_stringsetloc(argc=2)
pop.v.v self.SELTEXT_C
push.s "DEVICE_MENU_slash_Draw_0_gml_128_0"@29330
conv.s.v
push.s "Continue"@29331
conv.s.v
call.i gml_Script_stringsetloc(argc=2)
pop.v.v self.SELTEXT_A
push.s "DEVICE_MENU_slash_Draw_0_gml_128_1"@29332
conv.s.v
push.s "Back"@20255
conv.s.v
call.i gml_Script_stringsetloc(argc=2)
pop.v.v self.SELTEXT_B
pushi.e -1
pushi.e -1
pushi.e 0
push.v [array]self.MENUCOORD
conv.v.i
push.v [array]self.FILE
pushi.e 0
cmp.i.v EQ
bf [123]

:[122]
push.s "DEVICE_MENU_slash_Draw_0_gml_129_0"@29333
conv.s.v
push.s "Start"@29334
conv.s.v
call.i gml_Script_stringsetloc(argc=2)
pop.v.v self.SELTEXT_A
push.s "DEVICE_MENU_slash_Draw_0_gml_129_1"@29335
conv.s.v
push.s "Back"@20255
conv.s.v
call.i gml_Script_stringsetloc(argc=2)
pop.v.v self.SELTEXT_B

:[123]
push.v self.MENU_NO
pushi.e 4
cmp.i.v EQ
bf [125]

:[124]
push.s "DEVICE_MENU_slash_Draw_0_gml_131_0"@29336
conv.s.v
push.s "Yes"@5478
conv.s.v
call.i gml_Script_stringsetloc(argc=2)
pop.v.v self.SELTEXT_A
push.s "DEVICE_MENU_slash_Draw_0_gml_131_1"@29337
conv.s.v
push.s "No"@2313
conv.s.v
call.i gml_Script_stringsetloc(argc=2)
pop.v.v self.SELTEXT_B
push.s "DEVICE_MENU_slash_Draw_0_gml_131_2"@29338
conv.s.v
push.s "Copy over this file?"@29339
conv.s.v
call.i gml_Script_stringsetloc(argc=2)
pop.v.v self.SELTEXT_C

:[125]
push.v self.MENU_NO
pushi.e 6
cmp.i.v EQ
bf [127]

:[126]
push.s "DEVICE_MENU_slash_Draw_0_gml_132_0"@29340
conv.s.v
push.s "Yes"@5478
conv.s.v
call.i gml_Script_stringsetloc(argc=2)
pop.v.v self.SELTEXT_A
push.s "DEVICE_MENU_slash_Draw_0_gml_132_1"@29341
conv.s.v
push.s "No"@2313
conv.s.v
call.i gml_Script_stringsetloc(argc=2)
pop.v.v self.SELTEXT_B
push.s "DEVICE_MENU_slash_Draw_0_gml_132_2"@29342
conv.s.v
push.s "Erase this file?"@29343
conv.s.v
call.i gml_Script_stringsetloc(argc=2)
pop.v.v self.SELTEXT_C

:[127]
push.v self.MENU_NO
pushi.e 7
cmp.i.v EQ
bf [129]

:[128]
push.s "DEVICE_MENU_slash_Draw_0_gml_133_0"@29344
conv.s.v
push.s "Yes!"@29345
conv.s.v
call.i gml_Script_stringsetloc(argc=2)
pop.v.v self.SELTEXT_A
push.s "DEVICE_MENU_slash_Draw_0_gml_133_1"@29346
conv.s.v
push.s "No!"@29347
conv.s.v
call.i gml_Script_stringsetloc(argc=2)
pop.v.v self.SELTEXT_B
push.s "DEVICE_MENU_slash_Draw_0_gml_133_2"@29348
conv.s.v
push.s "Really erase it?"@29349
conv.s.v
call.i gml_Script_stringsetloc(argc=2)
pop.v.v self.SELTEXT_C

:[129]
push.v self.MENU_NO
pushi.e 11
cmp.i.v EQ
bf [131]

:[130]
push.s "DEVICE_MENU_slash_Draw_0_gml_164_0"@29350
conv.s.v
push.s "Start"@29334
conv.s.v
call.i gml_Script_stringsetloc(argc=2)
pop.v.v self.SELTEXT_A
push.s "DEVICE_MENU_slash_Draw_0_gml_165_0"@29351
conv.s.v
push.s "Back"@20255
conv.s.v
call.i gml_Script_stringsetloc(argc=2)
pop.v.v self.SELTEXT_B
push.s "DEVICE_MENU_slash_Draw_0_gml_166_0"@29352
conv.s.v
push.s " "@210
conv.s.v
call.i gml_Script_stringsetloc(argc=2)
pop.v.v self.SELTEXT_C

:[131]
push.v self.COL_B
call.i draw_set_color(argc=1)
popz.v
push.v self.MENU_NO
pushi.e 7
cmp.i.v EQ
bf [133]

:[132]
pushi.e 255
conv.i.v
call.i draw_set_color(argc=1)
popz.v

:[133]
push.v self.SELTEXT_C
push.v self.BOX_Y1
pushi.e 5
add.i.v
push.v self.BOX_X1
pushi.e 25
add.i.v
call.i gml_Script_draw_text_shadow(argc=3)
popz.v
push.v self.COL_A
call.i draw_set_color(argc=1)
popz.v
pushi.e -1
push.v self.MENU_NO
conv.v.i
push.v [array]self.MENUCOORD
pushi.e 0
cmp.i.v EQ
bf [135]

:[134]
push.v self.COL_B
call.i draw_set_color(argc=1)
popz.v
pushi.e 75
pop.v.i self.HEARTX
pushi.e 81
push.v self.YL
push.v self.YS
add.v.v
pushi.e -1
push.v self.PREV_MENU
conv.v.i
push.v [array]self.MENUCOORD
mul.v.v
add.v.i
pop.v.v self.HEARTY

:[135]
push.v self.SELTEXT_A
push.v self.BOX_Y1
pushi.e 22
add.i.v
push.v self.BOX_X1
pushi.e 35
add.i.v
call.i gml_Script_draw_text_shadow(argc=3)
popz.v
push.v self.COL_A
call.i draw_set_color(argc=1)
popz.v
pushi.e -1
push.v self.MENU_NO
conv.v.i
push.v [array]self.MENUCOORD
pushi.e 1
cmp.i.v EQ
bf [137]

:[136]
push.v self.COL_B
call.i draw_set_color(argc=1)
popz.v
pushi.e 165
pop.v.i self.HEARTX
pushi.e 81
push.v self.YL
push.v self.YS
add.v.v
pushi.e -1
push.v self.PREV_MENU
conv.v.i
push.v [array]self.MENUCOORD
mul.v.v
add.v.i
pop.v.v self.HEARTY

:[137]
push.v self.SELTEXT_B
push.v self.BOX_Y1
pushi.e 22
add.i.v
push.v self.BOX_X1
pushi.e 125
add.i.v
call.i gml_Script_draw_text_shadow(argc=3)
popz.v
b [148]

:[138]
pushi.e -1
push.v self.i
conv.v.i
push.v [array]self.PLACE
pop.v.v local.NOWPLACE
push.v self.MENU_NO
pushi.e 10
cmp.i.v EQ
bt [140]

:[139]
push.v self.MENU_NO
pushi.e 11
cmp.i.v EQ
b [141]

:[140]
push.e 1

:[141]
bf [147]

:[142]
pushi.e -1
push.v self.i
conv.v.i
push.v [array]self.COMPLETEFILE_PREV
pushi.e 1
cmp.i.v EQ
bf [144]

:[143]
push.s "DEVICE_MENU_slash_Draw_0_gml_194_0"@29354
conv.s.v
push.s "Your Room [Chapter 1 END]"@29355
conv.s.v
call.i gml_Script_stringsetloc(argc=2)
pop.v.v local.NOWPLACE
b [145]

:[144]
push.s "DEVICE_MENU_slash_Draw_0_gml_195_0"@29356
conv.s.v
push.s "[Made on seeing credits.]"@29357
conv.s.v
call.i gml_Script_stringsetloc(argc=2)
pop.v.v local.NOWPLACE

:[145]
push.v self.INCOMPLETE_LOAD
conv.v.b
bf [147]

:[146]
pushi.e -1
push.v self.i
conv.v.i
push.v [array]self.COMPLETEFILE_PREV_PLACE
pop.v.v local.NOWPLACE

:[147]
pushi.e 180
conv.i.v
pushloc.v local.NOWPLACE
push.v self.BOX_Y1
pushi.e 22
add.i.v
push.v self.BOX_X1
pushi.e 25
add.i.v
call.i gml_Script_draw_text_shadow_width(argc=4)
popz.v

:[148]
push.v self.i
pushi.e 1
add.i.v
pop.v.v self.i
b [24]

:[149]
push.v self.MENU_NO
pushi.e 0
cmp.i.v GTE
bf [264]

:[150]
push.v self.MENU_NO
pushi.e 0
cmp.i.v EQ
bt [155]

:[151]
push.v self.MENU_NO
pushi.e 2
cmp.i.v EQ
bt [155]

:[152]
push.v self.MENU_NO
pushi.e 3
cmp.i.v EQ
bt [155]

:[153]
push.v self.MENU_NO
pushi.e 5
cmp.i.v EQ
bt [155]

:[154]
push.v self.MENU_NO
pushi.e 10
cmp.i.v EQ
b [156]

:[155]
push.e 1

:[156]
bf [174]

:[157]
pushi.e -1
push.v self.MENU_NO
conv.v.i
push.v [array]self.MENUCOORD
pushi.e 0
cmp.i.v GTE
bf [159]

:[158]
pushi.e -1
push.v self.MENU_NO
conv.v.i
push.v [array]self.MENUCOORD
pushi.e 2
cmp.i.v LTE
b [160]

:[159]
push.e 0

:[160]
bf [162]

:[161]
pushi.e 65
pop.v.i self.HEARTX
pushi.e 72
push.v self.YL
push.v self.YS
add.v.v
pushi.e -1
push.v self.MENU_NO
conv.v.i
push.v [array]self.MENUCOORD
mul.v.v
add.v.i
pop.v.v self.HEARTY

:[162]
pushi.e -1
push.v self.MENU_NO
conv.v.i
push.v [array]self.MENUCOORD
pushi.e 3
cmp.i.v EQ
bf [164]

:[163]
pushi.e 40
push.v self.jamod
sub.v.i
pop.v.v self.HEARTX
pushi.e 195
pop.v.i self.HEARTY

:[164]
pushi.e -1
push.v self.MENU_NO
conv.v.i
push.v [array]self.MENUCOORD
pushi.e 4
cmp.i.v EQ
bf [166]

:[165]
pushi.e 125
pop.v.i self.HEARTX
pushi.e 195
pop.v.i self.HEARTY

:[166]
pushi.e -1
push.v self.MENU_NO
conv.v.i
push.v [array]self.MENUCOORD
pushi.e 5
cmp.i.v EQ
bf [168]

:[167]
pushi.e 40
push.v self.jamod
sub.v.i
pop.v.v self.HEARTX
pushi.e 215
pop.v.i self.HEARTY

:[168]
pushi.e -1
push.v self.MENU_NO
conv.v.i
push.v [array]self.MENUCOORD
pushi.e 6
cmp.i.v EQ
bf [170]

:[169]
pushi.e 125
pop.v.i self.HEARTX
pushi.e 215
pop.v.i self.HEARTY

:[170]
pushi.e -1
push.v self.MENU_NO
conv.v.i
push.v [array]self.MENUCOORD
pushi.e 7
cmp.i.v EQ
bf [172]

:[171]
pushi.e 190
pop.v.i self.HEARTX
pushi.e 195
pop.v.i self.HEARTY

:[172]
pushi.e -1
push.v self.MENU_NO
conv.v.i
push.v [array]self.MENUCOORD
pushi.e 8
cmp.i.v EQ
bf [174]

:[173]
pushi.e 190
pop.v.i self.HEARTX
pushi.e 215
pop.v.i self.HEARTY

:[174]
push.v self.MENU_NO
pushi.e 2
cmp.i.v GTE
bf [186]

:[175]
push.s "DEVICE_MENU_slash_Draw_0_gml_189_0"@29358
conv.s.v
push.s "CANCEL"@20395
conv.s.v
call.i gml_Script_stringsetloc(argc=2)
pop.v.v self.CANCELTEXT
push.v self.TYPE
pushi.e 1
cmp.i.v EQ
bf [177]

:[176]
push.s "DEVICE_MENU_slash_Draw_0_gml_190_0"@29360
conv.s.v
push.s "Cancel"@5652
conv.s.v
call.i gml_Script_stringsetloc(argc=2)
pop.v.v self.CANCELTEXT

:[177]
push.v self.MENU_NO
pushi.e 10
cmp.i.v EQ
bt [179]

:[178]
push.v self.MENU_NO
pushi.e 11
cmp.i.v EQ
b [180]

:[179]
push.e 1

:[180]
bf [182]

:[181]
push.s "DEVICE_MENU_slash_Draw_0_gml_242_0"@29361
conv.s.v
push.s "Don't Use Chapter 1 FILE"@29362
conv.s.v
call.i gml_Script_stringsetloc(argc=2)
pop.v.v self.CANCELTEXT

:[182]
push.v self.COL_A
call.i draw_set_color(argc=1)
popz.v
push.v self.MENU_NO
pushi.e 20
cmp.i.v LT
bf [185]

:[183]
pushi.e -1
push.v self.PREV_MENU
conv.v.i
push.v [array]self.MENUCOORD
pushi.e 3
cmp.i.v EQ
bf [185]

:[184]
push.v self.COL_B
call.i draw_set_color(argc=1)
popz.v

:[185]
push.v self.CANCELTEXT
pushi.e 190
conv.i.v
pushi.e 55
conv.i.v
call.i gml_Script_draw_text_shadow(argc=3)
popz.v

:[186]
push.v self.MENU_NO
pushi.e 0
cmp.i.v EQ
bt [188]

:[187]
push.v self.MENU_NO
pushi.e 1
cmp.i.v EQ
b [189]

:[188]
push.e 1

:[189]
bf [219]

:[190]
pushi.e 0
pop.v.i self.jamod
pushglb.v global.lang
push.s "ja"@6044
cmp.s.v EQ
bf [192]

:[191]
pushi.e 10
pop.v.i self.jamod

:[192]
push.s "DEVICE_MENU_slash_Draw_0_gml_199_0"@29363
conv.s.v
push.s "COPY"@29364
conv.s.v
call.i gml_Script_stringsetloc(argc=2)
pop.v.v self.COPYTEXT
push.s "DEVICE_MENU_slash_Draw_0_gml_200_0"@29366
conv.s.v
push.s "ERASE"@28831
conv.s.v
call.i gml_Script_stringsetloc(argc=2)
pop.v.v self.ERASETEXT
push.s "DEVICE_MENU_slash_Draw_0_gml_253_0"@29368
conv.s.v
push.s "Ch 1 Files"@29369
conv.s.v
call.i gml_Script_stringsetloc(argc=2)
pop.v.v self.CH1TEXT
push.s "DEVICE_MENU_slash_Draw_0_gml_284_0"@29371
conv.s.v
push.s "Chapter Select"@14538
conv.s.v
call.i gml_Script_stringsetloc(argc=2)
pop.v.v self.CHSELECTTEXT
push.s "DEVICE_MENU_slash_Draw_0_gml_285_0"@29373
conv.s.v
push.s "End Program"@29374
conv.s.v
call.i gml_Script_stringsetloc(argc=2)
pop.v.v self.QUITTEXT
pushglb.v global.lang
push.s "en"@9324
cmp.s.v EQ
bf [194]

:[193]
push.s "日本語"@29376
conv.s.v
call.i gml_Script_stringset(argc=1)
pop.v.v self.LANGUAGETEXT
b [197]

:[194]
pushglb.v global.lang
push.s "es"@58265
cmp.s.v EQ
bf [196]

:[195]
push.s "English"@29377
conv.s.v
call.i gml_Script_stringset(argc=1)
pop.v.v self.LANGUAGETEXT
b [197]

:[196]
push.s "Español"@58266
conv.s.v
call.i gml_Script_stringset(argc=1)
pop.v.v self.LANGUAGETEXT

:[197]
push.v self.TYPE
pushi.e 1
cmp.i.v EQ
bf [199]

:[198]
push.s "DEVICE_MENU_slash_Draw_0_gml_201_0"@29379
conv.s.v
push.s "Copy"@29380
conv.s.v
call.i gml_Script_stringsetloc(argc=2)
pop.v.v self.COPYTEXT
push.s "DEVICE_MENU_slash_Draw_0_gml_201_1"@29381
conv.s.v
push.s "Erase"@29382
conv.s.v
call.i gml_Script_stringsetloc(argc=2)
pop.v.v self.ERASETEXT

:[199]
push.v self.COL_A
call.i draw_set_color(argc=1)
popz.v
pushi.e -1
pushi.e 0
push.v [array]self.MENUCOORD
pushi.e 3
cmp.i.v EQ
bf [201]

:[200]
push.v self.COL_B
call.i draw_set_color(argc=1)
popz.v

:[201]
push.v self.COPYTEXT
pushi.e 190
conv.i.v
pushi.e 54
push.v self.jamod
sub.v.i
call.i gml_Script_draw_text_shadow(argc=3)
popz.v
push.v self.COL_A
call.i draw_set_color(argc=1)
popz.v
pushi.e -1
pushi.e 0
push.v [array]self.MENUCOORD
pushi.e 4
cmp.i.v EQ
bf [203]

:[202]
push.v self.COL_B
call.i draw_set_color(argc=1)
popz.v

:[203]
push.v self.ERASETEXT
pushi.e 190
conv.i.v
pushi.e 140
conv.i.v
call.i gml_Script_draw_text_shadow(argc=3)
popz.v
push.v self.COL_A
call.i draw_set_color(argc=1)
popz.v
pushi.e -1
pushi.e 0
push.v [array]self.MENUCOORD
pushi.e 5
cmp.i.v EQ
bf [205]

:[204]
push.v self.COL_B
call.i draw_set_color(argc=1)
popz.v

:[205]
push.v self.CH1TEXT
pushi.e 210
conv.i.v
pushi.e 54
push.v self.jamod
sub.v.i
call.i gml_Script_draw_text_shadow(argc=3)
popz.v
push.v self.COL_A
call.i draw_set_color(argc=1)
popz.v
pushi.e -1
pushi.e 0
push.v [array]self.MENUCOORD
pushi.e 7
cmp.i.v EQ
bf [207]

:[206]
push.v self.COL_B
call.i draw_set_color(argc=1)
popz.v

:[207]
push.v self.CHSELECTTEXT
pushi.e 190
conv.i.v
pushi.e 204
conv.i.v
call.i gml_Script_draw_text_shadow(argc=3)
popz.v
push.v self.COL_A
call.i draw_set_color(argc=1)
popz.v
pushi.e -1
pushi.e 0
push.v [array]self.MENUCOORD
pushi.e 8
cmp.i.v EQ
bf [209]

:[208]
push.v self.COL_B
call.i draw_set_color(argc=1)
popz.v

:[209]
push.v self.CANQUIT
conv.v.b
bf [211]

:[210]
push.v self.QUITTEXT
pushi.e 210
conv.i.v
pushi.e 204
conv.i.v
call.i gml_Script_draw_text_shadow(argc=3)
popz.v

:[211]
pushglb.v global.lang
push.s "en"@9324
cmp.s.v EQ
bf [213]

:[212]
pushi.e 10
conv.i.v
call.i draw_set_font(argc=1)
popz.v
b [214]

:[213]
pushi.e 3
conv.i.v
call.i draw_set_font(argc=1)
popz.v

:[214]
push.v self.COL_A
call.i draw_set_color(argc=1)
popz.v
pushi.e -1
pushi.e 0
push.v [array]self.MENUCOORD
pushi.e 6
cmp.i.v EQ
bf [216]

:[215]
push.v self.COL_B
call.i draw_set_color(argc=1)
popz.v

:[216]
pushi.e 140
pop.v.i local.languagex
pushglb.v global.lang
push.s "en"@9324
cmp.s.v EQ
bf [218]

:[217]
pushi.e 136
pop.v.i local.languagex

:[218]
push.v self.LANGUAGETEXT
pushi.e 210
conv.i.v
pushloc.v local.languagex
call.i gml_Script_draw_text_shadow(argc=3)
popz.v
push.s "main"@6036
conv.s.v
call.i gml_Script_scr_84_set_draw_font(argc=1)
popz.v

:[219]
pushi.e 3
conv.i.v
call.i draw_set_font(argc=1)
popz.v
push.v self.TYPE
pushi.e 1
cmp.i.v EQ
bf [221]

:[220]
push.d 0.4
conv.d.v
call.i draw_set_alpha(argc=1)
popz.v
push.i 16777215
conv.i.v
call.i draw_set_color(argc=1)
popz.v
pushi.e 0
conv.i.v
push.d 0.5
conv.d.v
push.d 0.5
conv.d.v
push.s "DELTARUNE "@29384
push.v self.version_text
add.v.s
push.s " (C) Toby Fox 2018-2021 "@29385
add.s.v
pushi.e 230
conv.i.v
pushi.e 195
conv.i.v
call.i draw_text_transformed(argc=6)
popz.v
b [222]

:[221]
push.v self.COL_A
call.i draw_set_color(argc=1)
popz.v
pushi.e 0
conv.i.v
push.d 0.5
conv.d.v
push.d 0.5
conv.d.v
push.v self.version_text
pushi.e 230
conv.i.v
pushi.e 248
conv.i.v
call.i draw_text_transformed(argc=6)
popz.v
push.i 16777215
conv.i.v
call.i draw_set_color(argc=1)
popz.v

:[222]
push.s "main"@6036
conv.s.v
call.i gml_Script_scr_84_set_draw_font(argc=1)
popz.v
pushi.e 1
conv.i.v
call.i draw_set_alpha(argc=1)
popz.v
push.v self.MESSAGETIMER
pushi.e 0
cmp.i.v LTE
bf [263]

:[223]
push.v self.TYPE
pushi.e 0
cmp.i.v EQ
bf [241]

:[224]
push.v self.MENU_NO
pushi.e 0
cmp.i.v EQ
bt [226]

:[225]
push.v self.MENU_NO
pushi.e 1
cmp.i.v EQ
b [227]

:[226]
push.e 1

:[227]
bf [229]

:[228]
push.s "DEVICE_MENU_slash_Draw_0_gml_215_0"@29386
conv.s.v
push.s " "@210
conv.s.v
call.i gml_Script_stringsetloc(argc=2)
pop.v.v self.TEMPCOMMENT

:[229]
push.v self.MENU_NO
pushi.e 2
cmp.i.v EQ
bf [231]

:[230]
push.s "DEVICE_MENU_slash_Draw_0_gml_216_0"@29387
conv.s.v
push.s "CHOOSE THE ONE TO COPY."@29388
conv.s.v
call.i gml_Script_stringsetloc(argc=2)
pop.v.v self.TEMPCOMMENT

:[231]
push.v self.MENU_NO
pushi.e 3
cmp.i.v EQ
bf [233]

:[232]
push.s "DEVICE_MENU_slash_Draw_0_gml_217_0"@29389
conv.s.v
push.s "CHOOSE THE TARGET FOR THE REFLECTION."@29390
conv.s.v
call.i gml_Script_stringsetloc(argc=2)
pop.v.v self.TEMPCOMMENT

:[233]
push.v self.MENU_NO
pushi.e 4
cmp.i.v EQ
bf [235]

:[234]
push.s "DEVICE_MENU_slash_Draw_0_gml_218_0"@29391
conv.s.v
push.s "IT WILL BE SUBSUMED."@29320
conv.s.v
call.i gml_Script_stringsetloc(argc=2)
pop.v.v self.TEMPCOMMENT

:[235]
push.v self.MENU_NO
pushi.e 5
cmp.i.v EQ
bt [238]

:[236]
push.v self.MENU_NO
pushi.e 6
cmp.i.v EQ
bt [238]

:[237]
push.v self.MENU_NO
pushi.e 7
cmp.i.v EQ
b [239]

:[238]
push.e 1

:[239]
bf [241]

:[240]
push.s "DEVICE_MENU_slash_Draw_0_gml_219_0"@29392
conv.s.v
push.s "SELECT THE ONE TO ERASE."@29393
conv.s.v
call.i gml_Script_stringsetloc(argc=2)
pop.v.v self.TEMPCOMMENT

:[241]
push.v self.TYPE
pushi.e 1
cmp.i.v EQ
bf [263]

:[242]
push.v self.MENU_NO
pushi.e 0
cmp.i.v EQ
bt [244]

:[243]
push.v self.MENU_NO
pushi.e 1
cmp.i.v EQ
b [245]

:[244]
push.e 1

:[245]
bf [247]

:[246]
push.s "DEVICE_MENU_slash_Draw_0_gml_223_0"@29394
conv.s.v
push.s "Please select a file."@29395
conv.s.v
call.i gml_Script_stringsetloc(argc=2)
pop.v.v self.TEMPCOMMENT

:[247]
push.v self.MENU_NO
pushi.e 2
cmp.i.v EQ
bf [249]

:[248]
push.s "DEVICE_MENU_slash_Draw_0_gml_224_0"@29396
conv.s.v
push.s "Choose a file to copy."@29397
conv.s.v
call.i gml_Script_stringsetloc(argc=2)
pop.v.v self.TEMPCOMMENT

:[249]
push.v self.MENU_NO
pushi.e 3
cmp.i.v EQ
bf [251]

:[250]
push.s "DEVICE_MENU_slash_Draw_0_gml_225_0"@29398
conv.s.v
push.s "Choose a file to copy to."@29399
conv.s.v
call.i gml_Script_stringsetloc(argc=2)
pop.v.v self.TEMPCOMMENT

:[251]
push.v self.MENU_NO
pushi.e 4
cmp.i.v EQ
bf [253]

:[252]
push.s "DEVICE_MENU_slash_Draw_0_gml_226_0"@29400
conv.s.v
push.s "The file will be overwritten."@29401
conv.s.v
call.i gml_Script_stringsetloc(argc=2)
pop.v.v self.TEMPCOMMENT

:[253]
push.v self.MENU_NO
pushi.e 5
cmp.i.v EQ
bt [256]

:[254]
push.v self.MENU_NO
pushi.e 6
cmp.i.v EQ
bt [256]

:[255]
push.v self.MENU_NO
pushi.e 7
cmp.i.v EQ
b [257]

:[256]
push.e 1

:[257]
bf [259]

:[258]
push.s "DEVICE_MENU_slash_Draw_0_gml_227_0"@29402
conv.s.v
push.s "Choose a file to erase."@29403
conv.s.v
call.i gml_Script_stringsetloc(argc=2)
pop.v.v self.TEMPCOMMENT

:[259]
push.v self.MENU_NO
pushi.e 10
cmp.i.v EQ
bf [261]

:[260]
push.s "DEVICE_MENU_slash_Draw_0_gml_291_0"@29404
conv.s.v
push.s "Start Chapter 2 from Chapter 1's FILE."@29405
conv.s.v
call.i gml_Script_stringsetloc(argc=2)
pop.v.v self.TEMPCOMMENT

:[261]
push.v self.MENU_NO
pushi.e 11
cmp.i.v EQ
bf [263]

:[262]
push.s "DEVICE_MENU_slash_Draw_0_gml_292_0"@29406
conv.s.v
pushi.e -1
pushi.e 10
push.v [array]self.MENUCOORD
pushi.e 1
add.i.v
push.s "This will start Chapter 2 in FILE Slot ~1."@29407
conv.s.v
call.i gml_Script_stringsetsubloc(argc=3)
pop.v.v self.TEMPCOMMENT

:[263]
push.v self.COL_B
call.i draw_set_color(argc=1)
popz.v
push.v self.TEMPCOMMENT
pushi.e 30
conv.i.v
pushi.e 40
conv.i.v
call.i gml_Script_draw_text_shadow(argc=3)
popz.v
push.v self.MESSAGETIMER
pushi.e 1
sub.i.v
pop.v.v self.MESSAGETIMER

:[264]
push.v self.HEARTX
push.v self.HEARTXCUR
sub.v.v
call.i abs(argc=1)
pushi.e 2
cmp.i.v LTE
bf [266]

:[265]
push.v self.HEARTX
pop.v.v self.HEARTXCUR

:[266]
push.v self.HEARTY
push.v self.HEARTYCUR
sub.v.v
call.i abs(argc=1)
pushi.e 2
cmp.i.v LTE
bf [268]

:[267]
push.v self.HEARTY
pop.v.v self.HEARTYCUR

:[268]
push.v self.HEARTXCUR
push.v self.HEARTX
push.v self.HEARTXCUR
sub.v.v
pushi.e 2
conv.i.d
div.d.v
add.v.v
pop.v.v self.HEARTXCUR
push.v self.HEARTYCUR
push.v self.HEARTY
push.v self.HEARTYCUR
sub.v.v
pushi.e 2
conv.i.d
div.d.v
add.v.v
pop.v.v self.HEARTYCUR
push.v self.MENU_NO
pushi.e 0
cmp.i.v GTE
bf [270]

:[269]
push.v self.HEARTYCUR
push.v self.HEARTXCUR
pushi.e 0
conv.i.v
pushi.e 2533
conv.i.v
call.i draw_sprite(argc=4)
popz.v

:[270]
pushi.e 3
conv.i.v
call.i draw_set_font(argc=1)
popz.v
push.i 16777215
conv.i.v
call.i draw_set_color(argc=1)
popz.v
push.s "CHAPTER "@20822
pushglb.v global.chapter
call.i string(argc=1)
add.v.s
call.i gml_Script_cameray(argc=0)
pushi.e 4
add.i.v
call.i gml_Script_camerax(argc=0)
pushi.e 8
add.i.v
call.i gml_Script_draw_text_shadow(argc=3)
popz.v
push.s "main"@6036
conv.s.v
call.i gml_Script_scr_84_set_draw_font(argc=1)
popz.v

:[end]