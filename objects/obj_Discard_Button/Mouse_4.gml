with(obj_player)
{
	//deck.discard_hand();
	if global.active_card != noone { deck.discard_card(global.active_card); }
}