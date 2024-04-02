function create_mech_attachment(_attachment_type, _deck, _obj)
{
	var attachment = new Attachment();

	var _inst = instance_create_layer(0, 0, "Mech", _obj,
	{
		data : attachment,
	});

	with _inst
	{
		data.mech_obj = id;
	}

	attachment.title = _attachment_type.title;
	attachment.max_hp = _attachment_type.max_hp;
	attachment.current_hp = _attachment_type.current_hp;

	for (var _i = 0; _i < array_length(_attachment_type.cards_in_attachment); _i++)
	{
		var _card_type = _attachment_type.cards_in_attachment[_i][0];
		var _card_amount = _attachment_type.cards_in_attachment[_i][1];

		repeat(_card_amount)
		{
			var _inst = instance_create_layer(0, 0, "Cards", obj_player_card,
			{
				data : new Card(_card_type),
			});

			with _inst
			{
				data.card_obj = id;
				
			}

			attachment.add_to_slot(_inst);
		}		
	}

	attachment.add_to_deck(_deck);

	return attachment;
}