function define_constants()
{
	#macro	CARD_WIDTH			180
	#macro	CARD_HEIGHT			250

	#macro	TOPPEST_CARD		0
	#macro	BOTTOMEST_CARD		1000

	#macro	DOUBLE_CLICK_DELAY	250000

	#macro	gui_mouse_x device_mouse_x_to_gui(0)
	#macro	gui_mouse_y device_mouse_y_to_gui(0)

	enum PARENT_TYPE
	{
		PLAYER,
		ENEMY
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
}