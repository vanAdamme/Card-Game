function set_active_card(_bool)
{
	if _bool	{ global.active_card = id; }
	else		{ global.active_card = noone; }
}