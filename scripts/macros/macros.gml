function macros_and_enums()
{
	#macro	CARD_WIDTH		180
	#macro	CARD_HEIGHT		250

	#macro	CARD_MIN_DEPTH	0
	#macro	CARD_MAX_DEPTH	1000

	#macro	DOUBLE_CLICK_DELAY	250000

	#macro gui_mouse_x device_mouse_x_to_gui(0)
	#macro gui_mouse_y device_mouse_y_to_gui(0)

	enum CARD_TYPE
	{
		PLAYER,
		MECH
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
}