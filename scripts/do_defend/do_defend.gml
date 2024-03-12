function do_defend()
{
	for (var i = 0; i < array_length(global.active_cards); i++)
	{
		var _defend_amt;
		var _card = global.active_cards[i];
		_defend_amt = _card.defend_val;

		with (objPlayer)
		{
			current_defence = Approach(current_defence, max_defence, _defend_amt);
		}

		var _text = instance_create_layer(800, 180 + 50 * i, "Text", objText);
		with (_text)
		{
			text = _card.title + " card: " + string(_defend_amt) + " defended!";
		}

		objPlayer.deck.discard_card(_card);
	}
}