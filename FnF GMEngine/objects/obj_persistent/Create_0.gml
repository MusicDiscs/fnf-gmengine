randomize()

audio_group_load(audiogroup_default)
load_tex_group("grp_global")

global.debug = false // To set compiled builds into debug mode, make this true.
if string(GM_build_type) == "run" {global.debug = true}
debugoverlay = false

global.paused = false

global.opendate = date_current_datetime()

global.songplaylist = []
global.cursong = "bopeebo"
global.curdiff = "hard"
global.curtag = ""
global.inst_tag = "Default"
global.storymode = false
global.curweek = "tutorial"
global.weekscore = 0

global.curcharacter = "bf"

global.lastchar = ""

global.bpm = 100
global.timesig = [4, 4]
global.curbeat = 0
global.curmeasure = 0
global.ismeasure = false

beat_microseconds = 0
beat_timer = 0

global.keybinds[0] = vk_left
global.keybinds[1] = ord("S")
global.keybinds[2] = ord("W")
global.keybinds[3] = vk_right

global.volume = 1.0

global.offset = 0

// Global Audio
global.confirmsound = audio_create_stream("assets\\sounds\\confirmMenu.ogg")
global.scrollsound = audio_create_stream("assets\\sounds\\scrollMenu.ogg")
global.cancelsound = audio_create_stream("assets\\sounds\\cancelMenu.ogg")

screenshotsound = audio_create_stream("assets\\sounds\\screenshot.ogg")
volup_sound = audio_create_stream("assets\\sounds\\Volup.ogg")
voldown_sound = audio_create_stream("assets\\sounds\\Voldown.ogg")
volmax_sound = audio_create_stream("assets\\sounds\\VolMAX.ogg")

load_clientprefs()
load_score_file()

game_set_speed(global.clientprefs.graphics.curfps, gamespeed_fps)

thealpha = 0

global.alphabet = font_add_sprite(spr_alphabet, 32, true, 1)

debugstring = ""

global.gjuserdata = 0
joltready = false

if GameJolt_User_LogIn_FromCache() {
	show_debug_message("Logged in via cache!")
	gamejolt_post_login()
}
else {show_debug_message("Failed to log in via cache."); joltready = true}

 // STATE SWAP VARIABLES //
global.swappingstate = false
room_to_swap = rm_TitleState
transtype = "instant"
entering = false
started = false
// Fade transition
fade_tween = TWEEN_NULL
blackalpha = 0
fadetimerthing = 1

gpu_set_tex_filter(global.clientprefs.graphics.smoothing)

// Beat System
beat_handler = time_source_create(time_source_game, time_bpm_to_seconds(global.bpm), time_source_units_seconds, function()
{
    beat_hit()
	audio_play_sound(sfx_beat, 1, false)
}, [], -1);
time_source_start(beat_handler)