function do_support()
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

		var _support_m = card.data.support_val_m;
		var _support_sd = card.data.support_val_sd;

		support = round(gauss(_support_m, _support_sd))

		//heal amount is capped by max_hp
		support = clamp(support, 0, max_hp - current_hp);  

		current_hp += support;
		current_actions -= card.data.cost;
		card.data.current_xp++;		
		deck.discard_card(card);

		var _text = instance_create_layer(800, 280, "Text", obj_text);

		with (_text)
		{
			text = other.card.data.title + " card: " + string(other.support) + " healed!";
		}
	}

	global.active_card = noone;
}