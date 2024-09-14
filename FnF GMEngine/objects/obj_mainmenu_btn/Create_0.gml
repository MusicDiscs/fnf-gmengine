sprite_index = asset_get_index("spr_" + name + "_btn_0")
image_xscale = 1 - (0.15 * (btnid))
image_yscale = 1 - (0.15 * (btnid))
base_y = 360 + (150 * btnid)
y = base_y
alphatween = TWEEN_NULL
flashing = false
flashcooldown = 1 * (game_get_speed(gamespeed_fps) / 60)