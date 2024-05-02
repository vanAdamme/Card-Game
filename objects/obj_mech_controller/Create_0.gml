assign_card_types();
assign_attachment_types();

core		= create_mech_attachment(StrongCore);
head		= create_mech_attachment(BasicHead);
left_arm	= create_mech_attachment(StrongLeftArm);
right_arm	= create_mech_attachment(StrongRightArm);
left_leg	= create_mech_attachment(BasicLeftLeg);
right_leg	= create_mech_attachment(BasicRightLeg);

attachment_slots = [core, head, left_arm, right_arm, left_leg, right_leg];