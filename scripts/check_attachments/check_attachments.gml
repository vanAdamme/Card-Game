function check_attachments()
{
	with(obj_mech_parent)
	{
		if current_hp <= 0
		{
			instance_destroy();
		}
	}
}