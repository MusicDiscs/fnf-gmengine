set_bpm(102)
if !audio_is_playing(global.menumusic) {audio_play_sound(global.menumusic, 0, true)}

selsong = 1
seldiff = 2

global.cursong = "bopeebo"
global.curdiff = "hard"

mode = 0 // 0 is select mode, 1 is rebind mode
curbind = 0

dirs[0] = "LEFT"
dirs[1] = "DOWN"
dirs[2] = "UP"
dirs[3] = "RIGHT"

txtb = "[fnt_big][fa_center]"
txts = "[fnt_small][fa_center]"

diffarray = ["easy", "normal", "hard", "erect", "nightmare"]
songarray = [

"tutorial",
"bopeebo",
"fresh",
"dadbattle",
"spookeez",
"south",
"monster",
"pico",
"philly-nice",
"blammed",
"satin-panties",
"high",
"milf",
"cocoa",
"eggnog",
"winter-horrorland",
"senpai",
"roses",
"thorns",
"ugh",
"guns",
"stress",
"darnell",
"lit-up",
"2hot",
"blazin"

]

function change_song(_type) { // 1 for next 0 for previous
	
	audio_play_sound(global.scrollsound, 1, false)
	if _type == 1 {
	if selsong != array_length(songarray) - 1 {selsong++}
	else {selsong = 0}
	}
	else {
	if selsong != 0 {selsong--}
	else {selsong = array_length(songarray) - 1}
	}
	global.cursong = songarray[selsong]
}

function change_diff(_type) { // 1 for next 0 for previous
	
	audio_play_sound(global.scrollsound, 1, false)
	if _type == 1 {
	if seldiff != array_length(diffarray) - 1 {seldiff++}
	else {seldiff = 0}
	}
	else {
	if seldiff != 0 {seldiff--}
	else {seldiff = array_length(diffarray) - 1}
	}
	global.curdiff = diffarray[seldiff]
}