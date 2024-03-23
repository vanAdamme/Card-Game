draw_self();

var _xx = bbox_left;
var _yy = bbox_top;

if is_active_card()
{
	draw_rectangle_thick(_xx, _yy, _xx + sprite_width, _yy + sprite_height, c_red, 4);
}

if sprite_index == data.face
{
	draw_set_colour(c_white);
	draw_set_font(fnt_futured);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);

	draw_text(_xx + 90, _yy + 18, data.title);

	draw_set_halign(fa_left);
	draw_set_valign(fa_top);

	draw_text(_xx + 30, _yy + 124, string(data.attack_val_m));
	draw_text(_xx + 40, _yy + 138, string(data.attack_val_sd));

	draw_text(_xx + 30, _yy + 159, string(data.defend_val_m));
	draw_text(_xx + 40, _yy + 173, string(data.defend_val_sd));

	draw_text(_xx + 30, _yy + 194, string(data.support_val_m));
	draw_text(_xx + 40, _yy + 207, string(data.support_val_sd));

	for (var _i = 0; _i < data.xp_to_level; _i++)
	{
		draw_rectangle(_xx + 22 + 10 * _i, _yy + 230, _xx + 27 + 10 * _i, _yy + 247, true);
	}

	draw_set_colour(c_green);

	for (var _i = 0; _i < data.current_xp; _i++)
	{
		draw_rectangle(_xx + 23 + 10 * _i, _yy + 231, _xx + 26 + 10 * _i, _yy + 246, false);
	}
}

if fsm.state_is("moving to deck")
{
	x = lerp_approach(xprevious, x, x_target, 0.2);
	y = lerp_approach(yprevious, y, y_target, 0.2);

	if x == x_target && y == y_target
	{
		fsm.change("in deck");
	}
}

if fsm.state_is("discarding")
{
	x = lerp_approach(xprevious, x, x_target, 0.2);
	y = lerp_approach(yprevious, y, y_target, 0.2);
	
	if x == x_target && y == y_target
	{
		fsm.change("discarded");
	}
}

if fsm.state_is("dealing")
{
	x = lerp_approach(xprevious, x, x_target, 0.2);
	y = lerp_approach(yprevious, y, y_target, 0.2);

	if x == x_target && y == y_target
	{
		fsm.change("dealt");
	}
}
