function create_player_cards()
{
	BasicAttack		= new PlayerCard("Attack", CARD_TYPE.PLAYER, CARD_SUBTYPE.ATTACK, sprPlayerCardFront, sprCardBasicBack, [100, 15], [20, 8], [8, 3], 1, 3);
	BasicDefend		= new PlayerCard("Defend", CARD_TYPE.PLAYER, CARD_SUBTYPE.DEFEND, sprPlayerCardFront, sprCardBasicBack, [8, 3], [100, 15], [20, 8], 1, 3);
	BasicSupport	= new PlayerCard("Support", CARD_TYPE.PLAYER, CARD_SUBTYPE.SUPPORT, sprPlayerCardFront, sprCardBasicBack, [20, 8], [8, 3], [100, 15], 1, 3);
}