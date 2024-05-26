if instance_exists(obj_game_controller) { exit; }

instance_create_layer(0, 0, "Controllers", obj_game_controller);
	with(obj_game_controller) {
		initialise_game_states();
	}

instance_create_layer(0, 0, "Controllers", UI);
instance_create_layer(0, 0, "Controllers", obj_mouse_controller);
instance_create_layer(0, 0, "Controllers", obj_pubsub_controller);
instance_create_layer(0, 0, "Controllers", obj_deck_controller);
instance_create_layer(0, 0, "Controllers", obj_inventory_controller);
instance_create_layer(0, 0, "Controllers", obj_mech_controller);
instance_create_layer(0, 0, "Player", obj_player);
instance_create_layer(0, 0, "Mech", obj_mech);
	with(obj_mech) {
		assign_card_types();
		define_attachment_types();
	}

randomise();
define_constants();

instance_create_layer(870, 90, "Enemy", obj_enemy);

with(obj_deck_controller) {
	initialise_deck();
}

instance_create_layer(150, 0, "GUI", obj_gui_controller);

room_set_persistent(rm_battle, true);
set_game_speed(60);
obj_game_controller.fsm.change("player_turn");
room_goto(rm_mech_selection);
instance_destroy();