function AttachmentType(_title, _hp) constructor
{
	title = _title;
	hp = _hp;
	cards_in_attachment = array_create(argument_count - 2);

	for (var _i = 0; _i < argument_count - 2; _i++)
	{
		cards_in_attachment[_i] = [argument[_i + 2][0], argument[_i + 2][1]];
	}
}

function Attachment(_attachment_type) constructor
{
	title		= _attachment_type.title;
	current_hp	= _attachment_type.hp;
	max_hp		= _attachment_type.hp;
	slot = [];

	for (var _i = 0; _i < array_length(_attachment_type.cards_in_attachment); _i++)
	{
		for (var _j = 0; _j < _attachment_type.cards_in_attachment[_i][1]; _j++)
		{
			var _inst = instance_create_layer(0, 0, "Cards", obj_player_card,
			{
				data : new Card(_attachment_type.cards_in_attachment[_i][0]),
			});

			with _inst
			{
				data.card_obj = id;
			}

			add_to_slot(_inst);
		}
	}

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

	static remove_from_mech = function()
	{
		instance_destroy(mech_obj);	
	}
}