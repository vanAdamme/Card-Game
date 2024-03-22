function do_attack()
{
	if global.activecard == noone { exit; }
	else { card = global.activecard; }

	with (obj_player)
	{
		if card.values.cost > current_actions
		{
			show_message("Not enough action points");
			exit;
		}

		var _damage_m = card.values.attack_val_m;
		var _damage_sd = card.values.attack_val_sd;

		 damage = round(gauss(_damage_m, _damage_sd));

		current_actions -= card.values.cost;
		card.values.current_xp++;
		deck.discardcard(card);
}

	harm_enemy(damage);

	var _text = instance_create_layer(800, 280, "Text", obj_text);
	with (_text)
	{
		text = card.values.title + " card: " + string(damage) + " damage!";
	}

	if obj_enemy.current_hp == 0 { show_message("You win!"); }

	global.activecard = noone;
}