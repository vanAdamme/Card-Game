function CardType(_title, _functions, _cost = 1, _xp_to_level = 3, _text = "", _face = spr_player_card_face, _back = spr_player_card_back) constructor
{
	data = array_create(argument_count);

	for (var _i = 0; _i < argument_count; _i++)
	{
		data[_i] = argument[_i];
	}
}

function Card(_card_type, _parent, _card_obj) constructor
{
	title			= _card_type.data[0];
	functions		= _card_type.data[1];
	cost			= _card_type.data[2];
	xp_to_level		= _card_type.data[3];
	text			= _card_type.data[4];
	face			= _card_type.data[5];
	back			= _card_type.data[6];
	parent			= _parent;
	card_obj		= _card_obj;
	current_xp		= 2;
	level			= 1;
}

/*
//if we only have player cards then we can merge these two structs
function Card(_title, _face, _back) constructor
{
	title		= _title;
	face		= _face;
	back		= _back;
}

function PlayerCard(_title, _face = spr_player_card_face, _back = spr_player_card_back, _attack_val = [1, 0], _defend_val = [1, 0], _support_val = [1, 0], _cost = 1, _xp_to_level = 3, _attachment = ATTACHMENT_TYPE.CORE, _text = "") : Card(_title, _face, _back) constructor
{
	attack_val	= _attack_val;
	defend_val	= _defend_val;
	support_val	= _support_val;
	cost		= _cost;
	xp_to_level	= _xp_to_level;
	level		= 1;
	attachment	= _attachment;
	text		= _text;
}
