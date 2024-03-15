instance_create_layer(0, 0, "Controllers", objRoom_Controller);
instance_create_layer(50, 0, "Controllers", objMouse_Controller);
instance_create_layer(100, 0, "Controllers", UI);

init_state_machine();

instance_create_layer(0, 0, "Player", objPlayer);
instance_create_layer(608, 96, "Enemy", objEnemy);

with(objPlayer)
{
	deck.deal(hand_size);
}

with(objEnemy)
{
	deck.deal(hand_size);
}

instance_create_layer(150, 0, "GUI", objGUI_Controller);

//should make this a separate GUI_controller object
show_damage = false;
width = room_width;
height = room_height;

fsm.change("player_turn");