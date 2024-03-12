function fill_player_deck(_deck, _deck_type)
{
	var deck = _deck;

	switch(_deck_type)
	{
		case DECK_TYPE.BASIC:
			repeat(5)
			{
				var _inst = instance_create_layer(objDeckGoesHere.x + 21, objDeckGoesHere.y + 40, "Hidden_items_layer", objPlayerCard);
				with (_inst)
				{
					title			= objGame_Controller.BasicAttack.title;
					type			= objGame_Controller.BasicAttack.type;
					subtype			= objGame_Controller.BasicAttack.subtype;
					attack_val_m	= objGame_Controller.BasicAttack.attack_val[0];
					attack_val_sd	= objGame_Controller.BasicAttack.attack_val[1];
					defend_val		= objGame_Controller.BasicAttack.defend_val;
					support_val		= objGame_Controller.BasicAttack.support;
					front			= objGame_Controller.BasicAttack.front;
					back			= objGame_Controller.BasicAttack.back;

					sprite_index	= back;
				}

				deck.add_to_deck(_inst);
				deck.add_to_deal_pile(_inst);
			}

			repeat(5)
			{
				var _inst = instance_create_layer(objDeckGoesHere.x + 21, objDeckGoesHere.y + 40, "Hidden_items_layer", objPlayerCard);
				with (_inst)
				{
					title			= objGame_Controller.BasicDefend.title;
					type			= objGame_Controller.BasicDefend.type;
					subtype			= objGame_Controller.BasicDefend.subtype;
					attack_val_m	= objGame_Controller.BasicDefend.attack_val[0];
					attack_val_sd	= objGame_Controller.BasicDefend.attack_val[1];
					defend_val		= objGame_Controller.BasicDefend.defend_val;
					support_val		= objGame_Controller.BasicDefend.support;
					front			= objGame_Controller.BasicDefend.front;
					back			= objGame_Controller.BasicDefend.back;

					sprite_index	= back;
				}

				deck.add_to_deck(_inst);
				deck.add_to_deal_pile(_inst);
			}
		break;
	}
	deck.shuffle_deal_pile();
	return deck;
}