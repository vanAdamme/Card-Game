if mouse_check_button_pressed(mb_left) && !empty(global.active_cards)
{
	dam = do_attack(objEnemy);
}

clear_array(global.active_cards);