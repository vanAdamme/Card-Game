function set_active_card(_bool)
{
	if _bool { array_push(global.active_cards, id); }
	else
	{ 
		for (var i = 0; i < array_length(global.active_cards); i++)
		{
			if global.active_cards[i] == id
			{
				array_delete(global.active_cards, i, 1);
			}
		}
	}
}