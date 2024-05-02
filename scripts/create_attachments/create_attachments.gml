function create_attachments()
{
	BasicCore			= new AttachmentType("Basic Core",		MECH_PART.CORE,			spr_mech_core_inv,		20,	10, "Description goes here.",	[BasicSupport, 2], [BasicAttack, 1]);
	BasicHead			= new AttachmentType("Basic Head",		MECH_PART.HEAD,			spr_mech_head_inv,		20,	10, "Description goes here.",	[MegaAttack, 1]);
	BasicLeftArm		= new AttachmentType("Basic Left Arm",	MECH_PART.LEFT_ARM,		spr_mech_left_arm_inv,	20,	10, "Description goes here.",	[BasicAttack, 2]);
	BasicRightArm		= new AttachmentType("Basic Right Arm",	MECH_PART.RIGHT_ARM,	spr_mech_right_arm_inv,	20,	10, "Description goes here.",	[BasicAttack, 2]);
	BasicLeftLeg		= new AttachmentType("Basic Left Leg",	MECH_PART.LEFT_LEG,		spr_mech_left_leg_inv,	20,	10, "Description goes here.",	[BasicDefend, 1]);
	BasicRightLeg		= new AttachmentType("Basic Right Leg",	MECH_PART.RIGHT_LEG,	spr_mech_right_leg_inv,	20,	10, "Description goes here.",	[BasicDefend, 1]);
}