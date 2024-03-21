function do_attack()
{
	if global.active_card == noone { exit; }
	else { var _card = global.active_card; }

	with (objPlayer)
	{
		if _card.values.cost > current_actions
		{
			show_message("Not enough action points");
			exit;
		}

		var _damage_m = _card.values.attack_val_m;
		var _damage_sd = _card.values.attack_val_sd;

		var _damage = round(gauss(_damage_m, _damage_sd));

		current_actions -= _card.values.cost;
		_card.values.current_xp++;
		deck.discard_card(_card);
}

	harm_enemy(_damage);

	var _text = instance_create_layer(800, 280, "Text", objText);
	with (_text)
	{
		text = _card.values.title + " card: " + string(_damage) + " damage!";
	}

	if objEnemy.current_hp == 0 { show_message("You win!"); }

	global.active_card = noone;
}