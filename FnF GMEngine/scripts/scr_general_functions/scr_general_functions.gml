function set_bpm(_bpm, _timesig = [4, 4], _beathit = true) {
	
	time_source_destroy(obj_persistent.beat_handler)
	global.bpm = _bpm
	global.timesig = _timesig
	global.curbeat = 0
	global.curmeasure = 0
	//obj_persistent.beat_timer = 0
	obj_persistent.beat_handler = time_source_create(time_source_game, time_bpm_to_seconds(global.bpm), time_source_units_seconds, function()
	{
	    beat_hit()
	}, [], -1);
	time_source_start(obj_persistent.beat_handler)
	if _beathit = true {beat_hit(false)}
}

function beat_hit(_increasebeat = true) {

	if _increasebeat == true {global.curbeat++}
	with (obj_song_handler) {handler_beat_hit()}
	with (obj_title_scene) {title_beat(global.curbeat)}
	with (obj_storymenu_handler) {story_menu_beat()}
	if global.curbeat % global.timesig[1] == 0 {
		//audio_play_sound(sfx_measure, 1, false)
		global.curmeasure++
		global.ismeasure = true
		show_debug_message("beat " + string(global.curbeat) + " measure " + string(global.curmeasure))
	}
	else {
		//audio_play_sound(sfx_beat, 1, false)
		show_debug_message("beat " + string(global.curbeat))
	}
	
}

function load_music(_track) {

	var _path = working_directory + "\\assets\\music\\" + _track + ".ogg"
	if file_exists(_path) {return audio_create_stream(_path)}
	else {
		show_debug_message("Audio not loaded")
		return audio_create_stream(working_directory + "\\assets\\music\\titleBeta.ogg")
	}
	
}
	
function load_tex_group(_tex) {

	var _tex_array = texturegroup_get_textures(_tex);
	for (var i = 0; i < array_length(_tex_array); ++i;)
	{
		texture_prefetch(_tex_array[i]);
	}
	show_debug_message("Loaded texture group " + _tex)
}

function unload_tex_group(_tex) {

	var _tex_array = texturegroup_get_textures(_tex);
	for (var i = 0; i < array_length(_tex_array); ++i;)
	{
		texture_flush(_tex_array[i]);
	}
	show_debug_message("Unloaded texture group " + _tex)
}
	
function get_icon_sprite(_icon) {

	if asset_get_index("spr_icon_" + _icon) != -1 {return asset_get_index("spr_icon_" + _icon)}
	else {return spr_icon_test}
	
}
	
function start_song(_song, _diff, _tag = "", _inst_tag = "default") {
	
	global.storymode = false
	global.songplaylist = []
	audio_stop_sound(global.menumusic)
	global.cursong = _song
	global.curdiff = _diff
	global.curtag = _tag
	if _inst_tag == "default" {global.inst_tag = ""}
	else {global.inst_tag = _inst_tag}
	show_debug_message(_inst_tag)
	global.songplaylist = [_song]
	swap_state(rm_Playstate)
	
}

function start_week(_week, _diff, _inst_tag = "default") {
	
	global.storymode = true
	global.songplaylist = []
	global.weekscore = 0
	global.curweek = _week.fileName
	if _inst_tag == "default" {global.inst_tag = ""}
	else {global.inst_tag = _inst_tag}
	audio_stop_sound(global.menumusic)
	global.cursong = _week.songs[0][0]
	global.curdiff = _diff
	for (var i = 0; i < array_length(_week.songs); i += 1) {
	array_push(global.songplaylist, _week.songs[i][0])
	}
	swap_state(rm_Playstate)
	
}
	
function keybind_check_pressed(_keybind) {

	if struct_exists(global.clientprefs.keybinds, _keybind) {
		var _finalkeybind = struct_get(global.clientprefs.keybinds, _keybind)
		if keyboard_check_pressed(_finalkeybind[0]) {return true}
		else if keyboard_check_pressed(_finalkeybind[1]) {return true}
		else {return false}
	}
	else {return false}

}

function keybind_check(_keybind) {

	if struct_exists(global.clientprefs.keybinds, _keybind) {
		var _finalkeybind = struct_get(global.clientprefs.keybinds, _keybind)
		if keyboard_check(_finalkeybind[0]) {return true}
		else if keyboard_check(_finalkeybind[1]) {return true}
		else {return false}
	}
	else {return false}
	
}

function keybind_check_released(_keybind) {

	if struct_exists(global.clientprefs.keybinds, _keybind) {
		var _finalkeybind = struct_get(global.clientprefs.keybinds, _keybind)
		if keyboard_check_released(_finalkeybind[0]) {return true}
		else if keyboard_check_released(_finalkeybind[1]) {return true}
		else {return false}
	}
	else {return false}
	
}
	
function swap_state(_room, _type) {
	var  _finaltype = "fade"
	if !is_undefined(_type) {
		_finaltype = _type
	}
	global.swappingstate = true
	obj_persistent.transtype = _finaltype
	obj_persistent.room_to_swap = _room
}

function load_xml(path) {
	
	// Taken from https://gist.github.com/williammustaffa/f6b7e02a43f468d622eb3d7ae08a5324
	
	/**
	 * Reads a XML file and converts its content into a ds_map
	 *
	 * Example output:
	 * 
	 * <ds_map>{
	 *   type: "root",
	 *   content: "",
	 *   nodes: <ds_list>[
	 *     <ds_map>{
	 *       type: "tagname",
	 *       content: "",
	 *       nodes: <ds_list>[...]
	 *     },
	 *     ...
	 *   ]
	 * }
	 *
	 * @param {String} path xml path to read
	 * @returns {DS_MAP} ds_map representation of the xml
	 */
	
	var file = file_text_open_read(working_directory  + path);

	// Create rootnode
	var ds_root = ds_map_create();
	ds_map_set(ds_root, "type", "root");
	ds_map_set(ds_root, "content", "");
	ds_map_add_list(ds_root, "nodes", ds_list_create());

	// Modes:
	// 0 = Not reading tag definitions
	// 1 = Reading tag type name
	// 2 = Waiting for tag attribute
	// 3 = Reading tag attribute name
	// 4 = Waiting for attribute value start
	// 5 = Reading tag attribute value
	var str_temp = "";
	var attr_temp = "";
	var closure = false;
	var mode = 0;
	var ds_node = ds_root;

	while (!file_text_eof(file)) {
		var str_line = file_text_readln(file);

		//show_message(str_line);
		for (var pos = 1; pos <  string_length(str_line); pos++) {
			var char = string_char_at(str_line, pos);

			// Replace text newline to GMS compliant new line
			if (char == "\r" or char == "\n") {
				char = "#";
			}

			switch(mode) {
				// Reading  content
				case 0:
					// If we find a new tag
					if (char == "<") {
						// Add node content
						ds_map_set(ds_node, "content", ds_node[? "content"] + str_temp);
						str_temp = "";

						if (string_char_at(str_line, pos + 1) == "/") {
							closure = true;
							pos++;
						}

						if (!closure) {
							// If it's not closing the tag we create it
							var ds_new_node = ds_map_create();
							ds_map_set(ds_new_node, "type", "undefined");
							ds_map_set(ds_new_node, "content", "");
							ds_map_set(ds_new_node, "parent", ds_node);

							// Add linked lists
							ds_map_add_list(ds_new_node, "nodes", ds_list_create());

							// Add to parent nodes list
							var ds_node_list = ds_node[? "nodes"];
							ds_list_add(ds_node_list, ds_new_node);

							// Link added list item  to parent map for later cleanup
							ds_list_mark_as_map(ds_node_list, ds_list_size(ds_node_list) - 1);
							
							// Set current node as the new node as we are modifying it
							ds_node = ds_new_node;
						}

						// Initiate tag name reading
						mode = 1;
					} else {
						str_temp += char;
					}

					break;

				// Reading tag name
				case 1:
					if (string_lettersdigits(char) != "") {
						str_temp += char;
					} else {
						if (!closure) {
							ds_map_set(ds_node, "type", str_temp);
						}

						str_temp = "";
						mode = 2;
					}
					break;

				// Waiting to start reading tag attributes
				case 2:
					if (string_lettersdigits(char) != "") {
						mode = 3
					} else {
						// since we need to 
						break;
					}
				
				// Reading tag attribute name
				case 3:
				
					if (string_lettersdigits(char) != "")  {
						str_temp += char;
					} else {
						attr_temp = str_temp;
						str_temp = "";
						// If we find the equal sign, means we are going to read the tag value
						// mode 4 which will wait for value
						// mode 2 for waiting for next attribute
						mode = char == "=" ? 4 : 2;
					};
					break;

				// Wait to start reading tag attribute value 
				case 4:
					if (char == "\"") {
						mode = 5
					} else {
						mode = 2;
					};
					break;

				// Reading attribute value
				case 5:
					if (char != "\"")  {
						str_temp += char;
					} else {
						ds_map_set(ds_node, attr_temp, str_temp);
						attr_temp = "";
						str_temp = "";
						mode = 2;
					}

					break;
			}

			// If we are reading a tag and we find this character, it's a closure tag
			if (mode != 0 and char == "/") closure = true;

			if (char == ">") {
				// if we are closing the tag we go to upper scope
				if (closure) {
					// If has no text then delete content
					if (string_lettersdigits(ds_node[? "content"]) == "") {
						ds_map_delete(ds_node, "content");
					}

					ds_node = ds_node[? "parent"];
					closure = false;
				}

				// Reset tag
				mode = 0;
			}
		}
	}

	return ds_root;
}