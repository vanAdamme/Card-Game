function assign_mech_attachments() {
	var _chosen = obj_mech.chosen;
	
	//for (var i = 0; i < array_length(_chosen); i++) {
	//	if _chosen[i] != undefined {
	//		obj_mech.attachment[i] = _chosen[i];
	//	}
	//}
	
	with(obj_mech) {
		core = build_mech_attachment(_chosen[0]);
		head = build_mech_attachment(_chosen[1]);
		left_arm = build_mech_attachment(_chosen[2]);
		right_arm = build_mech_attachment(_chosen[3]);
		left_leg = build_mech_attachment(_chosen[4]);
		right_leg = build_mech_attachment(_chosen[5]);
	}
}