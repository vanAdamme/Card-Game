//checks for a double-click with the left mouse button and a quarter-second delay
if mouse_check_doubleclick(mb_left, DOUBLE_CLICK_DELAY) && position_meeting(mouse_x, mouse_y, id) && clickable
{
	if card_on_top() { flip_card(); }
}


/*

//mouse drag and drop
if (!drag)
{
   if mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id) && card_on_top() && clickable
   {
	   if is_active_card()
	   {
		   set_active_card(false);
	   }
	   else
	   {
			set_active_card(true);
			drag = true;
			mx = x - mouse_x;
			my = y - mouse_y;
	   }
	}
}
else
{
	x = mouse_x + mx;
	y = mouse_y + my;
	if !mouse_check_button(mb_left)
	{
		drag = false;
	}
}



///Collision
collide = instance_place(x, y, all);
if is_active_card() && collide != noone
{
	if object_get_parent(collide.object_index) == objCardParent
	{
		put_on_top();
	}
}