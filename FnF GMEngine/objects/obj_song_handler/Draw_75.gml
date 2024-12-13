if global.paused = true and pausemenu.focuspause == false {draw_surface(pausemenu.pause_surface, 0, 0)}
draw_set_alpha(deathalpha)
draw_rectangle_color(0, 0, 1280, 720, c_black, c_black, c_black, c_black, false)
draw_set_alpha(1)