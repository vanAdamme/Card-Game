function build_mech_attachment(_mech_part)
{
	if _mech_part == undefined exit;
	
	obj = instance_create_layer(_mech_part.x_pos, _mech_part.y_pos, "Mech", _mech_part.parent_object);

	for (var _i = 0; _i < array_length(_mech_part.cards_in_attachment); _i++)
	{
		var _card_type = _mech_part.cards_in_attachment[_i][0];
		var _card_amount = _mech_part.cards_in_attachment[_i][1];

		repeat(_card_amount)
		{
			var _inst = instance_create_layer(0, 0, "Cards", obj_player_card);
			with(_inst)
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

			array_push(obj.slot, _inst);
		}
	}

	with(obj)
	{
		title = _mech_part.title;
		type = _mech_part.type;
		inv_object = _mech_part.inv_object;
		parent_object = id;
		max_hp = _mech_part.hp;
		current_hp = max_hp;
		price = _mech_part.price;
		description = _mech_part.description;
		x = _mech_part.x_pos;
		y = _mech_part.y_pos;
		depth = _mech_part.init_depth;

		for (var _i = 0; _i < array_length(slot); _i++)
		{
			array_push(obj_deck_controller.cards, slot[_i]);
		}
	}

	return obj;
}