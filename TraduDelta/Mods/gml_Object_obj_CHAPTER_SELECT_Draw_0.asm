.localvar 2 arguments
.localvar 99 i 6264
.localvar 11788 filename 6265
.localvar 14540 select_text 6270
.localvar 14551 max_options 6274
.localvar 5993 mycolor 6275
.localvar 14552 heart_xpos 6276
.localvar 14553 heart_ypos 6277
.localvar 14561 play_color 6280
.localvar 14562 not_color 6281

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
pushi.e 3
conv.i.v
call.i string(argc=1)
add.v.v
call.i gml_Script_ossafe_file_exists(argc=1)
conv.v.b
bt [19]

:[17]
pushloc.v local.filename
pushi.e 4
conv.i.v
call.i string(argc=1)
add.v.v
call.i gml_Script_ossafe_file_exists(argc=1)
conv.v.b
bt [19]

:[18]
pushloc.v local.filename
pushi.e 5
conv.i.v
call.i string(argc=1)
add.v.v
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
pushi.e 0
conv.i.v
call.i string(argc=1)
add.v.v
call.i gml_Script_ossafe_file_exists(argc=1)
conv.v.b
bt [30]

:[28]
pushloc.v local.filename
pushi.e 1
conv.i.v
call.i string(argc=1)
add.v.v
call.i gml_Script_ossafe_file_exists(argc=1)
conv.v.b
bt [30]

:[29]
pushloc.v local.filename
pushi.e 2
conv.i.v
call.i string(argc=1)
add.v.v
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
bf [69]

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
bf [47]

:[46]
push.i 65535
conv.i.v
call.i draw_set_color(argc=1)
popz.v
b [48]

:[47]
push.i 16777215
conv.i.v
call.i draw_set_color(argc=1)
popz.v

:[48]
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
bf [50]

:[49]
push.i 65535
conv.i.v
call.i draw_set_color(argc=1)
popz.v
b [51]

:[50]
push.i 16777215
conv.i.v
call.i draw_set_color(argc=1)
popz.v

:[51]
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
bf [53]

:[52]
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

:[53]
push.v self.mpos
pushi.e 1
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

:[55]
call.i gml_Script_up_p(argc=0)
conv.v.b
bf [57]

:[56]
push.v self.mpos
push.e 1
sub.i.v
pop.v.v self.mpos
pushi.e 1
pop.v.i self.move_noise

:[57]
call.i gml_Script_down_p(argc=0)
conv.v.b
bf [59]

:[58]
push.v self.mpos
push.e 1
add.i.v
pop.v.v self.mpos
pushi.e 1
pop.v.i self.move_noise

:[59]
pushi.e 1
conv.i.v
pushi.e 0
conv.i.v
push.v self.mpos
call.i clamp(argc=3)
pop.v.v self.mpos
call.i gml_Script_button1_p(argc=0)
conv.v.b
bf [61]

:[60]
push.v self.timer
pushi.e 10
cmp.i.v GT
b [62]

:[61]
push.e 0

:[62]
bf [69]

:[63]
pushi.e 1
pop.v.i self.select_noise
push.v self.mpos
dup.v 0
pushi.e 0
cmp.i.v EQ
bt [66]

:[64]
dup.v 0
pushi.e 1
cmp.i.v EQ
bt [67]

:[65]
b [68]

:[66]
pushi.e 1
pop.v.i self.chaptertoload
push.s "gameload"@14528
pop.v.s self.con
b [68]

:[67]
pushi.e 0
pop.v.i self.mpos
push.s "chapterselect"@14529
pop.v.s self.con
b [68]

:[68]
popz.v

:[69]
push.v self.con
push.s "filefound"@14522
cmp.s.v EQ
bf [73]

:[70]
push.v self.fademax
pop.v.v self.fade
pushi.e 0
pop.v.i self.mpos
pushi.e 0
pop.v.i self.timer
push.v self.highestCompletedChapter
push.v self.highestUncompletedChapter
cmp.v.v EQ
bf [72]

:[71]
push.s "startNextChapter"@14530
pop.v.s self.con
b [73]

:[72]
push.s "continueChapter"@14531
pop.v.s self.con

:[73]
push.v self.con
push.s "startNextChapter"@14530
cmp.s.v EQ
bf [107]

:[74]
push.v self.highestCompletedChapter
push.v self.latestAvailableChapter
cmp.v.v GTE
bf [76]

:[75]
push.s "chapterselect"@14529
pop.v.s self.con
exit.i

:[76]
push.v self.fade
pushi.e 0
cmp.i.v NEQ
bf [78]

:[77]
push.d 0.125
conv.d.v
pushi.e 0
conv.i.v
push.v self.fade
call.i lerp(argc=3)
pop.v.v self.fade

:[78]
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
bf [80]

:[79]
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

:[80]
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
bf [82]

:[81]
push.i 65535
conv.i.v
call.i draw_set_color(argc=1)
popz.v
b [83]

:[82]
push.i 16777215
conv.i.v
call.i draw_set_color(argc=1)
popz.v

:[83]
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
bf [85]

:[84]
push.i 65535
conv.i.v
call.i draw_set_color(argc=1)
popz.v
b [86]

:[85]
push.i 16777215
conv.i.v
call.i draw_set_color(argc=1)
popz.v

:[86]
pushglb.v global.lang
push.s "en"@9324
cmp.s.v EQ
bf [88]

:[87]
push.s "Chapter Select"@14538
conv.s.v
b [89]

:[88]
push.s "チャプター選択"@14539
conv.s.v

:[89]
pop.v.v local.select_text
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
bf [91]

:[90]
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

:[91]
push.v self.mpos
pushi.e 1
cmp.i.v EQ
bf [93]

:[92]
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

:[93]
call.i gml_Script_up_p(argc=0)
conv.v.b
bf [95]

:[94]
push.v self.mpos
push.e 1
sub.i.v
pop.v.v self.mpos
pushi.e 1
pop.v.i self.move_noise

:[95]
call.i gml_Script_down_p(argc=0)
conv.v.b
bf [97]

:[96]
push.v self.mpos
push.e 1
add.i.v
pop.v.v self.mpos
pushi.e 1
pop.v.i self.move_noise

:[97]
pushi.e 1
conv.i.v
pushi.e 0
conv.i.v
push.v self.mpos
call.i clamp(argc=3)
pop.v.v self.mpos
call.i gml_Script_button1_p(argc=0)
conv.v.b
bf [99]

:[98]
push.v self.timer
pushi.e 10
cmp.i.v GT
b [100]

:[99]
push.e 0

:[100]
bf [107]

:[101]
pushi.e 1
pop.v.i self.select_noise
push.v self.mpos
dup.v 0
pushi.e 0
cmp.i.v EQ
bt [104]

:[102]
dup.v 0
pushi.e 1
cmp.i.v EQ
bt [105]

:[103]
b [106]

:[104]
push.v self.highestCompletedChapter
pushi.e 1
add.i.v
pop.v.v self.chaptertoload
push.s "gameload"@14528
pop.v.s self.con
b [106]

:[105]
pushi.e 0
pop.v.i self.timer
pushi.e 0
pop.v.i self.mpos
push.s "chapterselect"@14529
pop.v.s self.con
b [106]

:[106]
popz.v

:[107]
push.v self.con
push.s "continueChapter"@14531
cmp.s.v EQ
bf [142]

:[108]
push.v self.highestUncompletedChapter
pushi.e 0
cmp.i.v EQ
bt [111]

:[109]
push.v self.highestUncompletedChapter
push.v self.latestAvailableChapter
cmp.v.v GT
bt [111]

:[110]
push.v self.highestCompletedChapter
push.v self.latestAvailableChapter
cmp.v.v GT
b [112]

:[111]
push.e 1

:[112]
bf [114]

:[113]
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

:[114]
push.v self.fade
pushi.e 0
cmp.i.v NEQ
bf [116]

:[115]
push.d 0.125
conv.d.v
pushi.e 0
conv.i.v
push.v self.fade
call.i lerp(argc=3)
pop.v.v self.fade

:[116]
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
bf [118]

:[117]
push.s "Chapter "@14532
push.v self.highestUncompletedChapter
call.i string(argc=1)
add.v.s
push.s "から続けますか？"@14544
add.s.v
pop.v.v self.my_stringset

:[118]
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
bf [120]

:[119]
push.i 65535
conv.i.v
call.i draw_set_color(argc=1)
popz.v
b [121]

:[120]
push.i 16777215
conv.i.v
call.i draw_set_color(argc=1)
popz.v

:[121]
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
bf [123]

:[122]
push.i 65535
conv.i.v
call.i draw_set_color(argc=1)
popz.v
b [124]

:[123]
push.i 16777215
conv.i.v
call.i draw_set_color(argc=1)
popz.v

:[124]
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
bf [126]

:[125]
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

:[126]
push.v self.mpos
pushi.e 1
cmp.i.v EQ
bf [128]

:[127]
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

:[128]
call.i gml_Script_up_p(argc=0)
conv.v.b
bf [130]

:[129]
push.v self.mpos
push.e 1
sub.i.v
pop.v.v self.mpos
pushi.e 1
pop.v.i self.move_noise

:[130]
call.i gml_Script_down_p(argc=0)
conv.v.b
bf [132]

:[131]
push.v self.mpos
push.e 1
add.i.v
pop.v.v self.mpos
pushi.e 1
pop.v.i self.move_noise

:[132]
pushi.e 1
conv.i.v
pushi.e 0
conv.i.v
push.v self.mpos
call.i clamp(argc=3)
pop.v.v self.mpos
call.i gml_Script_button1_p(argc=0)
conv.v.b
bf [134]

:[133]
push.v self.timer
pushi.e 10
cmp.i.v GT
b [135]

:[134]
push.e 0

:[135]
bf [142]

:[136]
pushi.e 0
pop.v.i self.timer
pushi.e 1
pop.v.i self.select_noise
push.v self.mpos
dup.v 0
pushi.e 0
cmp.i.v EQ
bt [139]

:[137]
dup.v 0
pushi.e 1
cmp.i.v EQ
bt [140]

:[138]
b [141]

:[139]
push.v self.highestUncompletedChapter
pop.v.v self.chaptertoload
push.s "gameload"@14528
pop.v.s self.con
b [141]

:[140]
pushi.e 0
pop.v.i self.timer
pushi.e 0
pop.v.i self.mpos
push.s "chapterselect"@14529
pop.v.s self.con
b [141]

:[141]
popz.v

:[142]
push.v self.con
push.s "chapterselect"@14529
cmp.s.v EQ
bf [187]

:[143]
pushglb.v global.lang
push.s "en"@9324
cmp.s.v EQ
bf [145]

:[144]
push.s "Quit"@14545
conv.s.v
b [146]

:[145]
push.s "とじる"@14546
conv.s.v

:[146]
pop.v.v self.quit
push.s "Chapter"@14548
pop.v.s self.chapterstring
push.v self.chapterselectinit
pushi.e 0
cmp.i.v EQ
bf [149]

:[147]
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
bf [149]

:[148]
push.v self.latestAvailableChapter
pushi.e 1
sub.i.v
pop.v.v self.mpos

:[149]
push.v self.fade
pushi.e 0
cmp.i.v NEQ
bf [151]

:[150]
push.d 0.125
conv.d.v
pushi.e 0
conv.i.v
push.v self.fade
call.i lerp(argc=3)
pop.v.v self.fade

:[151]
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

:[152]
pushloc.v local.i
pushi.e 6
cmp.i.v LT
bf [154]

:[153]
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
b [152]

:[154]
pushi.e 1
conv.i.v
call.i draw_set_halign(argc=1)
popz.v
call.i gml_Script_up_p(argc=0)
conv.v.b
bf [157]

:[155]
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
bf [157]

:[156]
push.v self.latestAvailableChapter
pushi.e 1
sub.i.v
pop.v.v self.mpos

:[157]
call.i gml_Script_down_p(argc=0)
conv.v.b
bf [163]

:[158]
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
bf [163]

:[159]
pushglb.v global.is_console
conv.v.b
bf [161]

:[160]
pushi.e 1
conv.i.v
b [162]

:[161]
pushi.e 7
conv.i.v

:[162]
pop.v.v self.mpos

:[163]
push.v self.console
conv.v.b
bf [165]

:[164]
pushi.e 6
conv.i.v
pushi.e 0
conv.i.v
push.v self.mpos
call.i clamp(argc=3)
pop.v.v self.mpos
b [166]

:[165]
pushi.e 7
conv.i.v
pushi.e 0
conv.i.v
push.v self.mpos
call.i clamp(argc=3)
pop.v.v self.mpos

:[166]
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

:[167]
pushloc.v local.i
pushloc.v local.max_options
cmp.v.v LT
bf [173]

:[168]
push.i 8421504
pop.v.i local.mycolor
pushloc.v local.i
push.v self.latestAvailableChapter
cmp.v.v LT
bf [170]

:[169]
push.i 16777215
pop.v.i local.mycolor

:[170]
push.v self.mpos
pushloc.v local.i
cmp.v.v EQ
bf [172]

:[171]
push.i 65535
pop.v.i local.mycolor

:[172]
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
b [167]

:[173]
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
bf [175]

:[174]
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

:[175]
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
bf [179]

:[176]
push.i 16777215
pop.v.i local.mycolor
push.v self.mpos
pushi.e 7
cmp.i.v EQ
bf [178]

:[177]
push.i 65535
pop.v.i local.mycolor

:[178]
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

:[179]
call.i gml_Script_button1_p(argc=0)
conv.v.b
bf [181]

:[180]
push.v self.timer
pushi.e 12
cmp.i.v GT
b [182]

:[181]
push.e 0

:[182]
bf [186]

:[183]
pushi.e 1
pop.v.i self.select_noise
pushi.e 0
pop.v.i self.timer
push.v self.mpos
pushi.e 7
cmp.i.v EQ
bf [185]

:[184]
call.i game_end(argc=0)
popz.v
b [186]

:[185]
push.s "gameloadConfirm"@14554
pop.v.s self.con
pushi.e 0
pop.v.i self.confirm_choice_index
push.v self.mpos
pushi.e 1
add.i.v
pop.v.v self.chaptertoload

:[186]
b [250]

:[187]
push.v self.con
push.s "gameloadConfirm"@14554
cmp.s.v EQ
bf [250]

:[188]
pushglb.v global.lang
push.s "en"@9324
cmp.s.v EQ
bf [190]

:[189]
push.s "Play"@14555
conv.s.v
b [191]

:[190]
push.s "プレイする"@14556
conv.s.v

:[191]
pop.v.v self.stringPlay
pushglb.v global.lang
push.s "en"@9324
cmp.s.v EQ
bf [193]

:[192]
push.s "Do Not"@14558
conv.s.v
b [194]

:[193]
push.s "しない"@14559
conv.s.v

:[194]
pop.v.v self.stringDoNot
pushi.e 30
push.v self.scale
mul.v.i
pop.v.v self.space
pushi.e 0
pop.v.i local.i

:[195]
pushloc.v local.i
pushi.e 6
cmp.i.v LT
bf [197]

:[196]
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
b [195]

:[197]
pushi.e 1
conv.i.v
call.i draw_set_halign(argc=1)
popz.v
push.v self.console
conv.v.b
bf [199]

:[198]
pushi.e 6
conv.i.v
pushi.e 0
conv.i.v
push.v self.mpos
call.i clamp(argc=3)
pop.v.v self.mpos
b [200]

:[199]
pushi.e 7
conv.i.v
pushi.e 0
conv.i.v
push.v self.mpos
call.i clamp(argc=3)
pop.v.v self.mpos

:[200]
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
bf [205]

:[201]
pushi.e 1
pop.v.i self.move_noise
push.v self.confirm_choice_index
pushi.e 1
sub.i.v
pushi.e 0
cmp.i.v LT
bf [203]

:[202]
pushi.e 1
conv.i.v
b [204]

:[203]
pushi.e 0
conv.i.v

:[204]
pop.v.v self.confirm_choice_index

:[205]
call.i gml_Script_right_p(argc=0)
conv.v.b
bf [210]

:[206]
pushi.e 1
pop.v.i self.move_noise
push.v self.confirm_choice_index
pushi.e 1
add.i.v
pushi.e 1
cmp.i.v GT
bf [208]

:[207]
pushi.e 0
conv.i.v
b [209]

:[208]
pushi.e 1
conv.i.v

:[209]
pop.v.v self.confirm_choice_index

:[210]
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
bf [212]

:[211]
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

:[212]
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

:[213]
pushloc.v local.i
pushloc.v local.max_options
cmp.v.v LT
bf [234]

:[214]
push.i 8421504
pop.v.i local.mycolor
pushloc.v local.i
push.v self.latestAvailableChapter
cmp.v.v LT
bf [216]

:[215]
push.i 16777215
pop.v.i local.mycolor

:[216]
push.v self.mpos
pushloc.v local.i
cmp.v.v EQ
bf [218]

:[217]
push.i 65535
pop.v.i local.mycolor

:[218]
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
bf [232]

:[219]
push.v self.confirm_choice_index
pushi.e 0
cmp.i.v EQ
bf [221]

:[220]
push.i 65535
conv.i.v
b [222]

:[221]
push.i 16777215
conv.i.v

:[222]
pop.v.v local.play_color
pushloc.v local.play_color
call.i draw_set_color(argc=1)
popz.v
pushglb.v global.lang
push.s "en"@9324
cmp.s.v EQ
bf [224]

:[223]
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
b [225]

:[224]
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

:[225]
push.v self.confirm_choice_index
pushi.e 1
cmp.i.v EQ
bf [227]

:[226]
push.i 65535
conv.i.v
b [228]

:[227]
push.i 16777215
conv.i.v

:[228]
pop.v.v local.not_color
pushloc.v local.not_color
call.i draw_set_color(argc=1)
popz.v
pushglb.v global.lang
push.s "en"@9324
cmp.s.v EQ
bf [230]

:[229]
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
b [231]

:[230]
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

:[231]
b [233]

:[232]
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

:[233]
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
b [213]

:[234]
push.v self.console
conv.v.b
not.b
bf [238]

:[235]
push.i 16777215
pop.v.i local.mycolor
push.v self.mpos
pushi.e 7
cmp.i.v EQ
bf [237]

:[236]
push.i 65535
pop.v.i local.mycolor

:[237]
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

:[238]
call.i gml_Script_button1_p(argc=0)
conv.v.b
bf [240]

:[239]
push.v self.timer
pushi.e 12
cmp.i.v GT
b [241]

:[240]
push.e 0

:[241]
bf [245]

:[242]
pushi.e 0
pop.v.i self.timer
pushi.e 1
pop.v.i self.select_noise
push.v self.confirm_choice_index
pushi.e 0
cmp.i.v EQ
bf [244]

:[243]
push.s "gameload"@14528
pop.v.s self.con
b [245]

:[244]
push.s "chapterselect"@14529
pop.v.s self.con

:[245]
call.i gml_Script_button2_p(argc=0)
conv.v.b
bf [247]

:[246]
push.v self.timer
pushi.e 12
cmp.i.v GT
b [248]

:[247]
push.e 0

:[248]
bf [250]

:[249]
pushi.e 0
pop.v.i self.timer
pushi.e 1
pop.v.i self.select_noise
push.s "chapterselect"@14529
pop.v.s self.con

:[250]
push.v self.con
push.s "gameload"@14528
cmp.s.v EQ
bf [261]

:[251]
push.v self.spr_aftereffect
pushi.e 0
cmp.i.v EQ
bf [253]

:[252]
pushi.e 0
conv.i.v
pushi.e 0
conv.i.v
pushi.e 0
conv.i.v
pushi.e 0
conv.i.v
pushbltn.v builtin.room_height
pushbltn.v builtin.room_width
pushi.e 0
conv.i.v
pushi.e 0
conv.i.v
pushbltn.v builtin.application_surface
call.i sprite_create_from_surface(argc=9)
pop.v.v self.spr_aftereffect
pushbltn.v builtin.room_height
pushi.e 2
conv.i.d
div.d.v
pushbltn.v builtin.room_width
pushi.e 2
conv.i.d
div.d.v
push.v self.spr_aftereffect
call.i sprite_set_offset(argc=3)
popz.v
pushbltn.v builtin.room_height
pushi.e 2
conv.i.d
div.d.v
pop.v.v self.yy

:[253]
push.v self.chaptertoload
pushi.e 0
cmp.i.v NEQ
bf [260]

:[254]
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
bt [257]

:[255]
dup.v 0
pushi.e 2
cmp.i.v EQ
bt [258]

:[256]
b [259]

:[257]
pushi.e 0
conv.i.v
pushi.e 50
conv.i.v
pushi.e 254
conv.i.v
call.i audio_play_sound(argc=3)
popz.v
b [259]

:[258]
pushi.e 0
conv.i.v
pushi.e 50
conv.i.v
pushi.e 193
conv.i.v
call.i audio_play_sound(argc=3)
popz.v
b [259]

:[259]
popz.v
push.v self.chaptertoload
pop.v.v self.chaptertoload_temp
pushi.e 0
pop.v.i self.chaptertoload
push.i 68062
setowner.e
pushi.e 60
conv.i.v
pushi.e -1
pushi.e 2
pop.v.v [array]self.alarm

:[260]
push.v self.fadeout
push.i 16777215
conv.i.v
pushi.e 0
conv.i.v
push.v self.yscale
push.v self.xscale
push.v self.yy
pushbltn.v builtin.room_width
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

:[261]
push.v self.move_noise
conv.v.b
bf [263]

:[262]
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

:[263]
push.v self.select_noise
conv.v.b
bf [end]

:[264]
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