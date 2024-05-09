//open/close inventory
if keyboard_check_pressed(ord("M")) {
	if !isShowingMenu {
		isShowingMenu = true;
		SortInventory(obj_player.myItems, sortType);
		obj_game_controller.fsm.change("inventory");
	} else {
		isShowingMenu = false;
		if sequence != undefined {
			layer_sequence_destroy(sequence);
			instance_destroy(obj_inventory_item_parent);
			showingDescription = false;
		}
		obj_game_controller.fsm.change(obj_game_controller.fsm.get_previous_state());
	}
}

//sort
if isShowingMenu {
	if keyboard_check_pressed(ord("S")) {
		sortType++;
		if sortType >= SortType.Height {
			sortType = 0;
		}
		SortInventory(obj_player.myItems, sortType);
	}
}

//animations
if sequence != undefined && layer_sequence_is_finished(sequence) && layer_sequence_get_headdir(sequence) == seqdir_right {
	showingDescription = true;
	if instance_exists(obj_inventory_item_parent) {
		currentItem.isShowingInfo = true;
	}
}

if sequence != undefined && layer_sequence_is_finished(sequence) && layer_sequence_get_headdir(sequence) == seqdir_left {
	layer_sequence_destroy(sequence);
}