function assign_attachment_types()
{
	//BASIC
	BasicCore			= new AttachmentType("Basic Core",			obj_mech_basic_core,		MECH_PART.CORE,			obj_mech_basic_core_inv,		20,	10, "basic core description",	[BasicSupport, 2], [BasicAttack, 1]);
	array_push(global.MasterList, BasicCore);
	array_push(global.AvailableToPurchase, BasicCore);
	BasicHead			= new AttachmentType("Basic Head",			obj_mech_basic_head,		MECH_PART.HEAD,			obj_mech_basic_head_inv,		20,	10, "basic head description",	[MegaAttack, 1]);
	array_push(global.MasterList, BasicHead);
	array_push(global.AvailableToPurchase, BasicHead);
	BasicLeftArm		= new AttachmentType("Basic Left Arm",		obj_mech_basic_left_arm,	MECH_PART.LEFT_ARM,		obj_mech_basic_left_arm_inv,	20,	10, "basic left arm description",	[BasicAttack, 2]);
	array_push(global.MasterList, BasicLeftArm);
	array_push(global.AvailableToPurchase, BasicLeftArm);
	BasicRightArm		= new AttachmentType("Basic Right Arm",		obj_mech_basic_right_arm,	MECH_PART.RIGHT_ARM,	obj_mech_basic_right_arm_inv,	20,	10, "basic right arm description",	[BasicAttack, 2]);
	array_push(global.MasterList, BasicRightArm);
	array_push(global.AvailableToPurchase, BasicRightArm);
	BasicLeftLeg		= new AttachmentType("Basic Left Leg",		obj_mech_basic_left_leg,	MECH_PART.LEFT_LEG,		obj_mech_basic_left_leg_inv,	20,	10, "basic left leg description",	[BasicDefend, 1]);
	array_push(global.MasterList, BasicLeftLeg);
	array_push(global.AvailableToPurchase, BasicLeftLeg);
	BasicRightLeg		= new AttachmentType("Basic Right Leg",		obj_mech_basic_right_leg,	MECH_PART.RIGHT_LEG,	obj_mech_basic_right_leg_inv,	20,	10, "basic right leg description",	[BasicDefend, 1]);
	array_push(global.MasterList, BasicRightLeg);
	array_push(global.AvailableToPurchase, BasicRightLeg);

	//STRONG
	StrongCore			= new AttachmentType("Strong Core",			obj_mech_strong_core,		MECH_PART.CORE,			obj_mech_strong_core_inv,	20,	10, "Description goes here.",	[BasicSupport, 2], [BasicAttack, 1]);
	array_push(global.MasterList, StrongCore);
	array_push(global.AvailableToPurchase, StrongCore);
	StrongHead			= new AttachmentType("Strong Head",			obj_mech_strong_head,		MECH_PART.HEAD,			obj_mech_strong_head_inv,	20,	10, "Description goes here.",	[MegaAttack, 1]);
	array_push(global.MasterList, StrongHead);
	StrongLeftArm		= new AttachmentType("Strong Left Arm",		obj_mech_strong_left_arm,	MECH_PART.LEFT_ARM,		obj_mech_strong_left_arm_inv,	20,	10, "Description goes here.",	[MegaAttack, 2]);
	array_push(global.MasterList, StrongLeftArm);
	StrongRightArm		= new AttachmentType("Strong Right Arm",	obj_mech_strong_right_arm,	MECH_PART.RIGHT_ARM,	obj_mech_strong_right_arm_inv,	20,	10, "Description goes here.",	[MegaAttack, 2]);
	array_push(global.MasterList, StrongRightArm);
	StrongLeftLeg		= new AttachmentType("Strong Left Leg",		obj_mech_strong_left_leg,	MECH_PART.LEFT_LEG,		obj_mech_strong_left_leg_inv,	20,	10, "Description goes here.",	[BasicDefend, 1]);
	array_push(global.MasterList, StrongLeftLeg);
	StrongRightLeg		= new AttachmentType("Strong Right Leg",	obj_mech_strong_right_leg,	MECH_PART.RIGHT_LEG,	obj_mech_strong_right_leg_inv,	20,	10, "Description goes here.",	[BasicDefend, 1]);
	array_push(global.MasterList, StrongRightLeg);

	//FAST

	//DEFENSIVE

	//WEAKENING

	//HEALING

}