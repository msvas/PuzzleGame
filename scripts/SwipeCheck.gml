if(device_mouse_check_button_pressed(0, mb_left)) {
   global.last_x = mouse_x;
}
else if(device_mouse_check_button_released(0, mb_left)) {
    diff = global.last_x - mouse_x;
    if(diff > 40) {
        show_debug_message("Horizontal right swipe detected");
        return 1;
    }
    else if(diff < -40) {
        show_debug_message("Horizontal left swipe detected");
        return -1;
    }
}
