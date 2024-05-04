draw_self();

if isShowingMenu {
	//pause the game
	draw_set_colour(c_black);
	draw_set_alpha(0.75);
	draw_rectangle(0, 0, room_width, room_height, false);

	//back of inventory
	draw_set_alpha(1);
	draw_sprite(spr_inventory_back, 0, CameraX() + 175, CameraMiddleY());

	//items
	for (var _i = 0; _i < ds_grid_width(myItems); _i++) {
		var _itemX = CameraX() + 81 + (_i * itemSeparation);
		var _itemY = CameraY() + 411;
		var _sprite = object_get_sprite(myItems[# _i, Item.Object]);

			//check for additional rows needed
			if _i >= menuWidth && _i < menuWidth * 2 {
				_itemX = CameraX() + 81 + ((_i - menuWidth) * itemSeparation);
				_itemY = CameraY() + 411;
			}

			if _i >= menuWidth * 2 && _i < menuWidth * 3 {
				//do stuff here for new row
			}

		draw_sprite_ext(_sprite, 0, _itemX, _itemY, itemScale, itemScale, 0, c_white, 1);

		//check if mouse is hovering over an item
		if point_in_rectangle(mouse_x, mouse_y, _itemX - (spriteWidth * itemScale / 2), _itemY - (spriteHeight * itemScale / 2), _itemX + (spriteWidth * itemScale / 2), _itemY + (spriteHeight * itemScale / 2)) {
			draw_set_alpha(0.25);
			draw_set_colour(c_blue);
			draw_rectangle(_itemX - (spriteWidth * itemScale / 2), _itemY - (spriteHeight * itemScale / 2), _itemX + (spriteWidth * itemScale / 2), _itemY + (spriteHeight * itemScale / 2), false);
			draw_set_alpha(1);
			currentItemSlot = _i;

			//draw item info
			if !instance_exists(myItems[# _i, Item.Object]) && !draggingItem {
				currentItem = instance_create_layer(-32, -32, "Inventory", myItems[# _i, Item.Object]);
				currentItem.price = myItems[# _i, Item.Price];
				currentItem.type = myItems[# _i, Item.Type];
				currentItem.name = myItems[# _i, Item.Name];
				currentItem.isInMenu = true;
				if showingDescription {
					currentItem.isShowingInfo = true;
				}
			}

			//clicked on an item?
			if mouse_check_button_pressed(mb_left) && !showingDescription {
				sequence = layer_sequence_create("Inventory", CameraMiddleX(), CameraMiddleY(), sq_description_animation);
			}
		}
	}

	//Dragging system
	if mouse_check_button(mb_middle) {
		draggedItem = instance_find(obj_item_parent, 0);
		draggedItem.x = mouse_x;
		draggedItem.y = mouse_y;
		draggedItem.visible = true;
		draggedItem.image_xscale = itemScale;
		draggedItem.image_yscale = itemScale;
		draggingItem = true;
	}

	if mouse_check_button_pressed(mb_middle) {
		draggedItemSlot = currentItemSlot;
	}

	if mouse_check_button_released(mb_middle) {
		draggedItem.x = -100;
		draggedItem.y = -100;
		draggingItem = false;
		alarm[0] = 1;
	}
		
	if point_in_rectangle(mouse_x, mouse_y, CameraX() + 1535, CameraY() + 320, CameraX() + 1575, CameraY() + 355) {
		if mouse_check_button_pressed(mb_left) {
			 layer_sequence_headdir(sequence, seqdir_left);
			 layer_sequence_play(sequence);
			 showingDescription = false;
		}
	}

	//ensure only 1 item exists at a time
	if instance_number(obj_item_parent) > 1 {
		instance_destroy(obj_item_parent);
	}

	//front of inventory
	draw_sprite(spr_inventory_front, 0, CameraX() + 175, CameraMiddleY() + 20);
}