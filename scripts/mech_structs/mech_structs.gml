function AttachmentType(_title) constructor
{
	title = _title;
	cards_in_attachment = array_create(argument_count - 1);
for (var _i = 0; _i < argument_count; _i++)
	{
		print("argument", _i, ": ", argument[_i]);
	}
	for (var _i = 0; _i < argument_count - 1; _i++)
	{
		cards_in_attachment[_i] = [argument[_i + 1][0], argument[_i + 1][1]];
	}
}

function Attachment() constructor
{
	slot = [];
	max_hp = 0;
	current_hp = 0;
	title = "";

	static add_to_slot = function(_card)
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
}