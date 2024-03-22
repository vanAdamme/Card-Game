scribble_font_set_default("fnt_8bitoperator_Small");
draw_set_halign(fa_left);

var _info_panel = new UIPanel("Info Panel", room_width - 300, 0, 300, room_height, glass_panel);
_info_panel.setResizable(false);

_info_panel.add(new UIText("Player Info", 0, 50, "[fa_center]Player Info", UI_RELATIVE_TO.TOP_CENTER));

var _player_hp = _info_panel.add(new UIText("Player HP", 50, 150, "", UI_RELATIVE_TO.TOP_LEFT));
	_player_hp.setPreRenderCallback(function() {
		UI.get("Player HP").setText("[fa_left]HP: " + string(obj_player.current_hp));
	});

var _player_defence = _info_panel.add(new UIText("Player Defence", 50, 200, "", UI_RELATIVE_TO.TOP_LEFT));
	_player_defence.setPreRenderCallback(function() {
		UI.get("Player Defence").setText("[fa_left]Defence: " + string(obj_player.current_defence));
	});

var _player_defence_loss = _info_panel.add(new UIText("Player Defence Loss", 50, 250, "", UI_RELATIVE_TO.TOP_LEFT));
	_player_defence_loss.setPreRenderCallback(function() {
		UI.get("Player Defence Loss").setText("[fa_left]Defence Loss: " + string(obj_player.defence_loss));
	});

var _player_AP = _info_panel.add(new UIText("Player AP", 50, 300, "", UI_RELATIVE_TO.TOP_LEFT));
	_player_AP.setPreRenderCallback(function() {
		UI.get("Player AP").setText("[fa_left]Action points: " + string(obj_player.current_actions));
	});

_info_panel.add(new UIText("Enemy Info", 0, 400, "[fa_center]Enemy Info", UI_RELATIVE_TO.TOP_CENTER));

var _enemy_hp = _info_panel.add(new UIText("Enemy HP", 50, 450, "", UI_RELATIVE_TO.TOP_LEFT));
	_enemy_hp.setPreRenderCallback(function() {
		UI.get("Enemy HP").setText("[fa_left]HP: " + string(obj_enemy.current_hp));
	});

var _enemy_defence = _info_panel.add(new UIText("Enemy Defence", 50, 500, "", UI_RELATIVE_TO.TOP_LEFT));
	_enemy_defence.setPreRenderCallback(function() {
		UI.get("Enemy Defence").setText("[fa_left]Defence: " + string(obj_enemy.current_defence));
	});