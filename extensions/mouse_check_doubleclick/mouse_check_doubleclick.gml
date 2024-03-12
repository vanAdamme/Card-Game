#define mouse_check_doubleclick_timer
/// @description mouse_check_doubleclick_timer(mouse_button, delay_microseconds)
/// @param mouse_button
/// @param  delay_microseconds
if mouse_check_button_pressed(argument0)
{
    if (csanyk_prev_click_time == -1) 
    {
        csanyk_prev_click_time = get_timer();
    }
    else 
    {
        if ((get_timer() - csanyk_prev_click_time) < argument1) 
        {
            csanyk_prev_click_time = -1;
            return true;
        }
		else
		{
		    csanyk_prev_click_time = -1;
		}
    }
}
if (csanyk_prev_click_time != -1)
{
    if ((get_timer() - csanyk_prev_click_time) > argument1)
	{
		csanyk_prev_click_time = -1;
	}
}
return false;

