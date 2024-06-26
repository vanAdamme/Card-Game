function initialise_game_states()
{
	fsm = new SnowState("initialise_game");

	fsm.add("initialise_game", {
		enter: function() {
			randomise();
			define_constants();
		}
	});

	fsm.add("player_turn", {
		enter: function() {
			//check hp and so forth ...
			with(obj_player)
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
			with(obj_player)
			{
				discard_hand();
				deal_hand();
			}
		}
	});

	fsm.add("enemy_turn", {
		enter: function() {
			//do start of enemy turn stuff
			with (obj_enemy)
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

	fsm.add("game_end", {
		enter: function() {
			finish_game();
		}
	});

	fsm.add("wait_for_player_input", {
		enter: function() {},
		leave: function() {}
	});

	fsm.add("inventory", {
		enter: function() {},
		leave: function() {}
	});

	fsm.add("paused", {
		enter: function() {},
		leave: function() {}
	});

	fsm.add_transition("end_player_turn", "player_turn", "enemy_turn");
	fsm.add_transition("end_enemy_turn", "enemy_turn", "player_turn", undefined, function() {});
	fsm.add_wildcard_transition("check_victory", "game_end", , function() {});
}