function do_discard_card()
{
	if obj_game_controller.fsm.get_current_state() == "wait_for_player_input"
	{
		with(obj_player_controller)
		{
			discard_card(global.active_card);
			deal_card();
		}

	obj_game_controller.fsm.change("player_turn", undefined, function() {});
	}
	else
	{
		global.active_card = noone;
		obj_game_controller.fsm.change("do_discard_card_wait");
	}
}