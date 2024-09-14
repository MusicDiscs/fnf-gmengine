if global.clientprefs.gameplay.downscroll == false {
	for (var i = 0; i < array_length(loadednotes); i += 1) {
	
		if loadednotes[i][1] < 4 {
			draw_sprite_stretched_ext(struct_get(noteskin[0], dirs[loadednotes[i][1]]).tail, 0, arrowx[0] + (arrowxoffset * loadednotes[i][1]) - 20, notesy + ((loadednotes[i][0] * curspeed) + loadednotes[i][5]), 40, (loadednotes[i][2] * curspeed) - loadednotes[i][5], c_white, loadednotes[i][6] - (1 - alpha_strum_player[loadednotes[i][1]]))
			var _spr = struct_get(noteskin[0], dirs[loadednotes[i][1]]).note
			var _frame = 0
			if loadednotes[i][7] != 0 {
				_frame = customnote_frame
				if struct_exists(global.customnotes, loadednotes[i][7]) {_spr = struct_get(global.customnotes, loadednotes[i][7]).sprites[loadednotes[i][1]]}
			}
			draw_sprite_ext(_spr, _frame, arrowx[0] + (arrowxoffset * loadednotes[i][1]), notesy + (loadednotes[i][0] * curspeed), 0.7, 0.7, 0, c_white, loadednotes[i][4] - (1 - alpha_strum_player[loadednotes[i][1]]))
		}
		else {
			draw_sprite_stretched_ext(struct_get(noteskin[1], dirs[loadednotes[i][1] - 4]).tail, 0, arrowx[1] + (arrowxoffset * (loadednotes[i][1] - 4)) - 20, notesy + ((loadednotes[i][0] * curspeed) + loadednotes[i][5]), 40, (loadednotes[i][2] * curspeed) - loadednotes[i][5], c_white, loadednotes[i][6] - (1 - alpha_strum_opponent[loadednotes[i][1] - 4]))
			var _spr = struct_get(noteskin[0], dirs[loadednotes[i][1] - 4]).note
			var _frame = 0
			if loadednotes[i][7] != 0 {
				_frame = customnote_frame
				if struct_exists(global.customnotes, loadednotes[i][7]) {_spr = struct_get(global.customnotes, loadednotes[i][7]).sprites[loadednotes[i][1] - 4]}
			}
			draw_sprite_ext(_spr, _frame, arrowx[1] + (arrowxoffset * (loadednotes[i][1] - 4)), notesy + (loadednotes[i][0] * curspeed), 0.7, 0.7, 0, c_white, loadednotes[i][4] - (1 - alpha_strum_opponent[loadednotes[i][1] - 4]))
		}
	
	}
	
}
else {
	for (var i = 0; i < array_length(loadednotes); i += 1) {
	
		if loadednotes[i][1] < 4 {
			draw_sprite_stretched_ext(struct_get(noteskin[0], dirs[loadednotes[i][1]]).downtail, 0, arrowx[0] + (arrowxoffset * loadednotes[i][1]) - 20, ((720 - notesy) - (loadednotes[i][0] * curspeed)) - (loadednotes[i][2] * curspeed), 40, (loadednotes[i][2] * curspeed) - loadednotes[i][5], c_white, loadednotes[i][6] - (1 - alpha_strum_player[loadednotes[i][1]]))
			var _spr = struct_get(noteskin[0], dirs[loadednotes[i][1]]).note
			var _frame = 0
			if loadednotes[i][7] != 0 {
				_frame = customnote_frame
				if struct_exists(global.customnotes, loadednotes[i][7]) {_spr = struct_get(global.customnotes, loadednotes[i][7]).sprites[loadednotes[i][1]]}
			}
			draw_sprite_ext(_spr, _frame, arrowx[0] + (arrowxoffset * loadednotes[i][1]), (720 - notesy) - (loadednotes[i][0] * curspeed), 0.7, 0.7, 0, c_white, loadednotes[i][4] - (1 - alpha_strum_player[loadednotes[i][1]]))
		}
		else {
			draw_sprite_stretched_ext(struct_get(noteskin[1], dirs[loadednotes[i][1] - 4]).downtail, 0, arrowx[1] + (arrowxoffset * (loadednotes[i][1] - 4)) - 20, ((720 - notesy) - (loadednotes[i][0] * curspeed)) - (loadednotes[i][2] * curspeed), 40, (loadednotes[i][2] * curspeed) - loadednotes[i][5], c_white, loadednotes[i][6] - (1 - alpha_strum_opponent[loadednotes[i][1] - 4]))
			var _spr = struct_get(noteskin[0], dirs[loadednotes[i][1] - 4]).note
			var _frame = 0
			if loadednotes[i][7] != 0 {
				_frame = customnote_frame
				if struct_exists(global.customnotes, loadednotes[i][7]) {_spr = struct_get(global.customnotes, loadednotes[i][7]).sprites[loadednotes[i][1] - 4]}
			}
			draw_sprite_ext(_spr, _frame, arrowx[1] + (arrowxoffset * (loadednotes[i][1] - 4)), (720 - notesy) - (loadednotes[i][0] * curspeed), 0.7, 0.7, 0, c_white, loadednotes[i][4] - (1 - alpha_strum_opponent[loadednotes[i][1] - 4]))
		}
	
	}
	
}	

ui_draw()

//draw_text(5, 5, string((time_bpm_to_seconds(global.bpm)*1000)))

//draw_text(5, 700, "Press ENTER to pause.")