function create_attachments()
{
	BasicCore			= new AttachmentType("Basic Core",		MECH_PART.CORE,			[BasicSupport, 2], [BasicAttack, 1]);
	BasicHead			= new AttachmentType("Basic Head",		MECH_PART.HEAD,			[MegaAttack, 1]);
	BasicLeftArm		= new AttachmentType("Basic Left Arm",	MECH_PART.LEFT_ARM,		[BasicAttack, 2]);
	BasicRightArm		= new AttachmentType("Basic Right Arm",	MECH_PART.RIGHT_ARM,	[BasicAttack, 2]);
	BasicLeftLeg		= new AttachmentType("Basic Left Leg",	MECH_PART.LEFT_LEG,		[BasicDefend, 1]);
	BasicRightLeg		= new AttachmentType("Basic Right Leg",	MECH_PART.RIGHT_LEG,	[BasicDefend, 1]);
}