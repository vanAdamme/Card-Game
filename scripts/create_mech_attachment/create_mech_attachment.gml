function create_mech_attachment(_name, _title, _parent_object, _type, _inv_object, _hp, _price, _description) {
	_name = new AttachmentType(_title, _parent_object, _type, _inv_object, _hp, _price, _description);
	array_push(global.MasterList, _name);
}