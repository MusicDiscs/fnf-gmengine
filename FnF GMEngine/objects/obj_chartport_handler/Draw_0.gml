switch chartstate {

	case 0:
	draw_text(5, 5, "Press ENTER to import chart.")
	break;
	
	case 1:
	draw_text(5, 5, string(chart))
	draw_text(5, 20, string(events))
	break;
	
	case 2:
	for (var i = 0; i < array_length(finalchart); i += 1) {
		draw_text(5, 5 + (15*i), string(finalchart[i]))
	}
	for (var i = 0; i < array_length(finalevents); i += 1) {
		draw_text(400, 5 + (15*i), string(finalevents[i]))
	}
	break;
	
}