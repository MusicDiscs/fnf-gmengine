draw_set_font(fnt_statbar)
draw_set_color(c_black)

draw_set_halign(fa_right)
draw_text(1275, 5, "Camera XPos - " + string(camx))
draw_text(1275, 20, "Camera YPos - " + string(camy))
draw_text(1275, 35, "Camera Zoom - " + string(camzoom))
draw_text(1275, 50, "Press C to change character.")
draw_text(1275, 65, "Press W and S to change animations.")
draw_text(1275, 80, "Press arrow keys to move offsets.")
draw_text(1275, 95, "Press Q and E to change zoom.")
draw_text(1275, 110, "Press IJKL to move camera.")
draw_text(1275, 125, "Press G to create ghost.")
draw_text(1275, 140, "Press H to remove ghost.")
draw_text(1275, 155, "Press SPACE to quickswap to idle.")
draw_text(1275, 170, "Press CONTROL to swap to previous animation after quickswap.")

draw_set_halign(fa_left)
draw_text(5, 5, "-ANIMATIONS-")
for (var i = 0; i < array_length(animlist); i += 1) {
		if i == curanimnum {draw_set_alpha(1)}
		else {draw_set_alpha(0.5)}
		draw_text(5, 25 + (20 * i), animlist[i][0] + " - " + string(animlist[i][1]))
}
draw_set_alpha(1)
draw_set_font(-1)
draw_set_color(c_white)