function init_state_machine()
{
	fsm = new SnowState("initialise_game");

	fsm.add("initialise_game", {
		enter: function() {
			randomise();
			define_constants();
			create_cards();
			create_decks();
		}
	});

	fsm.add("player_turn", {
		enter: function() {
			//check hp and so forth ...
			
			with(objPlayer)
			{
				current_defence = approach(current_defence, 0, defence_loss);
				current_actions = approach(current_actions, max_actions, action_refresh); 
			}
			fsm.step();
		},
		step: function() {
			//do player turn things
		},
		leave: function() {
			with(objPlayer)
			{
				deck.discard_hand();
				deck.deal_hand(hand_size);
			}
		}
	});

	fsm.add("enemy_turn", {
		enter: function() {
			//do start of enemy turn stuff
			with (objEnemy)
			{
				current_defence = approach(current_defence, 0, defence_loss);
			}
			fsm.step();
		},
		step: function() {
			enemy_choose_actions();
			//do enemy turn things
			do_enemy_turn();

			fsm.leave();
		},
		leave: function() {
			//do enemy turn clean up
			fsm.trigger("end_enemy_turn");
		}
	});

	fsm.add_transition("end_player_turn", "player_turn", "enemy_turn");
	fsm.add_transition("end_enemy_turn", "enemy_turn", "player_turn", undefined, function() {});
	//fsm.add_transition(//to transition into draw states and the like or something else better
}