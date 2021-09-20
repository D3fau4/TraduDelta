.localvar 2 arguments
.localvar 1 lang_offset 21880

:[0]
push.s "main"@6036
conv.s.v
call.i gml_Script_scr_84_set_draw_font_ch1(argc=1)
popz.v
push.v self.BGMADE
pushi.e 1
cmp.i.v EQ
bf [14]

:[1]
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
bf [3]

:[2]
push.v self.BG_ALPHA
push.d 0.04
push.v self.BG_ALPHA
pushi.e 14
conv.i.d
div.d.v
sub.v.d
add.v.v
pop.v.v self.BG_ALPHA

:[3]
push.v self.BG_ALPHA
push.d 0.5
cmp.d.v GT
bf [5]

:[4]
push.d 0.5
pop.v.d self.BG_ALPHA

:[5]
pushi.e 240
pop.v.i self.__WAVEHEIGHT
pushi.e 320
pop.v.i self.__WAVEWIDTH
pushi.e 0
pop.v.i self.i

:[6]
push.v self.i
push.v self.__WAVEHEIGHT
pushi.e 50
sub.i.v
cmp.v.v LT
bf [11]

:[7]
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
bf [9]

:[8]
pushi.e 0
pop.v.i self.__WAVEMAG
b [10]

:[9]
push.v self.BGMAGNITUDE
push.v self.__WAVEMINUS
sub.v.v
pop.v.v self.__WAVEMAG

:[10]
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
pushi.e 4376
conv.i.v
call.i gml_Script_draw_background_part_ext_ch1(argc=11)
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
pushi.e 4376
conv.i.v
call.i gml_Script_draw_background_part_ext_ch1(argc=11)
popz.v
push.v self.i
pushi.e 1
add.i.v
pop.v.v self.i
b [6]

:[11]
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
bf [13]

:[12]
push.v self.TRUE_ANIM_SINER
push.v self.T_SINER_ADD
add.v.v
pop.v.v self.TRUE_ANIM_SINER

:[13]
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
pushi.e 4269
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
pushi.e 4269
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
pushi.e 4269
conv.i.v
call.i draw_sprite_ext(argc=9)
popz.v

:[14]
pushi.e 0
pop.v.i self.i

:[15]
push.v self.i
pushi.e 3
cmp.i.v LT
bf [99]

:[16]
pushi.e 0
pop.v.i self.CONT_THIS
push.v self.MENU_NO
pop.v.v self.PREV_MENU
push.v self.MENU_NO
pushi.e 1
cmp.i.v EQ
bf [18]

:[17]
pushi.e 0
pop.v.i self.PREV_MENU

:[18]
push.v self.MENU_NO
pushi.e 4
cmp.i.v EQ
bf [20]

:[19]
pushi.e 3
pop.v.i self.PREV_MENU

:[20]
push.v self.MENU_NO
pushi.e 6
cmp.i.v EQ
bf [22]

:[21]
pushi.e 5
pop.v.i self.PREV_MENU

:[22]
push.v self.MENU_NO
pushi.e 7
cmp.i.v EQ
bf [24]

:[23]
pushi.e 5
pop.v.i self.PREV_MENU

:[24]
pushi.e -1
pushi.e 0
push.v [array]self.MENUCOORD
push.v self.i
cmp.v.v EQ
bf [26]

:[25]
push.v self.MENU_NO
pushi.e 1
cmp.i.v EQ
b [27]

:[26]
push.e 0

:[27]
bf [29]

:[28]
pushi.e 1
pop.v.i self.CONT_THIS

:[29]
pushi.e -1
pushi.e 3
push.v [array]self.MENUCOORD
push.v self.i
cmp.v.v EQ
bf [31]

:[30]
push.v self.MENU_NO
pushi.e 4
cmp.i.v EQ
b [32]

:[31]
push.e 0

:[32]
bf [34]

:[33]
pushi.e 4
pop.v.i self.CONT_THIS

:[34]
pushi.e -1
pushi.e 5
push.v [array]self.MENUCOORD
push.v self.i
cmp.v.v EQ
bf [36]

:[35]
push.v self.MENU_NO
pushi.e 6
cmp.i.v EQ
b [37]

:[36]
push.e 0

:[37]
bf [39]

:[38]
pushi.e 6
pop.v.i self.CONT_THIS

:[39]
pushi.e -1
pushi.e 5
push.v [array]self.MENUCOORD
push.v self.i
cmp.v.v EQ
bf [41]

:[40]
push.v self.MENU_NO
pushi.e 7
cmp.i.v EQ
b [42]

:[41]
push.e 0

:[42]
bf [44]

:[43]
pushi.e 7
pop.v.i self.CONT_THIS

:[44]
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
pushi.e -1
push.v self.PREV_MENU
conv.v.i
push.v [array]self.MENUCOORD
push.v self.i
cmp.v.v EQ
bf [46]

:[45]
push.v self.COL_B
call.i draw_set_color(argc=1)
popz.v

:[46]
push.v self.MENU_NO
pushi.e 3
cmp.i.v EQ
bt [48]

:[47]
push.v self.MENU_NO
pushi.e 4
cmp.i.v EQ
b [49]

:[48]
push.e 1

:[49]
bf [52]

:[50]
pushi.e -1
pushi.e 2
push.v [array]self.MENUCOORD
push.v self.i
cmp.v.v EQ
bf [52]

:[51]
push.v self.COL_PLUS
call.i draw_set_color(argc=1)
popz.v

:[52]
push.v self.MENU_NO
pushi.e 7
cmp.i.v EQ
bf [54]

:[53]
pushi.e -1
pushi.e 5
push.v [array]self.MENUCOORD
push.v self.i
cmp.v.v EQ
b [55]

:[54]
push.e 0

:[55]
bf [57]

:[56]
pushi.e 255
conv.i.v
call.i draw_set_color(argc=1)
popz.v

:[57]
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
bf [61]

:[58]
pushi.e 0
pop.v.i self.j

:[59]
push.v self.j
pushi.e 4
cmp.i.v LT
bf [61]

:[60]
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
b [59]

:[61]
push.v self.CONT_THIS
pushi.e 4
cmp.i.v LT
bf [69]

:[62]
pushi.e -1
push.v self.i
conv.v.i
push.v [array]self.FILE
pushi.e 0
cmp.i.v EQ
bf [64]

:[63]
push.s "main"@6036
conv.s.v
call.i gml_Script_scr_84_set_draw_font_ch1(argc=1)
popz.v
b [68]

:[64]
pushi.e -1
push.v self.i
conv.v.i
push.v [array]self.INITLANG
pushi.e 0
cmp.i.v EQ
bf [66]

:[65]
pushi.e 3
conv.i.v
call.i draw_set_font(argc=1)
popz.v
b [68]

:[66]
pushi.e -1
push.v self.i
conv.v.i
push.v [array]self.INITLANG
pushi.e 1
cmp.i.v EQ
bf [68]

:[67]
pushi.e 10
conv.i.v
call.i draw_set_font(argc=1)
popz.v

:[68]
pushi.e -1
push.v self.i
conv.v.i
push.v [array]self.NAME
push.v self.BOX_Y1
pushi.e 5
add.i.v
push.v self.BOX_X1
pushi.e 25
add.i.v
call.i gml_Script_draw_text_shadow_ch1(argc=3)
popz.v
push.s "main"@6036
conv.s.v
call.i gml_Script_scr_84_set_draw_font_ch1(argc=1)
popz.v
pushi.e 2
conv.i.v
call.i draw_set_halign(argc=1)
popz.v
pushi.e -1
push.v self.i
conv.v.i
push.v [array]self.TIME_STRING
push.v self.BOX_Y1
pushi.e 5
add.i.v
push.v self.BOX_X1
pushi.e 180
add.i.v
call.i gml_Script_draw_text_shadow_ch1(argc=3)
popz.v
pushi.e 0
conv.i.v
call.i draw_set_halign(argc=1)
popz.v

:[69]
push.v self.CONT_THIS
pushi.e 1
cmp.i.v GTE
bf [97]

:[70]
push.v self.TYPE
pushi.e 0
cmp.i.v EQ
bf [81]

:[71]
push.v self.MENU_NO
pushi.e 1
cmp.i.v EQ
bf [74]

:[72]
push.s " "@210
pop.v.s self.SELTEXT_C
push.s "DEVICE_MENU_slash_Draw_0_gml_116_0"@29308
conv.s.v
call.i gml_Script_scr_84_get_lang_string_ch1(argc=1)
pop.v.v self.SELTEXT_A
push.s "DEVICE_MENU_slash_Draw_0_gml_116_1"@29310
conv.s.v
call.i gml_Script_scr_84_get_lang_string_ch1(argc=1)
pop.v.v self.SELTEXT_B
pushi.e -1
pushi.e -1
pushi.e 0
push.v [array]self.MENUCOORD
conv.v.i
push.v [array]self.FILE
pushi.e 0
cmp.i.v EQ
bf [74]

:[73]
push.s "DEVICE_MENU_slash_Draw_0_gml_117_0"@29313
conv.s.v
call.i gml_Script_scr_84_get_lang_string_ch1(argc=1)
pop.v.v self.SELTEXT_A
push.s "DEVICE_MENU_slash_Draw_0_gml_117_1"@29315
conv.s.v
call.i gml_Script_scr_84_get_lang_string_ch1(argc=1)
pop.v.v self.SELTEXT_B

:[74]
push.v self.MENU_NO
pushi.e 4
cmp.i.v EQ
bf [76]

:[75]
push.s "DEVICE_MENU_slash_Draw_0_gml_119_0"@29316
conv.s.v
call.i gml_Script_scr_84_get_lang_string_ch1(argc=1)
pop.v.v self.SELTEXT_A
push.s "DEVICE_MENU_slash_Draw_0_gml_119_1"@29318
conv.s.v
call.i gml_Script_scr_84_get_lang_string_ch1(argc=1)
pop.v.v self.SELTEXT_B
push.s "DEVICE_MENU_slash_Draw_0_gml_119_2"@29319
conv.s.v
call.i gml_Script_scr_84_get_lang_string_ch1(argc=1)
pop.v.v self.SELTEXT_C

:[76]
push.v self.MENU_NO
pushi.e 6
cmp.i.v EQ
bf [78]

:[77]
push.s "DEVICE_MENU_slash_Draw_0_gml_120_0"@29321
conv.s.v
call.i gml_Script_scr_84_get_lang_string_ch1(argc=1)
pop.v.v self.SELTEXT_A
push.s "DEVICE_MENU_slash_Draw_0_gml_120_1"@29322
conv.s.v
call.i gml_Script_scr_84_get_lang_string_ch1(argc=1)
pop.v.v self.SELTEXT_B
push.s "DEVICE_MENU_slash_Draw_0_gml_120_2"@29323
conv.s.v
call.i gml_Script_scr_84_get_lang_string_ch1(argc=1)
pop.v.v self.SELTEXT_C

:[78]
push.v self.MENU_NO
pushi.e 7
cmp.i.v EQ
bf [80]

:[79]
push.s "DEVICE_MENU_slash_Draw_0_gml_121_0"@29325
conv.s.v
call.i gml_Script_scr_84_get_lang_string_ch1(argc=1)
pop.v.v self.SELTEXT_A
push.s "DEVICE_MENU_slash_Draw_0_gml_121_1"@29326
conv.s.v
call.i gml_Script_scr_84_get_lang_string_ch1(argc=1)
pop.v.v self.SELTEXT_B
push.s "DEVICE_MENU_slash_Draw_0_gml_121_2"@29327
conv.s.v
call.i gml_Script_scr_84_get_lang_string_ch1(argc=1)
pop.v.v self.SELTEXT_C

:[80]
b [90]

:[81]
push.v self.MENU_NO
pushi.e 1
cmp.i.v EQ
bf [84]

:[82]
push.s " "@210
pop.v.s self.SELTEXT_C
push.s "DEVICE_MENU_slash_Draw_0_gml_128_0"@29330
conv.s.v
call.i gml_Script_scr_84_get_lang_string_ch1(argc=1)
pop.v.v self.SELTEXT_A
push.s "DEVICE_MENU_slash_Draw_0_gml_128_1"@29332
conv.s.v
call.i gml_Script_scr_84_get_lang_string_ch1(argc=1)
pop.v.v self.SELTEXT_B
pushi.e -1
pushi.e -1
pushi.e 0
push.v [array]self.MENUCOORD
conv.v.i
push.v [array]self.FILE
pushi.e 0
cmp.i.v EQ
bf [84]

:[83]
push.s "DEVICE_MENU_slash_Draw_0_gml_129_0"@29333
conv.s.v
call.i gml_Script_scr_84_get_lang_string_ch1(argc=1)
pop.v.v self.SELTEXT_A
push.s "DEVICE_MENU_slash_Draw_0_gml_129_1"@29335
conv.s.v
call.i gml_Script_scr_84_get_lang_string_ch1(argc=1)
pop.v.v self.SELTEXT_B

:[84]
push.v self.MENU_NO
pushi.e 4
cmp.i.v EQ
bf [86]

:[85]
push.s "DEVICE_MENU_slash_Draw_0_gml_131_0"@29336
conv.s.v
call.i gml_Script_scr_84_get_lang_string_ch1(argc=1)
pop.v.v self.SELTEXT_A
push.s "DEVICE_MENU_slash_Draw_0_gml_131_1"@29337
conv.s.v
call.i gml_Script_scr_84_get_lang_string_ch1(argc=1)
pop.v.v self.SELTEXT_B
push.s "DEVICE_MENU_slash_Draw_0_gml_131_2"@29338
conv.s.v
call.i gml_Script_scr_84_get_lang_string_ch1(argc=1)
pop.v.v self.SELTEXT_C

:[86]
push.v self.MENU_NO
pushi.e 6
cmp.i.v EQ
bf [88]

:[87]
push.s "DEVICE_MENU_slash_Draw_0_gml_132_0"@29340
conv.s.v
call.i gml_Script_scr_84_get_lang_string_ch1(argc=1)
pop.v.v self.SELTEXT_A
push.s "DEVICE_MENU_slash_Draw_0_gml_132_1"@29341
conv.s.v
call.i gml_Script_scr_84_get_lang_string_ch1(argc=1)
pop.v.v self.SELTEXT_B
push.s "DEVICE_MENU_slash_Draw_0_gml_132_2"@29342
conv.s.v
call.i gml_Script_scr_84_get_lang_string_ch1(argc=1)
pop.v.v self.SELTEXT_C

:[88]
push.v self.MENU_NO
pushi.e 7
cmp.i.v EQ
bf [90]

:[89]
push.s "DEVICE_MENU_slash_Draw_0_gml_133_0"@29344
conv.s.v
call.i gml_Script_scr_84_get_lang_string_ch1(argc=1)
pop.v.v self.SELTEXT_A
push.s "DEVICE_MENU_slash_Draw_0_gml_133_1"@29346
conv.s.v
call.i gml_Script_scr_84_get_lang_string_ch1(argc=1)
pop.v.v self.SELTEXT_B
push.s "DEVICE_MENU_slash_Draw_0_gml_133_2"@29348
conv.s.v
call.i gml_Script_scr_84_get_lang_string_ch1(argc=1)
pop.v.v self.SELTEXT_C

:[90]
push.v self.COL_B
call.i draw_set_color(argc=1)
popz.v
push.v self.MENU_NO
pushi.e 7
cmp.i.v EQ
bf [92]

:[91]
pushi.e 255
conv.i.v
call.i draw_set_color(argc=1)
popz.v

:[92]
push.v self.SELTEXT_C
push.v self.BOX_Y1
pushi.e 5
add.i.v
push.v self.BOX_X1
pushi.e 25
add.i.v
call.i gml_Script_draw_text_shadow_ch1(argc=3)
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
bf [94]

:[93]
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

:[94]
push.v self.SELTEXT_A
push.v self.BOX_Y1
pushi.e 22
add.i.v
push.v self.BOX_X1
pushi.e 35
add.i.v
call.i gml_Script_draw_text_shadow_ch1(argc=3)
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
bf [96]

:[95]
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

:[96]
push.v self.SELTEXT_B
push.v self.BOX_Y1
pushi.e 22
add.i.v
push.v self.BOX_X1
pushi.e 125
add.i.v
call.i gml_Script_draw_text_shadow_ch1(argc=3)
popz.v
b [98]

:[97]
pushi.e -1
push.v self.i
conv.v.i
push.v [array]self.PLACE
push.v self.BOX_Y1
pushi.e 22
add.i.v
push.v self.BOX_X1
pushi.e 25
add.i.v
call.i gml_Script_draw_text_shadow_ch1(argc=3)
popz.v

:[98]
push.v self.i
pushi.e 1
add.i.v
pop.v.v self.i
b [15]

:[99]
push.v self.MENU_NO
pushi.e 0
cmp.i.v GTE
bf [197]

:[100]
push.v self.MENU_NO
pushi.e 0
cmp.i.v EQ
bt [104]

:[101]
push.v self.MENU_NO
pushi.e 2
cmp.i.v EQ
bt [104]

:[102]
push.v self.MENU_NO
pushi.e 3
cmp.i.v EQ
bt [104]

:[103]
push.v self.MENU_NO
pushi.e 5
cmp.i.v EQ
b [105]

:[104]
push.e 1

:[105]
bf [119]

:[106]
pushi.e -1
push.v self.MENU_NO
conv.v.i
push.v [array]self.MENUCOORD
pushi.e 0
cmp.i.v GTE
bf [108]

:[107]
pushi.e -1
push.v self.MENU_NO
conv.v.i
push.v [array]self.MENUCOORD
pushi.e 2
cmp.i.v LTE
b [109]

:[108]
push.e 0

:[109]
bf [111]

:[110]
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

:[111]
pushi.e -1
push.v self.MENU_NO
conv.v.i
push.v [array]self.MENUCOORD
pushi.e 3
cmp.i.v EQ
bf [113]

:[112]
pushi.e 40
pop.v.i self.HEARTX
pushi.e 195
pop.v.i self.HEARTY

:[113]
pushi.e -1
push.v self.MENU_NO
conv.v.i
push.v [array]self.MENUCOORD
pushi.e 4
cmp.i.v EQ
bf [115]

:[114]
pushi.e 125
pop.v.i self.HEARTX
pushi.e 195
pop.v.i self.HEARTY

:[115]
pushi.e -1
push.v self.MENU_NO
conv.v.i
push.v [array]self.MENUCOORD
pushi.e 5
cmp.i.v EQ
bf [117]

:[116]
pushi.e 190
pop.v.i self.HEARTX
pushi.e 195
pop.v.i self.HEARTY

:[117]
pushi.e -1
push.v self.MENU_NO
conv.v.i
push.v [array]self.MENUCOORD
pushi.e 6
cmp.i.v EQ
bf [119]

:[118]
pushi.e 125
pop.v.i self.HEARTX
pushi.e 215
pop.v.i self.HEARTY

:[119]
push.v self.MENU_NO
pushi.e 2
cmp.i.v GTE
bf [125]

:[120]
push.s "DEVICE_MENU_slash_Draw_0_gml_189_0"@29358
conv.s.v
call.i gml_Script_scr_84_get_lang_string_ch1(argc=1)
pop.v.v self.CANCELTEXT
push.v self.TYPE
pushi.e 1
cmp.i.v EQ
bf [122]

:[121]
push.s "DEVICE_MENU_slash_Draw_0_gml_190_0"@29360
conv.s.v
call.i gml_Script_scr_84_get_lang_string_ch1(argc=1)
pop.v.v self.CANCELTEXT

:[122]
push.v self.COL_A
call.i draw_set_color(argc=1)
popz.v
pushi.e -1
push.v self.PREV_MENU
conv.v.i
push.v [array]self.MENUCOORD
pushi.e 3
cmp.i.v EQ
bf [124]

:[123]
push.v self.COL_B
call.i draw_set_color(argc=1)
popz.v

:[124]
push.v self.CANCELTEXT
pushi.e 190
conv.i.v
pushi.e 80
conv.i.v
call.i gml_Script_draw_text_shadow_ch1(argc=3)
popz.v

:[125]
push.v self.MENU_NO
pushi.e 0
cmp.i.v EQ
bt [127]

:[126]
push.v self.MENU_NO
pushi.e 1
cmp.i.v EQ
b [128]

:[127]
push.e 1

:[128]
bf [156]

:[129]
push.s "DEVICE_MENU_slash_Draw_0_gml_199_0"@29363
conv.s.v
call.i gml_Script_scr_84_get_lang_string_ch1(argc=1)
pop.v.v self.COPYTEXT
push.s "DEVICE_MENU_slash_Draw_0_gml_200_0"@29366
conv.s.v
call.i gml_Script_scr_84_get_lang_string_ch1(argc=1)
pop.v.v self.ERASETEXT
push.v self.TYPE
pushi.e 1
cmp.i.v EQ
bf [131]

:[130]
push.s "Chapter Select"@14538
conv.s.v
b [132]

:[131]
push.s "CHAPTER SELECT"@41745
conv.s.v

:[132]
pop.v.v self.CHSELECTTEXT
pushglb.v global.lang
push.s "ja"@6044
cmp.s.v EQ
bf [136]

:[133]
push.s "チャプター選択"@14539
pop.v.s self.CHSELECTTEXT
push.s "ENGLISH"@41746
pop.v.s self.LANGUAGETEXT
push.v self.TYPE
pushi.e 1
cmp.i.v EQ
bf [135]

:[134]
push.s "English"@29377
pop.v.s self.LANGUAGETEXT

:[135]
b [142]

:[136]
pushglb.v global.lang
push.s "en"@9324
cmp.s.v EQ
bf [140]

:[137]
push.s "ESPAÑOL"@58267
pop.v.s self.LANGUAGETEXT
push.v self.TYPE
pushi.e 1
cmp.i.v EQ
bf [139]

:[138]
push.s "Español"@58266
pop.v.s self.LANGUAGETEXT

:[139]
b [142]

:[140]
push.s "Capítulos"@58268
pop.v.s self.CHSELECTTEXT
push.s "日本語"@29376
pop.v.s self.LANGUAGETEXT
push.v self.TYPE
pushi.e 1
cmp.i.v EQ
bf [142]

:[141]
push.s "日本語"@29376
pop.v.s self.LANGUAGETEXT

:[142]
push.v self.TYPE
pushi.e 1
cmp.i.v EQ
bf [144]

:[143]
push.s "DEVICE_MENU_slash_Draw_0_gml_201_0"@29379
conv.s.v
call.i gml_Script_scr_84_get_lang_string_ch1(argc=1)
pop.v.v self.COPYTEXT
push.s "DEVICE_MENU_slash_Draw_0_gml_201_1"@29381
conv.s.v
call.i gml_Script_scr_84_get_lang_string_ch1(argc=1)
pop.v.v self.ERASETEXT

:[144]
push.v self.COL_A
call.i draw_set_color(argc=1)
popz.v
pushi.e -1
pushi.e 0
push.v [array]self.MENUCOORD
pushi.e 3
cmp.i.v EQ
bf [146]

:[145]
push.v self.COL_B
call.i draw_set_color(argc=1)
popz.v

:[146]
push.v self.COPYTEXT
pushi.e 190
conv.i.v
pushi.e 54
conv.i.v
call.i gml_Script_draw_text_shadow_ch1(argc=3)
popz.v
push.v self.COL_A
call.i draw_set_color(argc=1)
popz.v
pushi.e -1
pushi.e 0
push.v [array]self.MENUCOORD
pushi.e 4
cmp.i.v EQ
bf [148]

:[147]
push.v self.COL_B
call.i draw_set_color(argc=1)
popz.v

:[148]
push.v self.ERASETEXT
pushi.e 190
conv.i.v
pushi.e 140
conv.i.v
call.i gml_Script_draw_text_shadow_ch1(argc=3)
popz.v
push.v self.COL_A
call.i draw_set_color(argc=1)
popz.v
pushi.e -1
pushi.e 0
push.v [array]self.MENUCOORD
pushi.e 5
cmp.i.v EQ
bf [150]

:[149]
push.v self.COL_B
call.i draw_set_color(argc=1)
popz.v

:[150]
push.v self.CHSELECTTEXT
pushi.e 190
conv.i.v
pushi.e 204
conv.i.v
call.i gml_Script_draw_text_shadow_ch1(argc=3)
popz.v
push.v self.COL_A
call.i draw_set_color(argc=1)
popz.v
pushi.e -1
pushi.e 0
push.v [array]self.MENUCOORD
pushi.e 6
cmp.i.v EQ
bf [152]

:[151]
push.v self.COL_B
call.i draw_set_color(argc=1)
popz.v

:[152]
pushi.e 0
pop.v.i local.lang_offset
pushglb.v global.lang
push.s "es"@58265
cmp.s.v EQ
bf [154]

:[153]
push.v local.lang_offset
pushi.e 2
sub.i.v
pop.v.v local.lang_offset
pushi.e 10
conv.i.v
call.i draw_set_font(argc=1)
popz.v
b [155]

:[154]
pushi.e 3
conv.i.v
call.i draw_set_font(argc=1)
popz.v

:[155]
push.v self.LANGUAGETEXT
pushi.e 210
conv.i.v
pushi.e 140
pushloc.v local.lang_offset
add.v.i
call.i gml_Script_draw_text_shadow_ch1(argc=3)
popz.v
push.s "main"@6036
conv.s.v
call.i gml_Script_scr_84_set_draw_font_ch1(argc=1)
popz.v

:[156]
pushi.e 3
conv.i.v
call.i draw_set_font(argc=1)
popz.v
push.v self.TYPE
pushi.e 1
cmp.i.v EQ
bf [158]

:[157]
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
push.s "(C) Toby Fox 2018-2021 "@41748
add.s.v
pushi.e 230
conv.i.v
pushi.e 195
conv.i.v
call.i draw_text_transformed(argc=6)
popz.v
b [159]

:[158]
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

:[159]
push.s "main"@6036
conv.s.v
call.i gml_Script_scr_84_set_draw_font_ch1(argc=1)
popz.v
pushi.e 1
conv.i.v
call.i draw_set_alpha(argc=1)
popz.v
push.v self.MESSAGETIMER
pushi.e 0
cmp.i.v LTE
bf [196]

:[160]
push.v self.TYPE
pushi.e 0
cmp.i.v EQ
bf [178]

:[161]
push.v self.MENU_NO
pushi.e 0
cmp.i.v EQ
bt [163]

:[162]
push.v self.MENU_NO
pushi.e 1
cmp.i.v EQ
b [164]

:[163]
push.e 1

:[164]
bf [166]

:[165]
push.s " "@210
pop.v.s self.TEMPCOMMENT

:[166]
push.v self.MENU_NO
pushi.e 2
cmp.i.v EQ
bf [168]

:[167]
push.s "DEVICE_MENU_slash_Draw_0_gml_216_0"@29387
conv.s.v
call.i gml_Script_scr_84_get_lang_string_ch1(argc=1)
pop.v.v self.TEMPCOMMENT

:[168]
push.v self.MENU_NO
pushi.e 3
cmp.i.v EQ
bf [170]

:[169]
push.s "DEVICE_MENU_slash_Draw_0_gml_217_0"@29389
conv.s.v
call.i gml_Script_scr_84_get_lang_string_ch1(argc=1)
pop.v.v self.TEMPCOMMENT

:[170]
push.v self.MENU_NO
pushi.e 4
cmp.i.v EQ
bf [172]

:[171]
push.s "DEVICE_MENU_slash_Draw_0_gml_218_0"@29391
conv.s.v
call.i gml_Script_scr_84_get_lang_string_ch1(argc=1)
pop.v.v self.TEMPCOMMENT

:[172]
push.v self.MENU_NO
pushi.e 5
cmp.i.v EQ
bt [175]

:[173]
push.v self.MENU_NO
pushi.e 6
cmp.i.v EQ
bt [175]

:[174]
push.v self.MENU_NO
pushi.e 7
cmp.i.v EQ
b [176]

:[175]
push.e 1

:[176]
bf [178]

:[177]
push.s "DEVICE_MENU_slash_Draw_0_gml_219_0"@29392
conv.s.v
call.i gml_Script_scr_84_get_lang_string_ch1(argc=1)
pop.v.v self.TEMPCOMMENT

:[178]
push.v self.TYPE
pushi.e 1
cmp.i.v EQ
bf [196]

:[179]
push.v self.MENU_NO
pushi.e 0
cmp.i.v EQ
bt [181]

:[180]
push.v self.MENU_NO
pushi.e 1
cmp.i.v EQ
b [182]

:[181]
push.e 1

:[182]
bf [184]

:[183]
push.s "DEVICE_MENU_slash_Draw_0_gml_223_0"@29394
conv.s.v
call.i gml_Script_scr_84_get_lang_string_ch1(argc=1)
pop.v.v self.TEMPCOMMENT

:[184]
push.v self.MENU_NO
pushi.e 2
cmp.i.v EQ
bf [186]

:[185]
push.s "DEVICE_MENU_slash_Draw_0_gml_224_0"@29396
conv.s.v
call.i gml_Script_scr_84_get_lang_string_ch1(argc=1)
pop.v.v self.TEMPCOMMENT

:[186]
push.v self.MENU_NO
pushi.e 3
cmp.i.v EQ
bf [188]

:[187]
push.s "DEVICE_MENU_slash_Draw_0_gml_225_0"@29398
conv.s.v
call.i gml_Script_scr_84_get_lang_string_ch1(argc=1)
pop.v.v self.TEMPCOMMENT

:[188]
push.v self.MENU_NO
pushi.e 4
cmp.i.v EQ
bf [190]

:[189]
push.s "DEVICE_MENU_slash_Draw_0_gml_226_0"@29400
conv.s.v
call.i gml_Script_scr_84_get_lang_string_ch1(argc=1)
pop.v.v self.TEMPCOMMENT

:[190]
push.v self.MENU_NO
pushi.e 5
cmp.i.v EQ
bt [193]

:[191]
push.v self.MENU_NO
pushi.e 6
cmp.i.v EQ
bt [193]

:[192]
push.v self.MENU_NO
pushi.e 7
cmp.i.v EQ
b [194]

:[193]
push.e 1

:[194]
bf [196]

:[195]
push.s "DEVICE_MENU_slash_Draw_0_gml_227_0"@29402
conv.s.v
call.i gml_Script_scr_84_get_lang_string_ch1(argc=1)
pop.v.v self.TEMPCOMMENT

:[196]
push.v self.COL_B
call.i draw_set_color(argc=1)
popz.v
push.v self.TEMPCOMMENT
pushi.e 30
conv.i.v
pushi.e 40
conv.i.v
call.i gml_Script_draw_text_shadow_ch1(argc=3)
popz.v
push.v self.MESSAGETIMER
pushi.e 1
sub.i.v
pop.v.v self.MESSAGETIMER

:[197]
push.v self.HEARTX
push.v self.HEARTXCUR
sub.v.v
call.i abs(argc=1)
pushi.e 2
cmp.i.v LTE
bf [199]

:[198]
push.v self.HEARTX
pop.v.v self.HEARTXCUR

:[199]
push.v self.HEARTY
push.v self.HEARTYCUR
sub.v.v
call.i abs(argc=1)
pushi.e 2
cmp.i.v LTE
bf [201]

:[200]
push.v self.HEARTY
pop.v.v self.HEARTYCUR

:[201]
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
push.v self.HEARTYCUR
push.v self.HEARTXCUR
pushi.e 0
conv.i.v
pushi.e 4278
conv.i.v
call.i draw_sprite(argc=4)
popz.v
push.v self.TYPE
pushi.e 1
cmp.i.v EQ
bf [203]

:[202]
push.i 16777215
conv.i.v
call.i draw_set_color(argc=1)
popz.v
b [204]

:[203]
push.v self.COL_A
call.i draw_set_color(argc=1)
popz.v

:[204]
pushi.e 3
conv.i.v
call.i draw_set_font(argc=1)
popz.v
pushglb.v global.lang
push.s "es"@58265
cmp.s.v EQ
bf [206]

:[205]
push.s "CAPÍTULO 1"@58269
conv.s.v
pushi.e 0
conv.i.v
pushi.e 1
conv.i.v
call.i gml_Script___view_get(argc=2)
pushi.e 4
add.i.v
pushi.e 0
conv.i.v
pushi.e 0
conv.i.v
call.i gml_Script___view_get(argc=2)
pushi.e 8
add.i.v
call.i gml_Script_draw_text_shadow_ch1(argc=3)
popz.v
b [207]

:[206]
push.s "CHAPTER 1"@29211
conv.s.v
pushi.e 0
conv.i.v
pushi.e 1
conv.i.v
call.i gml_Script___view_get(argc=2)
pushi.e 4
add.i.v
pushi.e 0
conv.i.v
pushi.e 0
conv.i.v
call.i gml_Script___view_get(argc=2)
pushi.e 8
add.i.v
call.i gml_Script_draw_text_shadow_ch1(argc=3)
popz.v

:[207]
push.i 16777215
conv.i.v
call.i draw_set_color(argc=1)
popz.v
push.s "main"@6036
conv.s.v
call.i gml_Script_scr_84_set_draw_font_ch1(argc=1)
popz.v

:[end]