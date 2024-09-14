function gamejolt_post_login() {
	GameJolt_User_FetchMe(
	function(_userData)
	{
		global.gjuserdata = _userData
		sprite = sprite_add(global.gjuserdata.avatar_url, 0, 0, 0, 0, 0);
		show_debug_message(string(global.gjuserdata))
		gamejolt_heartbeat()
	},
	function(message)
	{
		show_message_async(message)
	});
}

function gamejolt_heartbeat() {
	gamejolt_grab_profile()
}

function gamejolt_grab_profile() {
	GameJolt_DataStorage_Fetch_Global(global.gjuserdata.username + "_profile",
	function(data) {
		var _iconserver = data;
		show_debug_message(_iconserver); 
		global.gjuserdata.profile = _iconserver
	},
	function(message) {
		global.gjuserdata.profile = "test"
		GameJolt_DataStorage_Set_Global(global.gjuserdata.username + "_profile", global.gjuserdata.profile)
	});
}
	
global.gjscoretable_song = [
	["tutorial", "929584"],
	["bopeebo", "929536"],
	["fresh", "929537"],
	["dadbattle", "929538"],
	["spookeez", "929554"],
	["south", "929555"],
	["monster", "929556"],
	["pico", "929557"],
	["philly-nice", "929558"],
	["blammed", "929559"],
	["satin-panties", "929562"],
	["high", "929563"],
	["milf", "929564"],
	["cocoa", "929566"],
	["eggnog", "929567"],
	["winter-horrorland", "929568"],
	["senpai", "929570"],
	["roses", "929571"],
	["thorns", "929572"],
	["ugh", "929574"],
	["guns", "929575"],
	["stress", "929576"],
	["darnell", "929578"],
	["lit-up", "929579"],
	["2hot", "929580"],
	["blazin", "929581"],
]

global.gjscoretable_week = [
	["week1", "929539"],
	["week2", "929560"],
	["week3", "929561"],
	["week4", "929565"],
	["week5", "929569"],
	["week6", "929573"],
	["week7", "929577"],
	["weekend1", "929582"],
	["tutorial", "929585"],
]