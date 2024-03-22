function put_on_top(_object = id)
{
	var _lowest_depth = depth;
	with (obj_card_parent)
	{
		if instance_place(x, y, other) && depth < _lowest_depth
		{ 
			_lowest_depth = depth;
		}
	}
	_object.depth = _lowest_depth - 1;
}