draw_self();

if surface_exists(obj_surface.surface)
{
	surface_set_target(obj_surface.surface);

	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);

	surface_reset_target();
}

if !surface_exists(obj_surface.surface)
{
	obj_surface.surface = surface_create(room_width, room_height);
}