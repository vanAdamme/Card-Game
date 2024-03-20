function create_player_deck(_deck_type)
{
	var deck = new Deck();
	var deck_type = _deck_type;

	for (var i = 0; i < array_length(deck_type.cards_in_deck); i++)
	{
		var card_amount = deck_type.cards_in_deck[i][1];
		var card_type = deck_type.cards_in_deck[i][0];

		repeat(card_amount)
		{
			var _inst = instance_create_layer(0, 0, "Hidden_items_layer", objPlayerCard);
			with (_inst)
			{
				title			= card_type.title;
				type			= card_type.type;
				subtype			= card_type.subtype;
				attack_val_m	= card_type.attack_val[0];
				attack_val_sd	= card_type.attack_val[1];
				defend_val_m	= card_type.defend_val[0];
				defend_val_sd	= card_type.defend_val[1];
				support_val_m	= card_type.support_val[0];
				support_val_sd	= card_type.support_val[1];
				xp_to_level		= card_type.xp_to_level;
				front			= card_type.front;
				back			= card_type.back;
				cost			= card_type.cost;
			}
			deck.add_to_deck(_inst);
			deck.add_to_deal_pile(_inst);
		}		
	}
	deck.deal_pile = array_shuffle(deck.deal_pile);

	return deck;
}

/*

function initialise_player_deck(_deck, _deck_type)
{
	var deck = _deck;

	switch(_deck_type)
	{
		case DECK_TYPE.BASIC:
			repeat(5)
			{
				var _inst = instance_create_layer(0, 0, "Hidden_items_layer", objPlayerCard);
				with (_inst)
				{
					title			= objGame_Controller.BasicAttack.title;
					type			= objGame_Controller.BasicAttack.type;
					subtype			= objGame_Controller.BasicAttack.subtype;
					attack_val_m	= objGame_Controller.BasicAttack.attack_val[0];
					attack_val_sd	= objGame_Controller.BasicAttack.attack_val[1];
					defend_val_m	= objGame_Controller.BasicAttack.defend_val[0];
					defend_val_sd	= objGame_Controller.BasicAttack.defend_val[1];
					support_val_m	= objGame_Controller.BasicAttack.support_val[0];
					support_val_sd	= objGame_Controller.BasicAttack.support_val[1];
					xp_to_level		= objGame_Controller.BasicAttack.xp_to_level;
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
					defend_val_m	= objGame_Controller.BasicDefend.defend_val[0];
					defend_val_sd	= objGame_Controller.BasicDefend.defend_val[1];
					support_val_m	= objGame_Controller.BasicDefend.support_val[0];
					support_val_sd	= objGame_Controller.BasicDefend.support_val[1];
					xp_to_level		= objGame_Controller.BasicDefend.xp_to_level;
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
					defend_val_m	= objGame_Controller.BasicSupport.defend_val[0];
					defend_val_sd	= objGame_Controller.BasicSupport.defend_val[1];
					support_val_m	= objGame_Controller.BasicSupport.support_val[0];
					support_val_sd	= objGame_Controller.BasicSupport.support_val[1];
					xp_to_level		= objGame_Controller.BasicSupport.xp_to_level;
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