//shop variables
shopOpen = false;
global.shop = false;

global.inv = ds_list_create();
global.money = 100;

selected = 0;

//items
items = ds_list_create();

ds_list_add(items, ["item_1", 20, "This is a blue circle."]);
ds_list_add(items, ["item_2", 30, "This is a green circle."]);
ds_list_add(items, ["item_3", 40, "This is a pink circle."]);

itemCount = ds_list_size(items);

//GUI properties
display_set_gui_size(room_width, room_height);
guiWidth = display_get_gui_width();
guiHeight = display_get_gui_height();

menuWidth = guiWidth * 0.3;
menuMargin = guiWidth * 0.1;

previewWidth = guiWidth - (menuWidth + menuMargin);