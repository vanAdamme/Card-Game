function pause() {
	if fsm.get_current_state() == "paused" {
		fsm.change(fsm.get_previous_state());
		instance_activate_all();
		surface_free(obj_game_controller.paused_surf);
		obj_game_controller.paused_surf = -1;
	} else {
		fsm.change("paused");
	}
}