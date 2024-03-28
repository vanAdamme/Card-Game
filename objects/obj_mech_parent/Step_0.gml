//checks for a double-click with the left mouse button and a quarter-second delay
if mouse_check_doubleclick(mb_left, DOUBLE_CLICK_DELAY) && position_meeting(mouse_x, mouse_y, id) && clickable
{
	display_attachment_info(id);
}