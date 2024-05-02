function AttachmentType(_title, _type, _inv_sprite, _hp, _price, _description) constructor
{
	title = _title;
	type = _type;
	inv_sprite = _inv_sprite;
	hp = _hp;
	price = _price;
	description = _description;
	
	stdParameters = 6;
	
	cards_in_attachment = array_create(argument_count - stdParameters); //the "4" refers to how many parameters there are before the cards appear

	for (var _i = 0; _i < argument_count - stdParameters; _i++)
	{
		cards_in_attachment[_i] = [argument[_i + stdParameters][0], argument[_i + stdParameters][1]];
	}
}

/*
function Attachment() constructor
{
	slot = [];
	max_hp = 0;
	current_hp = 0;
	title = "";
	mech_obj = noone;

	//static add_card = function(_card)
	//{
	//	array_push(slot, _card);
	//}

	//static add_to_deck = function(_deck)
	//{
	//	with(_deck)
	//	{
	//		array_for_each(other.slot, add_to_deck);
	//	}
	//}

	static remove_from_mech = function()
	{
		instance_destroy(mech_obj);	
	}
}