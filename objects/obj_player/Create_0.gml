deck = new Deck();

core		= create_mech_attachment(obj_game_controller.Basic_Core, deck, 2);
head		= create_mech_attachment(obj_game_controller.Basic_Head, deck, 2);
left_arm	= create_mech_attachment(obj_game_controller.Basic_Left_Arm, deck, 1);
right_arm	= create_mech_attachment(obj_game_controller.Basic_Right_Arm, deck, 1);
left_leg	= create_mech_attachment(obj_game_controller.Basic_Left_Leg, deck, 1);
right_leg	= create_mech_attachment(obj_game_controller.Basic_Right_Leg, deck, 1);

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