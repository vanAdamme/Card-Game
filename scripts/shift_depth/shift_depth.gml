function shift_depth(top_object)
{
    if (instance_exists(objCardParent))
    {
        if (top_object.depth == 0)
            exit;

        top_object.depth = 0;
        with(objCardParent)
        {
            if (id == top_object)
                continue;

            depth++;
        }
    }
}