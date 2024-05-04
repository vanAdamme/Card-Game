if keyboard_check_pressed(ord("M")) {
	if !isShowingMenu {
		isShowingMenu = true;
		//prevState = obj_game_controller.fsm.get_previous_state();
		obj_game_controller.fsm.change("inventory");
	} else {
		isShowingMenu = false;
		obj_game_controller.fsm.change(obj_game_controller.fsm.get_previous_state());
	}
}

//animations
if sequence != undefined && layer_sequence_is_finished(sequence) && layer_sequence_get_headdir(sequence) == seqdir_right {
	showingDescription = true;
	if instance_exists(obj_item_parent) {
		currentItem.isShowingInfo = true;
	}
}

if sequence != undefined && layer_sequence_is_finished(sequence) && layer_sequence_get_headdir(sequence) == seqdir_left {
	layer_sequence_destroy(sequence);
	if instance_exists(obj_item_parent) {
		currentItem.isShowingInfo = false;
	}
}