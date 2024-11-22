
var _file = file_text_open_read("HapticMaterials/" + obj_interhaptics_file.array[obj_interhaptics_file.index] + ".haps")
var _content = file_text_read_string(_file)
file_text_close(_file)

var _hm_index = interhaptics_add_hm(_content)

interhaptics_add_target_to_event(_hm_index, [
	{
        sign: obj_interhaptics_sign.array_value[obj_interhaptics_sign.index],
        group: obj_interhaptics_group.array_value[obj_interhaptics_group.index],
        side: obj_interhaptics_side.array_value[obj_interhaptics_side.index]
	} ]);


interhaptics_play_event(_hm_index, -current_time/1000, 0,0)

var _ins = instance_create_depth(500, 100, depth, obj_interhaptics_instance, { hm_index: _hm_index });
_ins.text = obj_interhaptics_file.array[obj_interhaptics_file.index]
_ins.subtext = obj_interhaptics_sign.array[obj_interhaptics_sign.index] + "," + 
	obj_interhaptics_group.array[obj_interhaptics_group.index] + "," + 
	obj_interhaptics_side.array[obj_interhaptics_side.index]

array_push(array, _ins);

array_positions_refresh();

