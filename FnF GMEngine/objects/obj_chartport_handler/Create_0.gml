chartstate = 0
chart = {}
events = {}
finalevents = []
finalchart = []

function open_chart() {
	var _file = get_open_filename("Chart File|*.json", "")
	var _eventfile = get_open_filename("Event File|*.json", "")
	var _chart = ""
	var _chart_file = undefined
	var _event = ""
	var _event_file = undefined
	
	if _file != "" {_chart_file = file_text_open_read(_file)}
	else {exit}
	while(file_text_eof(_chart_file) == false) {_chart += file_text_readln(_chart_file)}
	file_text_close(_chart_file)
	chart =  json_parse(_chart)
	
	if _eventfile != "" {_event_file = file_text_open_read(_eventfile)}
	else {exit}
	while(file_text_eof(_event_file) == false) {_event += file_text_readln(_event_file)}
	file_text_close(_event_file)
	events =  json_parse(_event)
	
	chartstate = 1
}

function port_chart() {
var _isplayable = false
	
	#region Porting Notes
	for (var i = 0; i < array_length(chart.song.notes); i += 1) {
		_isplayable = chart.song.notes[i].mustHitSection
		var _event_time = 0
		if array_length(chart.song.notes[i].sectionNotes) > 0 {_event_time = chart.song.notes[i].sectionNotes[0][0]}
		finalevents[array_length(finalevents)] = { t: _event_time, e: "FocusCamera", v: { char: !_isplayable, ease: "CLASSIC" } }
		for (var j = 0; j < array_length(chart.song.notes[i].sectionNotes); j += 1) {
			var _finaltime = chart.song.notes[i].sectionNotes[j][0]
			var _finaldir = 0
			if _isplayable == true {_finaldir = chart.song.notes[i].sectionNotes[j][1]}
			else {
				if chart.song.notes[i].sectionNotes[j][1] > 3 {_finaldir = chart.song.notes[i].sectionNotes[j][1] - 4}
				else {_finaldir = chart.song.notes[i].sectionNotes[j][1] +	4}
			}
			var _finaltail = chart.song.notes[i].sectionNotes[j][2]
			finalchart[array_length(finalchart)] = {d : _finaldir, t : _finaltime, l : _finaltail}
		}
	}
	#endregion
	
	#region Porting Events
	for (var i = 0; i < array_length(events.song.events); i += 1) {
		var _event_time = events.song.events[i][0]
		for (var j = 0; j < array_length(events.song.events[i][1]); j += 1) {
			var _event_name = string_replace(events.song.events[i][1][j][0], " ", "")
			var _event_vars = {}
			switch _event_name {
			
				case "FocusCamera" :
				_event_vars = {}
				break;
				
				case "PlayAnimation" :
				_event_vars = {target : string_lower(events.song.events[i][1][j][2]), anim : events.song.events[i][1][j][1]}
				break;
				
				case "ZoomCamera" :
				_event_vars = {}
				break;
				
				case "ChangeCharacter" :
				_event_vars = {target : string_lower(events.song.events[i][1][j][1]), character : events.song.events[i][1][j][2]}
				break;
				
				case "SetCameraBop" :
				_event_vars = {}
				break;
			}
			finalevents[array_length(finalevents)] = { t: _event_time, e: _event_name, v: _event_vars }
		}
	}
	#endregion
	
	chartstate = 2
	
	
}
	
function save_chart() {

	var _finalchart = {
		events : finalevents,
		notes : {
			hard : finalchart	
		},
		version : "0.0.1",
		generatedBy : "Psych to GMEngine Porter",
		scrollSpeed : {
			hard : chart.song.speed
		}
	}
	var _savechart = json_stringify(_finalchart, true)
	var _savepath = get_save_filename("chart_file|*.json", chart.song.song)
	var _file = file_text_open_write(_savepath);
	file_text_write_string(_file, _savechart);
	file_text_close(_file);
}