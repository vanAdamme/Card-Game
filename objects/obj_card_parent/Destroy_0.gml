if in_hand()			{ array_delete(obj_deck_controller.hand, array_get_index(obj_deck_controller.hand, id), 1); }
if in_deal_pile()		{ array_delete(obj_deck_controller.deal_pile, array_get_index(obj_deck_controller.deal_pile, id), 1); }
if in_discard_pile()	{ array_delete(obj_deck_controller.discard_pile, array_get_index(obj_deck_controller.discard_pile, id), 1); }

array_delete(obj_deck_controller.cards, array_get_index(obj_deck_controller.cards, id), 1);