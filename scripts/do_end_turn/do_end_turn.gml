function do_end_turn()
{
	with (objPlayer)
	{
		current_defence = 0;
		deck.discard_hand();
		deck.deal(hand_size);
	}
}