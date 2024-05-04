/// @description Swap items

var _tempGrid = ds_grid_create(1, Item.Height);

//save the item we're hovering over to temp
ds_grid_set_grid_region(_tempGrid, myItems, currentItemSlot, 0, currentItemSlot, Item.Height, 0, 0);

//replace item we're hovering over
ds_grid_set_grid_region(myItems, myItems, draggedItemSlot, 0, draggedItemSlot, Item.Height, currentItemSlot, 0);

//replace item we dragged with item we were just hovering over
ds_grid_set_grid_region(myItems, _tempGrid, 0, 0, 0, Item.Height, draggedItemSlot, 0);

ds_grid_destroy(_tempGrid);