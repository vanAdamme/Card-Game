function use_card(_card = global.active_card)
{
	if _card == noone { exit; }

	with(obj_player)
	{
		if _card.data.cost > current_actions
		{
			show_message("Not enough action points");
			exit;
		}

		current_actions -= _card.data.cost;

		if !is_array(_card.data.functions)
		{
			script_execute_ext(_card.data.functions);
		}
		else
		{
			script_execute_ext(_card.data.functions[0], _card.data.functions[1]);
		}

		_card.data.current_xp++;
		deck.discard_card(_card);
}


//this will handle what screen-text is displayed for each card
	//var _text = instance_create_layer(800, 280, "Text", obj_text);

	//with (_text)
	//{
	//	text = other.card.data.title + " card: " + string(other.defence) + " defended!";
	//}

	global.active_card = noone;
}