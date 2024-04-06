instance_create_layer(obj_mech_head_placement.x,		obj_mech_head_placement.y,		"Mech", obj_mech_head);
instance_create_layer(obj_mech_core_placement.x,		obj_mech_core_placement.y,		"Mech", obj_mech_core);
instance_create_layer(obj_mech_left_arm_placement.x,	obj_mech_left_arm_placement.y,	"Mech", obj_mech_left_arm);
instance_create_layer(obj_mech_right_arm_placement.x,	obj_mech_right_arm_placement.y,	"Mech", obj_mech_right_arm);
instance_create_layer(obj_mech_left_leg_placement.x,	obj_mech_left_leg_placement.y,	"Mech", obj_mech_left_leg);
instance_create_layer(obj_mech_right_leg_placement.x,	obj_mech_right_leg_placement.y,	"Mech", obj_mech_right_leg);

create_cards();
create_attachments();

core		= create_mech_attachment(BasicCore, 2);
head		= create_mech_attachment(BasicHead, 2);
left_arm	= create_mech_attachment(BasicLeftArm, 1);
right_arm	= create_mech_attachment(BasicRightArm, 1);
left_leg	= create_mech_attachment(BasicLeftLeg, 1);
right_leg	= create_mech_attachment(BasicRightLeg, 1);

//assign_mech_objs();

attachment_slots = [core, head, left_arm, right_arm, left_leg, right_leg];