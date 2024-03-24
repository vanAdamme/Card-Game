function CardType(_title, _face = spr_player_card_face, _back = spr_player_card_back, _cost = 1, _xp_to_level = 3, _attachment = ATTACHMENT_TYPE.CORE, _text = "", _functions) constructor
{
	data = array_create(argument_count);

	for (var _i = 0; _i < argument_count; _i++)
	{
		data[_i] = argument[_i];
	}
}

function Card(card_type) constructor
{
	title			= card_type.data[0];
	face			= card_type.data[1];
	back			= card_type.data[2];
	cost			= card_type.data[3];
	xp_to_level		= card_type.data[4];
	attachment		= card_type.data[5];
	text			= card_type.data[6];
	functions		= card_type.data[7];
	current_xp		= 0;
	level			= 1;
}

/*
function Card(card_type) constructor
{
	title			= card_type.data[0];
	face			= card_type.data[1];
	back			= card_type.data[2];
	attack_val_m	= card_type.data[3, 0];
	attack_val_sd	= card_type.data[3, 1];
	defend_val_m	= card_type.data[4, 0];
	defend_val_sd	= card_type.data[4, 1];
	support_val_m	= card_type.data[5, 0];
	support_val_sd	= card_type.data[5, 1];
	cost			= card_type.data[6];
	xp_to_level		= card_type.data[7];
	attachment		= card_type.data[8];
	text			= card_type.data[9];
	current_xp		= 0;
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
