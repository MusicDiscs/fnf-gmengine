global.customnotes = {

	hurtnote : {
		// order for sprite paths is left, down, up, right
		sprites : [spr_hurtnote_left, spr_hurtnote_down, spr_hurtnote_up, spr_hurtnote_right],
		hit_func : function(_note) { // Immediately kills the player
			obj_input_handler.modify_health(500, true)
		},
		miss_func : function(_note) { // Does nothing to the player
			show_debug_message("missed hurt note")
		},
		opp_func : function(_note) { // Makes the opponent just not hit the note
			show_debug_message("opp hit hurt note")
			return "strum"
		}
	}
	
}