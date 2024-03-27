function AttachmentType() constructor
{
	cards_in_attachment = array_create(argument_count);

	for (var _i = 0; _i < argument_count; _i++)
	{
		cards_in_attachment[_i] = [argument[_i][0], argument[_i][1]];
	}
}

function Attachment() constructor
{
	slot = [];
	hp = 0;

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