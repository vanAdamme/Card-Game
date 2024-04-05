function create_mech_attachment(_attachment_type, _deck, _hp)
{
	var attachment = new Attachment();

	switch (_attachment_type.type)
	{
		case ATTACHMENT_TYPE.CORE:
			obj = obj_mech_core;
		break;

		case ATTACHMENT_TYPE.HEAD:
			obj = obj_mech_head;
		break;

		case ATTACHMENT_TYPE.LEFT_ARM:
			obj = obj_mech_left_arm;
		break;

		case ATTACHMENT_TYPE.RIGHT_ARM:
			obj = obj_mech_right_arm;
		break;

		case ATTACHMENT_TYPE.LEFT_LEG:
			obj = obj_mech_left_leg;
		break;

		case ATTACHMENT_TYPE.RIGHT_LEG:
			obj = obj_mech_right_leg;
		break;
	}

	for (var _i = 0; _i < array_length(_attachment_type.cards_in_attachment); _i++)
	{
		var _card_type = _attachment_type.cards_in_attachment[_i][0];
		var _card_amount = _attachment_type.cards_in_attachment[_i][1];

		repeat(_card_amount)
		{
			var _inst = instance_create_layer(0, 0, "Cards", obj,
			{
				data : new Card(_card_type, attachment),
			});

			attachment.add_card(_inst);
		}		
	}

	attachment.max_hp = _hp;
	attachment.current_hp = _hp;
	attachment.title = _attachment_type.title;
	attachment.mech_obj = _obj;

	attachment.add_to_deck(_deck);

	return attachment;
}