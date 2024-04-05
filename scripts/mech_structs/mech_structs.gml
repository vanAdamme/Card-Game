function AttachmentType(_title, _type) constructor
{
	title = _title;
	type = _type;
	cards_in_attachment = array_create(argument_count - 2);

	for (var _i = 0; _i < argument_count - 2; _i++)
	{
		cards_in_attachment[_i] = [argument[_i + 2][0], argument[_i + 2][1]];
	}
}

function Attachment() constructor
{
	slot = [];
	max_hp = 0;
	current_hp = 0;
	title = "";
	mech_obj = noone;

	static add_card = function(_card)
	{
		array_push(slot, _card);
	}

	static add_to_deck = function(_deck)
	{
		with(_deck)
		{
			array_for_each(other.slot, add_to_deck);
		}
	}

	static remove_from_mech = function()
	{
		instance_destroy(mech_obj);	
	}
}