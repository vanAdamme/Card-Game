function create_attachments()
{
	BasicCore			= new AttachmentType("Basic Core",		ATTACHMENT_TYPE.CORE,		[BasicSupport, 2], [BasicAttack, 1]);
	BasicHead			= new AttachmentType("Basic Head",		ATTACHMENT_TYPE.HEAD,		[BasicDefend, 1]);
	BasicLeftArm		= new AttachmentType("Basic Left Arm",	ATTACHMENT_TYPE.LEFT_ARM,	[BasicAttack, 2]);
	BasicRightArm		= new AttachmentType("Basic Right Arm",	ATTACHMENT_TYPE.RIGHT_ARM,	[BasicAttack, 2]);
	BasicLeftLeg		= new AttachmentType("Basic Left Leg",	ATTACHMENT_TYPE.LEFT_LEG,	[BasicDefend, 1]);
	BasicRightLeg		= new AttachmentType("Basic Right Leg",	ATTACHMENT_TYPE.RIGHT_LEG,	[BasicDefend, 1]);
}