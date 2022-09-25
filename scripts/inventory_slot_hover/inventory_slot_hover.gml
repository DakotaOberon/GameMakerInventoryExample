// @description Returns the index of the hovered slot
//
// @argument	{Array}		_array				Inventory array to check
// @argument	{Real}		_inventory_x		Left coordinate of inventory start
// @argument	{Real}		_inventory_y		Top coordinate of inventory start
// @argument	{Real}		_slot_width			Width of inventory slots
// @argument	{Real}		_slot_height		Height of inventory slots
// @argument	{Real}		_slot_padding		Pixels between slots
// @return		{Boolean}
function inventory_slot_hover(_array, _inventory_x, _inventory_y, _slot_width, _slot_height, _slot_padding) {
	var _slot_y1 = _inventory_y;
	var _slot_y2 = _inventory_y + _slot_height;

	for (var _index = 0; _index < array_length(_array); _index++) {
		var _slot_x1 = _inventory_x + ((_slot_width + _slot_padding) * _index);
		var _slot_x2 = _slot_x1 + _slot_width;
		
		if (point_in_rectangle(mouse_x, mouse_y, _slot_x1, _slot_y1, _slot_x2, _slot_y2)) {
			return _index;
		}
	}

	return -1;
}
