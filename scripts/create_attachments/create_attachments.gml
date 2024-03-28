function create_attachments()
{
	Core			= new AttachmentType("Core",		[BasicSupport, 2], [BasicAttack, 1]);
	Head			= new AttachmentType("Head",		[BasicDefend, 1]);
	LeftArm			= new AttachmentType("Left Arm",	[BasicAttack, 2]);
	RightArm		= new AttachmentType("Right Arm",	[BasicAttack, 2]);
	LeftLeg			= new AttachmentType("Left Leg",	[BasicDefend, 1]);
	RightLeg		= new AttachmentType("Right Leg",	[BasicDefend, 1]);
}