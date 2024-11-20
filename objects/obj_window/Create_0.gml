/// @description Insert description here

// For now, the code here is specific to the interaction with itm_control
// I'll generalize if necessary LATER...
event_inherited(); 

scr_activate();

// Standby is a status we use to determine whether or not
standby = false;

window_border = 2;

offset_x = 150;
offset_y = 150;

window_height = 80; // Total window height
window_width = 360; // Total window width

label_height = 16; // How tall the window label is

text_border_x = 16;
text_border_y = 16;

// For simplicity, I'll support a finite number of buttons to appear below the display text
// If there are multiple buttons, they will appear in a row!
buttons = ["Control 1", "Control 2", "Control 3"];

button_height = 48;

// Vertical space between text and buttons
button_sep = 24;

// How much space should we leave in between buttons?
button_spacing = 8;

// Maximum width that a button can occupy
max_button_width = 75;

// Text settings for our window
draw_set_font(global.font);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

if !variable_instance_exists(self, "text") {
	text = "Controls for secret door";	
}

active_timer = 0;

if !struct_exists(state, "clicks") {
	state.clicks = 0;
}