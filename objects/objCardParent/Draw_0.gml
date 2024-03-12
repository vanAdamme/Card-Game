draw_self();
draw_set_colour(c_red);
if is_active_card()
{
	draw_rectangle_thick(x, y, x + sprite_width, y + sprite_height, c_red, 4);
}