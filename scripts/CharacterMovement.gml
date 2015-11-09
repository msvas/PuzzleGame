if (device_mouse_check_button(0, mb_left) && !moving) {
    while(obj_character1.x != device_mouse_x(0) && obj_character1.y != device_mouse_y(0)) {
        obj_character1.x += 1;
        obj_character1.y += 1;
        moving = true;
    }
}
