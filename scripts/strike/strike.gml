function strike(_mean, _sd = 0)
{
	if _sd == 0	{ damage  = _mean; }
	else		{ damage = round(gauss(_mean, _sd)); }

	with(obj_player)
	{
		var _target = choose(core, head, left_arm, right_arm, left_leg, right_leg);
		
	}

	harm_attachment(_target, damage);
	var _text = "Enemy strikes at " + _target.title + " for " + string(damage) + " damage!";
	show_message(_text);
}