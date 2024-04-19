
#include "Interhaptics_Tools.h"

func double interhaptics_init()
{
	return Init() ? 1.0 : 0.0;
}

func double interhaptics_quit()
{
	Quit();
	return 0;
}

func double interhaptics_add_hm(char* content)
{
	auto material_id = AddHM(content);
	return (double)packIndexIntoRef(material_id, GM_INTERHAPTICS_TYPE_MATERIAL);
}

func double interhaptics_update_hm(double material_ref, char* content)
{
	uint64_t material_id = 0;
	VALIDATE_REF_TYPE(material_ref, GM_INTERHAPTICS_TYPE_MATERIAL, material_id);

	return UpdateHM((int)material_id, content) ? 1.0 : 0.0;
}

func double interhaptics_play_event(double material_ref, double vibration_offset, double texture_offset, double stiffness_offset)
{
	uint64_t material_id = 0;
	VALIDATE_REF_TYPE(material_ref, GM_INTERHAPTICS_TYPE_MATERIAL, material_id);

	PlayEvent((int)material_id, vibration_offset, texture_offset, stiffness_offset);
	return 0;
}

func double interhaptics_stop_event(double material_ref)
{
	uint64_t material_id = 0;
	VALIDATE_REF_TYPE(material_ref, GM_INTERHAPTICS_TYPE_MATERIAL, material_id);

	StopEvent((int)material_id);
	return 0;
}

func double interhaptics_add_target_to_event_multiplatform(double material_ref, char* buff_args)
{
	uint64_t material_id = 0;
	VALIDATE_REF_TYPE(material_ref, GM_INTERHAPTICS_TYPE_MATERIAL, material_id);

	auto args = buffer_unpack((uint8_t*)buff_args);
	auto vect = YYGetArray(args[0]);

	std::vector<CommandData> target = VectorToCommandDataArray(vect);

	AddTargetToEventMarshal((int)material_id, target.data(), (int)target.size());

	return 0;
}

func double interhaptics_remove_target_from_event_multiplatform(double material_ref, char* buff_args)
{
	uint64_t material_id = 0;
	VALIDATE_REF_TYPE(material_ref, GM_INTERHAPTICS_TYPE_MATERIAL, material_id);

	auto args = buffer_unpack((uint8_t*)buff_args);
	auto vect = YYGetArray(args[0]);

	std::vector<CommandData> target = VectorToCommandDataArray(vect);

	RemoveTargetFromEventMarshal((int)material_id, target.data(), (int)target.size());

	return 0;
}

func double interhaptics_remove_all_targets_from_event(double material_ref)
{
	uint64_t material_id = 0;
	VALIDATE_REF_TYPE(material_ref, GM_INTERHAPTICS_TYPE_MATERIAL, material_id);

	RemoveAllTargetsFromEvent((int)material_id);
	return 0;
}

func double interhaptics_compute_all_events(double current_time)
{
	ComputeAllEvents(current_time);
	return 0;
}

func double interhaptics_update_event_positions_multiplatform(double material_ref, char* buff_args, double texture_position, double stiffness_position)
{
	uint64_t material_id = 0;
	VALIDATE_REF_TYPE(material_ref, GM_INTERHAPTICS_TYPE_MATERIAL, material_id);

	auto args = buffer_unpack((uint8_t*)buff_args);
	auto vect = YYGetArray(args[0]);

	std::vector<CommandData> target = VectorToCommandDataArray(vect);

	UpdateEventPositionsMarshal((int)material_id, target.data(), (int)target.size(), texture_position, stiffness_position);
	return 0;
}

func double interhaptics_set_event_offsets(double material_ref, double vibration_offset, double texture_offset, double stiffness_offet)
{
	uint64_t material_id = 0;
	VALIDATE_REF_TYPE(material_ref, GM_INTERHAPTICS_TYPE_MATERIAL, material_id);

	SetEventOffsets((int)material_id, vibration_offset, texture_offset, stiffness_offet);
	return 0;
}

func double interhaptics_clear_inactive_events()
{
	ClearInactiveEvents();
	return 0;
}

func double interhaptics_clear_active_events()
{
	ClearActiveEvents();
	return 0;
}

func double interhaptics_clear_event(double material_ref)
{
	uint64_t material_id = 0;
	VALIDATE_REF_TYPE(material_ref, GM_INTERHAPTICS_TYPE_MATERIAL, material_id);

	ClearEvent((int)material_id);
	return 0;
}

///////////////////////////////////// Provider

extern "C"
{
	DLLExport bool ProviderInit();
	DLLExport bool ProviderIsPresent();
	DLLExport bool ProviderClean();
	DLLExport void ProviderRenderHaptics();
}

func double interhaptics_provider_init()
{
	return ProviderInit() ? 1.0 : 0.0;
}

func double interhaptics_provider_is_present()
{
	return ProviderIsPresent() ? 1.0 : 0.0;
}

func double interhaptics_provider_provider_clean()
{
	return ProviderClean() ? 1.0 : 0.0;
}

func double interhaptics_provider_render_haptics()
{
	ProviderRenderHaptics();
	return 0;
}
