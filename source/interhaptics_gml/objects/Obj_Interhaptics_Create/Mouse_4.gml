
var file = file_text_open_read("HapticMaterials/" + obj_interhaptics_file.array[obj_interhaptics_file.index] + ".haps")
var content = file_text_read_string(file)
file_text_close(file)

var hm_index = interhaptics_add_hm(content)

interhaptics_add_target_to_event(hm_index, [
	{
        sign: obj_interhaptics_sign.array_value[obj_interhaptics_sign.index],
        group: obj_interhaptics_group.array_value[obj_interhaptics_group.index],
        side: obj_interhaptics_side.array_value[obj_interhaptics_side.index]
	} ]);


interhaptics_play_event(hm_index, -current_time/1000, 0,0)

var ins = instance_create_depth(500,100,depth,obj_interhaptics_instance,{hm_index:hm_index})
ins.text = obj_interhaptics_file.array[obj_interhaptics_file.index]
ins.subtext = obj_interhaptics_sign.array[obj_interhaptics_sign.index] + "," + 
	obj_interhaptics_group.array[obj_interhaptics_group.index] + "," + 
	obj_interhaptics_side.array[obj_interhaptics_side.index]

array_push(array,ins)

array_positions_refresh()


