//shop variables
selected = 0;

//items
items = obj_player.inventory;

itemCount = array_length(items);

//GUI properties
display_set_gui_size(room_width, room_height);
guiWidth = display_get_gui_width();
guiHeight = display_get_gui_height();

menuWidth = guiWidth * 0.3;
menuMargin = guiWidth * 0.1;

previewWidth = guiWidth - (menuWidth + menuMargin);