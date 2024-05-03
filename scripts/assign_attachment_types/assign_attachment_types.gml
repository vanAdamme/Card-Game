function assign_attachment_types()
{
	//BASIC
	BasicCore			= new AttachmentType("Basic Core",			obj_mech_basic_core,		MECH_PART.CORE,			obj_mech_basic_inv_core,		20,	10, "Description goes here.",	[BasicSupport, 2], [BasicAttack, 1]);
	BasicHead			= new AttachmentType("Basic Head",			obj_mech_basic_head,		MECH_PART.HEAD,			obj_mech_basic_inv_head,		20,	10, "Description goes here.",	[MegaAttack, 1]);
	BasicLeftArm		= new AttachmentType("Basic Left Arm",		obj_mech_basic_left_arm,	MECH_PART.LEFT_ARM,		obj_mech_basic_inv_left_arm,	20,	10, "Description goes here.",	[BasicAttack, 2]);
	BasicRightArm		= new AttachmentType("Basic Right Arm",		obj_mech_basic_right_arm,	MECH_PART.RIGHT_ARM,	obj_mech_basic_inv_right_arm,	20,	10, "Description goes here.",	[BasicAttack, 2]);
	BasicLeftLeg		= new AttachmentType("Basic Left Leg",		obj_mech_basic_left_leg,	MECH_PART.LEFT_LEG,		obj_mech_basic_inv_left_leg,	20,	10, "Description goes here.",	[BasicDefend, 1]);
	BasicRightLeg		= new AttachmentType("Basic Right Leg",		obj_mech_basic_right_leg,	MECH_PART.RIGHT_LEG,	obj_mech_basic_inv_right_leg,	20,	10, "Description goes here.",	[BasicDefend, 1]);

	//STRONG
	//StrongCore			= new AttachmentType("Strong Core",			obj_mech_strong_core,		MECH_PART.CORE,			obj_mech_strong_core_inv,		20,	10, "Description goes here.",	[BasicSupport, 2], [BasicAttack, 1]);
	//StrongHead			= new AttachmentType("Strong Head",			obj_mech_strong_head,		MECH_PART.HEAD,			obj_mech_strong_head_inv,		20,	10, "Description goes here.",	[MegaAttack, 1]);
	//StrongLeftArm		= new AttachmentType("Strong Left Arm",		obj_mech_strong_left_arm,	MECH_PART.LEFT_ARM,		obj_mech_strong_left_arm_inv,	20,	10, "Description goes here.",	[MegaAttack, 2]);
	//StrongRightArm		= new AttachmentType("Strong Right Arm",	obj_mech_strong_right_arm,	MECH_PART.RIGHT_ARM,	obj_mech_strong_right_arm_inv,	20,	10, "Description goes here.",	[MegaAttack, 2]);
	//StrongLeftLeg		= new AttachmentType("Strong Left Leg",		obj_mech_strong_left_leg,	MECH_PART.LEFT_LEG,		obj_mech_strong_left_leg_inv,	20,	10, "Description goes here.",	[BasicDefend, 1]);
	//StrongRightLeg		= new AttachmentType("Strong Right Leg",	obj_mech_strong_right_leg,	MECH_PART.RIGHT_LEG,	obj_mech_strong_right_leg_inv,	20,	10, "Description goes here.",	[BasicDefend, 1]);
	
	//FAST
	
	//DEFENSIVE
	
	//WEAKENING
	
	//HEALING
}