var _curid = obj_mainmenu_handler.curselect
if _curid == btnid {
	sprite_index = asset_get_index("spr_" + name + "_btn_1")
	image_xscale = lerp(image_xscale, 1, (0.1 / (game_get_speed(gamespeed_fps) / 60)))
	image_yscale = lerp(image_yscale, 1, (0.1 / (game_get_speed(gamespeed_fps) / 60)))
}
else {
	sprite_index = asset_get_index("spr_" + name + "_btn_0")
	if btnid > _curid {
		image_xscale = lerp(image_xscale, 1 - (0.15 * (btnid - _curid)), (0.1 / (game_get_speed(gamespeed_fps) / 60)))
		image_yscale = lerp(image_yscale, 1 - (0.15 * (btnid - _curid)), (0.1 / (game_get_speed(gamespeed_fps) / 60)))
	}
	else {
		image_xscale = lerp(image_xscale, 1 - (0.15 * (_curid - btnid)), (0.1 / (game_get_speed(gamespeed_fps) / 60)))
		image_yscale = lerp(image_yscale, 1 - (0.15 * (_curid - btnid)), (0.1 / (game_get_speed(gamespeed_fps) / 60)))
	}
}

y = lerp(y, base_y - obj_mainmenu_handler.centery, (0.1 / (game_get_speed(gamespeed_fps) / 60)))

if flashing == true {
	TweenDestroy(alphatween)
	flashcooldown--
	if flashcooldown <= 0 {
		if image_alpha == 1 {image_alpha = 0}
		else {image_alpha = 1}
		flashcooldown = 4 * (game_get_speed(gamespeed_fps) / 60)
	}
}