if global.storymode == true and obj_song_handler.songready == false {
	if videoplaying = false {

		video_open("assets\\videos\\" + curvid + ".mp4")
		//video_set_volume(0.3)
		videoplaying = true
		video_resume()
	
	}
}
else if obj_song_handler.songready == false and obj_song_handler.assetsloaded == true {obj_song_handler.begin_song()}