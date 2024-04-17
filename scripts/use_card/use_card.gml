function use_card(_card = global.active_card)
{
	if _card == noone { exit; }

	with(obj_player)
	{
		if _card.cost > current_actions
		{
			show_message("Not enough action points");
			exit;
		}

		if _card.disabled
		{
			show_message("Card disabled.");
			exit;
		}

		current_actions -= _card.cost;

		if !is_array(_card.functions)
		{
			script_execute_ext(_card.functions);
		}
		else
		{
			script_execute_ext(_card.functions[0], _card.functions[1]);
		}

		_card.current_xp++;
		discard_card(_card);
}

//this will handle what screen-text is displayed for each card
	//var _text = instance_create_layer(800, 280, "Text", obj_text);

	//with (_text)
	//{
	//	text = other.card.title + " card: " + string(other.defence) + " defended!";
	//}

	global.active_card = noone;
}