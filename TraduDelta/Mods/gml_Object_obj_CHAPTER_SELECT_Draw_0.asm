.localvar 2 arguments
.localvar 1 i 21862
.localvar 2 filename 21863
.localvar 3 select_text 21864
.localvar 4 max_options 21865
.localvar 5 mycolor 21866
.localvar 6 heart_xpos 21867
.localvar 7 heart_ypos 21868
.localvar 8 play_color 21869
.localvar 9 not_color 21870

:[0]
pushi.e 1
conv.i.v
call.i audio_group_is_loaded(argc=1)
conv.v.b
not.b
bf [2]

:[1]
exit.i

:[2]
push.v self.init_loaded
conv.v.b
not.b
bf [4]

:[3]
exit.i

:[4]
push.v self.text_font
call.i draw_set_font(argc=1)
popz.v
pushi.e 1
conv.i.v
call.i draw_set_halign(argc=1)
popz.v
push.i 8421504
conv.i.v
call.i draw_set_color(argc=1)
popz.v
pushi.e 0
conv.i.v
call.i draw_set_halign(argc=1)
popz.v
push.i 16777215
conv.i.v
call.i draw_set_color(argc=1)
popz.v
push.v self.timer
pushi.e 20
cmp.i.v LT
bf [6]

:[5]
push.v self.timer
push.e 1
add.i.v
pop.v.v self.timer

:[6]
push.v self.con
push.s "init"@9735
cmp.s.v EQ
bf [11]

:[7]
push.v self.timer
pushi.e 1
cmp.i.v EQ
bf [9]

:[8]
pushi.e 1
conv.i.v
pushi.e 15
conv.i.v
pushi.e 342
conv.i.v
call.i audio_play_sound(argc=3)
pop.v.v self.loop

:[9]
push.v self.timer
pushi.e 15
cmp.i.v EQ
bf [11]

:[10]
push.s "start"@11646
pop.v.s self.con

:[11]
push.v self.con
push.s "start"@11646
cmp.s.v EQ
bf [39]

:[12]
pushi.e 0
pop.v.i self.file_found
push.s "dr.ini"@9572
conv.s.v
call.i gml_Script_ossafe_file_exists(argc=1)
conv.v.b
bf [14]

:[13]
push.s "dr.ini"@9572
conv.s.v
call.i gml_Script_ossafe_ini_open(argc=1)
popz.v
call.i gml_Script_ossafe_ini_close(argc=0)
popz.v

:[14]
pushi.e 0
pop.v.i local.i

:[15]
pushloc.v local.i
pushi.e 7
cmp.i.v LT
bf [25]

:[16]
push.s "filech"@11773
pushloc.v local.i
call.i string(argc=1)
add.v.s
push.s "_"@10752
add.s.v
pop.v.v local.filename
pushloc.v local.filename
push.s "3"@2605
add.s.v
call.i gml_Script_ossafe_file_exists(argc=1)
conv.v.b
bt [19]

:[17]
pushloc.v local.filename
push.s "4"@469
add.s.v
call.i gml_Script_ossafe_file_exists(argc=1)
conv.v.b
bt [19]

:[18]
pushloc.v local.filename
push.s "5"@5171
add.s.v
call.i gml_Script_ossafe_file_exists(argc=1)
conv.v.b
b [20]

:[19]
push.e 1

:[20]
bf [22]

:[21]
pushloc.v local.i
pop.v.v self.highestCompletedChapter

:[22]
push.v self.highestCompletedChapter
pushi.e 0
cmp.i.v GT
bf [24]

:[23]
pushi.e 1
pop.v.i self.file_found

:[24]
push.v local.i
push.e 1
add.i.v
pop.v.v local.i
b [15]

:[25]
push.s "highestCompletedChapter:"@14519
push.v self.highestCompletedChapter
call.i string(argc=1)
add.v.s
call.i show_debug_message(argc=1)
popz.v
pushi.e 0
pop.v.i local.i

:[26]
pushloc.v local.i
pushi.e 7
cmp.i.v LT
bf [36]

:[27]
push.s "filech"@11773
pushloc.v local.i
call.i string(argc=1)
add.v.s
push.s "_"@10752
add.s.v
pop.v.v local.filename
pushloc.v local.filename
push.s "0"@3355
add.s.v
call.i gml_Script_ossafe_file_exists(argc=1)
conv.v.b
bt [30]

:[28]
pushloc.v local.filename
push.s "1"@9367
add.s.v
call.i gml_Script_ossafe_file_exists(argc=1)
conv.v.b
bt [30]

:[29]
pushloc.v local.filename
push.s "2"@4039
add.s.v
call.i gml_Script_ossafe_file_exists(argc=1)
conv.v.b
b [31]

:[30]
push.e 1

:[31]
bf [33]

:[32]
pushloc.v local.i
pop.v.v self.highestUncompletedChapter

:[33]
push.v self.highestUncompletedChapter
pushi.e 0
cmp.i.v GT
bf [35]

:[34]
pushi.e 1
pop.v.i self.file_found

:[35]
push.v local.i
push.e 1
add.i.v
pop.v.v local.i
b [26]

:[36]
push.s "highestUncompletedChapter:"@14520
push.v self.highestUncompletedChapter
call.i string(argc=1)
add.v.s
call.i show_debug_message(argc=1)
popz.v
push.v self.file_found
pushi.e 0
cmp.i.v EQ
bf [38]

:[37]
push.s "nofile"@14521
pop.v.s self.con
push.v self.fademax
pop.v.v self.fade
pushi.e 0
pop.v.i self.timer
pushi.e 0
pop.v.i self.mpos
b [39]

:[38]
push.s "filefound"@14522
pop.v.s self.con
push.v self.fademax
pop.v.v self.fade
pushi.e 0
pop.v.i self.timer
pushi.e 0
pop.v.i self.mpos

:[39]
push.v self.con
push.s "nofile"@14521
cmp.s.v EQ
bf [71]

:[40]
push.v self.fade
pushi.e 0
cmp.i.v NEQ
bf [42]

:[41]
push.d 0.125
conv.d.v
pushi.e 0
conv.i.v
push.v self.fade
call.i lerp(argc=3)
pop.v.v self.fade

:[42]
pushi.e 160
push.v self.scale
mul.v.i
pop.v.v self.xx
pushi.e 110
push.v self.scale
mul.v.i
pop.v.v self.yy
pushi.e 20
push.v self.scale
mul.v.i
pop.v.v self.mspace
push.v self.fade
push.v self.scale
mul.v.v
pop.v.v self.fadescaled
push.v self.fade
push.v self.fademax
div.v.v
pushi.e 0
conv.i.v
push.i 16777215
conv.i.v
call.i merge_color(argc=3)
pop.v.v self.drawcolor
push.v self.drawcolor
call.i draw_set_color(argc=1)
popz.v
pushglb.v global.lang
push.s "en"@9324
cmp.s.v EQ
bf [44]

:[43]
push.s "Would you like to start from Chapter 1?"@14525
conv.s.v
b [45]

:[44]
push.s "Chapter 1から始めますか？"@14526
conv.s.v

:[45]
pop.v.v self.my_stringset
pushglb.v global.lang
push.s "es"@58265
cmp.s.v EQ
bf [47]

:[46]
push.s "¿Queres empezar desde el capítulo 1?"@58268
pop.v.s self.my_stringset

:[47]
push.v self.text_font
call.i draw_set_font(argc=1)
popz.v
pushi.e 1
conv.i.v
call.i draw_set_halign(argc=1)
popz.v
pushi.e 0
conv.i.v
push.v self.scale
push.v self.scale
push.v self.my_stringset
push.v self.yy
push.v self.fadescaled
sub.v.v
push.v self.xx
call.i draw_text_transformed(argc=6)
popz.v
push.i 16777215
conv.i.v
call.i draw_set_color(argc=1)
popz.v
push.v self.mpos
pushi.e 0
cmp.i.v EQ
bf [49]

:[48]
push.i 65535
conv.i.v
call.i draw_set_color(argc=1)
popz.v
b [50]

:[49]
push.i 16777215
conv.i.v
call.i draw_set_color(argc=1)
popz.v

:[50]
pushi.e 0
conv.i.v
push.v self.scale
push.v self.scale
push.v self.yes
pushi.e 20
push.v self.scale
mul.v.i
push.v self.yy
add.v.v
push.v self.fadescaled
sub.v.v
push.v self.mspace
pushi.e 0
mul.i.v
add.v.v
push.v self.xx
call.i draw_text_transformed(argc=6)
popz.v
push.v self.mpos
pushi.e 1
cmp.i.v EQ
bf [52]

:[51]
push.i 65535
conv.i.v
call.i draw_set_color(argc=1)
popz.v
b [53]

:[52]
push.i 16777215
conv.i.v
call.i draw_set_color(argc=1)
popz.v

:[53]
pushi.e 0
conv.i.v
push.v self.scale
push.v self.scale
push.v self.no
pushi.e 20
push.v self.scale
mul.v.i
push.v self.yy
add.v.v
push.v self.fadescaled
sub.v.v
push.v self.mspace
pushi.e 1
mul.i.v
add.v.v
push.v self.xx
call.i draw_text_transformed(argc=6)
popz.v
push.v self.mpos
pushi.e 0
cmp.i.v EQ
bf [55]

:[54]
push.v self.fademax
push.v self.fade
sub.v.v
push.v self.fademax
div.v.v
push.i 16777215
conv.i.v
pushi.e 0
conv.i.v
push.v self.scale
pushi.e 2
conv.i.d
div.d.v
push.v self.scale
pushi.e 2
conv.i.d
div.d.v
pushi.e 20
push.v self.scale
mul.v.i
push.v self.yy
add.v.v
push.v self.fadescaled
sub.v.v
push.v self.mspace
push.v self.mpos
mul.v.v
add.v.v
pushi.e 4
push.v self.scale
mul.v.i
add.v.v
push.v self.xx
push.v self.yes
call.i string_width(argc=1)
pushi.e 2
conv.i.d
div.d.v
push.v self.scale
mul.v.v
sub.v.v
pushi.e 13
push.v self.scale
mul.v.i
sub.v.v
pushi.e 0
conv.i.v
pushi.e 2527
conv.i.v
call.i draw_sprite_ext(argc=9)
popz.v

:[55]
push.v self.mpos
pushi.e 1
cmp.i.v EQ
bf [57]

:[56]
push.v self.fademax
push.v self.fade
sub.v.v
push.v self.fademax
div.v.v
push.i 16777215
conv.i.v
pushi.e 0
conv.i.v
push.v self.scale
pushi.e 2
conv.i.d
div.d.v
push.v self.scale
pushi.e 2
conv.i.d
div.d.v
pushi.e 20
push.v self.scale
mul.v.i
push.v self.yy
add.v.v
push.v self.fadescaled
sub.v.v
push.v self.mspace
push.v self.mpos
mul.v.v
add.v.v
pushi.e 4
push.v self.scale
mul.v.i
add.v.v
push.v self.xx
push.v self.no
call.i string_width(argc=1)
pushi.e 2
conv.i.d
div.d.v
push.v self.scale
mul.v.v
sub.v.v
pushi.e 13
push.v self.scale
mul.v.i
sub.v.v
pushi.e 0
conv.i.v
pushi.e 2527
conv.i.v
call.i draw_sprite_ext(argc=9)
popz.v

:[57]
call.i gml_Script_up_p(argc=0)
conv.v.b
bf [59]

:[58]
push.v self.mpos
push.e 1
sub.i.v
pop.v.v self.mpos
pushi.e 1
pop.v.i self.move_noise

:[59]
call.i gml_Script_down_p(argc=0)
conv.v.b
bf [61]

:[60]
push.v self.mpos
push.e 1
add.i.v
pop.v.v self.mpos
pushi.e 1
pop.v.i self.move_noise

:[61]
pushi.e 1
conv.i.v
pushi.e 0
conv.i.v
push.v self.mpos
call.i clamp(argc=3)
pop.v.v self.mpos
call.i gml_Script_button1_p(argc=0)
conv.v.b
bf [63]

:[62]
push.v self.timer
pushi.e 10
cmp.i.v GT
b [64]

:[63]
push.e 0

:[64]
bf [71]

:[65]
pushi.e 1
pop.v.i self.select_noise
push.v self.mpos
dup.v 0
pushi.e 0
cmp.i.v EQ
bt [68]

:[66]
dup.v 0
pushi.e 1
cmp.i.v EQ
bt [69]

:[67]
b [70]

:[68]
pushi.e 1
pop.v.i self.chaptertoload
push.s "gameload"@14528
pop.v.s self.con
b [70]

:[69]
pushi.e 0
pop.v.i self.mpos
push.s "chapterselect"@14529
pop.v.s self.con
b [70]

:[70]
popz.v

:[71]
push.v self.con
push.s "filefound"@14522
cmp.s.v EQ
bf [75]

:[72]
push.v self.fademax
pop.v.v self.fade
pushi.e 0
pop.v.i self.mpos
pushi.e 0
pop.v.i self.timer
push.v self.highestCompletedChapter
push.v self.highestUncompletedChapter
cmp.v.v EQ
bf [74]

:[73]
push.s "startNextChapter"@14530
pop.v.s self.con
b [75]

:[74]
push.s "continueChapter"@14531
pop.v.s self.con

:[75]
push.v self.con
push.s "startNextChapter"@14530
cmp.s.v EQ
bf [113]

:[76]
push.v self.highestCompletedChapter
push.v self.latestAvailableChapter
cmp.v.v GTE
bf [78]

:[77]
push.s "chapterselect"@14529
pop.v.s self.con
exit.i

:[78]
push.v self.fade
pushi.e 0
cmp.i.v NEQ
bf [80]

:[79]
push.d 0.125
conv.d.v
pushi.e 0
conv.i.v
push.v self.fade
call.i lerp(argc=3)
pop.v.v self.fade

:[80]
pushi.e 160
push.v self.scale
mul.v.i
pop.v.v self.xx
pushi.e 110
push.v self.scale
mul.v.i
pop.v.v self.yy
pushi.e 20
push.v self.scale
mul.v.i
pop.v.v self.mspace
push.v self.fade
push.v self.scale
mul.v.v
pop.v.v self.fadescaled
push.v self.fade
push.v self.fademax
div.v.v
pushi.e 0
conv.i.v
push.i 16777215
conv.i.v
call.i merge_color(argc=3)
pop.v.v self.drawcolor
push.v self.drawcolor
call.i draw_set_color(argc=1)
popz.v
push.s "Chapter "@14532
push.v self.highestCompletedChapter
call.i string(argc=1)
add.v.s
push.s " was completed."@14533
add.s.v
pop.v.v self.my_stringset
push.s "Play Chapter "@14534
push.v self.highestCompletedChapter
pushi.e 1
add.i.v
call.i string(argc=1)
add.v.s
pop.v.v self.stringset2
pushglb.v global.lang
push.s "ja"@6044
cmp.s.v EQ
bf [82]

:[81]
push.s "Chapter "@14532
push.v self.highestCompletedChapter
call.i string(argc=1)
add.v.s
push.s "はクリア済みです。"@14536
add.s.v
pop.v.v self.my_stringset
push.s "Chapter "@14532
push.v self.highestCompletedChapter
pushi.e 1
add.i.v
call.i string(argc=1)
add.v.s
push.s "をプレイ"@14537
add.s.v
pop.v.v self.stringset2

:[82]
pushglb.v global.lang
push.s "es"@58265
cmp.s.v EQ
bf [84]

:[83]
push.s "Capítulo "@58269
push.v self.highestCompletedChapter
call.i string(argc=1)
add.v.s
push.s " fue completado."@58270
add.s.v
pop.v.v self.my_stringset
push.s "Jugar capítulo"@58271
push.v self.highestCompletedChapter
pushi.e 1
add.i.v
call.i string(argc=1)
add.v.s
pop.v.v self.stringset2

:[84]
push.v self.text_font
call.i draw_set_font(argc=1)
popz.v
pushi.e 1
conv.i.v
call.i draw_set_halign(argc=1)
popz.v
pushi.e 0
conv.i.v
push.v self.scale
push.v self.scale
push.v self.my_stringset
push.v self.yy
push.v self.fadescaled
sub.v.v
push.v self.mspace
pushi.e 0
mul.i.v
add.v.v
push.v self.xx
call.i draw_text_transformed(argc=6)
popz.v
push.v self.mpos
pushi.e 0
cmp.i.v EQ
bf [86]

:[85]
push.i 65535
conv.i.v
call.i draw_set_color(argc=1)
popz.v
b [87]

:[86]
push.i 16777215
conv.i.v
call.i draw_set_color(argc=1)
popz.v

:[87]
pushi.e 0
conv.i.v
push.v self.scale
push.v self.scale
push.v self.stringset2
push.v self.yy
push.v self.fadescaled
sub.v.v
push.v self.mspace
pushi.e 1
mul.i.v
add.v.v
push.v self.xx
call.i draw_text_transformed(argc=6)
popz.v
push.v self.mpos
pushi.e 1
cmp.i.v EQ
bf [89]

:[88]
push.i 65535
conv.i.v
call.i draw_set_color(argc=1)
popz.v
b [90]

:[89]
push.i 16777215
conv.i.v
call.i draw_set_color(argc=1)
popz.v

:[90]
pushglb.v global.lang
push.s "en"@9324
cmp.s.v EQ
bf [92]

:[91]
push.s "Chapter Select"@14538
conv.s.v
b [93]

:[92]
push.s "チャプター選択"@14539
conv.s.v

:[93]
pop.v.v local.select_text
pushglb.v global.lang
push.s "es"@58265
cmp.s.v EQ
bf [95]

:[94]
push.s "Selecciona un capítulo:"@58272
pop.v.s local.select_text

:[95]
pushi.e 0
conv.i.v
push.v self.scale
push.v self.scale
pushloc.v local.select_text
push.v self.yy
push.v self.fadescaled
sub.v.v
push.v self.mspace
pushi.e 2
mul.i.v
add.v.v
push.v self.xx
call.i draw_text_transformed(argc=6)
popz.v
push.v self.mpos
pushi.e 0
cmp.i.v EQ
bf [97]

:[96]
push.v self.fademax
push.v self.fade
sub.v.v
push.v self.fademax
div.v.v
push.i 16777215
conv.i.v
pushi.e 0
conv.i.v
push.v self.scale
pushi.e 2
conv.i.d
div.d.v
push.v self.scale
pushi.e 2
conv.i.d
div.d.v
push.v self.yy
push.v self.fadescaled
sub.v.v
push.v self.mspace
pushi.e 1
mul.i.v
add.v.v
pushi.e 4
push.v self.scale
mul.v.i
add.v.v
push.v self.xx
push.v self.stringset2
call.i string_width(argc=1)
pushi.e 2
conv.i.d
div.d.v
push.v self.scale
mul.v.v
sub.v.v
pushi.e 13
push.v self.scale
mul.v.i
sub.v.v
pushi.e 0
conv.i.v
pushi.e 2527
conv.i.v
call.i draw_sprite_ext(argc=9)
popz.v

:[97]
push.v self.mpos
pushi.e 1
cmp.i.v EQ
bf [99]

:[98]
push.v self.fademax
push.v self.fade
sub.v.v
push.v self.fademax
div.v.v
push.i 16777215
conv.i.v
pushi.e 0
conv.i.v
push.v self.scale
pushi.e 2
conv.i.d
div.d.v
push.v self.scale
pushi.e 2
conv.i.d
div.d.v
push.v self.yy
push.v self.fadescaled
sub.v.v
push.v self.mspace
pushi.e 2
mul.i.v
add.v.v
pushi.e 4
push.v self.scale
mul.v.i
add.v.v
push.v self.xx
pushloc.v local.select_text
call.i string_width(argc=1)
pushi.e 2
conv.i.d
div.d.v
push.v self.scale
mul.v.v
sub.v.v
pushi.e 13
push.v self.scale
mul.v.i
sub.v.v
pushi.e 0
conv.i.v
pushi.e 2527
conv.i.v
call.i draw_sprite_ext(argc=9)
popz.v

:[99]
call.i gml_Script_up_p(argc=0)
conv.v.b
bf [101]

:[100]
push.v self.mpos
push.e 1
sub.i.v
pop.v.v self.mpos
pushi.e 1
pop.v.i self.move_noise

:[101]
call.i gml_Script_down_p(argc=0)
conv.v.b
bf [103]

:[102]
push.v self.mpos
push.e 1
add.i.v
pop.v.v self.mpos
pushi.e 1
pop.v.i self.move_noise

:[103]
pushi.e 1
conv.i.v
pushi.e 0
conv.i.v
push.v self.mpos
call.i clamp(argc=3)
pop.v.v self.mpos
call.i gml_Script_button1_p(argc=0)
conv.v.b
bf [105]

:[104]
push.v self.timer
pushi.e 10
cmp.i.v GT
b [106]

:[105]
push.e 0

:[106]
bf [113]

:[107]
pushi.e 1
pop.v.i self.select_noise
push.v self.mpos
dup.v 0
pushi.e 0
cmp.i.v EQ
bt [110]

:[108]
dup.v 0
pushi.e 1
cmp.i.v EQ
bt [111]

:[109]
b [112]

:[110]
push.v self.highestCompletedChapter
pushi.e 1
add.i.v
pop.v.v self.chaptertoload
push.s "gameload"@14528
pop.v.s self.con
b [112]

:[111]
pushi.e 0
pop.v.i self.timer
pushi.e 0
pop.v.i self.mpos
push.s "chapterselect"@14529
pop.v.s self.con
b [112]

:[112]
popz.v

:[113]
push.v self.con
push.s "continueChapter"@14531
cmp.s.v EQ
bf [150]

:[114]
push.v self.highestUncompletedChapter
pushi.e 0
cmp.i.v EQ
bt [117]

:[115]
push.v self.highestUncompletedChapter
push.v self.latestAvailableChapter
cmp.v.v GT
bt [117]

:[116]
push.v self.highestCompletedChapter
push.v self.latestAvailableChapter
cmp.v.v GT
b [118]

:[117]
push.e 1

:[118]
bf [120]

:[119]
push.s "highestUncompletedChapter="@14541
push.v self.highestUncompletedChapter
call.i string(argc=1)
add.v.s
call.i show_debug_message(argc=1)
popz.v
push.s "highestCompletedChapter="@14542
push.v self.highestCompletedChapter
call.i string(argc=1)
add.v.s
call.i show_debug_message(argc=1)
popz.v
push.s "nofile"@14521
pop.v.s self.con
exit.i

:[120]
push.v self.fade
pushi.e 0
cmp.i.v NEQ
bf [122]

:[121]
push.d 0.125
conv.d.v
pushi.e 0
conv.i.v
push.v self.fade
call.i lerp(argc=3)
pop.v.v self.fade

:[122]
pushi.e 160
push.v self.scale
mul.v.i
pop.v.v self.xx
pushi.e 110
push.v self.scale
mul.v.i
pop.v.v self.yy
pushi.e 20
push.v self.scale
mul.v.i
pop.v.v self.mspace
push.v self.fade
push.v self.scale
mul.v.v
pop.v.v self.fadescaled
push.v self.fade
push.v self.fademax
div.v.v
pushi.e 0
conv.i.v
push.i 16777215
conv.i.v
call.i merge_color(argc=3)
pop.v.v self.drawcolor
push.v self.drawcolor
call.i draw_set_color(argc=1)
popz.v
push.s "Continue from Chapter "@14543
push.v self.highestUncompletedChapter
call.i string(argc=1)
add.v.s
push.s "?"@4778
add.s.v
pop.v.v self.my_stringset
pushglb.v global.lang
push.s "ja"@6044
cmp.s.v EQ
bf [124]

:[123]
push.s "Chapter "@14532
push.v self.highestUncompletedChapter
call.i string(argc=1)
add.v.s
push.s "から続けますか？"@14544
add.s.v
pop.v.v self.my_stringset

:[124]
pushglb.v global.lang
push.s "es"@58265
cmp.s.v EQ
bf [126]

:[125]
push.s "¿Continuar desde capítulo"@58273
push.v self.highestUncompletedChapter
call.i string(argc=1)
add.v.s
push.s "?"@4778
add.s.v
pop.v.v self.my_stringset

:[126]
push.v self.text_font
call.i draw_set_font(argc=1)
popz.v
pushi.e 1
conv.i.v
call.i draw_set_halign(argc=1)
popz.v
pushi.e 0
conv.i.v
push.v self.scale
push.v self.scale
push.v self.my_stringset
push.v self.yy
push.v self.fadescaled
sub.v.v
push.v self.mspace
pushi.e 0
mul.i.v
add.v.v
push.v self.xx
call.i draw_text_transformed(argc=6)
popz.v
push.v self.mpos
pushi.e 0
cmp.i.v EQ
bf [128]

:[127]
push.i 65535
conv.i.v
call.i draw_set_color(argc=1)
popz.v
b [129]

:[128]
push.i 16777215
conv.i.v
call.i draw_set_color(argc=1)
popz.v

:[129]
pushi.e 0
conv.i.v
push.v self.scale
push.v self.scale
push.v self.yes
push.v self.yy
push.v self.fadescaled
sub.v.v
push.v self.mspace
pushi.e 1
mul.i.v
add.v.v
push.v self.xx
call.i draw_text_transformed(argc=6)
popz.v
push.v self.mpos
pushi.e 1
cmp.i.v EQ
bf [131]

:[130]
push.i 65535
conv.i.v
call.i draw_set_color(argc=1)
popz.v
b [132]

:[131]
push.i 16777215
conv.i.v
call.i draw_set_color(argc=1)
popz.v

:[132]
pushi.e 0
conv.i.v
push.v self.scale
push.v self.scale
push.v self.no
push.v self.yy
push.v self.fadescaled
sub.v.v
push.v self.mspace
pushi.e 2
mul.i.v
add.v.v
push.v self.xx
call.i draw_text_transformed(argc=6)
popz.v
push.v self.mpos
pushi.e 0
cmp.i.v EQ
bf [134]

:[133]
push.v self.fademax
push.v self.fade
sub.v.v
push.v self.fademax
div.v.v
push.i 16777215
conv.i.v
pushi.e 0
conv.i.v
push.v self.scale
pushi.e 2
conv.i.d
div.d.v
push.v self.scale
pushi.e 2
conv.i.d
div.d.v
push.v self.yy
push.v self.fadescaled
sub.v.v
push.v self.mspace
pushi.e 1
mul.i.v
add.v.v
push.v self.mspace
push.v self.mpos
mul.v.v
add.v.v
pushi.e 4
push.v self.scale
mul.v.i
add.v.v
push.v self.xx
push.v self.yes
call.i string_width(argc=1)
pushi.e 2
conv.i.d
div.d.v
push.v self.scale
mul.v.v
sub.v.v
pushi.e 13
push.v self.scale
mul.v.i
sub.v.v
pushi.e 0
conv.i.v
pushi.e 2527
conv.i.v
call.i draw_sprite_ext(argc=9)
popz.v

:[134]
push.v self.mpos
pushi.e 1
cmp.i.v EQ
bf [136]

:[135]
push.v self.fademax
push.v self.fade
sub.v.v
push.v self.fademax
div.v.v
push.i 16777215
conv.i.v
pushi.e 0
conv.i.v
push.v self.scale
pushi.e 2
conv.i.d
div.d.v
push.v self.scale
pushi.e 2
conv.i.d
div.d.v
push.v self.yy
push.v self.fadescaled
sub.v.v
push.v self.mspace
pushi.e 1
mul.i.v
add.v.v
push.v self.mspace
push.v self.mpos
mul.v.v
add.v.v
pushi.e 4
push.v self.scale
mul.v.i
add.v.v
push.v self.xx
push.v self.no
call.i string_width(argc=1)
pushi.e 2
conv.i.d
div.d.v
push.v self.scale
mul.v.v
sub.v.v
pushi.e 13
push.v self.scale
mul.v.i
sub.v.v
pushi.e 0
conv.i.v
pushi.e 2527
conv.i.v
call.i draw_sprite_ext(argc=9)
popz.v

:[136]
call.i gml_Script_up_p(argc=0)
conv.v.b
bf [138]

:[137]
push.v self.mpos
push.e 1
sub.i.v
pop.v.v self.mpos
pushi.e 1
pop.v.i self.move_noise

:[138]
call.i gml_Script_down_p(argc=0)
conv.v.b
bf [140]

:[139]
push.v self.mpos
push.e 1
add.i.v
pop.v.v self.mpos
pushi.e 1
pop.v.i self.move_noise

:[140]
pushi.e 1
conv.i.v
pushi.e 0
conv.i.v
push.v self.mpos
call.i clamp(argc=3)
pop.v.v self.mpos
call.i gml_Script_button1_p(argc=0)
conv.v.b
bf [142]

:[141]
push.v self.timer
pushi.e 10
cmp.i.v GT
b [143]

:[142]
push.e 0

:[143]
bf [150]

:[144]
pushi.e 0
pop.v.i self.timer
pushi.e 1
pop.v.i self.select_noise
push.v self.mpos
dup.v 0
pushi.e 0
cmp.i.v EQ
bt [147]

:[145]
dup.v 0
pushi.e 1
cmp.i.v EQ
bt [148]

:[146]
b [149]

:[147]
push.v self.highestUncompletedChapter
pop.v.v self.chaptertoload
push.s "gameload"@14528
pop.v.s self.con
b [149]

:[148]
pushi.e 0
pop.v.i self.timer
pushi.e 0
pop.v.i self.mpos
push.s "chapterselect"@14529
pop.v.s self.con
b [149]

:[149]
popz.v

:[150]
push.v self.con
push.s "chapterselect"@14529
cmp.s.v EQ
bf [199]

:[151]
pushglb.v global.lang
push.s "en"@9324
cmp.s.v EQ
bf [153]

:[152]
push.s "Quit"@14545
conv.s.v
b [154]

:[153]
push.s "とじる"@14546
conv.s.v

:[154]
pop.v.v self.quit
pushglb.v global.lang
push.s "es"@58265
cmp.s.v EQ
bf [156]

:[155]
push.s "Salir"@58274
pop.v.s self.quit

:[156]
push.s "Chapter"@14548
pop.v.s self.chapterstring
pushglb.v global.lang
push.s "es"@58265
cmp.s.v EQ
bf [158]

:[157]
push.s "Capítulo"@58275
pop.v.s self.chapterstring

:[158]
push.v self.chapterselectinit
pushi.e 0
cmp.i.v EQ
bf [161]

:[159]
push.v self.fademax
pop.v.v self.fade
pushi.e 1
pop.v.i self.chapterselectinit
pushi.e 0
pop.v.i self.timer
push.v self.highestCompletedChapter
pop.v.v self.mpos
push.v self.mpos
push.v self.latestAvailableChapter
pushi.e 1
sub.i.v
cmp.v.v GT
bf [161]

:[160]
push.v self.latestAvailableChapter
pushi.e 1
sub.i.v
pop.v.v self.mpos

:[161]
push.v self.fade
pushi.e 0
cmp.i.v NEQ
bf [163]

:[162]
push.d 0.125
conv.d.v
pushi.e 0
conv.i.v
push.v self.fade
call.i lerp(argc=3)
pop.v.v self.fade

:[163]
push.v self.fade
push.v self.scale
mul.v.v
pop.v.v self.fadescaled
pushi.e 30
push.v self.scale
mul.v.i
pop.v.v self.space
pushi.e 0
pop.v.i local.i

:[164]
pushloc.v local.i
pushi.e 6
cmp.i.v LT
bf [166]

:[165]
pushi.e 1
push.v self.fade
push.v self.fademax
div.v.v
sub.v.i
push.i 16777215
conv.i.v
pushi.e 0
conv.i.v
push.v self.scale
push.v self.scale
pushi.e 36
push.v self.scale
mul.v.i
push.v self.space
pushloc.v local.i
mul.v.v
add.v.v
push.v self.fadescaled
pushi.e 2
conv.i.d
div.d.v
add.v.v
pushi.e 0
conv.i.v
pushi.e 0
conv.i.v
pushi.e 1481
conv.i.v
call.i draw_sprite_ext(argc=9)
popz.v
push.v local.i
push.e 1
add.i.v
pop.v.v local.i
b [164]

:[166]
pushi.e 1
conv.i.v
call.i draw_set_halign(argc=1)
popz.v
call.i gml_Script_up_p(argc=0)
conv.v.b
bf [169]

:[167]
pushi.e 1
pop.v.i self.move_noise
push.v self.mpos
push.e 1
sub.i.v
pop.v.v self.mpos
push.v self.mpos
push.v self.latestAvailableChapter
pushi.e 1
sub.i.v
cmp.v.v GT
bf [169]

:[168]
push.v self.latestAvailableChapter
pushi.e 1
sub.i.v
pop.v.v self.mpos

:[169]
call.i gml_Script_down_p(argc=0)
conv.v.b
bf [175]

:[170]
pushi.e 1
pop.v.i self.move_noise
push.v self.mpos
push.e 1
add.i.v
pop.v.v self.mpos
push.v self.mpos
push.v self.latestAvailableChapter
pushi.e 1
sub.i.v
cmp.v.v GT
bf [175]

:[171]
pushglb.v global.is_console
conv.v.b
bf [173]

:[172]
pushi.e 1
conv.i.v
b [174]

:[173]
pushi.e 7
conv.i.v

:[174]
pop.v.v self.mpos

:[175]
push.v self.console
conv.v.b
bf [177]

:[176]
pushi.e 6
conv.i.v
pushi.e 0
conv.i.v
push.v self.mpos
call.i clamp(argc=3)
pop.v.v self.mpos
b [178]

:[177]
pushi.e 7
conv.i.v
pushi.e 0
conv.i.v
push.v self.mpos
call.i clamp(argc=3)
pop.v.v self.mpos

:[178]
pushi.e 35
push.v self.scale
mul.v.i
pop.v.v self.xx
pushi.e 10
push.v self.scale
mul.v.i
pop.v.v self.yy
pushi.e 30
push.v self.scale
mul.v.i
pop.v.v self.mspace
pushi.e 7
pop.v.i local.max_options
pushi.e 0
pop.v.i local.i

:[179]
pushloc.v local.i
pushloc.v local.max_options
cmp.v.v LT
bf [185]

:[180]
push.i 8421504
pop.v.i local.mycolor
pushloc.v local.i
push.v self.latestAvailableChapter
cmp.v.v LT
bf [182]

:[181]
push.i 16777215
pop.v.i local.mycolor

:[182]
push.v self.mpos
pushloc.v local.i
cmp.v.v EQ
bf [184]

:[183]
push.i 65535
pop.v.i local.mycolor

:[184]
push.v self.fade
push.v self.fademax
div.v.v
pushi.e 0
conv.i.v
pushloc.v local.mycolor
call.i merge_color(argc=3)
pop.v.v local.mycolor
pushi.e 1
push.v self.fade
push.v self.fademax
div.v.v
sub.v.i
pushloc.v local.mycolor
pushi.e 0
conv.i.v
push.v self.scale
push.v self.scale
push.v self.fadescaled
neg.v
push.v self.yy
add.v.v
pushloc.v local.i
pushi.e 30
mul.i.v
push.v self.scale
mul.v.v
add.v.v
push.v self.xx
pushi.e 234
push.v self.scale
mul.v.i
add.v.v
pushloc.v local.i
pushi.e 3261
conv.i.v
call.i draw_sprite_ext(argc=9)
popz.v
pushloc.v local.mycolor
call.i draw_set_color(argc=1)
popz.v
pushi.e 0
conv.i.v
call.i draw_set_halign(argc=1)
popz.v
pushi.e 3
conv.i.v
call.i draw_set_font(argc=1)
popz.v
pushi.e 0
conv.i.v
push.v self.scale
push.v self.scale
push.v self.chapterstring
push.s " "@210
add.s.v
pushloc.v local.i
pushi.e 1
add.i.v
call.i string(argc=1)
add.v.v
push.v self.fadescaled
neg.v
push.v self.yy
add.v.v
push.v self.mspace
pushloc.v local.i
mul.v.v
add.v.v
pushi.e 3
push.v self.scale
mul.v.i
add.v.v
push.v self.xx
call.i draw_text_transformed(argc=6)
popz.v
push.v self.text_font
call.i draw_set_font(argc=1)
popz.v
pushi.e 1
conv.i.v
call.i draw_set_halign(argc=1)
popz.v
pushi.e 0
conv.i.v
push.v self.scale
push.v self.scale
pushi.e -1
pushloc.v local.i
pushi.e 1
add.i.v
conv.v.i
push.v [array]self.chapname
push.v self.fadescaled
neg.v
push.v self.yy
add.v.v
push.v self.mspace
pushloc.v local.i
mul.v.v
add.v.v
pushi.e 3
push.v self.scale
mul.v.i
add.v.v
pushi.e 176
push.v self.scale
mul.v.i
call.i draw_text_transformed(argc=6)
popz.v
pushi.e 0
conv.i.v
call.i draw_set_halign(argc=1)
popz.v
push.i 16777215
conv.i.v
call.i draw_set_color(argc=1)
popz.v
push.v local.i
push.e 1
add.i.v
pop.v.v local.i
b [179]

:[185]
push.v self.xx
pushi.e 15
push.v self.scale
mul.v.i
sub.v.v
pop.v.v local.heart_xpos
push.v self.fadescaled
neg.v
push.v self.yy
add.v.v
pushi.e 7
push.v self.scale
mul.v.i
add.v.v
push.v self.mpos
pushi.e 30
push.v self.scale
mul.v.i
mul.v.v
add.v.v
pop.v.v local.heart_ypos
push.v self.mpos
pushi.e 7
cmp.i.v EQ
bf [187]

:[186]
push.v local.heart_ypos
pushi.e 5
push.v self.scale
mul.v.i
sub.v.v
pop.v.v local.heart_ypos
pushi.e 130
push.v self.scale
mul.v.i
pop.v.v local.heart_xpos

:[187]
push.v self.fademax
push.v self.fade
sub.v.v
push.v self.fademax
div.v.v
push.i 16777215
conv.i.v
pushi.e 1
conv.i.v
push.v self.scale
pushi.e 2
conv.i.d
div.d.v
push.v self.scale
pushi.e 2
conv.i.d
div.d.v
pushloc.v local.heart_ypos
pushloc.v local.heart_xpos
pushi.e 0
conv.i.v
pushi.e 2527
conv.i.v
call.i draw_sprite_ext(argc=9)
popz.v
push.v self.console
conv.v.b
not.b
bf [191]

:[188]
push.i 16777215
pop.v.i local.mycolor
push.v self.mpos
pushi.e 7
cmp.i.v EQ
bf [190]

:[189]
push.i 65535
pop.v.i local.mycolor

:[190]
push.v self.fade
push.v self.fademax
div.v.v
pushi.e 0
conv.i.v
pushloc.v local.mycolor
call.i merge_color(argc=3)
pop.v.v local.mycolor
pushloc.v local.mycolor
call.i draw_set_color(argc=1)
popz.v
pushi.e 1
conv.i.v
call.i draw_set_halign(argc=1)
popz.v
pushi.e 0
conv.i.v
push.v self.scale
push.v self.scale
push.v self.quit
push.v self.fadescaled
neg.v
pushi.e 218
push.v self.scale
mul.v.i
add.v.v
pushi.e 160
push.v self.scale
mul.v.i
call.i draw_text_transformed(argc=6)
popz.v
pushi.e 0
conv.i.v
call.i draw_set_halign(argc=1)
popz.v

:[191]
call.i gml_Script_button1_p(argc=0)
conv.v.b
bf [193]

:[192]
push.v self.timer
pushi.e 12
cmp.i.v GT
b [194]

:[193]
push.e 0

:[194]
bf [198]

:[195]
pushi.e 1
pop.v.i self.select_noise
pushi.e 0
pop.v.i self.timer
push.v self.mpos
pushi.e 7
cmp.i.v EQ
bf [197]

:[196]
call.i game_end(argc=0)
popz.v
b [198]

:[197]
push.s "gameloadConfirm"@14554
pop.v.s self.con
pushi.e 0
pop.v.i self.confirm_choice_index
push.v self.mpos
pushi.e 1
add.i.v
pop.v.v self.chaptertoload

:[198]
b [261]

:[199]
push.v self.con
push.s "gameloadConfirm"@14554
cmp.s.v EQ
bf [261]

:[200]
pushglb.v global.lang
push.s "en"@9324
cmp.s.v EQ
bf [202]

:[201]
push.s "Play"@14555
conv.s.v
b [203]

:[202]
push.s "プレイする"@14556
conv.s.v

:[203]
pop.v.v self.stringPlay
pushglb.v global.lang
push.s "en"@9324
cmp.s.v EQ
bf [205]

:[204]
push.s "Do Not"@14558
conv.s.v
b [206]

:[205]
push.s "しない"@14559
conv.s.v

:[206]
pop.v.v self.stringDoNot
pushglb.v global.lang
push.s "es"@58265
cmp.s.v EQ
bf [208]

:[207]
push.s "Jugar"@58276
pop.v.s self.stringPlay
push.s "No jugar"@58277
pop.v.s self.stringDoNot

:[208]
pushi.e 30
push.v self.scale
mul.v.i
pop.v.v self.space
pushi.e 0
pop.v.i local.i

:[209]
pushloc.v local.i
pushi.e 6
cmp.i.v LT
bf [211]

:[210]
pushi.e 1
push.v self.fade
push.v self.fademax
div.v.v
sub.v.i
push.i 16777215
conv.i.v
pushi.e 0
conv.i.v
push.v self.scale
push.v self.scale
pushi.e 36
push.v self.scale
mul.v.i
push.v self.space
pushloc.v local.i
mul.v.v
add.v.v
push.v self.fadescaled
pushi.e 2
conv.i.d
div.d.v
add.v.v
pushi.e 0
conv.i.v
pushi.e 0
conv.i.v
pushi.e 1481
conv.i.v
call.i draw_sprite_ext(argc=9)
popz.v
push.v local.i
push.e 1
add.i.v
pop.v.v local.i
b [209]

:[211]
pushi.e 1
conv.i.v
call.i draw_set_halign(argc=1)
popz.v
push.v self.console
conv.v.b
bf [213]

:[212]
pushi.e 6
conv.i.v
pushi.e 0
conv.i.v
push.v self.mpos
call.i clamp(argc=3)
pop.v.v self.mpos
b [214]

:[213]
pushi.e 7
conv.i.v
pushi.e 0
conv.i.v
push.v self.mpos
call.i clamp(argc=3)
pop.v.v self.mpos

:[214]
pushi.e 35
push.v self.scale
mul.v.i
pop.v.v self.xx
pushi.e 10
push.v self.scale
mul.v.i
pop.v.v self.yy
pushi.e 30
push.v self.scale
mul.v.i
pop.v.v self.mspace
call.i gml_Script_left_p(argc=0)
conv.v.b
bf [216]

:[215]
pushi.e 1
pop.v.i self.move_noise
push.v self.confirm_choice_index
pushi.e 1
sub.i.v
pushi.e 0
cmp.i.v LT
pop.v.b self.confirm_choice_index

:[216]
call.i gml_Script_right_p(argc=0)
conv.v.b
bf [221]

:[217]
pushi.e 1
pop.v.i self.move_noise
push.v self.confirm_choice_index
pushi.e 1
add.i.v
pushi.e 1
cmp.i.v GT
bf [219]

:[218]
pushi.e 0
conv.i.v
b [220]

:[219]
pushi.e 1
conv.i.v

:[220]
pop.v.v self.confirm_choice_index

:[221]
pushi.e 116
push.v self.scale
mul.v.i
push.v self.confirm_choice_index
pushi.e 75
mul.i.v
push.v self.scale
mul.v.v
add.v.v
pop.v.v local.heart_xpos
pushglb.v global.lang
push.s "ja"@6044
cmp.s.v EQ
bf [223]

:[222]
pushi.e 106
push.v self.scale
mul.v.i
push.v self.confirm_choice_index
pushi.e 95
mul.i.v
push.v self.scale
mul.v.v
add.v.v
pop.v.v local.heart_xpos

:[223]
push.v self.yy
pushi.e 7
push.v self.scale
mul.v.i
add.v.v
push.v self.mpos
pushi.e 30
mul.i.v
push.v self.scale
mul.v.v
add.v.v
pop.v.v local.heart_ypos
push.v self.fademax
push.v self.fade
sub.v.v
push.v self.fademax
div.v.v
push.i 16777215
conv.i.v
pushi.e 0
conv.i.v
push.v self.scale
pushi.e 2
conv.i.d
div.d.v
push.v self.scale
pushi.e 2
conv.i.d
div.d.v
pushloc.v local.heart_ypos
pushloc.v local.heart_xpos
pushi.e 0
conv.i.v
pushi.e 2527
conv.i.v
call.i draw_sprite_ext(argc=9)
popz.v
pushi.e 7
pop.v.i local.max_options
pushi.e 0
pop.v.i local.i

:[224]
pushloc.v local.i
pushloc.v local.max_options
cmp.v.v LT
bf [245]

:[225]
push.i 8421504
pop.v.i local.mycolor
pushloc.v local.i
push.v self.latestAvailableChapter
cmp.v.v LT
bf [227]

:[226]
push.i 16777215
pop.v.i local.mycolor

:[227]
push.v self.mpos
pushloc.v local.i
cmp.v.v EQ
bf [229]

:[228]
push.i 65535
pop.v.i local.mycolor

:[229]
push.v self.fade
push.v self.fademax
div.v.v
pushi.e 0
conv.i.v
pushloc.v local.mycolor
call.i merge_color(argc=3)
pop.v.v local.mycolor
pushi.e 1
push.v self.fade
push.v self.fademax
div.v.v
sub.v.i
pushloc.v local.mycolor
pushi.e 0
conv.i.v
push.v self.scale
push.v self.scale
push.v self.fade
neg.v
push.v self.scale
mul.v.v
push.v self.yy
add.v.v
pushloc.v local.i
pushi.e 30
mul.i.v
push.v self.scale
mul.v.v
add.v.v
push.v self.xx
pushi.e 234
push.v self.scale
mul.v.i
add.v.v
pushloc.v local.i
pushi.e 3261
conv.i.v
call.i draw_sprite_ext(argc=9)
popz.v
pushloc.v local.mycolor
call.i draw_set_color(argc=1)
popz.v
pushi.e 0
conv.i.v
call.i draw_set_halign(argc=1)
popz.v
pushi.e 3
conv.i.v
call.i draw_set_font(argc=1)
popz.v
pushi.e 0
conv.i.v
push.v self.scale
push.v self.scale
push.v self.chapterstring
push.s " "@210
add.s.v
pushloc.v local.i
pushi.e 1
add.i.v
call.i string(argc=1)
add.v.v
push.v self.fade
neg.v
push.v self.yy
add.v.v
push.v self.mspace
pushloc.v local.i
mul.v.v
add.v.v
pushi.e 3
push.v self.scale
mul.v.i
add.v.v
push.v self.xx
call.i draw_text_transformed(argc=6)
popz.v
push.v self.text_font
call.i draw_set_font(argc=1)
popz.v
pushi.e 1
conv.i.v
call.i draw_set_halign(argc=1)
popz.v
push.v self.mpos
pushloc.v local.i
cmp.v.v EQ
bf [243]

:[230]
push.v self.confirm_choice_index
pushi.e 0
cmp.i.v EQ
bf [232]

:[231]
push.i 65535
conv.i.v
b [233]

:[232]
push.i 16777215
conv.i.v

:[233]
pop.v.v local.play_color
pushloc.v local.play_color
call.i draw_set_color(argc=1)
popz.v
pushglb.v global.lang
push.s "ja"@6044
cmp.s.v NEQ
bf [235]

:[234]
pushi.e 0
conv.i.v
push.v self.scale
push.v self.scale
push.v self.stringPlay
push.v self.fade
neg.v
push.v self.scale
mul.v.v
push.v self.yy
add.v.v
push.v self.mspace
pushloc.v local.i
mul.v.v
add.v.v
pushi.e 3
push.v self.scale
mul.v.i
add.v.v
pushi.e 146
push.v self.scale
mul.v.i
call.i draw_text_transformed(argc=6)
popz.v
b [236]

:[235]
pushi.e 0
conv.i.v
push.v self.scale
push.v self.scale
push.v self.stringPlay
push.v self.fade
neg.v
push.v self.scale
mul.v.v
push.v self.yy
add.v.v
push.v self.mspace
pushloc.v local.i
mul.v.v
add.v.v
pushi.e 3
push.v self.scale
mul.v.i
add.v.v
pushi.e 156
push.v self.scale
mul.v.i
call.i draw_text_transformed(argc=6)
popz.v

:[236]
push.v self.confirm_choice_index
pushi.e 1
cmp.i.v EQ
bf [238]

:[237]
push.i 65535
conv.i.v
b [239]

:[238]
push.i 16777215
conv.i.v

:[239]
pop.v.v local.not_color
pushloc.v local.not_color
call.i draw_set_color(argc=1)
popz.v
pushglb.v global.lang
push.s "ja"@6044
cmp.s.v NEQ
bf [241]

:[240]
pushi.e 0
conv.i.v
push.v self.scale
push.v self.scale
push.v self.stringDoNot
push.v self.fade
neg.v
push.v self.scale
mul.v.v
push.v self.yy
add.v.v
push.v self.mspace
pushloc.v local.i
mul.v.v
add.v.v
pushi.e 3
push.v self.scale
mul.v.i
add.v.v
pushi.e 226
push.v self.scale
mul.v.i
call.i draw_text_transformed(argc=6)
popz.v
b [242]

:[241]
pushi.e 0
conv.i.v
push.v self.scale
push.v self.scale
push.v self.stringDoNot
push.v self.fade
neg.v
push.v self.scale
mul.v.v
push.v self.yy
add.v.v
push.v self.mspace
pushloc.v local.i
mul.v.v
add.v.v
pushi.e 3
push.v self.scale
mul.v.i
add.v.v
pushi.e 236
push.v self.scale
mul.v.i
call.i draw_text_transformed(argc=6)
popz.v

:[242]
b [244]

:[243]
pushi.e 0
conv.i.v
push.v self.scale
push.v self.scale
pushi.e -1
pushloc.v local.i
pushi.e 1
add.i.v
conv.v.i
push.v [array]self.chapname
push.v self.fade
neg.v
push.v self.yy
add.v.v
push.v self.mspace
pushloc.v local.i
mul.v.v
add.v.v
pushi.e 3
push.v self.scale
mul.v.i
add.v.v
pushi.e 176
push.v self.scale
mul.v.i
call.i draw_text_transformed(argc=6)
popz.v

:[244]
pushi.e 0
conv.i.v
call.i draw_set_halign(argc=1)
popz.v
push.i 16777215
conv.i.v
call.i draw_set_color(argc=1)
popz.v
push.v local.i
push.e 1
add.i.v
pop.v.v local.i
b [224]

:[245]
push.v self.console
conv.v.b
not.b
bf [249]

:[246]
push.i 16777215
pop.v.i local.mycolor
push.v self.mpos
pushi.e 7
cmp.i.v EQ
bf [248]

:[247]
push.i 65535
pop.v.i local.mycolor

:[248]
push.v self.fade
push.v self.fademax
div.v.v
pushi.e 0
conv.i.v
pushloc.v local.mycolor
call.i merge_color(argc=3)
pop.v.v local.mycolor
pushloc.v local.mycolor
call.i draw_set_color(argc=1)
popz.v
pushi.e 1
conv.i.v
call.i draw_set_halign(argc=1)
popz.v
pushi.e 0
conv.i.v
push.v self.scale
push.v self.scale
push.v self.quit
push.v self.fade
neg.v
push.v self.scale
mul.v.v
pushi.e 218
push.v self.scale
mul.v.i
add.v.v
pushi.e 160
push.v self.scale
mul.v.i
call.i draw_text_transformed(argc=6)
popz.v
pushi.e 0
conv.i.v
call.i draw_set_halign(argc=1)
popz.v

:[249]
call.i gml_Script_button1_p(argc=0)
conv.v.b
bf [251]

:[250]
push.v self.timer
pushi.e 12
cmp.i.v GT
b [252]

:[251]
push.e 0

:[252]
bf [256]

:[253]
pushi.e 0
pop.v.i self.timer
pushi.e 1
pop.v.i self.select_noise
push.v self.confirm_choice_index
pushi.e 0
cmp.i.v EQ
bf [255]

:[254]
push.s "gameload"@14528
pop.v.s self.con
b [256]

:[255]
push.s "chapterselect"@14529
pop.v.s self.con

:[256]
call.i gml_Script_button2_p(argc=0)
conv.v.b
bf [258]

:[257]
push.v self.timer
pushi.e 12
cmp.i.v GT
b [259]

:[258]
push.e 0

:[259]
bf [261]

:[260]
pushi.e 0
pop.v.i self.timer
pushi.e 1
pop.v.i self.select_noise
push.s "chapterselect"@14529
pop.v.s self.con

:[261]
push.v self.con
push.s "gameload"@14528
cmp.s.v EQ
bf [272]

:[262]
push.v self.spr_aftereffect
pushi.e 0
cmp.i.v EQ
bf [264]

:[263]
pushi.e 0
conv.i.v
pushi.e 0
conv.i.v
pushi.e 0
conv.i.v
pushi.e 0
conv.i.v
pushbltn.v self.room_height
pushbltn.v self.room_width
pushi.e 0
conv.i.v
pushi.e 0
conv.i.v
pushbltn.v self.application_surface
call.i sprite_create_from_surface(argc=9)
pop.v.v self.spr_aftereffect
pushbltn.v self.room_height
pushi.e 2
conv.i.d
div.d.v
pushbltn.v self.room_width
pushi.e 2
conv.i.d
div.d.v
push.v self.spr_aftereffect
call.i sprite_set_offset(argc=3)
popz.v
pushbltn.v self.room_height
pushi.e 2
conv.i.d
div.d.v
pop.v.v self.yy

:[264]
push.v self.chaptertoload
pushi.e 0
cmp.i.v NEQ
bf [271]

:[265]
pushi.e 500
conv.i.v
pushi.e 0
conv.i.v
push.v self.loop
call.i audio_sound_gain(argc=3)
popz.v
push.v self.chaptertoload
dup.v 0
pushi.e 1
cmp.i.v EQ
bt [268]

:[266]
dup.v 0
pushi.e 2
cmp.i.v EQ
bt [269]

:[267]
b [270]

:[268]
pushi.e 0
conv.i.v
pushi.e 50
conv.i.v
pushi.e 254
conv.i.v
call.i audio_play_sound(argc=3)
popz.v
b [270]

:[269]
pushi.e 0
conv.i.v
pushi.e 50
conv.i.v
pushi.e 193
conv.i.v
call.i audio_play_sound(argc=3)
popz.v
b [270]

:[270]
popz.v
push.v self.chaptertoload
pop.v.v self.chaptertoload_temp
pushi.e 0
pop.v.i self.chaptertoload
pushi.e 60
pushi.e -1
pushi.e 2
pop.v.i [array]self.alarm

:[271]
push.v self.fadeout
push.i 16777215
conv.i.v
pushi.e 0
conv.i.v
push.v self.yscale
push.v self.xscale
push.v self.yy
pushbltn.v self.room_width
pushi.e 2
conv.i.d
div.d.v
pushi.e 0
conv.i.v
push.v self.spr_aftereffect
call.i draw_sprite_ext(argc=9)
popz.v
push.d 0.125
conv.d.v
pushi.e 0
conv.i.v
push.v self.fadeout
call.i lerp(argc=3)
pop.v.v self.fadeout
push.v self.xscale
push.d 0.95
mul.d.v
pop.v.v self.xscale
push.v self.yscale
push.d 0.99
mul.d.v
pop.v.v self.yscale
push.v self.yy
push.d 0.99
mul.d.v
pop.v.v self.yy

:[272]
push.v self.move_noise
conv.v.b
bf [274]

:[273]
pushi.e 0
pop.v.i self.move_noise
pushi.e 0
conv.i.v
pushi.e 50
conv.i.v
pushi.e 259
conv.i.v
call.i audio_play_sound(argc=3)
popz.v

:[274]
push.v self.select_noise
conv.v.b
bf [end]

:[275]
pushi.e 0
pop.v.i self.select_noise
pushi.e 0
conv.i.v
pushi.e 50
conv.i.v
pushi.e 260
conv.i.v
call.i audio_play_sound(argc=3)
popz.v

:[end]