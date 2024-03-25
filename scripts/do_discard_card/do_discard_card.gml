function do_discard_card(_null)
{
	global.active_card = noone;

	obj_game_controller.fsm.change("waiting_for_card_to_be_selected");
	
	if fsm.get_current_state() == "player_turn"
	{
		with(obj_player)
		{
			deck.discard_card(global.active_card);
			deck.deal_card();
		}
	}
}