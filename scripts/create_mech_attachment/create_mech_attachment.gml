function create_mech_attachment(_attachment_type, _hp)
{
	for (var _i = 0; _i < array_length(_attachment_type.cards_in_attachment); _i++)
	{
		var _card_type = _attachment_type.cards_in_attachment[_i][0];
		var _card_amount = _attachment_type.cards_in_attachment[_i][1];

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

			switch (_attachment_type.type)
			{
				case ATTACHMENT_TYPE.CORE:
					array_push(obj_mech_core.slot, _inst);
					obj = obj_mech_core;
				break;

				case ATTACHMENT_TYPE.HEAD:
					array_push(obj_mech_head.slot, _inst);
					obj = obj_mech_head;
				break;

				case ATTACHMENT_TYPE.LEFT_ARM:
					array_push(obj_mech_left_arm.slot, _inst);
					obj = obj_mech_left_arm;
				break;

				case ATTACHMENT_TYPE.RIGHT_ARM:
					array_push(obj_mech_right_arm.slot, _inst);
					obj = obj_mech_right_arm;
				break;

				case ATTACHMENT_TYPE.LEFT_LEG:
					array_push(obj_mech_left_leg.slot, _inst);
					obj = obj_mech_left_leg;
				break;

				case ATTACHMENT_TYPE.RIGHT_LEG:
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
		title = _attachment_type.title;
		array_for_each(slot, add_to_deck);
	}

	return obj;
}