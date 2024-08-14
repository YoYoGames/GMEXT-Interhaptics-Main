
var file = file_text_open_read("HapticMaterials/" + Obj_Interhaptics_File.array[Obj_Interhaptics_File.index] + ".haps")
var content = file_text_read_string(file)
file_text_close(file)

var hm_index = interhaptics_add_hm(content)

interhaptics_add_target_to_event(hm_index, [
	{
        sign: Obj_Interhaptics_Sign.array_value[Obj_Interhaptics_Sign.index],
        group: Obj_Interhaptics_Group.array_value[Obj_Interhaptics_Group.index],
        side: Obj_Interhaptics_Side.array_value[Obj_Interhaptics_Side.index]
	} ]);


interhaptics_play_event(hm_index, -current_time/1000, 0,0)

var ins = instance_create_depth(500,100,depth,Obj_Interhaptics_Instance,{hm_index:hm_index})
ins.text = Obj_Interhaptics_File.array[Obj_Interhaptics_File.index]
ins.subtext = Obj_Interhaptics_Sign.array[Obj_Interhaptics_Sign.index] + "," + 
	Obj_Interhaptics_Group.array[Obj_Interhaptics_Group.index] + "," + 
	Obj_Interhaptics_Side.array[Obj_Interhaptics_Side.index]

array_push(array,ins)

array_positions_refresh()


