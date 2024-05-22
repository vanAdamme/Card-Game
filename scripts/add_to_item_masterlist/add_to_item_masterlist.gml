function add_to_item_masterlist(_mech_part)
{
		title = _mech_part.title;
		inv_object = _mech_part.inv_object;
		parent_object = noone;
		amount = 1;
		type = _mech_part.type;
		price = _mech_part.price;

		AddItem(global.AllItems, [_mech_part.title, _mech_part.inv_object, parent_object, amount, _mech_part.type, _mech_part.price]);
}