
function interhaptics_add_target_to_event(material_id, target_array)
{
	var _args = [
		[ target_array, buffer_s32 ] // array[struct[sign : int, group : int, side : int]]
	]
		
	var _args_buffer_address = ext_pack_args(_args);
		
	interhaptics_add_target_to_event_multiplatform(material_id, _args_buffer_address)
}

function interhaptics_remove_target_from_event(material_id,target_array)
{
	var _args = [
		[ target_array, buffer_s32 ] // array[struct[sign : int, group : int, side : int]]
	]
	
	var _args_buffer_address = ext_pack_args(_args);	
	interhaptics_remove_target_from_event_multiplatform(material_id, _args_buffer_address)
}

function interhaptics_update_event_positions(material_id, target_array, texture_position, stiffness_position)
{
	var _args = [
		[ target_array, buffer_s32 ] // array[struct[sign : int, group : int, side : int]]
	]
	var _args_buffer_address = ext_pack_args(_args);
	
	interhaptics_update_event_positions_multiplatform(material_id, _args_buffer_address, texture_position, stiffness_position)
}

function interhaptics_add_parametric_effect(amplitude_array, pitch_array, pitch_min,pitch_max, transient, is_looping)
{
	var _args = [
		[ amplitude_array, undefined ], // struct
		[ pitch_array, undefined ], // struct
		[ pitch_min, buffer_f64 ],
		[ pitch_max, buffer_f64 ],
		[ transient, buffer_f64 ],
		[ is_looping, buffer_f64 ],
	]
	var _args_buffer_address = ext_pack_args(_args);
	interhaptics_add_parametric_effect_multiplatform(_args_buffer_address)
}

function interhaptics_transients_played_on_those_body_parts(perception, body_parts)
{
	var _args = [
		[ body_parts, undefined ], // struct
	]
	var _args_buffer_address = ext_pack_args(_args);
	
	interhaptics_transients_played_on_those_body_parts_multiplatform(perception,_args_buffer_address)
}

function interhaptics_set_target_intensity(material_id, target_array, intensity)
{
	var _args = [
		[ target_array, undefined ], // struct
	]
	var _args_buffer_address = ext_pack_args(_args);
	
	interhaptics_set_target_intensity_multiplatform(material_id,_args_buffer_address,intensity)
}
