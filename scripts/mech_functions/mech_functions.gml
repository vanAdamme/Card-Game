function add_to_attachment_slot(_card)
{
	array_push(slot, _card);
}

function remove_from_mech(_attachment)
{
	instance_destroy(_attachment);
}