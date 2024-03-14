function init_state_machine()
{
	fsm = new SnowState("initialise_game");

	fsm.add("initialise_game", {
		enter: function() {
			randomise();
			define_constants();
			instance_create_layer(0, 0, "Instances", objRoom_Controller);
			create_player_cards();
			instance_create_layer(0, 0, "Instances", objPlayer);
			instance_create_layer(608, 96, "Instances", objEnemy);
			objPlayer.deck.deal(objPlayer.hand_size);
			objEnemy.deck.deal(objEnemy.hand_size);
		}
	});

	fsm.add("player_turn", {
		enter: function() {
			with(objPlayer)
			{
				current_defence = 0;
				current_actions = approach(current_actions, max_actions, action_refresh); 
			}
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
				deck.discard_hand();
				deck.deal(hand_size);
			}

			show_message("player_turn: leave");
		}
	});

	fsm.add("enemy_turn", {
		enter: function() {
			//do start of enemy turn stuff
			with(objEnemy)
			{
				current_defence = 0;
				current_actions = approach(current_actions, max_actions, action_refresh); 
			}
			show_message("enemy_turn: enter");
			fsm.step();
		},
		step: function() {
			//do enemy turn things
			show_message("enemy_turn: step");
			do_enemy_turn();
			fsm.leave();
		},
		leave: function() {
			//do enemy turn clean up
			with(objEnemy)
			{
				deck.discard_hand();
				deck.deal(hand_size);
			}		
			show_message("enemy_turn: leave");
			fsm.trigger("end_enemy_turn");
		}
	});

	fsm.add_transition("end_player_turn", "player_turn", "enemy_turn");
	fsm.add_transition("end_enemy_turn", "enemy_turn", "player_turn", undefined, function() {});
}