function draw_rectangle_thick(x1, y1, x2, y2, colour, width)
{
	draw_set_color(colour);

	draw_rectangle(x1, y1, x2, y2, true);

	var _i = 0;

	do
	{
	    _i++;
	    draw_rectangle(x1 - _i, y1 - _i ,x2 + _i,y2 + _i, true);
	}
	until (_i == width);
}