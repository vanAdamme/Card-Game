while !empty(slot)
{
	var _card = array_pop(slot);
	with(_card)
	{
		instance_destroy();
	}
}