if keyboard_check_pressed(ord("M")) {
	isShowingMenu = true;
}

//animations
if sequence != undefined && layer_sequence_is_finished(sequence) && layer_sequence_get_headdir(sequence) == seqdir_right {
	showingDescription = true;
}

if sequence != undefined && layer_sequence_is_finished(sequence) && layer_sequence_get_headdir(sequence) == seqdir_left {
	layer_sequence_destroy(sequence);	
}