function shift_depth(_object)
{
    if (instance_exists(objCardParent))
    {
        if (_object.depth == TOPPEST_CARD)
            exit;

        _object.depth = TOPPEST_CARD;
        with(objCardParent)
        {
            if (id == _object)
                continue;

            depth++;
        }
    }
}