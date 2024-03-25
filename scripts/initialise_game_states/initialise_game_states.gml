function initialise_game_states()
{
	fsm = new SnowState("initialise_game");

	fsm.add("initialise_game", {
		enter: function() {
			randomise();
			define_constants();
			create_cards();
//			create_decks();
			create_attachments();
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
		//	if (obj_enemy.current_hp <= 0 || obj_player.current_hp <= 0) return fsm.change("game_end");
			with(obj_player)
			{
				deck.discard_hand();
				deck.deal_hand(hand_size);
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
		//	if (obj_enemy.current_hp <= 0 || obj_player.current_hp <= 0) return fsm.change("game_end");
			//do enemy turn clean up
			fsm.trigger("end_enemy_turn");
		}
	});

	fsm.add("game_end", {
		enter: function() {
			finish_game();
		}
	});

	fsm.add("waiting_for_card_to_be_selected", {
		enter: function() {},
		step: function() {
			if global.card == noone { fsm.step(); }
			else { fsm.change("player_turn", undefined, function() {}); }
		},
		leave: function() {}
	});











	fsm.add_transition("end_player_turn", "player_turn", "enemy_turn");
	fsm.add_transition("end_enemy_turn", "enemy_turn", "player_turn", undefined, function() {});
	fsm.add_wildcard_transition("check_victory", "game_end", , function() {});
}