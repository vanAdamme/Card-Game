deck = new Deck();

core		= create_mech_attachment(obj_game_controller.BasicCore,		deck,	 obj_mech_core);
head		= create_mech_attachment(obj_game_controller.BasicHead,		deck,	 obj_mech_head);
left_arm	= create_mech_attachment(obj_game_controller.BasicLeftArm,	deck,	 obj_mech_left_arm);
right_arm	= create_mech_attachment(obj_game_controller.BasicRightArm,	deck,	 obj_mech_right_arm);
left_leg	= create_mech_attachment(obj_game_controller.BasicLeftLeg,	deck,	 obj_mech_left_leg);
right_leg	= create_mech_attachment(obj_game_controller.BasicRightLeg,	deck,	 obj_mech_right_leg);

assign_mech_objs();

attachment_slots = [core, head, left_arm, right_arm, left_leg, right_leg];

with(obj_card_parent)
{
	layer = layer_get_id("Cards");
}

hand_size = 5;
max_hp = 500;
current_hp = max_hp;

max_defence = 10000;
current_defence = 0;
defence_loss = 20;

max_actions = 3;
current_actions = max_actions;
action_refresh = 3;