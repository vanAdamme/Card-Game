function create_player_cards()
{
	BasicAttack = new PlayerCard("Attack", CARD_TYPE.PLAYER, CARD_SUBTYPE.ATTACK, sprCardBasicAttackFront, sprCardBasicBack, [100, 15], 0, 0);
	BasicDefend = new PlayerCard("Defend", CARD_TYPE.PLAYER, CARD_SUBTYPE.DEFEND, sprCardBasicDefendFront, sprCardBasicBack, [20, 8], 100, 0);
}