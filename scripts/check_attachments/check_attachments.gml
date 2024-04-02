function check_attachments()
{
	var _size = array_length(attachment_slots);

	for (var _i = 0; _i < _size; _i++;)
	{
		var _attachment = attachment_slots[_i];

		if _attachment.current_hp <= 0
		{
			_attachment.remove_from_mech();
		}
	}
}