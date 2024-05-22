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

#region
	//items
	for (var _i = 0; _i < ds_grid_width(_currentItems); _i++) {
		itemRow = _i div menuWidth;
		itemCol = _i mod menuHeight;

		itemX = frontX + itemStartX + (itemCol * itemSeparation);
		itemY = frontY + itemStartY + (itemRow * itemSeparation);

		sprite = object_get_sprite(_currentItems[# _i, Item.InvObject]);

		draw_sprite_ext(sprite, 0, itemX, itemY, itemScale, itemScale, 0, c_white, 1);

		//amount
		draw_set_color(c_white);
		draw_set_halign(fa_right);
		draw_set_alpha(1);
		draw_set_font(fnt_futured_12);
		draw_text(itemX + amountOffsetX, itemY + amountOffsetY, obj_player.myItems[# _i, Item.Amount]);
		draw_set_halign(fa_left);

		//check if mouse is hovering over an item
		if point_in_rectangle(mouse_x, mouse_y, itemX, itemY, itemX + (spriteWidth * itemScale), itemY + (spriteHeight * itemScale)) {
			draw_set_alpha(0.25);
			draw_set_colour(c_blue);
			draw_rectangle(itemX, itemY, itemX + (spriteWidth * itemScale), itemY + (spriteHeight * itemScale), false);
			draw_set_alpha(1);
			currentItemSlot = _i;

			//draw item info
			if !instance_exists(_currentItems[# _i, Item.InvObject]) && !draggingItem && !itemLocked {
				currentItem = instance_create_layer(-32, -32, "Inventory", _currentItems[# _i, Item.InvObject]);
				currentItem.type = _currentItems[# _i, Item.Type];
				currentItem.title = _currentItems[# _i, Item.Title];
				currentItem.price = _currentItems[# _i, Item.Price];
				//currentItem.parent = _currentItems[# _i, Item.ParentObject];
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
#endregion

	//draw locked item
	if itemLocked {
		draw_set_alpha(0.5);
		draw_set_colour(c_red);
		draw_rectangle(lockedItemX, lockedItemY, lockedItemX + 32, lockedItemY + 32, false);
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

	//front of inventory
	draw_sprite(spr_inventory_front, 0, frontX, frontY);

	//sort type
	draw_set_alpha(1);
	draw_set_colour(c_white);
	draw_set_font(fnt_futured_12);
	switch sortType {
		case SortType.Title:
			var _string = "Sorting by name";
		break;
		case SortType.Amount:
			var _string = "Sorting by amount";
		break;
		case SortType.Price:
			var _string = "Sorting by price";
		break;
		case SortType.Type:
			var _string = "Sorting by type";
		break;
	}
	draw_text(sortOffsetX, sortOffsetY, _string);
			
	//press button
	if point_in_rectangle(mouse_x, mouse_y, CameraX() + 440, CameraY() + 435, CameraX() + 520, CameraY() + 470) && mouse_check_button_pressed(mb_left) {
		show_message("Button pressed.");
	}
}