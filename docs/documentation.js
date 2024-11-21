/*
INTERHAPTICS DOCS: www.interhaptics.com/doc/interhaptics-engine/
*/

// Functions

/**
 * @func interhaptics_init
 * @desc This function initialises the different components and modules of the Interhaptics Engine:
 * * Haptic Material Manager: module in charge of loading and storing haptic effects
 * * Human Avatar Manager: module in charge of mapping between device, human avatar, and experience
 * * Haptic Event Manager: module in charge of the control of haptic sources
 * @returns {boolean}
 * @func_end
 */
function interhaptics_init() {}


/**
 * @func interhaptics_quit
 * @desc This function cleans up the different components and modules of the Interhaptics Engine. 
 * To be called before the application is quit.
 * @func_end
 */
function interhaptics_quit() {}


/**
 * @func interhaptics_set_global_intensity
 * @desc This function sets the global rendering intensity factor for the whole engine.
 * 
 * @param {real} intensity A positive value. 0 is nothing. Base value is 1.
 * @func_end
 */
function interhaptics_set_global_intensity(intensity) {}


/**
 * @func interhaptics_get_global_intensity
 * @desc This function gets the global rendering intensity factor for the whole engine.
 * 
 * It returns the global intensity, or -1 if the mixer is not initialised.
 * @returns {real}
 * @func_end
 */
function interhaptics_get_global_intensity() {}


/**
 * @func interhaptics_add_hm
 * @desc This function adds the content of an .haps file to the Interhaptics Engine for future use. It returns a reference to the new haptic effect to be used in other functions.
 * @param {string} content The JSON content of the .haps file to be loaded. This needs to follow the Interhaptics .haps format.
 * @returns {real}
 * @func_end
 */
function interhaptics_add_hm(content) {}


/**
 * @func interhaptics_add_parametric_effect
 * @desc This function creates a haptic effect by processing parameters such as amplitude, pitch, and transients. This function generates a haptic effect based on the given input parameters and can optionally loop it.
 * 
 * It returns the ID of the haptic effect created.
 * @param {array[real]} amplitude An array of amplitude values. Should be formatted as Time - Value pairs. Value is between 0 and 1.
 * @param {array[real]} pitch An array of pitch values. Should be formatted as Time - Value pairs. Value is between 0 and 1.
 * @param {real} freq_min The minimum value for the frequency range.
 * @param {real} freq_max The maximum value for the frequency range.
 * @param {array[real]} transient An array of transient values. The array should be formatted as Time - Amplitude - Pitch triplets, with both Amplitude and Pitch values ranging between 0 and 1.
 * @param {boolean} is_looping Indicates whether the effect should loop or not.
 * @returns {real}
 * @func_end
 */
function interhaptics_add_parametric_effect(amplitude, pitch, freq_min, freq_max, transient, is_looping) {}


/**
 * @func interhaptics_delete_hm
 * @desc This function deletes an existing haptic effect.
 * @param {real} material_ref The ID of the haptic effect to delete.
 * @func_end
 */
function interhaptics_delete_hm(material_ref) {}


/**
 * @func interhaptics_update_hm
 * @desc This function replaces the content of an already loaded haptic effect and returns whether the replace was successful.
 * This can be useful when the ID of the haptic effect needs to be persistent. 
 * @param {real} material_ref ID of the haptic effect to be replaced.
 * @param {string} content The JSON content of the .haps file to be loaded. This needs to follow the Interhaptics .haps format.
 * @returns {boolean}
 * @func_end
 */
function interhaptics_update_hm(material_ref, content) {}


/**
 * @func interhaptics_transients_played_on_those_body_parts
 * @desc This function returns true if at least one active event targeting the given body parts contains transients.
 * 
 * @param {real} perception The perception to play
 * @param {array[real]} body_parts The IDs of the body parts targeted
 * @returns {boolean}
 * @func_end
 */
function interhaptics_transients_played_on_those_body_parts(perception, body_parts) {}


/**
 * @func interhaptics_play_event
 * @desc This function starts the rendering playback of a haptic source. 
 * Sets the starting time to 0 + different offsets. 
 * If the event is already playing, it restarts with the new offets.
 * If the source does not already exist, it will be created.
 * @param {real} material_ref The ID of the source to play, which is the same as the attached haptic effect.
 * @param {real} vibration_offset The vibration offset for the source.
 * @param {real} texture_offset The texture offset for the source.
 * @param {real} stiffness_offset The stiffness offset for the source.
 * @func_end
 */
function interhaptics_play_event(material_ref, vibration_offset, texture_offset, stiffness_offset) {}


/**
 * @func interhaptics_stop_event
 * @desc This function stops the rendering playback of a haptic source.
 * @param {real} material_ref The ID of the source to stop, which is the same as the attached haptic effect.
 * @func_end
 */
function interhaptics_stop_event(material_ref) {}


/**
 * @func interhaptics_stop_all_events
 * @desc This function stops the rendering playback of all haptic sources.
 * @func_end
 */
function interhaptics_stop_all_events() {}


/**
 * @func interhaptics_add_target_to_event
 * @desc This function adds a target within the range of the source. The Interhaptics Engine will remap device endpoints and in-range targets to the device management layer for haptic playback.
 * @param {real} material_ref The ID of the source to add a target to, which is the same as the attached haptic effect.
 * @param {array[struct.Interhaptics_CommandData]} target A target contains a group of body parts, lateral flags, and exclusion flags.
 * @func_end
 */
function interhaptics_add_target_to_event(material_ref, target) {}


/**
 * @func interhaptics_remove_target_from_event
 * @desc This function adds a target within the range of the source. The Interhaptics Engine will remap device endpoints and in-range targets to the device management layer for haptic playback.
 * @param {real} material_ref The ID of the source to add a target to, which is the same as the attached haptic effect.
 * @param {array[struct.Interhaptics_CommandData]} target An array of ${struct.Interhaptics_CommandData} to build a target. A target contains a group of body parts, lateral flags, and exclusion flags. Only perfectly matching targets will be removed.
 * @func_end
 */
function interhaptics_remove_target_from_event(material_ref, target) {}


/**
 * @func interhaptics_remove_all_targets_from_event
 * @desc This function removes all targets from a source range. The Interhaptics Engine will remap device endpoints and in-range targets to the device management layer for haptic playback.
 * @param {real} material_ref The ID of the source to remove all targets from, which is the same as the attached haptic effect.
 * @func_end
 */
function interhaptics_remove_all_targets_from_event(material_ref) {}


/**
 * @func interhaptics_compute_all_events
 * @desc This function must be called in the application main loop to trigger the rendering of all haptic buffers at a specific time. The Interhaptics Engine will compare the current time with the last known value to build a buffer large enough to cover frame drops. This function can be called from the main thread or in a parallel loop. It must be called at least once before triggering the device update event.
 * @param {real} current_time The current time in seconds.
 * @func_end
 */
function interhaptics_compute_all_events(current_time) {}


/**
 * @func interhaptics_update_event_positions
 * @desc This function updates the spatial positions for a specific source target.
 * @param {real} material_ref The ID of the source, which is the same as the attached haptic effect.
 * @param {array[struct.Interhaptics_CommandData]} target A vector of ${struct.Interhaptics_CommandData} to build a target. A target contains a group of body parts, lateral flags, and exclusion flags. Only perfectly matching targets will be updated.
 * @param {real} texture_position The new texture position.
 * @param {real} stiffness_position The new stiffness position.
 * @func_end
 */
function interhaptics_update_event_positions(material_ref, target, texture_position, stiffness_position) {}


/**
 * @func interhaptics_set_event_offsets
 * @desc This function sets the offsets for a specific haptic source.
 * @param {real} material_ref The ID of the source, which is the same as the attached haptic effect.
 * @param {real} vibration_offset The vibration offset.
 * @param {real} texture_offset The texture offset.
 * @param {real} stiffness_offet The stiffness offset.
 * @func_end
 */
function interhaptics_set_event_offsets(material_ref, vibration_offset, texture_offset, stiffness_offet) {}


/**
 * @func interhaptics_clear_inactive_events
 * @desc This function clears all inactive sources from memory. Inactive sources are kept in memory to avoid deletion and creation when playing and stopping a source.
 * @func_end
 */
function interhaptics_clear_inactive_events() {}


/**
 * @func interhaptics_clear_active_events
 * @desc This function clears all active sources from memory. Deleted sources can be recreated by calling the ${function.interhaptics_play_event} function.
 * @func_end
 */
function interhaptics_clear_active_events() {}


/**
 * @func interhaptics_clear_event
 * @desc This function clears a specific haptic source, whether it is active or not.
 * @param {real} material_ref The ID of the source, which is the same as the attached haptic effect.
 * @func_end
 */
function interhaptics_clear_event(material_ref) {}


/**
 * @func interhaptics_set_event_intensity
 * @desc This function sets the haptics intensity factor for a specific source.
 * @param {real} material_ref The ID of the source, which is the same as the attached haptic effect.
 * @param {real} intensity The intensity factor value. Always clamped above 0.
 * @func_end
 */
function interhaptics_set_event_intensity(material_ref, intensity) {}


/**
 * @func interhaptics_set_event_loop
 * @desc This function sets the loop flag for a specific source.
 * @param {real} material_ref The ID of the source, which is the same as the attached haptic effect.
 * @param {real} number_of_loops The number of loops for the event. <= 1 is one iteration.
 * @func_end
 */
function interhaptics_set_event_loop(material_ref, number_of_loops) {}


/**
 * @func interhaptics_set_target_intensity
 * @desc This function sets the haptics intensity factor for a specific target of a source.
 * @param {real} material_ref The ID of the source, which is the same as the attached haptic effect.
 * @param {array[struct.Interhaptics_CommandData]} target The target to change intensity.
 * @param {real} intensity The intensity factor value. Always clamped above 0.
 * @func_end
 */
function interhaptics_set_target_intensity(material_ref, target, intensity) {}


/**
 * @func interhaptics_providers_init
 * @desc This function handles the initialisation process of the specific device's COM, its haptic settings for rendering and subscription to the Interhaptics Engine. It returns a bitmask with bits set or unset for every provider in ${constant.INTERHAPTICS_PROVIDER}, depending on whether it was initialised or not.
 * 
 * To check if a specific provider is initialised: 
 * 
 * ```gml
 * var _init_mask = interhaptics_providers_init();
 * if ((_init_mask & INTERHAPTICS_PROVIDER.SENSA) != 0)
 * {
 *     // Sensa has been initialised
 * }
 * ```
 * 
 * @returns {real}
 * @func_end
 */
function interhaptics_providers_init() {}


/**
 * @func interhaptics_providers_available
 * @desc This function checks the availability of the device before triggering haptic playback. It returns a bitmask with bits set or unset for every provider in ${constant.INTERHAPTICS_PROVIDER}, depending on whether it is available or not.
 * 
 * This optional step can help improve performance.
 * @returns {real}
 * @func_end
 */
function interhaptics_providers_available() {}


/**
 * @func interhaptics_providers_clean
 * @desc This function is responsible for de-initialising the device's COM, if necessary, and for unsubscribing the provider from the Interhaptics Engine. It returns a bitmask with bits set or unset for every provider in ${constant.INTERHAPTICS_PROVIDER}, depending on whether de-initialisation succeeded for the provider or not.
 * @returns {real}
 * @func_end
 */
function interhaptics_providers_clean() {}


/**
 * @func interhaptics_providers_render_haptics
 * @desc This function triggers the rendering process for all initialised providers by retrieving the necessary haptic buffers, transcoding them if required, and playing them back on the associated device.
 * It is mandatory to call ${function.interhaptics_compute_all_events} from the Interhaptics Engine before calling ${function.interhaptics_providers_render_haptics} for synchronized haptic rendering. Typically, both APIs are implemented in the same loop, with ${function.interhaptics_compute_all_events} called before the ${function.interhaptics_providers_render_haptics} calls.
 * @func_end
 */
function interhaptics_providers_render_haptics() {}

// Constants

/**
 * @const INTERHAPTICS_OPERATOR
 * @desc > **Interhaptics Constant** [INTERHAPTICS_OPERATOR](https://www.interhaptics.com/doc/interhaptics-engine/#operator)
 *
 * <br />
 *
 * This enum represents operators used in the haptic body mapping. The possible values are:
 * @member MINUS Represents a minus operator (-1)
 * @member NEUTRAL Represents a neutral operator (0)
 * @member PLUS Represents a plus operator (1)
 * @const_end
 */
 
 
/**
 * @const INTERHAPTICS_LATERAL_FLAG
 * @desc > **Interhaptics Constant** [INTERHAPTICS_LATERAL_FLAG](https://www.interhaptics.com/doc/interhaptics-engine/#lateralflag)
 *
 * <br />
 *
 * This enum represents the lateral position of a body part. The possible values are:
 * @member UnknownPosition Represents an unknown position. (-1)
 * @member GLOBAL Represents the global position. (0)
 * @member RIGHT Represents the right position. (1)
 * @member LEFT Represents the left position. (2)
 * @member CENTER Represents the center position. (3)
 * @const_end
 */
 
 /**
 * @const INTERHAPTICS_GROUP_ID
 * @desc > **Interhaptics Constant** [INTERHAPTICS_GROUP_ID](https://www.interhaptics.com/doc/interhaptics-engine/#groupid)
 *
 * <br />
 *
 * The GroupID enum represents the group IDs for different body parts. Each group has a unique ID assigned to it for grouping purposes. The following are some of the groups and their corresponding IDs:
 * @member UNKNOWN Represents an unknown group. ID -1
 * @member ALL Represents all body parts. ID 0
 * @member TOP Represents the top portion of the body. ID 100
 * @member DOWN Represents the lower portion of the body. ID 101
 * @member ARM Represents the arm group. ID 200
 * @member HEAD Represents the head group. ID 201
 * @member CHEST Represents the chest group. ID 202
 * @member WAIST Represents the waist group. ID 203
 * @member LEG Represents the leg group. ID 204
 * @member UPPER_ARM Represents the upper arm group. ID 300
 * @member LOWER_ARM Represents the lower arm group. ID 301
 * @member HAND Represents the hand group. ID 302
 * @member SKULL Represents the skull group. ID 303
 * @member NECK Represents the neck group. ID 304
 * @member UPPER_LEG Represents the upper leg group. ID 305
 * @member LOWER_LEG Represents the lower leg group. ID 306
 * @member FOOT Represents the foot group. ID 307
 * @member PALM Represents the palm group. ID 400
 * @member FINGER Represents the finger group. ID 401
 * @member SOLE Represents the sole group. ID 402
 * @member TOE Represents the toe group. ID 403
 * @member THUMB Represents the thumb group. ID 500
 * @member INDEX Represents the index finger group. ID 501
 * @member MIDDLE Represents the middle finger group. ID 502
 * @member RING Represents the ring finger group. ID 503
 * @member PINKY Represents the pinky finger group. ID 504
 * @member HALLUX Represents the hallux group. ID 505
 * @member INDEX_TOE Represents the index toe group. ID 506
 * @member MIDDLE_TOE Represents the middle toe group. ID 507
 * @member RING_TOE Represents the ring toe group. ID 508
 * @member PINKY_TOE Represents the pinky toe group. ID 509
 * @member FIRST Represents the first segment group. ID 600
 * @member SECOND Represents the second segment group. ID 601
 * @member THIRD Represents the third segment group. ID 602
 * @const_end
 */

 /**
  * @const INTERHAPTICS_PROVIDER
  * @desc > **Interhaptics Constant** N / A
  * 
  * <br />
  * This enum represents the possible haptics providers.
  * @member GAME_INPUT Game input provider
  * @member SENSA Sensa provider
  * @member DUAL_SENSE DualSense provider
  * @const_end
  */
 
 /**
 * @struct Interhaptics_CommandData
 * @desc > **Interhaptics Constant** [Interhaptics_CommandData](https://www.interhaptics.com/doc/interhaptics-engine/#commanddata)
 *
 * <br />
 *
 * This structure represents an instruction that is useful for finding the body part to render. It contains the following members:
 * @member Sign {constant.INTERHAPTICS_OPERATOR} Represents the sign of the operation (+/-) of type Operator.
 * @member Group {constant.INTERHAPTICS_GROUP_ID} Represents the group targeted of type ${constant.INTERHAPTICS_GROUP_ID}.
 * @member Side {constant.INTERHAPTICS_LATERAL_FLAG} Represents the side targeted of type ${constant.INTERHAPTICS_LATERAL_FLAG}.
 * @struct_end
 */
 
/**
  * @module home
  * @title Home
  * @desc This is the Interhaptics extension for GameMaker, which allows you to add haptic feedback to your GameMaker games.
  * 
  * Interhaptics is a software that allows you to design, test, and play haptic effects.
  * 
  * To create your own haptic effects for use with Interhaptics you can use the [Haptic Composer](https://www.interhaptics.com/doc/haptic-composer) tool, which includes an [Audio to Haptic](https://www.interhaptics.com/doc/haptic-composer/#audio-to-haptics-settings) feature to generate a haptic effect from audio.
  * 
  * [[Note: This extension is only supported on Windows and PS5.]]
  * 
  * @section Guides
  * @desc These are the guides for the Interhaptics extension: 
  * @ref page.setup
  * @ref page.basic_use
  * @section_end
  * 
  * @section Modules
  * @desc These are the modules of the Interhaptics extension. Each module links to the corresponding section of the Interhaptics documentation where possible.
  * @ref module.engine_control
  * @ref module.engine_events
  * @ref module.providers
  * @ref module.shared_types
  * @section_end
  * 
  * @module_end
  */

/**
  * @module engine_control
  * @title Engine Control
  * @desc **Interhaptics Docs Section:** [Engine Control](https://www.interhaptics.com/doc/interhaptics-engine/#engine-control)
  * 
  * <br />
  * 
  * This module contains the functions related to Engine Control.
  * 
  * @section_func
  * @ref interhaptics_init
  * @ref interhaptics_quit
  * @ref interhaptics_set_global_intensity
  * @ref interhaptics_get_global_intensity
  * @ref interhaptics_add_hm
  * @ref interhaptics_add_parametric_effect
  * @ref interhaptics_delete_hm
  * @ref interhaptics_update_hm
  * @ref interhaptics_transients_played_on_those_body_parts
  * @section_end
  * 
  * @module_end
  */


/**
  * @module engine_events
  * @title Engine Events
  * @desc **Interhaptics Docs Section:** [Engine Events](https://www.interhaptics.com/doc/interhaptics-engine/#engine-events)
  * 
  * <br />
  * 
  * This module contains the functions related to Engine Events.
  * 
  * @section_func
  * @ref interhaptics_play_event
  * @ref interhaptics_stop_event
  * @ref interhaptics_stop_all_events
  * @ref interhaptics_add_target_to_event
  * @ref interhaptics_remove_target_from_event
  * @ref interhaptics_remove_all_targets_from_event
  * @ref interhaptics_compute_all_events
  * @ref interhaptics_update_event_positions
  * @ref interhaptics_set_event_offsets
  * @ref interhaptics_set_event_intensity
  * @ref interhaptics_set_event_loop
  * @ref interhaptics_set_target_intensity
  * @ref interhaptics_clear_inactive_events
  * @ref interhaptics_clear_active_events
  * @ref interhaptics_clear_event
  * @section_end
  * 
  * @module_end
  */


/**
  * @module providers
  * @title Providers
  * @desc **Interhaptics Docs Section:** [Key Concepts](https://www.interhaptics.com/doc/interhaptics-engine/#key-concepts)
  * 
  * <br />
  * 
  * This module contains the functions related to providers.
  * 
  * @section_func Functions
  * @ref interhaptics_providers_init
  * @ref interhaptics_providers_available
  * @ref interhaptics_providers_clean
  * @ref interhaptics_providers_render_haptics
  * @section_end
  * 
  * @module_end
  */

/**
 * @module shared_types
 * @title Shared Types
 * @desc **Interhaptics Docs Section:** [Shared Types](https://www.interhaptics.com/doc/interhaptics-engine/#shared-types)
 * 
 * <br />
 * 
 * This module contains the constants and structs related to shared types.
 * 
 * @section_const Constants
 * @desc The following are the constants that the Interhaptics extension defines. All of them are defined as an enum.
 * @ref INTERHAPTICS_OPERATOR
 * @ref INTERHAPTICS_LATERAL_FLAG
 * @ref INTERHAPTICS_GROUP_ID
 * @ref INTERHAPTICS_PROVIDER
 * @section_end
 *
 * @section_struct Structs
 * @desc The Interhaptics extension also defines a ${type.struct}: 
 * @ref Interhaptics_CommandData
 * @section_end
 * 
 * @module_end
 */
