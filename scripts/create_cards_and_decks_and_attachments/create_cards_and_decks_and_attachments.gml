function create_cards()
{
	BasicAttack		= new CardType("Attack", spr_player_card_face, spr_player_card_back, [100, 15], [20, 8], [8, 3], 1, 3, ATTACHMENT_TYPE.CORE, "Punch 'em in the dick!");
	BasicDefend		= new CardType("Defend",	, ,	[8, 3],		[100, 15],	[20, 8], , , , "Shields up!");
	BasicSupport	= new CardType("Support",	, ,	[20, 8],	[8, 3],		[100, 15], , , , "Fuck! Time to heal.");

	MegaAttack		= new CardType("Mega Attack", , , [200, 50], , , 2, , , "Mega dick punch!");
}

function create_decks()
{
	BasicDeck			= new DeckType([BasicAttack, 5], [BasicDefend, 3], [BasicSupport, 2]);
	BasicBerserkDeck	= new DeckType([BasicAttack, 8], [BasicDefend, 1], [BasicSupport, 1]);
	BasicTurtleDeck		= new DeckType([BasicAttack, 1], [BasicDefend, 8], [BasicSupport, 1]);
	BasicImmortalDeck	= new DeckType([BasicAttack, 1], [BasicDefend, 3], [BasicSupport, 6]);
}

function create_attachments()
{
	Core			= new AttachmentType([BasicAttack, 5], [BasicDefend, 3], [BasicSupport, 2]);
	//Left_Arm		= new AttachmentType();
	//Right_Arm		= new AttachmentType();
	//Left_Leg		= new AttachmentType();
	//Right_Leg		= new AttachmentType();
}