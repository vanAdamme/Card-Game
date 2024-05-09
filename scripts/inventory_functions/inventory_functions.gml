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
	if attributes[Item.Type] != MECH_PART.CORE { //or any other type that can stack
		_canStack = false;
		if attributes[Item.Amount] > 1 {
			for (var _i = 0; _i < attributes[Item.Amount]; _i++) {
				AddItem(grid, [attributes[Item.Title], attributes[Item.InvObject], attributes[Item.ParentObject], 1,  attributes[Item.Type], attributes[Item.Price]]);
			}
		}
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

	//fifth check - do I have space?
	if obj_player.inventorySize <= ds_grid_width(grid) {
		return;
	}

	//sixth check - not in the grid, so add it
	ds_grid_resize(grid, ds_grid_width(grid) + 1, ds_grid_height(grid));

	for (var _i = 0; _i < array_length(attributes); _i++) {
		grid[# ds_grid_width(grid) - 1, _i] = attributes[_i];
	}
}

function AddItemToMasterList(attributes) {
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

function SortInventory(grid, sortType) {
	//convert sortType to item attribute
	switch(sortType) {
		case SortType.Title:
			sortType = Item.Title;
		break;
		case SortType.Amount:
			sortType = Item.Amount;
		break;
		case SortType.Price:
			sortType = Item.Price;
		break;
		case SortType.Type:
			sortType = Item.Type;
		break;
	}
	
	//create temp ds grid
	var sortedGrid = ds_grid_create(0, Item.Height);
	var lowestItem = 0;
	var savedItems = [];
	
	for (var i = 0; i < ds_grid_width(grid); i++) {
		for (var j = 0; j < ds_grid_width(grid); j++) {
			var item1 = grid[# lowestItem, sortType];
			var item2 = grid[# j, sortType];
			if item2 <= item1 && !array_contains(savedItems, j) {
				lowestItem = j;
			}
		}
		
		//end of inner loop
		AddItem(sortedGrid, [grid[# lowestItem, Item.Title], grid[# lowestItem, Item.InvObject], grid[# lowestItem, Item.ParentObject],
				grid[# lowestItem, Item.Amount], grid[# lowestItem, Item.Type], grid[# lowestItem, Item.Price]]);

		//add to saved items
		savedItems[i] = lowestItem;

		//find next lowest item
		for (var l = 0; l < ds_grid_width(grid); l++) {
			if !array_contains(savedItems, l) {
				lowestItem = l;
			}
		}
	}
	
	//copy items and return
	ds_grid_set_grid_region(grid, sortedGrid, 0, 0, ds_grid_width(sortedGrid), Item.Height, 0, 0);
	ds_grid_destroy(sortedGrid);
	return grid;
}