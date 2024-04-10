while !empty(slot)
{
	var _card = array_pop(slot);
	instance_destroy(_card);
}