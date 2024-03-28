function create_mech_attachment(_attachment_type, _deck, _hp)
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
				data : new Card(_card_type, attachment),
			});

			with _inst
			{
				data.card_obj = id;
			}

			attachment.add_to_slot(_inst);
		}		
	}

	attachment.max_hp = _hp;
	attachment.current_hp = _hp;
	attachment.title = _attachment_type.title;

	attachment.add_to_deck(_deck);

	return attachment;
}