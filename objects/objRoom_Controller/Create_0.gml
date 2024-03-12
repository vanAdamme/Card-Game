card_spot_array = [];

instance_create_layer(80, 690, "Background_GUI", objDeckGoesHere);

for (var i = 0; i < 5; i++)
{
	_inst = instance_create_layer(368 + i * 256, 690, "Background_GUI", objPlayerCardSpot);
	array_push(card_spot_array, _inst);
}

instance_create_layer(1680, 690, "Background_GUI", objDiscardGoesHere);