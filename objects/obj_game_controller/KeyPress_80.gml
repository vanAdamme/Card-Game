/// @desc Pause

pause();
/*
paused = !paused;
if !paused
{
	instance_activate_all();
	surface_free(paused_surf);
	paused_surf = -1;
	fsm.change(fsm.get_previous_state());
}
else {
	pause();
	fsm.change("paused");
}