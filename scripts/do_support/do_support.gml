function do_support(_mean, _sd)
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

		support = round(gauss(_mean, _sd));

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