var _video = video_draw()

if _video[0] == 0 {
video_set_volume(global.clientprefs.gameplay.volume)
draw_surface(_video[1], 0, 0)
}
else {ready = true}