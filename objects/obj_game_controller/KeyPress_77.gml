//open/close inventory

with(obj_inventory_controller) {
	if !isShowingMenu {
		isShowingMenu = true;
		SortInventory(obj_player.myItems, sortType);
		other.fsm.change("inventory");
	} else {
		isShowingMenu = false;
		if sequence != undefined {
			layer_sequence_destroy(sequence);
			instance_destroy(obj_inventory_item_parent);
			showingDescription = false;
			itemLocked = false;
		}
		other.fsm.change(other.fsm.get_previous_state());
	}
}