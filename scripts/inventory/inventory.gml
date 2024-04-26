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