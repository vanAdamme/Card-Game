//myItems = ds_grid_create(0, Item.Height);

isShowingMenu = false;
showingDescription = false;

currentItem = undefined;
currentItemSlot = undefined;
sequence = undefined;

backX = CameraX() + 475;
backY = CameraMiddleY() - 200;
frontX = backX + 8;
frontY = backY + 52;

menuWidth = 6;
menuHeight = 8;
itemSeparation = 38;
itemScale = 2;
sortType = SortType.Title;
spriteHeight = 16;
spriteWidth = 16;
itemStartX = 20;
itemStartY = 16;
amountOffsetX = 10;
amountOffsetY = 10;
sortOffsetX = frontX + 12;
sortOffsetY = frontY + 340;

draggedItem = undefined;
draggingItem = false;
draggedItemSlot = undefined;

itemLocked = false;
lockedItemX = undefined;
lockedItemY = undefined;

//maxInventorySlots = obj_player.inventorySize;

//prevState = undefined;