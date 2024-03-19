function do_support()
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

		var _support_m = _card.support_val_m;
		var _support_sd = _card.support_val_sd;

		var _support = round(gauss(_support_m, _support_sd))

		{
			//heal amount is capped by max_hp
			_support = clamp(_support, 0, max_hp - current_hp);  

			current_hp += _support;
			current_actions -= _card.cost;
			deck.discard_card(_card);
		}
	}

	var _text = instance_create_layer(800, 280, "Text", objText);
	with (_text)
	{
		text = _card.title + " card: " + string(_support) + " healed!";
	}

	global.active_card = noone;
}