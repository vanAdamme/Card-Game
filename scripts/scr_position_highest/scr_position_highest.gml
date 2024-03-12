function scr_position_highest()
{
	var _highest = 16000;
	var _clicked_thing = noone;
	
	if position_meeting(mouse_x, mouse_y, id) && (depth < _highest)
	{
	        _highest = depth;
			_clicked_thing = id;
	}

	return _clicked_thing;
}