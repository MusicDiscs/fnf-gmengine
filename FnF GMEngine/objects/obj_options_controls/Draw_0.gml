if is_rebinding == false {draw_text_scribble(640, 25, "[fnt_big][fa_center]" + "Controls Menu")}
else {draw_text_scribble(640, 25, "[fnt_big][fa_center]" + "Rebinding " + string(controlarray[curselect][0]) + " Key " + string(curoption + 1) + "...")}
draw_text_scribble(640, 70, "[fnt_small][fa_center]" + "Press ENTER to rebind a control.")
draw_text_scribble(640, 110, "[fnt_small][fa_center]" + "I cant properly show keybind names yet. Use the numbers.")

draw_text(5, 5, delaytimer)

for (var i = 0; i < array_length(controlarray); i += 1) {
	var _alpha = 0.5
	var _optionalpha = [0.5, 0.5]
	if curselect == i {
	_alpha = 1
	_optionalpha[curoption] = 1
	}
	draw_text_color(5, 100 + (15 * i), string(controlarray[i][0]), c_black, c_black, c_black, c_black, _alpha)
	draw_text_color(120, 100 + (15 * i), string(struct_get(global.clientprefs.keybinds, controlarray[i][1])[0]), c_black, c_black, c_black, c_black, _optionalpha[0])
	draw_text_color(170, 100 + (15 * i), string(struct_get(global.clientprefs.keybinds, controlarray[i][1])[1]), c_black, c_black, c_black, c_black, _optionalpha[1])
	
}