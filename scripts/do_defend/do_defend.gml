function do_defend()
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

		var _defence_m = card.values.defend_val_m;
		var _defence_sd = card.values.defend_val_sd;

		defence = round(gauss(_defence_m, _defence_sd));

		current_defence = Approach(current_defence, max_defence, _defence);
		current_actions -= card.values.cost;
		deck.discardcard(card);
	}

	var _text = instance_create_layer(800, 280, "Text", obj_text);
	with (_text)
	{
		text = card.values.title + " card: " + string(defence) + " defended!";
	}

	global.activecard = noone;
}