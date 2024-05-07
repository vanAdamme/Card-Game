function AddItem(grid, attributes) {
	var _canStack = true;
	
	//first check - are the arguments acceptable?
	if !ds_exists(grid, ds_type_grid) {
		show_message("No grid found.");
		return;
	}

	if !is_array(attributes) || array_length(attributes) != Item.Height {
		show_message("Wrong attributes.");
		return;
	}
	
	//second check - is item in the master list?
	//var _isInMasterList = false;
	//for (var _i = 0; _i < ds_grid_width(global.AllItems); _i++) {
	//	if global.AllItems[# _i, Item.Title] == attributes[Item.Title] {
	//		_isInMasterList = true;
	//	}
	//}
	//if !_isInMasterList {
	//	show_message("Cannot find this item.");
	//	return;
	//}
	
	//third check - can it stack?
	if attributes[Item.Type] != Type.Consumable { //or any other type that can stack
		_canStack = false;
	}
	
	//fourth check - is it already in the grid?
	if _canStack {
		for (var _i = 0; _i < ds_grid_width(grid); _i++) {
			if attributes[Item.Title] == grid[# _i, Item.Title] {
				//it's in here, so add amount to item
				grid[# _i, Item.Amount] += attributes[Item.Amount];
				return;
			}
		}
	}
	
	//fifth check - not in the grid, so add it
	ds_grid_resize(grid, ds_grid_width(grid) + 1, ds_grid_height(grid));
	
	for (var _i = 0; _i < array_length(attributes); _i++) {
		grid[# ds_grid_width(grid) - 1, _i] = attributes[_i];
	}
}

function AddItemToMasterList(attributes){
	//Check for global variable
	if !variable_global_exists("AllItems") {
		//global.AllItems = ds_grid_create(0, Item.Height);
		show_message("No 'AllItems' variable found");
		return;
	}

	//Check type of variable
	if !ds_exists(global.AllItems, ds_type_grid) {
		//global.AllItems = ds_grid_create(0, Item.Height);
		show_message("'AllItems' not a ds_grid");
		return;
	}

	//check inputs
	if !is_array(attributes) || array_length(attributes) != Item.Height {
		show_message("Bad input for AddItemToMasterList");
		return;
	}
	
	//Add the item
	ds_grid_resize(global.AllItems, ds_grid_width(global.AllItems) + 1, ds_grid_height(global.AllItems));
	
	for (var _i = 0; _i < array_length(attributes); _i++) {
		global.AllItems[# ds_grid_width(global.AllItems) - 1, _i] = attributes[_i];
	}
}