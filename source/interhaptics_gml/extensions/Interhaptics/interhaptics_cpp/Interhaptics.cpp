
#include "Interhaptics_Tools.h"

#include "windows.h"

std::vector<void*> g_providerHandles;
std::vector<std::string> g_providerFilenames = {
	"Interhaptics.GameInputProvider.dll",
	"Interhaptics.RazerProvider.dll",
};

bool g_isInitialised = false;

func double interhaptics_init()
{
	if (g_isInitialised) return 1.0;

	g_isInitialised = Init();
	if (g_isInitialised) {
		for (const auto& providerFilename : g_providerFilenames) {
			g_providerHandles.push_back((void*)LoadLibraryA(providerFilename.c_str()));
		}
	}

	return g_isInitialised ? 1.0 : 0.0;
}

func double interhaptics_quit()
{
	if (!g_isInitialised) return 0;
	g_isInitialised = false;

	for (const auto& providerHandle : g_providerHandles)
	{
		FreeLibrary((HMODULE)providerHandle);
	}
	g_providerHandles.clear();

	Quit();

	return 0;
}

func double interhaptics_add_hm(char* content)
{
	if (!g_isInitialised) return -1;

	auto material_id = AddHM(content);
	return (double)packIndexIntoRef(material_id, GM_INTERHAPTICS_TYPE_MATERIAL);
}

func double interhaptics_update_hm(double material_ref, char* content)
{
	if (!g_isInitialised) return -1;

	uint64_t material_id = 0;
	VALIDATE_REF_TYPE(material_ref, GM_INTERHAPTICS_TYPE_MATERIAL, material_id);

	return UpdateHM((int)material_id, content) ? 1.0 : 0.0;
}

func double interhaptics_play_event(double material_ref, double vibration_offset, double texture_offset, double stiffness_offset)
{
	if (!g_isInitialised) return -1;

	uint64_t material_id = 0;
	VALIDATE_REF_TYPE(material_ref, GM_INTERHAPTICS_TYPE_MATERIAL, material_id);

	PlayEvent((int)material_id, vibration_offset, texture_offset, stiffness_offset);

	return 0;
}

func double interhaptics_stop_event(double material_ref)
{
	if (!g_isInitialised) return -1;

	uint64_t material_id = 0;
	VALIDATE_REF_TYPE(material_ref, GM_INTERHAPTICS_TYPE_MATERIAL, material_id);

	StopEvent((int)material_id);
	return 0;
}

func double interhaptics_add_target_to_event_multiplatform(double material_ref, char* buff_args)
{
	if (!g_isInitialised) return -1;

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
	if (!g_isInitialised) return -1;

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
	if (!g_isInitialised) return -1;

	uint64_t material_id = 0;
	VALIDATE_REF_TYPE(material_ref, GM_INTERHAPTICS_TYPE_MATERIAL, material_id);

	RemoveAllTargetsFromEvent((int)material_id);
	return 0;
}

func double interhaptics_compute_all_events(double current_time)
{
	if (!g_isInitialised) return -1;

	ComputeAllEvents(current_time);
	return 0;
}

func double interhaptics_update_event_positions_multiplatform(double material_ref, char* buff_args, double texture_position, double stiffness_position)
{
	if (!g_isInitialised) return -1;

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
	if (!g_isInitialised) return -1;

	uint64_t material_id = 0;
	VALIDATE_REF_TYPE(material_ref, GM_INTERHAPTICS_TYPE_MATERIAL, material_id);

	SetEventOffsets((int)material_id, vibration_offset, texture_offset, stiffness_offet);
	return 0;
}

func double interhaptics_clear_inactive_events()
{
	if (!g_isInitialised) return -1;

	ClearInactiveEvents();
	return 0;
}

func double interhaptics_clear_active_events()
{
	if (!g_isInitialised) return -1;

	ClearActiveEvents();
	return 0;
}

func double interhaptics_clear_event(double material_ref)
{
	if (!g_isInitialised) return -1;

	uint64_t material_id = 0;
	VALIDATE_REF_TYPE(material_ref, GM_INTERHAPTICS_TYPE_MATERIAL, material_id);

	ClearEvent((int)material_id);
	return 0;
}

///////////////////////////////////// 1.4.0

func double interhaptics_set_global_intensity(double intensity)
{
	if (!g_isInitialised) return -1;

	SetGlobalIntensity(intensity);
	return 0;
}

func double interhaptics_get_global_intensity()
{
	if (!g_isInitialised) return -1;

	return GetGlobalIntensity();
}

func double interhaptics_add_parametric_effect_multiplatform(char* buff_args)
{
	if (!g_isInitialised) return -1;

	auto args = buffer_unpack((uint8_t*)buff_args);

	auto vect = YYGetArray(args[0]);
	double* amplitude = (double*)malloc(vect.size() * sizeof(double));
	VectorToDoubleArray(vect, amplitude);

	size_t amplitudeSize = vect.size();

	vect = YYGetArray(args[1]);
	double* pitch = (double*)malloc(vect.size() * sizeof(double));
	VectorToDoubleArray(vect, pitch);

	size_t pitchSize = vect.size();

	double pitchMin = YYGetReal(args[2]);
	double pitchMax = YYGetReal(args[3]);

	vect = YYGetArray(args[4]);
	double* transient = (double*)malloc(vect.size() * sizeof(double));
	VectorToDoubleArray(vect, transient);
	size_t transientSize = vect.size();

	bool isLooping = YYGetReal(args[5])>0.5;

	AddParametricEffect(amplitude, (int)amplitudeSize, pitch, (int)pitchSize, pitchMin, pitchMax, transient, (int)transientSize, isLooping);

	return 0;
}

func double interhaptics_delete_hm(double material_ref)
{
	if (!g_isInitialised) return -1;

	uint64_t material_id = 0;
	VALIDATE_REF_TYPE(material_ref, GM_INTERHAPTICS_TYPE_MATERIAL, material_id);

	DeleteHM((int)material_id);
	return 0;
}

func double interhaptics_transients_played_on_those_body_parts_multiplatform(double perception,char* buff_args)
{
	if (!g_isInitialised) return -1;

	auto args = buffer_unpack((uint8_t*)buff_args);

	auto vect = YYGetArray(args[0]);
	int* _bodyparts = (int*)malloc(vect.size() * sizeof(int));
	VectorToIntArray(vect, _bodyparts);

	size_t _numberOfBodyparts = vect.size();

	return TransientsPlayedOnThoseBodyparts((int)perception, _bodyparts, (int)_numberOfBodyparts)?1.0:0.0;
}

func double interhaptics_stop_all_events()
{
	if (!g_isInitialised) return -1;

	StopAllEvents();
	return 0;
}

func double interhaptics_set_event_intensity(double material_ref,double intensity)
{
	if (!g_isInitialised) return -1;

	uint64_t material_id = 0;
	VALIDATE_REF_TYPE(material_ref, GM_INTERHAPTICS_TYPE_MATERIAL, material_id);

	SetEventIntensity((int)material_id, intensity);
	
	return 0;
}

func double interhaptics_set_event_loop(double material_ref,double number_of_loop)
{
	if (!g_isInitialised) return -1;

	uint64_t material_id = 0;
	VALIDATE_REF_TYPE(material_ref, GM_INTERHAPTICS_TYPE_MATERIAL, material_id);

	SetEventLoop((int)material_id,(int)number_of_loop);
	return 0;
}

func double interhaptics_set_target_intensity_multiplatform(double material_ref, char* buff_args, double intensity)
{
	if (!g_isInitialised) return -1;

	uint64_t material_id = 0;
	VALIDATE_REF_TYPE(material_ref, GM_INTERHAPTICS_TYPE_MATERIAL, material_id);

	auto args = buffer_unpack((uint8_t*)buff_args);

	auto vect = YYGetArray(args[0]);
	std::vector<CommandData>  _target = VectorToCommandDataArray(vect);

	SetTargetIntensityMarshal((int)material_id, _target.data(), (int)_target.size(), (int)intensity);
	return 0;
}

///////////////////////////////////// Provider

func double interhaptics_provider_init()
{
	if (!g_isInitialised) return -1;

	typedef void(__stdcall* f_providerInit)();

	for (const auto& providerHandle : g_providerHandles)
	{
		if (!providerHandle)
		{
			continue;
		}

		f_providerInit providerInit = (f_providerInit)GetProcAddress((HMODULE)providerHandle, "ProviderInit");

		if (!providerInit)
		{
			continue;
		}

		providerInit();
	}
	return 0;
}

func double interhaptics_provider_is_present()
{
	if (!g_isInitialised) return -1;

	typedef bool(__stdcall* f_providerIsPresent)();

	int64_t ret = 0;

	for (int i = 0; i < g_providerHandles.size(); i++)
	{
		HMODULE providerHandle = (HMODULE)g_providerHandles[i];

		if (!providerHandle) {
			continue;
		}

		f_providerIsPresent providerIsPresent = (f_providerIsPresent)GetProcAddress(providerHandle, "ProviderIsPresent");

		if (!providerIsPresent) {
			continue;
		}

		if (providerIsPresent()) {
			ret |= (1ULL << i);
		}
	}

	return (double)ret;
}

func double interhaptics_provider_provider_clean()
{
	if (!g_isInitialised) return -1;

	typedef void(__stdcall* f_providerClean)();

	for (const auto& providerHandle : g_providerHandles)
	{
		if (!providerHandle) {
			continue;
		}

		f_providerClean providerClean = (f_providerClean)GetProcAddress((HMODULE)providerHandle, "ProviderClean");

		if (!providerClean) {
			continue;
		}

		providerClean();
	}
	return 0;
}

func double interhaptics_provider_render_haptics()
{
	if (!g_isInitialised) return -1;

	typedef void(__stdcall* f_providerRenderHaptics)();

	for (const auto& providerHandle : g_providerHandles)
	{
		if (!providerHandle) {
			continue;
		}

		f_providerRenderHaptics providerRenderHaptics = (f_providerRenderHaptics)GetProcAddress((HMODULE)providerHandle, "ProviderRenderHaptics");

		if (!providerRenderHaptics) {
			continue;
		}

		providerRenderHaptics();
	}
	return 0;
}
