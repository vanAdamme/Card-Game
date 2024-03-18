player_card_spot_array = [];
enemy_card_spot_array = [];

player_deck_spot = instance_create_layer(80, 690, "Background_GUI", objDeckGoesHere);
enemy_deck_spot = instance_create_layer(80, 100, "Background_GUI", objDeckGoesHere);


for (var i = 0; i < 5; i++)
{
	player_card_spot_array[i] = instance_create_layer(368 + i * 256, 690, "Background_GUI", objCardSpot);
	enemy_card_spot_array[i] = instance_create_layer(368 + i * 256, 100, "Background_GUI", objCardSpot);
}

player_discard_spot = instance_create_layer(1680, 690, "Background_GUI", objDiscardGoesHere);
enemy_discard_spot = instance_create_layer(1680, 100, "Background_GUI", objDiscardGoesHere);