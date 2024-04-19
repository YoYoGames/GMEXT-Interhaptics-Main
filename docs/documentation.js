

/**
 * @func interhaptics_init
 * @desc 
 * @returns {real}
 */
function interhaptics_init() {}


/**
 * @func interhaptics_quit
 * @desc 
 * @returns {real}
 */
function interhaptics_quit() {}


/**
 * @func interhaptics_add_hm
 * @desc 
 * @param {string} content
 * @returns {real}
 */
function interhaptics_add_hm(content) {}


/**
 * @func interhaptics_update_hm
 * @desc 
 * @param {real} material_ref
 * @param {string} content
 * @returns {real}
 */
function interhaptics_update_hm(material_ref, content) {}


/**
 * @func interhaptics_play_event
 * @desc 
 * @param {real} material_ref
 * @param {real} vibration_offset
 * @param {real} texture_offset
 * @param {real} stiffness_offset
 * @returns {real}
 */
function interhaptics_play_event(material_ref, vibration_offset, texture_offset, stiffness_offset) {}


/**
 * @func interhaptics_stop_event
 * @desc 
 * @param {real} material_ref
 * @returns {real}
 */
function interhaptics_stop_event(material_ref) {}


/**
 * @func interhaptics_add_target_to_event_multiplatform
 * @desc 
 * @param {real} material_ref
 * @param {Id.Buffer} buff_args
 * @returns {real}
 */
function interhaptics_add_target_to_event_multiplatform(material_ref, buff_args) {} // FIXME 


/**
 * @func interhaptics_remove_target_from_event_multiplatform
 * @desc 
 * @param {real} material_ref
 * @param {Id.Buffer} buff_args
 * @returns {real}
 */
function interhaptics_remove_target_from_event_multiplatform(material_ref, buff_args) {} // FIXME 


/**
 * @func interhaptics_remove_all_targets_from_event
 * @desc 
 * @param {real} material_ref
 * @returns {real}
 */
function interhaptics_remove_all_targets_from_event(material_ref) {}


/**
 * @func interhaptics_compute_all_events
 * @desc 
 * @param {real} current_time
 * @returns {real}
 */
function interhaptics_compute_all_events(current_time) {}


/**
 * @func interhaptics_update_event_positions_multiplatform
 * @desc 
 * @param {real} material_ref
 * @param {Id.Buffer} buff_args
 * @param {real} texture_position
 * @param {real} stiffness_position
 * @returns {real}
 */
function interhaptics_update_event_positions_multiplatform(material_ref, buff_args, texture_position, stiffness_position) {} // FIXME 


/**
 * @func interhaptics_set_event_offsets
 * @desc 
 * @param {real} material_ref
 * @param {real} vibration_offset
 * @param {real} texture_offset
 * @param {real} stiffness_offet
 * @returns {real}
 */
function interhaptics_set_event_offsets(material_ref, vibration_offset, texture_offset, stiffness_offet) {}


/**
 * @func interhaptics_clear_inactive_events
 * @desc 
 * @returns {real}
 */
function interhaptics_clear_inactive_events() {}


/**
 * @func interhaptics_clear_active_events
 * @desc 
 * @returns {real}
 */
function interhaptics_clear_active_events() {}


/**
 * @func interhaptics_clear_event
 * @desc 
 * @param {real} material_ref
 * @returns {real}
 */
function interhaptics_clear_event(material_ref) {}


/**
 * @func interhaptics_provider_init
 * @desc 
 * @returns {real}
 */
function interhaptics_provider_init() {}


/**
 * @func interhaptics_provider_is_present
 * @desc 
 * @returns {real}
 */
function interhaptics_provider_is_present() {}


/**
 * @func interhaptics_provider_provider_clean
 * @desc 
 * @returns {real}
 */
function interhaptics_provider_provider_clean() {}


/**
 * @func interhaptics_provider_render_haptics
 * @desc 
 * @returns {real}
 */
function interhaptics_provider_render_haptics() {}
