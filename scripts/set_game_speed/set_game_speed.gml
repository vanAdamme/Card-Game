function set_game_speed(spd) {
	if game_get_speed(gamespeed_fps) != spd
	{
	    game_set_speed(spd, gamespeed_fps);
	}
}