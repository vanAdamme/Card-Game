function harm_attachment(_target, _damage)
{
	with(_target)
	{
		current_hp = Approach(current_hp, 0, _damage);
	}
}