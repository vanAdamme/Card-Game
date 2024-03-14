function initialise_enemy_deck(_deck, _deck_type)
{
	var deck = _deck;

	switch(_deck_type)
	{
		case DECK_TYPE.BASIC:
			repeat(5)
			{
				var _inst = instance_create_layer(objDeckGoesHere.x, objDeckGoesHere.y, "Hidden_items_layer", objPlayerCard);
				with (_inst)
				{
					title			= objGame_Controller.BasicAttack.title;
					type			= objGame_Controller.BasicAttack.type;
					subtype			= objGame_Controller.BasicAttack.subtype;
					attack_val_m	= objGame_Controller.BasicAttack.attack_val[0];
					attack_val_sd	= objGame_Controller.BasicAttack.attack_val[1];
					defend_val		= objGame_Controller.BasicAttack.defend_val;
					support_val		= objGame_Controller.BasicAttack.support_val;
					front			= objGame_Controller.BasicAttack.front;
					back			= objGame_Controller.BasicAttack.back;
					cost			= objGame_Controller.BasicAttack.cost;
				}
				deck.add_to_deck(_inst);
				deck.add_to_deal_pile(_inst);
			}

			repeat(3)
			{
				var _inst = instance_create_layer(objDeckGoesHere.x, objDeckGoesHere.y, "Hidden_items_layer", objPlayerCard);
				with (_inst)
				{
					title			= objGame_Controller.BasicDefend.title;
					type			= objGame_Controller.BasicDefend.type;
					subtype			= objGame_Controller.BasicDefend.subtype;
					attack_val_m	= objGame_Controller.BasicDefend.attack_val[0];
					attack_val_sd	= objGame_Controller.BasicDefend.attack_val[1];
					defend_val		= objGame_Controller.BasicDefend.defend_val;
					support_val		= objGame_Controller.BasicDefend.support_val;
					front			= objGame_Controller.BasicDefend.front;
					back			= objGame_Controller.BasicDefend.back;
					cost			= objGame_Controller.BasicDefend.cost;
				}
				deck.add_to_deck(_inst);
				deck.add_to_deal_pile(_inst);
			}

			repeat(2)
			{
				var _inst = instance_create_layer(objDeckGoesHere.x, objDeckGoesHere.y, "Hidden_items_layer", objPlayerCard);
				with (_inst)
				{
					title			= objGame_Controller.BasicSupport.title;
					type			= objGame_Controller.BasicSupport.type;
					subtype			= objGame_Controller.BasicSupport.subtype;
					attack_val_m	= objGame_Controller.BasicSupport.attack_val[0];
					attack_val_sd	= objGame_Controller.BasicSupport.attack_val[1];
					defend_val		= objGame_Controller.BasicSupport.defend_val;
					support_val		= objGame_Controller.BasicSupport.support_val;
					front			= objGame_Controller.BasicSupport.front;
					back			= objGame_Controller.BasicSupport.back;
					cost			= objGame_Controller.BasicSupport.cost;
				}
				deck.add_to_deck(_inst);
				deck.add_to_deal_pile(_inst);
			}
		break;
	}

	deck.deal_pile = array_shuffle(deck.deal_pile);
}