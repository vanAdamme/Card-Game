function AttachmentType(_card_type, _amount) constructor
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

function create_mech_attachment(_attachment_type, _deck)
{
	var attachment = new Attachment();

	for (var _i = 0; _i < array_length(_attachment_type.cards_in_attachment); _i++)
	{
		var _card_type = _attachment_type.cards_in_attachment[_i][0];
		var _card_amount = _attachment_type.cards_in_attachment[_i][1];

		repeat(_card_amount)
		{
			var _inst = instance_create_layer(0, 0, "Cards", obj_player_card,
			{
				data : new TestCard(_card_type),
			});

			attachment.add_to_slot(_inst);
		}		
	}

	attachment.add_to_deck(_deck);

	return attachment;
}

