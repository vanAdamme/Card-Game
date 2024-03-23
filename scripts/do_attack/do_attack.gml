function do_attack()
{
	with (obj_player)
	{
		if global.active_card == noone { exit; }
		else { card = global.active_card; }

		if card.data.cost > current_actions
		{
			show_message("Not enough action points");
			exit;
		}

		var _damage_m = card.data.attack_val_m;
		var _damage_sd = card.data.attack_val_sd;

		damage = round(gauss(_damage_m, _damage_sd));

		current_actions -= card.data.cost;
		card.data.current_xp++;
		deck.discard_card(card);

		harm_enemy(damage);

		var _text = instance_create_layer(800, 280, "Text", obj_text);
		with (_text)
		{
			text = other.card.data.title + " card: " + string(other.damage) + " damage!";
		}
	}

	global.active_card = noone;
}