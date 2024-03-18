function do_support(_actor, _enemy_card = noone)
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
				var _support_m = _card.support_val_m;
				var _support_sd = _card.support_val_sd;

				var _support = round(gauss(_support_m, _support_sd));

				with (objPlayer)
				{
					current_hp = Approach(current_hp, max_hp, _support);
					current_actions -= _card.cost;
				}

				var _text = instance_create_layer(800, 180 + 50 * i, "Text", objText);
				with (_text)
				{
					text = _card.title + " card: " + string(_support) + " healed!";
				}

				objPlayer.deck.discard_card(_card);
			}
			
			clear_array(global.active_cards);
		break;
		
		case "enemy":
				var _support_m = _enemy_card.support_val_m;
				var _support_sd = _enemy_card.support_val_sd;

				var _support = round(gauss(_support_m, _support_sd));

				with (objEnemy)
				{
					current_hp = Approach(current_hp, max_hp, _support);
					current_actions -= _enemy_card.cost;
					deck.discard_card(_enemy_card);
				}

				var _text = instance_create_layer(800, 230, "Text", objText);
				with (_text)
				{
					text = _enemy_card.title + " card: " + string(_support) + " healed!";
				}
		break;
	}
}