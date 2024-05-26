/// @descr go to selection room

if room == rm_battle {
	room_goto(rm_mech_selection); 
} else {
	room_goto(rm_battle);
}
