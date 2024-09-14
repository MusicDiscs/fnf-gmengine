randomize()
playvid = false
if playvid == true {
	vidpath = working_directory + "assets\\videos\\startup.mp4"
	ready = false
	video_open(vidpath)
}
else {room_goto(rm_TitleState)}