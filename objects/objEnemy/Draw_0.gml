draw_self();

draw_set_font(fnt_8bitoperatorBig);
draw_set_colour(c_black);

draw_text(x + 200, y, "Enemy HP: " + string(current_hp));
draw_text(x + 200, y + 100, "Enemy defence: " + string(current_defence));