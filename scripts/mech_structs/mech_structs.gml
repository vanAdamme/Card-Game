function AttachmentType(_title, _parent_object, _type, _inv_object, _hp, _price, _description) constructor
{
	title = _title;
	parent_object = _parent_object;
	type = _type;
	inv_object = _inv_object;
	hp = _hp;
	price = _price;
	description = _description;

	stdParameters = 7; //must equal number of variables above

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
			init_depth = obj_mech_core_placement.depth - 1;
		break;

		case MECH_PART.HEAD:
			x_pos = obj_mech_head_placement.x;
			y_pos = obj_mech_head_placement.y;
			init_depth = obj_mech_head_placement.depth - 1;
		break;

		case MECH_PART.LEFT_ARM:
			x_pos = obj_mech_left_arm_placement.x;
			y_pos = obj_mech_left_arm_placement.y;
			init_depth = obj_mech_left_arm_placement.depth - 1;
		break;

		case MECH_PART.RIGHT_ARM:
			x_pos = obj_mech_right_arm_placement.x;
			y_pos = obj_mech_right_arm_placement.y;
			init_depth = obj_mech_right_arm_placement.depth - 1;
		break;

		case MECH_PART.LEFT_LEG:
			x_pos = obj_mech_left_leg_placement.x;
			y_pos = obj_mech_left_leg_placement.y;
			init_depth = obj_mech_left_leg_placement.depth - 1;
		break;

		case MECH_PART.RIGHT_LEG:
			x_pos = obj_mech_right_leg_placement.x;
			y_pos = obj_mech_right_leg_placement.y;
			init_depth = obj_mech_right_leg_placement.depth - 1;
		break;
	}
}