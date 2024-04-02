function create_attachments()
{
	BasicCore			= new AttachmentType("Basic Core",		20, [BasicSupport, 2], [BasicAttack, 1]);
	BasicHead			= new AttachmentType("Basic Head",		10, [BasicDefend, 1]);
	BasicLeftArm		= new AttachmentType("Basic Left Arm",	10, [BasicAttack, 2]);
	BasicRightArm		= new AttachmentType("Basic Right Arm",	10, [BasicAttack, 2]);
	BasicLeftLeg		= new AttachmentType("Basic Left Leg",	10, [BasicDefend, 1]);
	BasicRightLeg		= new AttachmentType("Basic Right Leg",	10, [BasicDefend, 1]);
}