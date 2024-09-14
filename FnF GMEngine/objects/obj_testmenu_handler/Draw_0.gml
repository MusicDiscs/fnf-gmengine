draw_sprite_ext(spr_menu_bg, 0, 0, 0, 1, 1, 0, c_fuchsia, 1)

draw_text_scribble(640, 25, txtb + "[rainbow]" + "Welcome to Friday Night Funkin' - GMEngine!")

if mode == 0 {
	
	draw_text_scribble(640, 75, txts + "This is a heavy WIP, please report issues to me :)")

	draw_text_scribble(350, 280, txtb + "Current Song")
	draw_text_scribble(350, 330, txts + "Press UP and DOWN to change")
	draw_text_scribble(350, 360, txtb + string(global.cursong))

	draw_text_scribble(928, 280, txtb + "Current Difficulty")
	draw_text_scribble(928, 330, txts + "Press LEFT and RIGHT to change")
	draw_text_scribble(928, 360, txtb + string(global.curdiff))

	draw_text_scribble(640, 545, txts + "Press R to change Keybinds")
	draw_text_scribble(640, 575, txts + "Press F to set FPS")
	draw_text_scribble(640, 605, txts + "Press O to set Note Offset")
	draw_text_scribble(640, 650, txtb + "Press SPACE to Begin!")

}
else {
	
	draw_text_scribble(640, 75, txts + "Rebinding keys...")
	draw_text_scribble(640, 350, txtb + "Press Your " + dirs[curbind] + " Key!")
	
}