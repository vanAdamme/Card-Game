function corrode_armour(_mean, _sd)
{
	if _sd == 0	{ var _amount  = _mean; }
	else		{ var _amount = round(gauss(_mean, _sd)); }

	objPlayer.defence_loss += _amount;
}