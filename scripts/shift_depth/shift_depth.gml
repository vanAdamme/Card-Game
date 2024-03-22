function shift_depth(_object)
{
    if (instance_exists(obj_card_parent))
    {
        if (_object.depth == TOPPEST_CARD)
            exit;

        _object.depth = TOPPEST_CARD;
        with(obj_card_parent)
        {
            if (id == _object)
                continue;

            depth++;
        }
    }
}