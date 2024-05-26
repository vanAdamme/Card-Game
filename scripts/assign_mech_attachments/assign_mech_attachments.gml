function assign_mech_attachments() {
	var _chosen = obj_mech.chosen;

	//for (var i = 0; i < array_length(_chosen); i++) {
	//	if _chosen[i] != undefined {
	//		obj_mech.attachment[i] = _chosen[i];
	//	}
	//}

	for (var i = 0; i < 6; i++) {
		if _chosen[i] != noone {
			switch(i) {
				case 0:
					obj_mech.core = build_mech_attachment(_chosen[i]);
				break;
				case 1:
					obj_mech.head = build_mech_attachment(_chosen[i]);
				break;
				case 2:
					obj_mech.left_arm = build_mech_attachment(_chosen[i]);
				break;
				case 3:
					obj_mech.right_arm = build_mech_attachment(_chosen[i]);
				break;
				case 4:
					obj_mech.left_leg = build_mech_attachment(_chosen[i]);
 				break;
				case 5:
					obj_mech.right_leg = build_mech_attachment(_chosen[i]);
				break;
			}
		}
	}
}