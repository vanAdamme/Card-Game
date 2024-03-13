function do_empty_deal_pile()
{
	var _discards = objPlayer.deck.discard_pile;
	var _deal_pile = objPlayer.deck.deal_pile;
	
	shuffle(_discards);

	for (var i = 0; i < array_length(_discards); i++)
	{
		var _card = _discards[i];
		array_push(_deal_pile, _card);
	}
	clear_array(_discards);
}