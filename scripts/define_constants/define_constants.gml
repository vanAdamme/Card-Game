function define_constants()
{
	#macro	TOPPEST_CARD		0
	#macro	BOTTOMEST_CARD		1000

	#macro	DOUBLE_CLICK_DELAY	250000

	enum COMBATANT_TYPE
	{
		PLAYER,
		ENEMY
	}

	enum CARD_LOCATION
	{
		DEAL_PILE,
		HAND,
		DISCARD_PILE
	}

	enum MECH_PART
	{
		CORE,
		HEAD,
		LEFT_ARM,
		RIGHT_ARM,
		LEFT_LEG,
		RIGHT_LEG
	}
	
	//All inventory item properties
	enum Item {
		Title,
		InvObject,
		ParentObject,
		Amount,
		Type,
		Price,
		Description,
		Height
	}

	enum Type {
		MECH_PART,
		Card,
		Boost,
		Consumable //stackable
	}

	enum Ailment {
		Poisoned,
		Confused,
		Drunk
	}

	enum SortType {
		Title,
		Amount,
		Type,
		Price,
		Height
	}
	
	
}