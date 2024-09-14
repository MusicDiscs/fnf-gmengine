draw_sprite_ext(spr_menu_bg, 0, 0, 0, 1, 1, 0, c_fuchsia, 1)
if insubmenu == false {
	draw_text_scribble(640, 25, "[fnt_big][fa_center]" + "[rainbow]" + "You are not in a sub-menu!")
	draw_text_scribble(640, 70, "[fnt_small][fa_center]" + "Press ENTER to enter controls menu.")
	draw_text_scribble(640, 110, "[fnt_small][fa_center]" + "Press CONTROL to toggle downscroll. Currently " + string(global.clientprefs.gameplay.downscroll))
	draw_text_scribble(640, 150, "[fnt_small][fa_center]" + "Press F to change FPS. Currently " + string(global.clientprefs.graphics.curfps))
	draw_text_scribble(640, 190, "[fnt_small][fa_center]" + "Press O to change note offset. Currently " + string(global.clientprefs.gameplay.noteoffset))
	draw_text_scribble(640, 230, "[fnt_small][fa_center]" + "Press G to do Gamejolt stuff.")
	
}