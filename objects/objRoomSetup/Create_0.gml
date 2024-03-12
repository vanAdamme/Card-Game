instance_create_layer(30, 640, "Background_GUI", objDeckGoesHere);

for (var i = 0; i < 5; i++)
{
	instance_create_layer(318 + i * 256, 640, "Background_GUI", objPlayerCardSpot);
}

instance_create_layer(1630, 640, "Background_GUI", objDiscardGoesHere);