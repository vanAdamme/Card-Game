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

myItems = ds_grid_create(0, Item.Height);

//AddItem(myItems, ["Basic Core", obj_mech_basic_inv_core, obj_mech_basic_core, 6, MECH_PART.CORE, 20]);