draw_sprite_ext(spr_menu_bg, 0, 0, 0, 1, 1, 0, c_green, 1)

draw_text_scribble(640, 25, "[fnt_big][fa_center]" + "Debug Menu")
draw_text_scribble(640, 75, "[fnt_small][fa_center]" + "Press CONFIRM to enter character editor.")


draw_text(10, 700, "Built on " + date_datetime_string(GM_build_date))
draw_text(10, 675, "Opened on " + date_datetime_string(global.opendate))
draw_text(10, 650, "Built with Runtime " + string(GM_runtime_version))
draw_text(10, 625, "Build type - " + string(GM_build_type))
if global.debug == true {draw_text(10, 600, "Debug mode is ON")}