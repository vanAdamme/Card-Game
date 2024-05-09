draw_self();

if isShowingMenu {
	//pause the game
	draw_set_colour(c_black);
	draw_set_alpha(0.75);
	draw_rectangle(0, 0, room_width, room_height, false);

	//back of inventory
	draw_set_alpha(1);
	draw_sprite(spr_inventory_back, 0, backX, backY);

	var _currentItems = obj_player.myItems;

	//items
	for (var _i = 0; _i < ds_grid_width(_currentItems); _i++) {
		itemRow = _i div menuWidth;
		itemCol = _i mod menuHeight;

		itemX = itemStartX + (itemCol * itemSeparation);
		itemY = frontY + itemStartY + (itemRow * itemSeparation);

		sprite = object_get_sprite(_currentItems[# _i, Item.InvObject]);

		draw_sprite_ext(sprite, 0, itemX, itemY, itemScale, itemScale, 0, c_white, 1);

//if _i = 0 {
//	show_debug_message("itemX = " + string(itemX));
//	show_debug_message("itemY = " + string(itemY));
//	show_debug_message("itemRow = " + string(itemRow));
//	show_debug_message("itemCol = " + string(itemCol));
//}
		//amount
		draw_set_color(c_white);
		draw_set_alpha(1);
		draw_set_font(fnt_futured_12);
		draw_text(itemX - 14, itemY + 2, obj_player.myItems[# _i, Item.Amount]);

		//check if mouse is hovering over an item
		if point_in_rectangle(mouse_x, mouse_y, itemX - (spriteWidth * itemScale / 2), itemY - (spriteHeight * itemScale / 2), itemX + (spriteWidth * itemScale / 2), itemY + (spriteHeight * itemScale / 2)) {
			draw_set_alpha(0.25);
			draw_set_colour(c_blue);
			draw_rectangle(itemX - (spriteWidth * itemScale / 2), itemY - (spriteHeight * itemScale / 2), itemX + (spriteWidth * itemScale / 2), itemY + (spriteHeight * itemScale / 2), false);
			draw_set_alpha(1);
			currentItemSlot = _i;

			//draw item info
			if !instance_exists(_currentItems[# _i, Item.InvObject]) && !draggingItem && !itemLocked {
				currentItem = instance_create_layer(-32, -32, "Inventory", _currentItems[# _i, Item.InvObject]);
				currentItem.type = _currentItems[# _i, Item.Type];
				currentItem.title = _currentItems[# _i, Item.Title];
				currentItem.price = _currentItems[# _i, Item.Price];
				currentItem.parent = _currentItems[# _i, Item.ParentObject];
				currentItem.isInMenu = true;
				if showingDescription {
					currentItem.isShowingInfo = true;
				}
			}

			//clicked on an item?
			if mouse_check_button_pressed(mb_left) && !showingDescription {
				sequence = layer_sequence_create("Inventory", CameraMiddleX(), CameraMiddleY(), sq_description_animation);
			}
			
			//lock item
			if mouse_check_button_pressed(mb_right) && !itemLocked && showingDescription {
				itemLocked = true;
				lockedItemX = itemX;
				lockedItemY = itemY;
			}
			else if mouse_check_button_pressed(mb_right) && itemLocked {
				itemLocked = false;
			}
		}
	}

	//draw locked item
	if itemLocked {
		draw_set_alpha(0.5);
		draw_set_colour(c_red);
		draw_rectangle(lockedItemX - 16, lockedItemY - 16, lockedItemX +16, lockedItemY + 16, false);
		draw_set_alpha(1);
	}

	//Dragging system
	if mouse_check_button(mb_middle) {
		draggedItem = instance_find(obj_inventory_item_parent, 0);
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

	//exit description
	if point_in_rectangle(mouse_x, mouse_y, CameraX() + 1535, CameraY() + 320, CameraX() + 1575, CameraY() + 355) {
		if mouse_check_button_pressed(mb_left) {
			 layer_sequence_headdir(sequence, seqdir_left);
			 layer_sequence_play(sequence);
			 showingDescription = false;
			 instance_destroy(obj_inventory_item_parent);
		}
	}

	//ensure only 1 item exists at a time
	if instance_number(obj_inventory_item_parent) > 1 {
		instance_destroy(obj_inventory_item_parent);
	}
/*
	//locked item slots
	for (var _i = obj_player.inventorySize; _i < (menuHeight * menuWidth); _i++) {
		itemX = CameraX() + 81 + (_i * itemSeparation);
		itemY = CameraY() + 411;
		sprite = spr_locked_icon;

		//check for additional rows needed
		if _i >= menuWidth && _i < menuWidth * 2 {
			itemX = CameraX() + 81 + ((_i - menuWidth) * itemSeparation);
			itemY = CameraY() + 447;
			//show_message(string(itemX) + ", " + string(itemY));
		}

		if _i >= menuWidth * 2 && _i < menuWidth * 3 {
			itemX = CameraX() + 81 + ((_i - menuWidth * 2) * itemSeparation);
			itemY = CameraY() + 483;
		}

		if _i >= menuWidth * 3 && _i < menuWidth * 4 {
			itemX = CameraX() + 81 + ((_i - menuWidth * 3) * itemSeparation);
			itemY = CameraY() + 519;
		}

		if _i >= menuWidth * 4 && _i < menuWidth * 5 {
			itemX = CameraX() + 81 + ((_i - menuWidth * 4) * itemSeparation);
			itemY = CameraY() + 555;
		}

		if _i >= menuWidth * 5 && _i < menuWidth * 6 {
			itemX = CameraX() + 81 + ((_i - menuWidth * 5) * itemSeparation);
			itemY = CameraY() + 591;
		}

		if _i >= menuWidth * 6 && _i < menuWidth * 7 {
			itemX = CameraX() + 81 + ((_i - menuWidth * 6) * itemSeparation);
			itemY = CameraY() + 627;
		}

		if _i >= menuWidth * 7 && _i < menuWidth * 8 {
			itemX = CameraX() + 81 + ((_i - menuWidth * 7) * itemSeparation);
			itemY = CameraY() + 663;
		}

		draw_sprite_ext(sprite, 0, itemX, itemY, 0.5, 0.5, 0, c_white, 0.5);
	}
*/
	//front of inventory
	draw_sprite(spr_inventory_front, 0, frontX, frontY);

	//sort type
	draw_set_alpha(1);
	draw_set_colour(c_white);
	draw_set_font(fnt_futured_12);
	if sortType == SortType.Title {
		draw_text(CameraX() + 50, CameraY() + 725, "Sorting by name");
	}
	if sortType == SortType.Amount {
		draw_text(CameraX() + 50, CameraY() + 725, "Sorting by amount");
	}
	if sortType == SortType.Price {
		draw_text(CameraX() + 50, CameraY() + 725, "Sorting by price");
	}
	if sortType == SortType.Type {
		draw_text(CameraX() + 50, CameraY() + 725, "Sorting by type");
	}

	//press button
	if point_in_rectangle(mouse_x, mouse_y, CameraX() + 440, CameraY() + 435, CameraX() + 520, CameraY() + 470) && mouse_check_button_pressed(mb_left) {
		show_message("Button pressed.");
	}
}