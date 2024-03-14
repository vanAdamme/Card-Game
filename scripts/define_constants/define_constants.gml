function define_constants()
{
	#macro	CARD_WIDTH		180
	#macro	CARD_HEIGHT		250

	#macro	TOPPEST_CARD	0
	#macro	BOTTOMEST_CARD	1000

	#macro	DOUBLE_CLICK_DELAY	250000

	#macro gui_mouse_x device_mouse_x_to_gui(0)
	#macro gui_mouse_y device_mouse_y_to_gui(0)

	enum GAME_STATE
	{
		PLAYER_START = 0,
		PLAYER_DURING = 1,
		PLAYER_END = 2,
		ENEMY_START = 3,
		ENEMY_DURING = 4,
		ENEMY_END = 5,
		LENGTH,
	}

	enum CARD_TYPE
	{
		PLAYER,
		ENEMY
	}

	enum CARD_SUBTYPE
	{
		ATTACK,
		DEFEND,
		SUPPORT
	}
	
	enum DECK_TYPE
	{
		BASIC
	}

	enum ATTACHMENT_TYPE
	{
		CORE,
		HEAD,
		BODY,
		LEFT_ARM,
		RIGHT_ARM,
		LEFT_LEG,
		RIGHT_LEG
	}

	global.active_cards = [];
}