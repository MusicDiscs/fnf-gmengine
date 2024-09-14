deathmusic = load_music("lossTheme")
switch global.lastchar {
	
	case "bf_pixel" :
	deathmusic = load_music("lossTheme_pixel")
	break;
	
	case "pico_playable" :
	deathmusic = load_music("lossTheme_pico")
	break;
	
}
musicplay = audio_play_sound(deathmusic, 0, true)

info = global.deathinfo
meta = load_song_metadata(info[0], info[1])

percentstring = (info[2]/info[3]) * 100