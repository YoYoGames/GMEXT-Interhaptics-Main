
function interhaptics_add_target_to_event(material_id, target_array)
{
	var _args = [
		[ target_array, undefined ] // struct
	]
		
	var _args_buffer_address = ext_pack_args(_args);
		
	interhaptics_add_target_to_event_multiplatform(material_id, _args_buffer_address)
}

function interhaptics_remove_target_from_event(material_id,target_array)
{
	var _args = [
		[ target_array, undefined ] // struct
	]
	
	var _args_buffer_address = ext_pack_args(_args);	
	interhaptics_remove_target_from_event_multiplatform(material_id, _args_buffer_address)
}

function interhaptics_update_event_positions(material_id, target_array, texture_position, stiffness_position)
{
	var _args = [
		[ target_array, undefined ] // struct
	]
	var _args_buffer_address = ext_pack_args(_args);
	
	interhaptics_update_event_positions_multiplatform(material_id, _args_buffer_address, texture_position, stiffness_position)
}

