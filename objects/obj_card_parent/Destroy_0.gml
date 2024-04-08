with(obj_deck_controller)
{
	array_delete(cards, array_get_index(cards, other.id), 1);
	array_delete(deal_pile, array_get_index(deal_pile, other.id), 1);
	array_delete(hand, array_get_index(hand, other.id), 1);
	array_delete(discard_pile, array_get_index(discard_pile, other.id), 1);
}