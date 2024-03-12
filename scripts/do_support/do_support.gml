function do_support()
{
	for (var i = 0; i < array_length(global.active_cards); i++)
	{
		var _card = global.active_cards[i];
		var _support_amt = _card.support_val;

		with (objPlayer)
		{
			current_hp = Approach(current_hp, max_hp, _support_amt);
		}

		var _text = instance_create_layer(800, 180 + 50 * i, "Text", objText);
		with (_text)
		{
			text = _card.title + " card: " + string(_support_amt) + " healed!";
		}

		objPlayer.deck.discard_card(_card);
	}
}