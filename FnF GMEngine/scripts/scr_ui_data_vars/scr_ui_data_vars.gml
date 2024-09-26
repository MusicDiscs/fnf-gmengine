global.uiskin_list = ["funkin", "pixel"]

function ui_load_vars_funkin() {
	
	
	// Initialize any vars relating to UI
	judgealpha = 0
	judgey_base = 530
	judgey = 480
	judgetimer_base = game_get_speed(gamespeed_fps) * 1.5
	judgetimer = 0
	scribble_color_set("c_judge", c_green)

	barpath = asset_get_index("spr_" + uiskin + "_healthbar")
	bar_center = 640
	barx_min = bar_center - (sprite_get_width(barpath) / 2)
	barx_max = bar_center + (sprite_get_width(barpath) / 2)
	bary_center = 640
	bary_min = bary_center - (sprite_get_height(barpath) / 2)
	bary_max = bary_center + (sprite_get_height(barpath) / 2)

	stat_text = "text"
	timebar_center = 640
	timebarx_min = timebar_center - 160
	timebarx_max = timebar_center + 160
	timebary_center = 90
	timebary_min = timebary_center - 7
	timebary_max = timebary_center + 7

	bficonframe = 0
	dadiconframe = 0
	barcenter = bar_center - ((bar_center - 240) * finalhealth)

	playerbarcolor = c_green
	dadbarcolor = c_red

	icon_scale_base = 0.8
	icon_scale = [0.8, 0.8]
	
	// I think it's pretty obvious where each of these functions is ran
	ui_draw = function() {
		if global.clientprefs.gameplay.downscroll == false {
			draw_set_alpha(alpha_ui)
			draw_sprite_ext(asset_get_index("spr_rating_" + uiskin + "_" + string(judgement)), 0, 640, judgey, 0.7, 0.7, 0, c_white, judgealpha)
			draw_set_alpha(judgealpha)
			gpu_set_tex_filter(false)
			draw_text_scribble(640, judgey + 40, "[fa_center][fnt_judge][c_judge]" + string(timecheck) + " ms")
			draw_set_alpha(alpha_ui)
	
			//draw_healthbar(timebarx_min, timebary_min, timebarx_max, timebary_max, obj_song_handler.timeprogress * 100, c_white, c_black, c_black, 1, true, true)
			draw_text_scribble(642, timebary_center - 20, "[fa_center][fnt_time][c_black]" + string(obj_song_handler.timestring))
			draw_text_scribble(640, timebary_center - 18, "[fa_center][fnt_time][c_black]" + string(obj_song_handler.timestring))
			draw_text_scribble(638, timebary_center - 20, "[fa_center][fnt_time][c_black]" + string(obj_song_handler.timestring))
			draw_text_scribble(640, timebary_center - 22, "[fa_center][fnt_time][c_black]" + string(obj_song_handler.timestring))
			draw_text_scribble(640, timebary_center - 20, "[fa_center][fnt_time]" + string(obj_song_handler.timestring))
			gpu_set_tex_filter(true)
	
			draw_healthbar(barx_min + 5, bary_min + 2, barx_max - 5, bary_max - 2, finalhealth * 100, dadbarcolor, playerbarcolor, playerbarcolor, 1, true, true)
			draw_sprite(barpath, 0, bar_center, bary_center)
			draw_sprite_ext(obj_song_handler.icons[1], dadiconframe, barcenter + 20, bary_center, icon_scale[1], icon_scale[1], 0, c_white, 1)
			draw_sprite_ext(obj_song_handler.icons[0], bficonframe, barcenter - 20, bary_center, -icon_scale[0], icon_scale[0], 0, c_white, 1)
			gpu_set_tex_filter(false)
			draw_text_scribble(641, 680, "[c_black]" + stat_text)
			draw_text_scribble(640, 681, "[c_black]" + stat_text)
			draw_text_scribble(639, 680, "[c_black]" + stat_text)
			draw_text_scribble(640, 679, "[c_black]" + stat_text)
			draw_text_scribble(640, 680, stat_text)
			draw_set_alpha(1)
			gpu_set_tex_filter(true)
		}
		else {
			draw_set_alpha(alpha_ui)
			draw_sprite_ext(asset_get_index("spr_rating_" + uiskin + "_" + string(judgement)), 0, 640, (720 - judgey), 0.7, 0.7, 0, c_white, judgealpha)
			draw_set_alpha(judgealpha)
			gpu_set_tex_filter(false)
			draw_text_scribble(640, 720 - (judgey + 80), "[fa_center][fnt_judge][c_judge]" + string(timecheck) + " ms")
			draw_set_alpha(alpha_ui)
			
			//draw_healthbar(timebarx_min, (720 - timebary_min), timebarx_max, (720 - timebary_max), obj_song_handler.timeprogress * 100, c_white, c_black, c_black, 1, true, true)
			draw_text_scribble(642, (700 - timebary_center) - 20, "[fa_center][fnt_time][c_black]" + string(obj_song_handler.timestring))
			draw_text_scribble(640, (700 - timebary_center) - 18, "[fa_center][fnt_time][c_black]" + string(obj_song_handler.timestring))
			draw_text_scribble(638, (700 - timebary_center) - 20, "[fa_center][fnt_time][c_black]" + string(obj_song_handler.timestring))
			draw_text_scribble(640, (700 - timebary_center) - 22, "[fa_center][fnt_time][c_black]" + string(obj_song_handler.timestring))
			draw_text_scribble(640, (700 - timebary_center) - 20, "[fa_center][fnt_time]" + string(obj_song_handler.timestring))
			gpu_set_tex_filter(true)
			
			draw_healthbar(barx_min, (720 - bary_min), barx_max, (720 - bary_max), finalhealth * 100, dadbarcolor, playerbarcolor, playerbarcolor, 1, true, true)
			draw_sprite(barpath, 0, bar_center, (720 - bary_center))
			draw_sprite_ext(obj_song_handler.icons[1], dadiconframe, barcenter + 20, (720 - bary_center), icon_scale[1], icon_scale[1], 0, c_white, 1)
			draw_sprite_ext(obj_song_handler.icons[0], bficonframe, barcenter - 20, (720 - bary_center), -icon_scale[0], icon_scale[0], 0, c_white, 1)
			gpu_set_tex_filter(false)
			draw_text_scribble(641, 20, "[c_black]" + stat_text)
			draw_text_scribble(640, 21, "[c_black]" + stat_text)
			draw_text_scribble(639, 20, "[c_black]" + stat_text)
			draw_text_scribble(640, 19, "[c_black]" + stat_text)
			draw_text_scribble(640, 20, stat_text)
			draw_set_alpha(1)
			gpu_set_tex_filter(true)
		}
	}
	ui_step = function() {
		barcenter = barx_max - ((barx_max - barx_min) * finalhealth)
	
		judgetimer--
		if judgetimer >= 0 {judgealpha = lerp(judgealpha, 1, (0.12 / (game_get_speed(gamespeed_fps) / 60)))}
		else {judgealpha = lerp(judgealpha, 0, (0.1 / (game_get_speed(gamespeed_fps) / 60)))}
		judgey = lerp(judgey, judgey_base, (0.12 / (game_get_speed(gamespeed_fps) / 60)))
	
		icon_scale[0] = lerp(icon_scale[0], icon_scale_base, (0.0002 * global.bpm) / (game_get_speed(gamespeed_fps)/60))
		icon_scale[1] = lerp(icon_scale[1], icon_scale_base, (0.0002 * global.bpm) / (game_get_speed(gamespeed_fps)/60))
	
		stat_text = "[fa_center][fnt_statbar]" + "Misses - " + string(misses) + " | Score - " + string(obj_song_handler.curscore) + " | Accuracy - " + string(obj_song_handler.accuracy * 100) + "%"
	}
	ui_beat = function() {
		icon_scale[0] += 0.15
		icon_scale[1] += 0.15	
	}
	ui_notehit = function() {
		judgealpha = 0
		judgey = 500
		judgetimer = judgetimer_base	
	}
	
}
	
function ui_load_vars_pixel() {
	
	ui_draw = function() {}
	ui_step = function() {}
	ui_beat = function() {}
	ui_notehit = function() {}
	
}