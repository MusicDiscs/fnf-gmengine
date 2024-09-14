if audio_is_playing(global.menumusic) {audio_stop_sound(global.menumusic)}
editormusic = load_music("editorMusic")
audio_play_sound(editormusic, 0, true)

set_bpm(137)

curchar = "bf"
curanimnum = 0

chardata = undefined
animlist = []

character = instance_create_depth(300, 300, -1, obj_offset_char, {curchar : "bf", curanim : "idle", offsets : [0, 0]})

camx = 0
camy = 0
camzoom = 1

hotswapanim = 0

ghostsprite = spr_chr_bf_idle
ghostframe = 0
ghostx = 0
ghosty = 0
ghostalpha = 0
ghostscale = 1

function setup_char(_char) {
	var _finalchar = "bf"
	if struct_exists(global.characterdata, _char) {_finalchar = _char}
	var _chardata = struct_get(global.characterdata, _finalchar).animations
	curchar = _finalchar
	animlist = []
	var _templist = variable_struct_get_names(_chardata)
	for (var i = 0; i < array_length(_templist); i += 1) {
		sprite_prefetch(struct_get(_chardata, _templist[i]).path)
		var _animpath = struct_get(_chardata, _templist[i]).path
		var _animname = struct_get(_chardata, _templist[i]).name
		var _animoffsets = struct_get(_chardata, _templist[i]).offsets
		array_push(animlist, [_animname, _animoffsets, _animpath])
	}
	character.curchar = curchar
	character.scale = struct_get(global.characterdata, _finalchar).scale
	character.flip = struct_get(global.characterdata, _finalchar).flip_x
	character.curanim = animlist[0][0]
	character.offsets = animlist[0][1]
	character.curpath = animlist[0][2]
	curanimnum = 0
	show_debug_message(animlist)
}

function change_anim(_isup) {
	
	if _isup == true {
		if curanimnum == 0 {curanimnum = array_length(animlist) - 1}
		else {curanimnum--}
	}
	else {
		if curanimnum == array_length(animlist) - 1 {curanimnum = 0}
		else {curanimnum++}
	}
	
	character.curanim = animlist[curanimnum][0]
	character.offsets = animlist[curanimnum][1]
	character.curpath = animlist[curanimnum][2]
	
}

setup_char(curchar)