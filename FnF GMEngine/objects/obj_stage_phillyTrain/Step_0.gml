if obj_song_handler.songready == false and obj_song_handler.assetsloaded == true {
	obj_song_handler.begin_song()
}

if global.paused == false {
	fps_accounting--
	if fps_accounting == 0 {
		if trainx <= trainx_base - (sprite_get_width(spr_stg_philly_train) * train_max) {trainx = trainx_base}
		else {trainx -= train_speed}
		fps_accounting = (game_get_speed(gamespeed_fps) / 60)
	}
}