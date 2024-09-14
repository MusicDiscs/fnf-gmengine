function get_judgement(_ms) {
	
	ui_notehit()
	
	//timecheck = _ms
	if _ms < 0 {_ms = abs(_ms)}
	
	if (_ms <= 45.0) {return 3}
	else if (_ms <= 90.0) {return 2}
	else if (_ms <= 135.0) {return 1}
	else {return 0}
	
}
	
function create_animated_stagesprite(_sprite, _x, _y, _isbeatbounce, _gfbounce) {

	return instance_create_depth(_x, _y, -1, obj_AnimatedStageSprite, {cursprite : _sprite, isbeatbounce : _isbeatbounce, gfbounce : _gfbounce})
	
}
	
function get_parallax_coords(_isy, _val, _pval) {
	var _cam = view_camera[view_current]
	if _isy == false {
		var _camx = camera_get_view_x(_cam) - ((1280 - camera_get_view_width(_cam)) / 2)
		//var _center = (obj_song_handler.curcamx + (1280/2))
		//var _camx = _center - (camera_get_view_width(view_camera[view_current]) / 2)
		var _parra = _camx*_pval
		return _parra + _val
	}
	else {
		var _camy = camera_get_view_y(view_camera[view_current]) - ((720 - camera_get_view_height(_cam)) / 2)
		//var _center = (obj_song_handler.curcamy + (720/2))
		//var _camy = _center - (camera_get_view_height(view_camera[view_current]) / 2)
		var _parra = _camy*_pval
		return _parra + _val
	}	
}