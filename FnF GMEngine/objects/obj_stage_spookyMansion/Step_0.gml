if obj_song_handler.songready == false {
	if dad.charid == "monster" {zoom = 1}
	obj_song_handler.begin_song()
}
if global.paused == false {
	fps_accounting--
	if fps_accounting == 0 {
		lightningframe++
		fps_accounting = (game_get_speed(gamespeed_fps) / 60) * 2
	}
	if lightningframe > sprite_get_number(spr_stg_spooky_strike) {lightningalpha = 0}
}