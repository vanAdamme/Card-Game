/// @desc Master Item Object

//All item properties
enum Item {
	Name,
	Object,
	Amount,
	Type,
	Price,
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