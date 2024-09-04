
event_inherited()

text = "Simple Test"

time = current_time/1000

show_debug_message("Interhaptics")
interhaptics_init()

show_debug_message("provider init: " + string(interhaptics_providers_init()))
show_debug_message("provider present: " + string(interhaptics_providers_available()))

var file = file_text_open_read("HapticMaterials/Body Hit.haps")
var content = file_text_read_string(file)
file_text_close(file)

hm_index = interhaptics_add_hm(content)

interhaptics_add_target_to_event(hm_index,[
	{
        sign: INTERHAPTICS_OPERATOR.PLUS,
        group: INTERHAPTICS_GROUP_ID.PALM,
        side: INTERHAPTICS_LATERAL_FLAG.GLOBAL
		
        //sign: INTERHAPTICS_OPERATOR.PLUS,
        //group: INTERHAPTICS_GROUP_ID.PALM,
        //side: INTERHAPTICS_LATERAL_FLAG.LEFT
	}]);
	
	
//interhaptics_add_target_to_event(hm_index,[
//{
//		sign: INTERHAPTICS_OPERATOR.NEUTRAL,
//		group: INTERHAPTICS_GROUP_ID.ALL,
//		side: INTERHAPTICS_LATERAL_FLAG.CENTER
//	},
//	{
//		sign: INTERHAPTICS_OPERATOR.PLUS,
//		group: INTERHAPTICS_GROUP_ID.CHEST,
//		side: INTERHAPTICS_LATERAL_FLAG.RIGHT
//	}])
