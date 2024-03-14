function init_state_machine()
{
	fsm = new SnowState("initialise_game");

	fsm.add("initialise_game", {
		enter: function() {
			randomise();
			define_constants();
			create_player_cards();
		}
	});

	fsm.add("player_turn", {
		enter: function() {
			//do start of player turn checks
			show_message("player_turn: enter");
			fsm.step();
		},
		step: function() {
			//do player turn things
			show_message("player_turn: step");
		},
		leave: function() {
			with(objPlayer)
			{
				current_defence = 0;
				current_actions = approach(current_actions, max_actions, action_refresh); 
				deck.discard_hand();
				deck.deal(hand_size);
			}
			show_message("player_turn: leave");
		}
	});

	fsm.add("enemy_turn", {
		enter: function() {
			//do start of enemy turn checks
			show_message("enemy_turn: enter");
			fsm.step();
		},
		step: function() {
			//do enemy turn things
			show_message("enemy_turn: step");
			fsm.leave();
		},
		leave: function() {
			//do enemy turn clean up
			show_message("enemy_turn: leave");
			fsm.trigger("end_enemy_turn");
		}
	});

	fsm.add_transition("end_player_turn", "player_turn", "enemy_turn");
	fsm.add_transition("end_enemy_turn", "enemy_turn", "player_turn", undefined, function() {});
}