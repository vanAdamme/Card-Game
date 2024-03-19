function gauss(m, sd) //mean, standard deviation
{
	var x1, x2, w;
	do
	{
		x1 = random(2) - 1;
		x2 = random(2) - 1;
		w = x1 * x1 + x2 * x2;
	}
	until (0 < w && w < 1)

	w = sqrt(-2 * ln(w) / w);
	return m + sd * x1 * w;
}

/// Approach(a, b, amount)
// Moves "a" towards "b" by "amount" and returns the result
// Nice bcause it will not overshoot "b", and works in both directions
// Examples:
//      speed = Approach(speed, max_speed, acceleration);
//      hp = Approach(hp, 0, damage_amount);
//      hp = Approach(hp, max_hp, heal_amount);
//      x = Approach(x, target_x, move_speed);
//      y = Approach(y, target_y, move_speed);
 function Approach(a, b, amount)
{
	if a < b
	{
	    a += amount;
	    if a > b
		{
	        return b;
		}
	}
	else
	{
	    a -= amount;
	    if a < b
		{
	        return b;
		}
	}
	return a;
}

// Returns true or false depending on RNG
// ex: 
//      Chance(0.7);    -> Returns true 70% of the time
 function Chance(percent)
 {
	return percent > random(1);
 }
 
 //map a value from one range to another
function map_value(_value, _current_lower_bound, _current_upper_bound, _desired_lowered_bound, _desired_upper_bound)
{
    return (((_value - _current_lower_bound) / (_current_upper_bound - _current_lower_bound)) * (_desired_upper_bound - _desired_lowered_bound)) + _desired_lowered_bound;
}