function create_attachments()
{
	Basic_Core			= new AttachmentType("Basic Core",		ATTACHMENT_TYPE.CORE,		[BasicSupport, 2], [BasicAttack, 1]);
	Basic_Head			= new AttachmentType("Basic Head",		ATTACHMENT_TYPE.HEAD,		[BasicDefend, 1]);
	Basic_Left_Arm		= new AttachmentType("Basic Left Arm",	ATTACHMENT_TYPE.LEFT_ARM,	[BasicAttack, 2]);
	Basic_Right_Arm		= new AttachmentType("Basic Right Arm",	ATTACHMENT_TYPE.RIGHT_ARM,	[BasicAttack, 2]);
	Basic_Left_Leg		= new AttachmentType("Basic Left Leg",	ATTACHMENT_TYPE.LEFT_LEG,	[BasicDefend, 1]);
	Basic_Right_Leg		= new AttachmentType("Basic Right Leg",	ATTACHMENT_TYPE.RIGHT_LEG,	[BasicDefend, 1]);
}