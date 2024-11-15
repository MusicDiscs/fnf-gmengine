if keybind_check_pressed("confirm") {
video_close()
ready = true
}
if ready == true and obj_persistent.joltready == true {room_goto(rm_TitleState)}