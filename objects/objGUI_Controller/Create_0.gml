scribble_font_set_default("fnt_8bitoperatorSmall");
draw_set_halign(fa_left);


var _button_panel = new UIPanel("Button Panel", 0, 0, 200, room_height, glass_panel);
_button_panel.setResizable(false);

var _next_turn_button = _button_panel.add(new UIButton("Next Turn Button", 0, 50, 150, 50, "Next turn", red_button04, UI_RELATIVE_TO.TOP_CENTER));
var _deal_button = _button_panel.add(new UIButton("Deal Button", 0, 150, 150, 50, "Deal", red_button04, UI_RELATIVE_TO.TOP_CENTER));
var _discard_button = _button_panel.add(new UIButton("Discard Button", 0, 250, 150, 50, "Discard", red_button04, UI_RELATIVE_TO.TOP_CENTER));
var _attack_button = _button_panel.add(new UIButton("Attack Button", 0, -250, 150, 50, "Attack", red_button04, UI_RELATIVE_TO.BOTTOM_CENTER));
var _defend_button = _button_panel.add(new UIButton("Defend Button", 0, -150, 150, 50, "Defend", red_button04, UI_RELATIVE_TO.BOTTOM_CENTER));
var _support_button = _button_panel.add(new UIButton("Support Button", 0, -50, 150, 50, "Support", red_button04, UI_RELATIVE_TO.BOTTOM_CENTER));


with(_next_turn_button) {
	setTextFormat("[c_black]");
	setSpriteMouseover(red_button05);
	setTextFormatMouseover("[c_white]");
	
	setCallback(UI_EVENT.LEFT_RELEASE, function() {
		objGame_Controller.fsm.trigger("end_player_turn");
	});
}

with(_deal_button) {
	setTextFormat("[c_black]");
	setSpriteMouseover(red_button05);
	setTextFormatMouseover("[c_white]");
	
	setCallback(UI_EVENT.LEFT_RELEASE, function() {
		with(objPlayer)
		{
			deck.deal(hand_size);
		}
	});
}

with(_discard_button) {
	setTextFormat("[c_black]");
	setSpriteMouseover(red_button05);
	setTextFormatMouseover("[c_white]");
	
	setCallback(UI_EVENT.LEFT_RELEASE, function() {
		with(objPlayer)
		{
			deck.discard_hand();
		}
	});
}

with(_attack_button) {
	setTextFormat("[c_black]");
	setSpriteMouseover(red_button05);
	setTextFormatMouseover("[c_white]");
	
	setCallback(UI_EVENT.LEFT_RELEASE, function() {
		if !empty(global.active_cards)
		{
			do_attack("player");
		}
	});
}

with(_defend_button) {
	setTextFormat("[c_black]");
	setSpriteMouseover(red_button05);
	setTextFormatMouseover("[c_white]");
	
	setCallback(UI_EVENT.LEFT_RELEASE, function() {
		if !empty(global.active_cards)
		{
			do_defend("player");
		}
	});
}

with(_support_button) {
	setTextFormat("[c_black]");
	setSpriteMouseover(red_button05);
	setTextFormatMouseover("[c_white]");
	
	setCallback(UI_EVENT.LEFT_RELEASE, function() {
		if !empty(global.active_cards)
		{
			do_support("player");
		}
	});
}

var _info_panel = new UIPanel("Info Panel", room_width - 300, 0, 300, room_height, glass_panel);
_info_panel.setResizable(false);

_info_panel.add(new UIText("Player Info", 0, 50, "[fa_center]Player Info", UI_RELATIVE_TO.TOP_CENTER));

var _player_hp = _info_panel.add(new UIText("Player HP", 50, 150, "", UI_RELATIVE_TO.TOP_LEFT));
	_player_hp.setPreRenderCallback(function() {
		UI.get("Player HP").setText("[fa_left]HP: " + string(objPlayer.current_hp));
	});

var _player_defence = _info_panel.add(new UIText("Player Defence", 50, 200, "", UI_RELATIVE_TO.TOP_LEFT));
	_player_defence.setPreRenderCallback(function() {
		UI.get("Player Defence").setText("[fa_left]Defence: " + string(objPlayer.current_defence));
	});

var _player_AP = _info_panel.add(new UIText("Player AP", 50, 250, "", UI_RELATIVE_TO.TOP_LEFT));
	_player_AP.setPreRenderCallback(function() {
		UI.get("Player AP").setText("[fa_left]Action points: " + string(objPlayer.current_actions));
	});

_info_panel.add(new UIText("Enemy Info", 0, 350, "[fa_center]Enemy Info", UI_RELATIVE_TO.TOP_CENTER));

var _enemy_hp = _info_panel.add(new UIText("Enemy HP", 50, 450, "", UI_RELATIVE_TO.TOP_LEFT));
	_enemy_hp.setPreRenderCallback(function() {
		UI.get("Enemy HP").setText("[fa_left]HP: " + string(objEnemy.current_hp));
	});

var _enemy_defence = _info_panel.add(new UIText("Enemy Defence", 50, 500, "", UI_RELATIVE_TO.TOP_LEFT));
	_enemy_defence.setPreRenderCallback(function() {
		UI.get("Enemy Defence").setText("[fa_left]Defence: " + string(objEnemy.current_defence));
	});

var _enemy_AP = _info_panel.add(new UIText("Enemy AP", 50, 550, "", UI_RELATIVE_TO.TOP_LEFT));
	_enemy_AP.setPreRenderCallback(function() {
		UI.get("Enemy AP").setText("[fa_left]Action points: " + string(objEnemy.current_actions));
	});