if mouse_check_button_pressed(mb_left) && instance_exists(objPlayer) && !position_meeting(mouse_x, mouse_y, objCardParent)
{
	for (var i = 0; i < array_length(global.active_cards); i++)
	array_pop(global.active_cards);
}