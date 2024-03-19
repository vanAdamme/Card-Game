function strike(_mean, _sd = 0)
{
	if _sd == 0	{ var _amount  = _mean; }
	else		{ var _amount = round(gauss(_mean, _sd)); }

	harm_player(_amount );
}