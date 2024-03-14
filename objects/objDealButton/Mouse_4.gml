with(objPlayer)
{
	deck.deal(hand_size);
}

with(objEnemy)
{
	show_message("about to call deal enemy hand");
	deck.deal(hand_size);
}