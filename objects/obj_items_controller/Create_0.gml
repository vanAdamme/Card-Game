//All item properties
enum Item {
	Name,
	Sprite,
	Amount,
	Type,
	Price,
	Object,
	Height
}

enum Type {
	MECH_PART,
	Armour,
	Consumable
}

enum Ailment {
	Poisoned,
	Confused,
	Drunk
}

enum SortType {
	Name,
	Amount,
	Type,
	Price,
	Height
}

global.AllItems = ds_grid_create(0, Item.Height);

AddItemToMasterList(["Basic Core",		spr_mech_core_inv,		1,	MECH_PART.CORE,			5,	obj_mech_core]);
AddItemToMasterList(["Basic Head",		spr_mech_head_inv,		1,	MECH_PART.HEAD,			5,	obj_mech_head]);
AddItemToMasterList(["Basic Left Arm",	spr_mech_left_arm_inv,	1,	MECH_PART.LEFT_ARM,		5,	obj_mech_left_arm]);
AddItemToMasterList(["Basic Right Arm",	spr_mech_right_arm_inv,	1,	MECH_PART.RIGHT_ARM,	5,	obj_mech_right_arm]);
AddItemToMasterList(["Basic Left Leg",	spr_mech_left_leg_inv,	1,	MECH_PART.LEFT_LEG,		5,	obj_mech_left_leg]);
AddItemToMasterList(["Basic Right Leg",	spr_mech_right_leg_inv,	1,	MECH_PART.RIGHT_LEG,	5,	obj_mech_right_leg]);