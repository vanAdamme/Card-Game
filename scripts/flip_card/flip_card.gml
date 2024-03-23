function flip_card()
{
	if sprite_index == data.face { sprite_index = data.back; }
	else { sprite_index = data.face; }
}