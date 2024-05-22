hand_size = 5;
max_hp = 500;
current_hp = max_hp;

max_defence = 10000;
current_defence = 0;
defence_loss = 20;

max_actions = 3;
current_actions = max_actions;
action_refresh = 3;

money = 500;

//myItems = ds_grid_create(0, Item.Height);

with(obj_mech_controller) {
	other.inventory = [BasicCore, BasicHead, BasicLeftArm, BasicRightArm, BasicLeftLeg, BasicRightLeg];
}

/*
	core		= build_mech_attachment(obj_mech_controller.BasicCore);
	head		= build_mech_attachment(obj_mech_controller.BasicHead);
	left_arm	= build_mech_attachment(obj_mech_controller.BasicLeftArm);
	right_arm	= build_mech_attachment(obj_mech_controller.BasicRightArm);
	left_leg	= build_mech_attachment(obj_mech_controller.BasicLeftLeg);
	right_leg	= build_mech_attachment(obj_mech_controller.BasicRightLeg);

inventory = [core, head, left_arm, right_arm, left_leg, right_leg];
*/
