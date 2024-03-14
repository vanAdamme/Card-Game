function do_support(_actor)
{
	switch(_actor)
	{
		case objPlayer:
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
				var _card = global.active_cards[i];
				var _support_amt = _card.support_val;

				with (objPlayer)
				{
					current_hp = Approach(current_hp, max_hp, _support_amt);
					current_actions -= _card.cost;
				}

				var _text = instance_create_layer(800, 180 + 50 * i, "Text", objText);
				with (_text)
				{
					text = _card.title + " card: " + string(_support_amt) + " healed!";
				}

				objPlayer.deck.discard_card(_card);
			}
			
			clear_array(global.active_cards);
		break;
	}
}