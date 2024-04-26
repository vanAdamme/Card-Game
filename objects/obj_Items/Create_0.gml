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
	Mech_Part,
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

AddItemToMasterList(["Basic Core", spr_mech_core, 1, Type.Mech_Part, 5, obj_mech_core]);




