if obj_song_handler.songready == false and obj_song_handler.assetsloaded == true {
	if dad.charid == "monster" {zoom = 1}
	obj_song_handler.begin_song()
}
if global.paused == true {TweenPause(lightningtween)}
else {TweenResume(lightningtween)}