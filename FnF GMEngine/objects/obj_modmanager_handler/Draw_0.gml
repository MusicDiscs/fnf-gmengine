draw_sprite_ext(spr_menu_bg, 0, 0, 0, 1, 1, 0, c_purple, 1)
draw_text_scribble(640, 25, "[fnt_big][fa_center]" + "[rainbow]" + "My Fun Mod Menu!!!")

for (var i = 0; i < array_length(modlist); i += 1) {
	if curmod == i {draw_set_alpha(1)}
	else {draw_set_alpha(0.6)}
	draw_text(5, 100 + (15 * i), modlist[i].name)
}
draw_set_alpha(1)

draw_text_scribble(640, 680, "[fnt_small][fa_center]" + modlist[curmod].desc)

draw_set_alpha(fadealpha)
draw_rectangle_color(0, 0, 1280, 720, c_black, c_black, c_black, c_black, false)
draw_set_alpha(1)