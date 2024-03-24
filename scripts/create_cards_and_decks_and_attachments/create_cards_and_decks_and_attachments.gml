function create_cards()
{
	BasicAttack		= new CardType("Attack", spr_player_card_face, spr_player_card_back, 1, 3, ATTACHMENT_TYPE.CORE, "Punch 'em in the dick!", [do_attack, [50, 5]]);
	BasicDefend		= new CardType("Defend", spr_player_card_face, spr_player_card_back, 1, 3, ATTACHMENT_TYPE.CORE, "Shields up!", [do_defend, [50, 5]]);
	BasicSupport	= new CardType("Support", spr_player_card_face, spr_player_card_back, 1, 3, ATTACHMENT_TYPE.CORE, "Fuck! Time to heal.", [do_support, [50, 5]]);

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