function flip_card()
{
	if sprite_index == values.face { sprite_index = values.back; }
	else { sprite_index = values.face; }
}