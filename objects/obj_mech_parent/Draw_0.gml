draw_self();

draw_set_font(fnt_futured_18);
draw_set_colour(c_red);
var _text = title + ": " + string(current_hp);
draw_text(x, y, _text);