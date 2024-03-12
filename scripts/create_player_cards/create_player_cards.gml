function create_player_cards()
{
	BasicAttack		= new PlayerCard("Attack", CARD_TYPE.PLAYER, CARD_SUBTYPE.ATTACK, sprCardBasicAttackFront, sprCardBasicBack, [100, 15], 5, 5, 1);
	BasicDefend		= new PlayerCard("Defend", CARD_TYPE.PLAYER, CARD_SUBTYPE.DEFEND, sprCardBasicDefendFront, sprCardBasicBack, [20, 8], 100, 20, 1);
	BasicSupport	= new PlayerCard("Support", CARD_TYPE.PLAYER, CARD_SUBTYPE.SUPPORT, sprCardBasicSupportFront, sprCardBasicBack, [10, 5], 20, 100, 1);
}