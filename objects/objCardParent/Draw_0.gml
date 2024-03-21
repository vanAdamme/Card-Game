draw_self();

var xx = bbox_left;
var yy = bbox_top;

if is_active_card()
{
	draw_rectangle_thick(xx, yy, xx + sprite_width, yy + sprite_height, c_red, 4);
}

if sprite_index == values.face
{
	draw_set_colour(c_white);
	draw_set_font(fnt_Futured);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);

	draw_text(xx + 90, yy + 18, values.title);

	draw_set_halign(fa_left);
	draw_set_valign(fa_top);

	draw_text(xx + 30, yy + 124, string(values.attack_val_m));
	draw_text(xx + 40, yy + 138, string(values.attack_val_sd));

	draw_text(xx + 30, yy + 159, string(values.defend_val_m));
	draw_text(xx + 40, yy + 173, string(values.defend_val_sd));

	draw_text(xx + 30, yy + 194, string(values.support_val_m));
	draw_text(xx + 40, yy + 207, string(values.support_val_sd));

	for (var i = 0; i < values.xp_to_level; i++)
	{
		draw_rectangle(xx + 22 + 10 * i, yy + 230, xx + 27 + 10 * i, yy + 247, true);
	}

	draw_set_colour(c_green);

	for (var i = 0; i < values.current_xp; i++)
	{
		draw_rectangle(xx + 23 + 10 * i, yy + 231, xx + 26 + 10 * i, yy + 246, false);
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
