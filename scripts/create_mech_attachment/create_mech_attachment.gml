function create_mech_attachment(_mech_part, _hp)
{
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

			switch (_mech_part.type)
			{
				case MECH_PART.CORE:
					array_push(obj_mech_core.slot, _inst);
					obj = obj_mech_core;
				break;

				case MECH_PART.HEAD:
					array_push(obj_mech_head.slot, _inst);
					obj = obj_mech_head;
				break;

				case MECH_PART.LEFT_ARM:
					array_push(obj_mech_left_arm.slot, _inst);
					obj = obj_mech_left_arm;
				break;

				case MECH_PART.RIGHT_ARM:
					array_push(obj_mech_right_arm.slot, _inst);
					obj = obj_mech_right_arm;
				break;

				case MECH_PART.LEFT_LEG:
					array_push(obj_mech_left_leg.slot, _inst);
					obj = obj_mech_left_leg;
				break;

				case MECH_PART.RIGHT_LEG:
					array_push(obj_mech_right_leg.slot, _inst);
					obj = obj_mech_right_leg;
				break;
			}
		}
	}

	with(obj)
	{
		max_hp = _hp;
		current_hp = _hp;
		title = _mech_part.title;
		for (var _i = 0; _i < array_length(slot); _i++)
		{
			array_push(obj_deck_controller.cards, slot[_i]);
		}

	}

	return obj;
}