draw_set_font(fnt_8bitoperatorBig);
draw_set_colour(c_black);
draw_set_alpha(1);

while (show_damage)
{
	draw_text(100, 100, "damage");
}

draw_text(50, 20, "HP: " + string(objPlayer.current_hp));
draw_text(50, 60, "Defence: " + string(objPlayer.current_defence));
draw_text(50, 100, "Action points: " + string(objPlayer.current_actions));

draw_set_font(fnt_8bitoperatorSmall);

draw_text(1000, 50, "# cards: " + string(array_length(objPlayer.deck.cards)));
draw_text(1000, 100, "# cards in deal pile: " + string(array_length(objPlayer.deck.deal_pile)));
draw_text(1000, 150, "# cards in hand: " + string(array_length(objPlayer.deck.cards_in_hand)));
draw_text(1000, 200, "# cards in discard: " + string(array_length(objPlayer.deck.discard_pile)));