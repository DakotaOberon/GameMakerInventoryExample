// @description Inventory constructor
//
// @argument	{Real}		_slots				Number of slots in inventory
// @argument	{Real}		_x					X coordinate of inventory, needed for draw and slot_at functions
// @argument	{Real}		_y					Y coordinate of inventory, needed for draw and slot_at functions
// @argument	{Real}		_slot_width			Width of inventory slots
// @argument	{Real}		_slot_height		Height of inventory slots
// @argument	{Real}		_slot_padding		Pixels between slots
function InventoryStruct(_slots, _x, _y, _slot_width, _slot_height, _slot_padding) constructor {
	// Use your empty slot indicator instead of -1
	array = array_create(_slots, -1);
	
	// Filling with random arbitary data, this is only here for the example
	for (var _index = 0; _index < array_length(array); _index++) {
		array[_index] = new SlotStruct(make_color_hsv(random(255), 255, 255));
	}

	// Values
	x = _x;
	y = _y;
	slot = {
		width:		_slot_width,
		height:		_slot_height,
		padding:	_slot_padding
	}
	selected_index = -1;

	// Get slot at x and y. Used in select and swap in step event
	slot_at = function (_x, _y) {
		var _slot_y1 = y;
		var _slot_y2 = y + slot.height;

		for (var _index = 0; _index < array_length(array); _index++) {
			var _slot_x1 = x + ((slot.width + slot.padding) * _index);
			var _slot_x2 = _slot_x1 + slot.width;

			if (point_in_rectangle(_x, _y, _slot_x1, _slot_y1, _slot_x2, _slot_y2)) {
				return _index;
			}
		}

		return -1;
	}

	// Swaps selected index with provided destination index
	swap = function (_dest_index) {
		if (selected_index == _dest_index) {
			return;
		}

		var _temp_hold = array[_dest_index];

		array[_dest_index] = array[selected_index];
		array[selected_index] = _temp_hold;

		selected_index = -1;
	}

	// Draw inventory, feel free to replace with your own draw functions
	draw = function() {
		var _slot_y1 = y;
		var _slot_y2 = y + slot.height;

		for (var _index = 0; _index < array_length(array); _index++) {
			var _slot_x1 = x + ((slot.width + slot.padding) * _index);
			var _slot_x2 = _slot_x1 + slot.width;

			var _c = array[_index].color;			

			draw_rectangle_color(_slot_x1, _slot_y1, _slot_x2, _slot_y2, _c, _c, _c, _c, 0);
			
			if (_index == selected_index) {
				draw_rectangle(_slot_x1, _slot_y1, _slot_x2, _slot_y2, 1);
			}
		}

	}
}
