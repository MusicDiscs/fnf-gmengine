if curvid != "test" {
	if global.storymode == true and obj_song_handler.songready == false {
		if videoplaying = false {

			video_open("assets\\videos\\" + curvid + ".mp4")
			videoplaying = true
			video_resume()
	
		}
	}
	else if obj_song_handler.songready == false and obj_song_handler.assetsloaded == true {obj_song_handler.begin_song()}
	video_set_volume(global.clientprefs.gameplay.volume)
}
else {
	if obj_song_handler.songready == false and obj_song_handler.assetsloaded == true {
		obj_song_handler.begin_song()
	}
}