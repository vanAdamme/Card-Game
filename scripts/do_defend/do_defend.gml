function do_defend(_mean, _sd)
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

		defence = round(gauss(_mean, _sd));

		current_defence = Approach(current_defence, max_defence, defence);
		current_actions -= card.data.cost;
		card.data.current_xp++;
		deck.discard_card(card);

		var _text = instance_create_layer(800, 280, "Text", obj_text);

		with (_text)
		{
			text = other.card.data.title + " card: " + string(other.defence) + " defended!";
		}
	}

	global.active_card = noone;
}