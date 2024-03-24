draw_self();

if is_active_card()
{
	draw_rectangle_thick(bbox_left, bbox_top, bbox_left + sprite_width, bbox_top + sprite_height, c_red, 4);
}

if face_up()
{
	for (var _i = 0; _i < data.cost; _i++)
	{
		scribble("[c_white][spr_energy, 0]").draw(bbox_left + 20 + (14 * _i), bbox_top + 15);
	}

	draw_set_colour(c_white);
	draw_set_font(fnt_futured_12);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);

	scribble("[fnt_futured_24][c_white][fa_center][fa_middle]" + data.title).scale_to_box(150, 50).draw(x, y + 80);
/*
	draw_text_scribble(bbox_left + 30, bbox_top + 124, data.attack_val_m);
	draw_text_scribble(bbox_left + 40, bbox_top + 138, data.attack_val_sd);

	draw_text_scribble(bbox_left + 30, bbox_top + 159, data.defend_val_m);
	draw_text_scribble(bbox_left + 40, bbox_top + 173, data.defend_val_sd);

	draw_text_scribble(bbox_left + 30, bbox_top + 194, data.support_val_m);
	draw_text_scribble(bbox_left + 40, bbox_top + 207, data.support_val_sd);
*/
	scribble("[fnt_futured_12][c_white][fa_center][fa_middle]" + data.text).scale_to_box(154, 25).draw(x, bbox_top + 239);

	for (var _i = 0; _i < data.xp_to_level; _i++)
	{
		var _x1 = bbox_right - card_border - (xp_box_width * (_i + 1)) - (_i * xp_box_border);
		var _x2 = bbox_right - card_border - ((xp_box_width + xp_box_border) * _i);
		draw_rectangle(_x1, y + 10, _x2, y + 10 + xp_box_height, true);
	}

	draw_set_colour(c_green);

	for (var _i = data.xp_to_level - 1; _i >= data.xp_to_level - data.current_xp; _i--)
	{
		var _x1 = bbox_right - card_border - (xp_box_width * (_i + 1)) - (_i * xp_box_border) + 1;
		var _x2 = bbox_right - card_border - ((xp_box_width + xp_box_border) * _i) - 1;
		draw_rectangle(_x1, y + 11, _x2, y + 9 + xp_box_height, false);
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