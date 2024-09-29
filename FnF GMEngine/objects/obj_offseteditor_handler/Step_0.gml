if keyboard_check(vk_shift) {
	if keyboard_check(ord("I")) {camy -= 5}
	if keyboard_check(ord("K")) {camy += 5}
	if keyboard_check(ord("L")) {camx += 5}
	if keyboard_check(ord("J")) {camx -= 5}

	if keyboard_check(ord("E")) and camzoom > 0 {camzoom -= 0.004}
	if keyboard_check(ord("Q")) {camzoom += 0.004}
}
else {
	if keyboard_check(ord("I")) {camy -= 1}
	if keyboard_check(ord("K")) {camy += 1}
	if keyboard_check(ord("L")) {camx += 1}
	if keyboard_check(ord("J")) {camx -= 1}

	if keyboard_check(ord("E")) and camzoom > 0 {camzoom -= 0.002}
	if keyboard_check(ord("Q")) {camzoom += 0.002}
}

if keyboard_check(vk_shift) {
	if keyboard_check_pressed(vk_up) {animlist[curanimnum][1][1] -= 10}
	if keyboard_check_pressed(vk_down) {animlist[curanimnum][1][1] += 10}
	if keyboard_check_pressed(vk_left) {animlist[curanimnum][1][0] -= 10}
	if keyboard_check_pressed(vk_right) {animlist[curanimnum][1][0] += 10}
}
else {
	if keyboard_check_pressed(vk_up) {animlist[curanimnum][1][1] -= 1}
	if keyboard_check_pressed(vk_down) {animlist[curanimnum][1][1] += 1}
	if keyboard_check_pressed(vk_left) {animlist[curanimnum][1][0] -= 1}
	if keyboard_check_pressed(vk_right) {animlist[curanimnum][1][0] += 1}
}

if keyboard_check_pressed(ord("C")) {
	var _chr = get_string("Input character string.", "")
	show_debug_message(_chr)
	setup_char(_chr)
}
if keyboard_check_pressed(ord("S")) {change_anim(false)}
if keyboard_check_pressed(ord("W")) {change_anim(true)}
if keyboard_check_pressed(vk_space) {
	hotswapanim = curanimnum
	for (var i = 0; i < array_length(animlist); i += 1) {
		if animlist[i][0] ==  "idle" {
		curanimnum = i
		break
		}
	}
	character.curanim = animlist[curanimnum][0]
	character.offsets = animlist[curanimnum][1]
	character.curpath = animlist[curanimnum][2]
}
if keyboard_check_pressed(vk_control) {
	curanimnum = hotswapanim
	character.curanim = animlist[curanimnum][0]
	character.offsets = animlist[curanimnum][1]
	character.curpath = animlist[curanimnum][2]
}
if keyboard_check_pressed(ord("G")) {
	ghostsprite = character.sprite_index
	ghostframe = character.image_index
	ghostx = character.x
	ghosty = character.y
	ghostalpha = 0.6
	ghostscale[0] = character.image_xscale
	ghostscale[1] = character.image_yscale
}
if keyboard_check_pressed(ord("H")) {ghostalpha = 0}
if keyboard_check_pressed(ord("F")) {
	if filteron == true {filteron = false}
	else {filteron = true}
}
if keybind_check_pressed("back") {swap_state(rm_MainMenu)}

var _cam = view_camera[view_current]
camera_set_view_size(_cam, 1280 * camzoom, 720 * camzoom)
var _center = [camx + (1280/2), camy + (720/2)]
camera_set_view_pos(_cam, _center[0] - (camera_get_view_width(_cam) / 2), _center[1] - (camera_get_view_height(_cam) / 2))