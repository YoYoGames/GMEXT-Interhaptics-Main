
event_inherited()

text = "Simple Test"

time = current_time/1000

show_debug_message("Interhaptics")
interhaptics_init()

show_debug_message("provider init: " + string(interhaptics_provider_init()))
show_debug_message("provider present: " + string(interhaptics_provider_is_present()))

var file = file_text_open_read("HapticMaterials/Body Hit.haps")
var content = file_text_read_string(file)
file_text_close(file)

hm_index = interhaptics_add_hm(content)

interhaptics_add_target_to_event(hm_index,[
	{
        sign: Interhaptics_Operator.Plus,
        group: Interhaptics_GroupID.Palm,
        side: Interhaptics_LateralFlag.Global
		
        //sign: Interhaptics_Operator.Plus,
        //group: Interhaptics_GroupID.Palm,
        //side: Interhaptics_LateralFlag.Left
	}]);
	
	
//interhaptics_add_target_to_event(hm_index,[
//{
//		sign: Interhaptics_Operator.Neutral,
//		group: Interhaptics_GroupID.All,
//		side: Interhaptics_LateralFlag.Center
//	},
//	{
//		sign: Interhaptics_Operator.Plus,
//		group: Interhaptics_GroupID.Chest,
//		side: Interhaptics_LateralFlag.Right
//	}])
