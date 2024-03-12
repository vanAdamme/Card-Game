if mouse_check_button_pressed(mb_left) && !empty(global.active_cards)
{
	do_support();
}

clear_array(global.active_cards);