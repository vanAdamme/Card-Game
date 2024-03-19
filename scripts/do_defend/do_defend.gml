function do_defend()
{
	if global.active_card == noone { exit; }
	else { var _card = global.active_card; }

	with (objPlayer)
	{
		if _card.cost > current_actions
		{
			show_message("Not enough action points");
			exit;
		}

		var _defence_m = _card.defend_val_m;
		var _defence_sd = _card.defend_val_sd;

		var _defence = round(gauss(_defence_m, _defence_sd));

		current_defence = Approach(current_defence, max_defence, _defence);
		current_actions -= _card.cost;
		deck.discard_card(_card);
	}

	var _text = instance_create_layer(800, 280, "Text", objText);
	with (_text)
	{
		text = _card.title + " card: " + string(_defence) + " defended!";
	}

	global.active_card = noone;
}