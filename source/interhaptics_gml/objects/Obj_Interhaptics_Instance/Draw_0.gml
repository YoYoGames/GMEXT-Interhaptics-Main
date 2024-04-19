
// Apply basic text properties
draw_set_font(font)
draw_set_color(color)
draw_set_halign(halign)
draw_set_valign(valign)

// Draw base sprite (background)
if(sprite_exists(sprite_index)) {
	draw_self();
}

// Draw the text (forground)
draw_text(x, y-10, text)

draw_text_ext_transformed(x, y+10, subtext,0,sprite_width,0.5,0.5,0)

