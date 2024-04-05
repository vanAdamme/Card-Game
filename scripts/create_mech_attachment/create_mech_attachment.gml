function create_mech_attachment(_attachment_type, _deck, _obj)
{
	var attachment = new Attachment(_attachment_type);

	instance_create_layer(0, 0, "Mech", _obj,
	{
		data : attachment,
	});

	attachment.add_to_deck(_deck);

	return attachment;
}