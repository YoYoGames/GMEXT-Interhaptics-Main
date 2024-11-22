
// feather ignore GM1041

/// @desc This function adds a target within the range of the source. The Interhaptics Engine will remap device endpoints and in-range targets to the device management layer for haptic playback.
/// @param {Real} material_id The ID of the source to add a target to, which is the same as the attached haptic effect.
/// @param {Array} target_array A target contains a group of body parts, lateral flags, and exclusion flags.
function interhaptics_add_target_to_event(material_id, target_array)
{
	var _args = [
		[ target_array, buffer_s32 ] // array[struct[sign : int, group : int, side : int]]
	]
		
	var _args_buffer_address = ext_pack_args(_args);
		
	interhaptics_add_target_to_event_multiplatform(material_id, _args_buffer_address)
}

/// @desc This function adds a target within the range of the source. The Interhaptics Engine will remap device endpoints and in-range targets to the device management layer for haptic playback.
/// @param {Real} material_id The ID of the source to add a target to, which is the same as the attached haptic effect.
/// @param {Array} target_array An array of Interhaptics_CommandData to build a target. A target contains a group of body parts, lateral flags, and exclusion flags. Only perfectly matching targets will be removed.
function interhaptics_remove_target_from_event(material_id, target_array)
{
	var _args = [
		[ target_array, buffer_s32 ] // array[struct[sign : int, group : int, side : int]]
	]
	
	var _args_buffer_address = ext_pack_args(_args);	
	interhaptics_remove_target_from_event_multiplatform(material_id, _args_buffer_address)
}

/// @desc This function updates the spatial positions for a specific source target.
/// @param {Real} material_id The ID of the source, which is the same as the attached haptic effect.
/// @param {Array<Real>} target_array A vector of Interhaptics_CommandData to build a target. A target contains a group of body parts, lateral flags, and exclusion flags. Only perfectly matching targets will be updated.
/// @param {Real} texture_position The new texture position.
/// @param {Real} stiffness_position The new stiffness position.
function interhaptics_update_event_positions(material_id, target_array, texture_position, stiffness_position)
{
	var _args = [
		[ target_array, buffer_s32 ] // array[struct[sign : int, group : int, side : int]]
	]
	var _args_buffer_address = ext_pack_args(_args);
	
	interhaptics_update_event_positions_multiplatform(material_id, _args_buffer_address, texture_position, stiffness_position)
}

/// @desc This function creates a haptic effect by processing parameters such as amplitude, pitch, and transients. This function generates a haptic effect based on the given input parameters and can optionally loop it.
/// @param {Array<Real>} amplitude_array An array of amplitude values. Should be formatted as Time - Value pairs. Value is between 0 and 1.
/// @param {Array<Real>} pitch_array An array of pitch values. Should be formatted as Time - Value pairs. Value is between 0 and 1.
/// @param {Real} pitch_min The minimum value for the frequency range.
/// @param {Real} pitch_max	The maximum value for the frequency range.
/// @param {Array<Real>} transient	Array of Real	An array of transient values. The array should be formatted as Time - Amplitude - Pitch triplets, with both Amplitude and Pitch values ranging between 0 and 1.
/// @param {Bool} is_looping Indicates whether the effect should loop or not.
function interhaptics_add_parametric_effect(amplitude_array, pitch_array, pitch_min, pitch_max, transient, is_looping)
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

/// @desc Return true if at least one active event targeting the given bodyparts contains transients
/// @param {Real} perception perception to play.
/// @param {Array<Real>} body_parts Ids of bodyparts targeted.
/// @returns {Bool}
function interhaptics_transients_played_on_those_body_parts(perception, body_parts)
{
	var _args = [
		[ body_parts, buffer_s32 ], // array<int>
	]
	var _args_buffer_address = ext_pack_args(_args);
	
	return bool(interhaptics_transients_played_on_those_body_parts_multiplatform(perception,_args_buffer_address));
}

/// @desc This function sets the haptics intensity factor for a specific target of a source.
/// @param {Real} material_id The ID of the source, which is the same as the attached haptic effect.
/// @param {Array} target_array The target to change intensity.
/// @param {Real} intensity The intensity factor value. Always clamped above 0.
function interhaptics_set_target_intensity(material_id, target_array, intensity)
{
	var _args = [
		[ target_array, undefined ], // struct
	]
	var _args_buffer_address = ext_pack_args(_args);
	
	interhaptics_set_target_intensity_multiplatform(material_id,_args_buffer_address,intensity)
}
