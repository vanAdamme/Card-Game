if selected && room == rm_battle {
	selected = false;
	assign_mech_attachments();
}

//pubsub_subscribe("mech attachments chosen", function(_id) {
//	assign_mech_attachments();
//});