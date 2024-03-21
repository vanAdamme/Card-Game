function lerp_approach(_previous, _current, _target, _ratio, _min = 0.33)
{
    _current = lerp(_current, _target, _ratio);
    var ret = _current;
	var mov = _previous - _current;

    if (abs(mov) < _min)
    {
        _current -= sign(_previous - _current) * _min;

        if (sign(_previous - _current) != sign(_current - _target))
            ret = _target;
        else
            ret = _current;
    }

    return ret;
}