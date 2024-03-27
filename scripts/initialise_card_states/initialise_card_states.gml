function initialise_card_states()
{
	fsm = new SnowState("initialise");

	fsm.add("initialise", {
		enter: function() {
			clickable = false;
			dealing = false;
			range = 15;
		}
	});

	fsm.add("moving_to_deal_pile", {
		enter: function() {
			sprite_index = data.back;
			clickable = false;
		}
	});

	fsm.add("in_deck", {
		enter: function() {
			sprite_index = data.back;
			clickable = false;
		}
	});

	fsm.add("dealing", {
		enter: function() {
			sprite_index = data.face;
			clickable = false;
		}
	});

	fsm.add("dealt", {
		enter: function() {
			sprite_index = data.face;
			clickable = true;
		}
	});

	fsm.add("discarding", {
		enter: function() {
			sprite_index = data.face;
			clickable = false;
		}
	});

	fsm.add("discarded", {
		enter: function() {
			sprite_index = data.face;
			clickable = true;
		}
	});
}