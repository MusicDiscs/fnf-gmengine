if global.clientprefs.gameplay.hidehud == false {inputhandler.ui_draw()}

/*
// This is stupid
var _camera = camera_get_active()
camera_set_view_mat(_camera, matrix_build_lookat(640, 720, 300, 640, -100, 0, 0, 0, 1));
camera_set_proj_mat(_camera, matrix_build_projection_perspective_fov(-60, window_get_width()/window_get_height(), 1, 32000))
camera_apply(_camera)
*/

inputhandler.draw_notes()
//draw_text(5, 5, string(inputhandler.startspace))
//var _dt = delta_time / 1000000;
//draw_text(5, 20, string(inputhandler.startframe * _dt))
/*
draw_text(5, 5, classicpan)
draw_text(5, 20, curcamx)
draw_text(5, 35, camxtarget)
draw_text(5, 50, curcamy)
draw_text(5, 65, camytarget)
*/