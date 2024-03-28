deck = new Deck();

core		= create_mech_attachment(obj_game_controller.Core, deck, 20);
head		= create_mech_attachment(obj_game_controller.Head, deck, 20);
left_arm	= create_mech_attachment(obj_game_controller.LeftArm, deck, 10);
right_arm	= create_mech_attachment(obj_game_controller.RightArm, deck, 10);
left_leg	= create_mech_attachment(obj_game_controller.LeftLeg, deck, 10);
right_leg	= create_mech_attachment(obj_game_controller.RightLeg, deck, 10);

assign_mech_objs();

attachment_slot = ds_map_create();

ds_map_add(attachment_slot, "Core", core);
ds_map_add(attachment_slot, "Head", head);
ds_map_add(attachment_slot, "Left Arm", left_arm);
ds_map_add(attachment_slot, "Right Arm", right_arm);
ds_map_add(attachment_slot, "Left Leg", left_leg);
ds_map_add(attachment_slot, "Right Leg", right_leg);

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