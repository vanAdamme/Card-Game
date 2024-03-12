function do_attack()
{
	var _damage_m; //mean
	var _damage_sd; //standard deviation

	for (var i = 0; i < array_length(global.active_cards); i++)
	{
		var _card = global.active_cards[i];
		_damage_m = _card.attack_val_m;
		_damage_sd = _card.attack_val_sd;

		var _damage = round(gauss(_damage_m, _damage_sd));
		with (objEnemy)
		{
			hp = Approach(hp, 0, _damage);
		}

		var _text = instance_create_layer(800, 180 + 50 * i, "Text", objText);
		with (_text)
		{
			text = _card.title + " card: " + string(_damage) + " damage!";
		}

		objPlayer.deck.discard_card(_card);
	}
	
	if objEnemy.hp == 0 { show_message("You win!"); }
}