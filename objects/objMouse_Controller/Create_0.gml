drag_object = noone;
xrelative = 0;
yrelative = 0;

// Create a sort depth to start with
start_depth = TOPPEST_CARD;
with (objCardParent)
{
    depth = other.start_depth;
    other.start_depth++;
}