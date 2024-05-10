function CardType(_title, _functions, _cost = 1, _xp_to_level = 3, _text = "", _face = spr_player_card_face, _back = spr_player_card_back) constructor
{
	data = array_create(argument_count);

	for (var _i = 0; _i < argument_count; _i++)
	{
		data[_i] = argument[_i];
	}
}

function Card(_card_type) constructor
{
	title			= _card_type.data[0];
	functions		= _card_type.data[1];
	cost			= _card_type.data[2];
	xp_to_level		= _card_type.data[3];
	text			= _card_type.data[4];
	face			= _card_type.data[5];
	back			= _card_type.data[6];
	card_obj		= noone;
	current_xp		= 0;
	level			= 1;
}