function create_cards()
{
	BasicAttack		= new CardType("Attack",		[do_attack,[50,5]],		1,	3,	"Punch 'em in the dick!",	spr_player_card_face,	spr_player_card_back);
	BasicDefend		= new CardType("Defend",		[do_defend,[50,5]],		1,	3,	"Shields up!",				spr_player_card_face,	spr_player_card_back);
	BasicSupport	= new CardType("Support",		[do_support,[50,5]],	1,	3,	"Fuck! Time to heal.",		spr_player_card_face,	spr_player_card_back);
	DiscardCard		= new CardType("Discard",		do_discard_card,		1,	3,	"Get something better.",	spr_player_card_face,	spr_player_card_back);
	MegaAttack		= new CardType("Mega Attack",	[do_attack,[100,15]],	2,	3,	"Mega dick punch!",			spr_player_card_face,	spr_player_card_back);
}

//function create_decks()
//{
//	BasicDeck			= new DeckType([BasicAttack, 5], [BasicDefend, 3], [BasicSupport, 2]);
//	BasicBerserkDeck	= new DeckType([BasicAttack, 8], [BasicDefend, 1], [BasicSupport, 1]);
//	BasicTurtleDeck		= new DeckType([BasicAttack, 1], [BasicDefend, 8], [BasicSupport, 1]);
//	BasicImmortalDeck	= new DeckType([BasicAttack, 1], [BasicDefend, 3], [BasicSupport, 6]);
//}

