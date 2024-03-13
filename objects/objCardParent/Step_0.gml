//checks for a double-click with the left mouse button and a quarter-second delay
if mouse_check_doubleclick(mb_left, DOUBLE_CLICK_DELAY) && position_meeting(mouse_x, mouse_y, id) && clickable
{
	if card_on_top() { flip_card(); }
}

if discarding
{
	if x == objDiscardGoesHere.x && y == objDiscardGoesHere.y
	{
		discarding = false;
		shift_depth(id);
	}
	else
	{
		var dx = objDiscardGoesHere.x - x;
		var dy = objDiscardGoesHere.y - y;
		if (abs(dx) != 0)
		{
		  x += min(abs(dx), room_speed) * sign(dx);
		}
		if (abs(dy) != 0)
		{
		  y += min(abs(dy), room_speed) * sign(dy);
		}
	}
}