function do_defend(_actor, _enemy_card = noone)
{
	switch(_actor)
	{
		case "player":
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

					var _defence_m = _card.defend_val_m;
					var _defence_sd = _card.defend_val_sd;

					var _defence = round(gauss(_defence_m, _defence_sd));

					with (objPlayer)
					{
						current_defence = Approach(current_defence, max_defence, _defence);
						current_actions -= _card.cost;
						deck.discard_card(_card);
					}

					var _text = instance_create_layer(800, 180 + 50 * i, "Text", objText);
					with (_text)
					{
						text = _card.title + " card: " + string(_defence) + " defended!";
					}
				}
			
			clear_array(global.active_cards);
		break;

		case "enemy":
			var _defence_m = _enemy_card.defend_val_m;
			var _defence_sd = _enemy_card.defend_val_sd;

			var _defence = round(gauss(_defence_m, _defence_sd));

			with (objEnemy)
			{
				current_defence = Approach(current_defence, max_defence, _defence);
				current_actions -= _enemy_card.cost;
				deck.discard_card(_enemy_card);
			}

			var _text = instance_create_layer(800, 230, "Text", objText);
			with (_text)
			{
				text = _enemy_card.title + " card: " + string(_defence) + " defended!";
			}
		break;
	}
}