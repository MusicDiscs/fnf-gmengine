if(async_load[?"id"] == login)
{
		var user = async_load[?"username"]
		var token = async_load[?"password"]
		GameJolt_User_LogIn(user,token,
						function()
						{
							show_debug_message("Logged in!")
							gamejolt_post_login()
							bgcolor = c_green
							audio_play_sound(global.confirmsound, 1, false)
						},
						function(message)
						{
							audio_play_sound(global.cancelsound, 1, false)
							show_debug_message("Failed to log in.")
						}
					)
}