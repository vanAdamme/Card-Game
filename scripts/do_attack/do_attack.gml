function do_attack()
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
		var _card = global.active_cards[i];
		var _damage_m = _card.attack_val_m;
		var _damage_sd = _card.attack_val_sd;

		var _damage = round(gauss(_damage_m, _damage_sd));

		with (objEnemy)
		{
			hp = Approach(hp, 0, _damage);
		}

		var _text = instance_create_layer(800, 180 + 50 * i, "Text", objText);
		with (_text)
		{
			text = _card.title + " card: " + string(_damage) + " damage!";
		}

		with(objPlayer)
		{
			deck.discard_card(_card);
			current_actions -= _card.cost;
		}
	}

	if objEnemy.hp == 0 { show_message("You win!"); }
}