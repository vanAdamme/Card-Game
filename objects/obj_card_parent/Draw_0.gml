draw_self();

if is_active_card()
{
	draw_rectangle_thick(bbox_left, bbox_top, bbox_left + sprite_width, bbox_top + sprite_height, c_red, 4);
}

if face_up()
{
	for (var _i = 0; _i < cost; _i++)
	{
		scribble("[c_white][spr_energy, 0]").draw(bbox_left + 20 + (14 * _i), bbox_top + 15);
	}

	draw_set_colour(c_white);
	draw_set_font(fnt_futured_12);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);

	if !disabled
	{
		scribble("[fnt_futured_24][c_white][fa_center][fa_middle]" + title).scale_to_box(150, 50).draw(x, y + 80);
		scribble("[fnt_futured_12][c_white][fa_center][fa_middle]" + text).scale_to_box(154, 25).draw(x, bbox_top + 239);
	}
	else
	{
	scribble("[fnt_futured_24][c_grey][fa_center][fa_middle]" + title).scale_to_box(150, 50).draw(x, y + 80);
	scribble("[fnt_futured_12][c_grey][fa_center][fa_middle]" + text).scale_to_box(154, 25).draw(x, bbox_top + 239);
	}

	for (var _i = 0; _i < xp_to_level; _i++)
	{
		var _x1 = bbox_right - card_border - (xp_box_width * (_i + 1)) - (_i * xp_box_border);
		var _x2 = bbox_right - card_border - ((xp_box_width + xp_box_border) * _i);
		draw_rectangle(_x1, y + 10, _x2, y + 10 + xp_box_height, true);
	}

	draw_set_colour(c_green);

	for (var _i = xp_to_level - 1; _i >= xp_to_level - current_xp; _i--)
	{
		var _x1 = bbox_right - card_border - (xp_box_width * (_i + 1)) - (_i * xp_box_border) + 1;
		var _x2 = bbox_right - card_border - ((xp_box_width + xp_box_border) * _i) - 1;
		draw_rectangle(_x1, y + 11, _x2, y + 9 + xp_box_height, false);
	}
}


if fsm.state_is("moving_to_deal_pile")
{
	x = lerp_approach(xprevious, x, x_target, spd);
	y = lerp_approach(yprevious, y, y_target, spd);

	if x == x_target && y == y_target
	{
		fsm.change("in_deck");
//		depth = obj_deck_spot.depth + array_get_index(obj_deck_controller..deal_pile, data);
	}
}

if fsm.state_is("discarding")
{
	x = lerp_approach(xprevious, x, x_target, spd);
	y = lerp_approach(yprevious, y, y_target, spd);
	
	if x == x_target && y == y_target
	{
		fsm.change("discarded");
	}
}

if fsm.state_is("dealing")
{
	x = lerp_approach(xprevious, x, x_target, spd);
	y = lerp_approach(yprevious, y, y_target, spd);

	if x == x_target && y == y_target
	{
		fsm.change("dealt");
	}
}