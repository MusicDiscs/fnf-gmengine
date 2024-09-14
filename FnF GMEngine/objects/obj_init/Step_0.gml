if keybind_check_pressed("confirm") {
video_close()
ready = true
}
if ready == true {room_goto(rm_TitleState)}