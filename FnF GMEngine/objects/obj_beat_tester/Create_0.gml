audio_stop_sound(global.menumusic)
music = audio_create_stream("assets\\songs\\darnell\\Inst.ogg")
audio_play_sound(music, 0, true)
set_bpm(155, [4, 4])