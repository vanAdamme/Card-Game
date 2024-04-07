instance_create_layer(50, 0, "Controllers", UI);
instance_create_layer(100, 0, "Controllers", obj_mouse_controller);
instance_create_layer(150, 0, "Controllers", obj_deck_controller);
instance_create_layer(200, 0, "Controllers", obj_mech_controller);

initialise_game_states();

instance_create_layer(0, 0, "Player", obj_player);
instance_create_layer(870, 90, "Enemy", obj_enemy);

global.active_card = noone;

initialise_deck();
deal_hand();

instance_create_layer(150, 0, "GUI", obj_gui_controller);

//should make this a separate GUI_controller object
show_damage = false;

fsm.change("player_turn");

if game_get_speed(gamespeed_fps) != 60
{
    game_set_speed(60, gamespeed_fps);
}