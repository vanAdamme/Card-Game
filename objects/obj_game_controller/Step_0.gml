/////move to mouse_controller?

if mouse_check_button_pressed(mb_left) && !position_meeting(mouse_x, mouse_y, obj_card_parent)
{
	global.active_card = noone;
}