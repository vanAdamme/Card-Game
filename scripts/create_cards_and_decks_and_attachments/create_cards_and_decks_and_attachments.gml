function create_cards()
{
	BasicAttack		= new CardType("Attack", spr_player_card_face, spr_player_card_back, 1, 3, ATTACHMENT_TYPE.CORE, "Punch 'em in the dick!", [do_attack, [50, 5]]);
	BasicDefend		= new CardType("Defend", spr_player_card_face, spr_player_card_back, 1, 3, ATTACHMENT_TYPE.CORE, "Shields up!", [do_defend, [50, 5]]);
	BasicSupport	= new CardType("Support", spr_player_card_face, spr_player_card_back, 1, 3, ATTACHMENT_TYPE.CORE, "Fuck! Time to heal.", [do_support, [50, 5]]);
	DiscardCard		= new CardType("Discard", spr_player_card_face, spr_player_card_back, 1, 3, ATTACHMENT_TYPE.CORE, "Get something better.", do_discard_card);
	MegaAttack		= new CardType("Mega Attack", spr_player_card_face, spr_player_card_back, 2, 3, ATTACHMENT_TYPE.CORE, "Mega dick punch!", [do_attack, [100, 15]]);
}

//function create_decks()
//{
//	BasicDeck			= new DeckType([BasicAttack, 5], [BasicDefend, 3], [BasicSupport, 2]);
//	BasicBerserkDeck	= new DeckType([BasicAttack, 8], [BasicDefend, 1], [BasicSupport, 1]);
//	BasicTurtleDeck		= new DeckType([BasicAttack, 1], [BasicDefend, 8], [BasicSupport, 1]);
//	BasicImmortalDeck	= new DeckType([BasicAttack, 1], [BasicDefend, 3], [BasicSupport, 6]);
//}

function create_attachments()
{
	Core			= new AttachmentType([BasicSupport, 2]);
	LeftArm			= new AttachmentType([BasicAttack, 2]);
	RightArm		= new AttachmentType([BasicAttack, 2]);
	LeftLeg			= new AttachmentType([BasicDefend, 2]);
	RightLeg		= new AttachmentType([BasicDefend, 2]);
}