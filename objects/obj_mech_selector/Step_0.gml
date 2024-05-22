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

//add item
var _item = items[selected];

if keyboard_check_pressed(vk_enter) {

//add to mech

}