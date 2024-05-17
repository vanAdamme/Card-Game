assign_card_types();
assign_attachment_types();

core		= create_mech_attachment(BasicCore);
head		= create_mech_attachment(BasicHead);
left_arm	= create_mech_attachment(BasicLeftArm);
right_arm	= create_mech_attachment(BasicRightArm);
left_leg	= create_mech_attachment(BasicLeftLeg);
right_leg	= create_mech_attachment(BasicRightLeg);

//strongcore		= create_mech_attachment(StrongCore);
//stronghead		= create_mech_attachment(StrongHead);
//strongleft_arm	= create_mech_attachment(StrongLeftArm);
//strongright_arm	= create_mech_attachment(StrongRightArm);
//strongleft_leg	= create_mech_attachment(StrongLeftLeg);
//strongright_leg	= create_mech_attachment(StrongRightLeg);

attachment_slots = [core, head, left_arm, right_arm, left_leg, right_leg];