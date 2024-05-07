/// @desc Master Inventory Item Object

//All inventory item properties
enum Item {
	Title,
	InvObject,
	ParentObject,
	Amount,
	Type,
	Price,
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

global.AllItems = ds_grid_create(0, Item.Height);