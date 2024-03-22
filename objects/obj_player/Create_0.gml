deck = create_player_deck(obj_game_controller.BasicDeck);
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

/*
attachment_slot = ds_map_create();
ds_map_add(attachment_slot, "Core", noone);
ds_map_add(attachment_slot, "Head", noone);
ds_map_add(attachment_slot, "Body", noone);
ds_map_add(attachment_slot, "Left Arm", noone);
ds_map_add(attachment_slot, "Right Arm", noone);
ds_map_add(attachment_slot, "Left Leg", noone);
ds_map_add(attachment_slot, "Right Leg", noone);