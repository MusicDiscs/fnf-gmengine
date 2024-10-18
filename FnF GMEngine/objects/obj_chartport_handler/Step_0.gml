switch chartstate {

	case 0:
	if keyboard_check_pressed(vk_enter) {open_chart()}
	break;
	
	case 1:
	if keyboard_check_pressed(vk_enter) {port_chart()}
	break;
	
	case 2:
	if keyboard_check_pressed(vk_enter) {save_chart()}
	break;
	
}