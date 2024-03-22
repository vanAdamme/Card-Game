function harm_player(_damage)
{
	var damage = _damage;

	with (obj_player)
	{
		if current_defence >= damage
		{
			current_defence -= damage;
			damage = 0;
		}
		else
		{
			damage -= current_defence;
			current_defence = 0;
		}

		current_hp = Approach(current_hp, 0, damage);
	}
}