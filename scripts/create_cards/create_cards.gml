function create_cards()
{
	BasicAttack		= new CardType("Attack",		[do_attack,[5, 2]],		1,	3,	"Punch 'em in the dick!",	spr_player_card_face,	spr_player_card_back);
	BasicDefend		= new CardType("Defend",		[do_defend,[5, 2]],		1,	3,	"Shields up!",				spr_player_card_face,	spr_player_card_back);
	BasicSupport	= new CardType("Support",		[do_support,[5, 2]],	1,	3,	"Fuck! Time to heal.",		spr_player_card_face,	spr_player_card_back);
	DiscardCard		= new CardType("Discard",		do_discard_card,		1,	3,	"Get something better.",	spr_player_card_face,	spr_player_card_back);
	MegaAttack		= new CardType("Mega Attack",	[do_attack,[13, 5]],	2,	3,	"Mega dick punch!",			spr_player_card_face,	spr_player_card_back);
}