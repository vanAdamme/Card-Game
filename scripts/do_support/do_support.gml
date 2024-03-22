function dosupport()
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

		var _support_m = card.values.support_val_m;
		var _support_sd = card.values.support_val_sd;

		support = round(gauss(_support_m, _support_sd))

		{
			//heal amount is capped by max_hp
			support = clamp(support, 0, max_hp - current_hp);  

			current_hp += support;
			current_actions -= card.values.cost;
			deck.discardcard(card);
		}
	}

	var _text = instance_create_layer(800, 280, "Text", obj_text);
	with (_text)
	{
		text = card.values.title + " card: " + string(support) + " healed!";
	}

	global.activecard = noone;
}