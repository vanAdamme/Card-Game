draw_self();
draw_set_colour(c_red);
if is_active_card()
{
	draw_rectangle_thick(x, y, x + sprite_width, y + sprite_height, c_red, 4);
}

draw_set_colour(c_white);
draw_set_font(fnt_Futured);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text(x + 90, y + 18, title);

draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_text(x + 30, y + 124, string(attack_val_m));
draw_text(x + 40, y + 138, string(attack_val_sd));

draw_text(x + 30, y + 159, string(defend_val_m));
draw_text(x + 40, y + 173, string(defend_val_sd));

draw_text(x + 30, y + 194, string(support_val_m));
draw_text(x + 40, y + 207, string(support_val_sd));