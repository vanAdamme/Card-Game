function do_defend()
{
	var _total_action_cost = 0;
	
	for (var i = 0; i < array_length(global.active_cards); i++)
	{
		_total_action_cost += global.active_cards[i].cost;
	}

	if _total_action_cost > objPlayer.current_actions
	{
		show_message("Not enough action points");
		exit;
	}

for (var i = 0; i < array_length(global.active_cards); i++)
	{
		var _defend_amt;
		var _card = global.active_cards[i];
		_defend_amt = _card.defend_val;

		with (objPlayer)
		{
			current_defence = Approach(current_defence, max_defence, _defend_amt);
			current_actions -= _card.cost;
			deck.discard_card(_card);
		}

		var _text = instance_create_layer(800, 180 + 50 * i, "Text", objText);
		with (_text)
		{
			text = _card.title + " card: " + string(_defend_amt) + " defended!";
		}

	}
}