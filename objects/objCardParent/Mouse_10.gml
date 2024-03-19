scribble_font_set_default("fnt_Futured");
draw_set_halign(fa_left);
draw_set_colour(c_black);

card_popup = new UIPanel("Card Popup", mouse_x, mouse_y, 300, 200, red_panel);
card_popup.setResizable(false);

var _damage_m = card_popup.add(new UIText("Damage mean", 20, 20, "", UI_RELATIVE_TO.TOP_LEFT));
	_damage_m.setPreRenderCallback(function() {
		UI.get("Damage mean").setText("[fa_left]Damage mean: " + string(attack_val_m));
	});
	
var _damage_sd = card_popup.add(new UIText("Damage standard deviation", 20, 40, "", UI_RELATIVE_TO.TOP_LEFT));
	_damage_sd.setPreRenderCallback(function() {
		UI.get("Damage standard deviation").setText("[fa_left]Damage standard deviation: " + string(attack_val_sd));
	});