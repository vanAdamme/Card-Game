function use_card(_card)
{
	with(obj_player)
	{
		script_execute_ext(_card.data.functions[0], _card.data.functions[1]);
	}
}