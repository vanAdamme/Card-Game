instance_create_layer(obj_mech_head_placement.x,		obj_mech_head_placement.y,		"Mech", obj_mech_head);
instance_create_layer(obj_mech_core_placement.x,		obj_mech_core_placement.y,		"Mech", obj_mech_core);
instance_create_layer(obj_mech_left_arm_placement.x,	obj_mech_left_arm_placement.y,	"Mech", obj_mech_left_arm);
instance_create_layer(obj_mech_right_arm_placement.x,	obj_mech_right_arm_placement.y,	"Mech", obj_mech_right_arm);
instance_create_layer(obj_mech_left_leg_placement.x,	obj_mech_left_leg_placement.y,	"Mech", obj_mech_left_leg);
instance_create_layer(obj_mech_right_leg_placement.x,	obj_mech_right_leg_placement.y,	"Mech", obj_mech_right_leg);

create_cards();
create_attachments();

core		= create_mech_attachment(BasicCore);
head		= create_mech_attachment(BasicHead);
left_arm	= create_mech_attachment(BasicLeftArm);
right_arm	= create_mech_attachment(BasicRightArm);
left_leg	= create_mech_attachment(BasicLeftLeg);
right_leg	= create_mech_attachment(BasicRightLeg);

attachment_slots = [core, head, left_arm, right_arm, left_leg, right_leg];