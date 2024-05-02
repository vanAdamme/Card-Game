function AttachmentType(_title, _object, _type, _inv_sprite, _hp, _price, _description) constructor
{
	title = _title;
	object = _object;
	type = _type;
	inv_sprite = _inv_sprite;
	hp = _hp;
	price = _price;
	description = _description;
	
	stdParameters = 7;

	cards_in_attachment = array_create(argument_count - stdParameters);

	for (var _i = 0; _i < argument_count - stdParameters; _i++)
	{
		cards_in_attachment[_i] = [argument[_i + stdParameters][0], argument[_i + stdParameters][1]];
	}

	switch (type)
	{
		case MECH_PART.CORE:
			x_pos = obj_mech_core_placement.x;
			y_pos = obj_mech_core_placement.y;
		break;

		case MECH_PART.HEAD:
			x_pos = obj_mech_head_placement.x;
			y_pos = obj_mech_head_placement.y;
		break;

		case MECH_PART.LEFT_ARM:
			x_pos = obj_mech_left_arm_placement.x;
			y_pos = obj_mech_left_arm_placement.y;
		break;

		case MECH_PART.RIGHT_ARM:
			x_pos = obj_mech_right_arm_placement.x;
			y_pos = obj_mech_right_arm_placement.y;
		break;

		case MECH_PART.LEFT_LEG:
			x_pos = obj_mech_left_leg_placement.x;
			y_pos = obj_mech_left_leg_placement.y;
		break;

		case MECH_PART.RIGHT_LEG:
			x_pos = obj_mech_right_leg_placement.x;
			y_pos = obj_mech_right_leg_placement.y;
		break;
	}
}