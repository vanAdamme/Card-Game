//open shop method
if keyboard_check_pressed(vk_space) {
	if !shopOpen {
		shopOpen = true;
		global.shop = true;
	} else {
		shopOpen = false;
		global.shop = false;
	}
}

//shop is open
if shopOpen {
	//check for active selection
	if keyboard_check_pressed(vk_down) {
		selected++;
		if selected == itemCount {
			selected = 0;
		}
	}
	if keyboard_check_pressed(vk_up) {
		selected--;
		if selected < 0 {
			selected = itemCount - 1;
		}
	}

	//buy item
	var _arr = items[| selected];
	var _item = _arr[0];
	var _price = _arr[1];
	
	if keyboard_check_pressed(vk_enter) {
		//add item to inventory
		ds_list_add(global.inv, _item);
		global.money -= _price;
	}
}

