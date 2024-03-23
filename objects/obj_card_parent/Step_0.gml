//checks for a double-click with the left mouse button and a quarter-second delay
if mouse_check_doubleclick(mb_left, DOUBLE_CLICK_DELAY) && position_meeting(mouse_x, mouse_y, id) && clickable
{
	if card_on_top() { flip_card(); }
}

/*
with(data)
{
	if current_xp == xp_to_level
	{
		current_xp = 0;
		xp_to_level++;
		level++;
		attack_val_m += 10;
		defend_val_m += 10;
		support_val_m += 10;
	}
}