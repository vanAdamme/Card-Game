if (mouse_check_button(mb_left))
{
    if (drag_object != noone)
    {
        drag_object.x = mouse_x + xrelative;
        drag_object.y = mouse_y + yrelative;
    }
}