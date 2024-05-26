event_inherited();

//pubsub_publish("mech attachments chosen", id);
obj_mech.selected = true;
obj_mech.chosen = obj_mech_selector.chosen;
room_goto(rm_battle);