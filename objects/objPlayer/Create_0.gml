deck = new Deck();
deck = initialise_player_deck(deck, DECK_TYPE.BASIC);

hand_size = 5;
max_hp = 500;
current_hp = max_hp;

max_defence = 10000;
current_defence = 0;


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