//draw_sprite_ext(spr_menu_bg, 0, 0, 0, 1, 1, 0, c_teal, 1)

draw_text_scribble(txtx, txty - 30, "[fa_center][c_storytracklist][fnt_storymode]TRACKS")
for (var i = 0; i < array_length(songnames); i += 1) {
	//draw_sprite(get_icon_sprite(curweek.songs[i][1]), 0, 5, 5 + (150 * i))
	draw_text_scribble(txtx, txty + (30 * i), "[fa_center][c_storytracklist][fnt_storymode]" + songnames[i])
}

for (var i = 0; i < array_length(weeklist); i += 1) {
	draw_set_alpha(0.6)
	if i == curweeknum {draw_sprite_ext(asset_get_index("spr_weekname_" + weeklist[i].fileName), flashframe, storybtn_x, storybtn_y + (storybtn_yoffset * i), weekscales[i], weekscales[i], 0, c_white, storybtn_alpha_s)}
	else {draw_sprite_ext(asset_get_index("spr_weekname_" + weeklist[i].fileName), 0, storybtn_x, storybtn_y + (storybtn_yoffset * i), weekscales[i], weekscales[i], 0, c_white, storybtn_alpha)}
	
}

draw_set_alpha(1)

draw_sprite(asset_get_index("spr_diffsprite_" + diffarray[thediff]), 0, storybtn_x + 450, storybtn_y_base)

var _color = make_color_rgb(expectedcolor[0], expectedcolor[1], expectedcolor[2])
draw_rectangle_color(0, 50, 1280, 450, _color, _color, _color, _color, false)

draw_sprite_ext(weekchar_dad, image_index, 250, 250, 0.5, 0.5, 0, c_white, 1)
draw_sprite_ext(weekchar_bf, image_index, 640, 250, 0.8, 0.8, 0, c_white, 1)
draw_sprite_ext(weekchar_gf, image_index, 1030, 250, 0.5, 0.5, 0, c_white, 1)

draw_rectangle_color(0, 0, 1280, 50, c_black, c_black, c_black, c_black, false)

//draw_text(5, 700, "Current Difficulty - " + diffarray[thediff] + ". Press LEFT and RIGHT to change difficulty.")
//draw_text(5, 685, "Current Week - " + curweek.weekName + ". Press UP and DOWN to change week.")

//draw_text(5, 5, string(timer))
draw_text_scribble(5, 5, "[fnt_storymode]" + "WEEK SCORE - " + string(curscore))
draw_text_scribble(1275, 5, "[fnt_storymode][fa_right]" + curweek.storyName)