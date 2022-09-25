// Select and swap on mouse click
if (mouse_check_button_pressed(mb_left)) {
	var _slot_index = inventory.slot_at(mouse_x, mouse_y);

	if (inventory.selected_index >= 0) {
		inventory.swap(_slot_index);
	} else {
		inventory.selected_index = _slot_index;
	}
}
