base_w = 320;
base_h = 480;
rate_w = window_get_width() / base_w;
rate_h = window_get_height() / base_h;

//display_get_gui_width() * (device_mouse_raw_x(argument0) / max(1, window_get_width()));

topleftX = argument0 * rate_w;
topleftY = argument1 * rate_h;
bottomrightX = argument2 * rate_w;
bottomrightY = argument3 * rate_h;
text = argument4;

width = (bottomrightX - topleftX)
height = (bottomrightY - topleftY)

centerX = topleftX + width/2;
centerY = topleftY + height/2; 

draw_set_alpha(0.6);
draw_set_color(c_gray); //Set the color to gray for our button
//draw_rectangle(topleftX, topleftY, bottomrightX, bottomrightY, false); //Draw our button
draw_sprite_stretched_ext(spr_gui_button1, -1, topleftX, topleftY, width, height, c_white, 1);

draw_set_color(c_black); //Set the color to black for our text
draw_set_halign(fa_center); //Center our text (horizontal)
draw_set_valign(fa_center); //Center our text (verticle)
draw_set_font(font_main);
draw_text_transformed(centerX, centerY, text, global.fontratio, global.fontratio, 0); //Draw our button text

//Now we clean up our drawing
draw_set_alpha(1); //Reset the alpha
draw_set_color(c_white); //Reset the color
draw_set_halign(fa_left); //Reset the horizontal align

//We check if the mouse has been pressed on any of the buttons
if (device_mouse_check_button_pressed(0, mb_left)) {
    click_x = device_mouse_x_to_gui(0);// * rate_w;
    click_y = device_mouse_y_to_gui(0);// * rate_h;
    //show_debug_message(string(click_x) + " " + string(click_y) + " " + string(topleftX) + " " + string(topleftY) + " " + string(bottomrightX) + " " + string(bottomrightY));
    if(point_in_rectangle(click_x, click_y, topleftX, topleftY, bottomrightX, bottomrightY)) {
        return true;
    }
}
return false;
