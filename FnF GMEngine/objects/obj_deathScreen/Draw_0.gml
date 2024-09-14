draw_sprite_ext(spr_menu_bg, 0, 0, 0, 1, 1, 0, c_maroon, 1)

draw_text(5, 700, "Press CONFIRM to retry.")
draw_text(5, 680, "Press CANCEL to return to menu.")
draw_text(5, 660, "Song Name - " + meta.songName)
draw_text(5, 640, "Song Difficulty - " + info[1])
draw_text(5, 620, "Completed " + string(percentstring) + "%")