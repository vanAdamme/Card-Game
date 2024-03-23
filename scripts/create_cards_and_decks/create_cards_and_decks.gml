function create_cards()
{
	BasicAttack		= new PlayerCard("Attack",	, ,	[100, 15],	[20, 8],	[8, 3]);
	BasicDefend		= new PlayerCard("Defend",	, ,	[8, 3],		[100, 15],	[20, 8]);
	BasicSupport	= new PlayerCard("Support",	, ,	[20, 8],	[8, 3],		[100, 15]);
}

function create_decks()
{
	BasicDeck			= new DeckType([BasicAttack, 5], [BasicDefend, 3], [BasicSupport, 2]);
	BasicBerserkDeck	= new DeckType([BasicAttack, 8], [BasicDefend, 1], [BasicSupport, 1]);
	BasicTurtleDeck		= new DeckType([BasicAttack, 1], [BasicDefend, 8], [BasicSupport, 1]);
	BasicImmortalDeck	= new DeckType([BasicAttack, 1], [BasicDefend, 3], [BasicSupport, 6]);
}