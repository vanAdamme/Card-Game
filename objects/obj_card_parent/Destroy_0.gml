with(obj_deck_controller)
{
	array_delete(cards, array_get_index(cards, id), 1);
	array_delete(deal_pile, array_get_index(deal_pile, id), 1);
	array_delete(hand, array_get_index(hand, id), 1);
	array_delete(discard_pile, array_get_index(discard_pile, id), 1);
}