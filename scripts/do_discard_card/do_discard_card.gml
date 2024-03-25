function do_discard_card()
{
	if obj_game_controller.fsm.get_current_state() == "do_discard_card_selected"
	{
		with(obj_player)
		{
			deck.discard_card(global.active_card);
			deck.deal_card();
		}

	obj_game_controller.fsm.change("player_turn", undefined, function() {});
	}
	else
	{
		global.active_card = noone;
		obj_game_controller.fsm.change("do_discard_card_wait");
	}
}