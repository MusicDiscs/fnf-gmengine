depth = -1
// Volume setter shit
if keybind_check_pressed("volup") {
if global.clientprefs.gameplay.volume != 1 {global.clientprefs.gameplay.volume += 0.1; thealpha = 2; audio_play_sound(volup_sound, 1, false); save_clientprefs()}
else {thealpha = 2; audio_play_sound(volmax_sound, 1, false);}
}
if keybind_check_pressed("voldown") {
if global.clientprefs.gameplay.volume != 0 {global.clientprefs.gameplay.volume -= 0.1; thealpha = 2; audio_play_sound(voldown_sound, 1, false); save_clientprefs()}
else {thealpha = 2}
}
thealpha -= 0.01
audio_master_gain(global.clientprefs.gameplay.volume);

// Screenshot key
if keybind_check_pressed("screenshot") {
	screen_save(working_directory + "Screenshots\\Screenshot_" + string(irandom_range(0, 1000)) + ".png")
	audio_play_sound(screenshotsound, 1, false)
}
if keybind_check_pressed("fullscreen") {window_set_fullscreen(!window_get_fullscreen())}

// Transition Stuff
if global.swappingstate == true {
switch transtype {
	
	case "instant" :
	with (obj_song_handler) {check_for_asset_reload()}
	room_goto(room_to_swap)
	global.swappingstate = false
	break;
	
	case "fade" :
	if entering = false {
		if started == false {fade_tween = TweenFire(obj_persistent, EaseOutQuart, 0, true, 0, 0.5, "blackalpha", blackalpha, 1); started = true}
		else if !TweenIsActive(fade_tween) {
		with (obj_song_handler) {load_playstate_assets(true)}
		room_goto(room_to_swap)
		entering = true
		started = false
		fadetimerthing = 1
		}
	}
	else {
	if fadetimerthing <= 0 {
		if started == false {fade_tween = TweenFire(obj_persistent, EaseOutQuart, 0, true, 0, 0.5, "blackalpha", blackalpha, 0); started = true}
		else if !TweenIsActive(fade_tween)  {
		global.swappingstate = false
		blackalpha = 0
		started = false
		entering = false
		TweenDestroy(fade_tween)
		}
	}
	else {fadetimerthing--}
	}
	break;
	
}
}

if global.debug == true {
	debugstring = string(fps) + " FPS | Debug Mode Enabled"
	if keyboard_check_pressed(vk_f1) {
		debugoverlay = !debugoverlay
		show_debug_overlay(debugoverlay)
	}
}
else {debugstring = string(fps) + " FPS"}