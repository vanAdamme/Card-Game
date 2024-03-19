instance_create_layer(0, 0, "Controllers", objRoom_Controller);
instance_create_layer(100, 0, "Controllers", UI);
instance_create_layer(50, 0, "Controllers", objMouse_Controller);
	
init_state_machine();

instance_create_layer(0, 0, "Player", objPlayer);
instance_create_layer(870, 390, "Enemy", objEnemy);

global.active_card = noone;

with(objPlayer)
{
	deck.deal(hand_size);
}

instance_create_layer(150, 0, "GUI", objGUI_Controller);

//should make this a separate GUI_controller object
show_damage = false;

fsm.change("player_turn");