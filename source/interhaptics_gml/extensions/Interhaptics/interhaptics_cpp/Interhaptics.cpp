
#include "Interhaptics_Tools.h"

#include "windows.h"

std::vector<void*> providers;
func double interhaptics_init()
{
	//HINSTANCE GameInputHandle = LoadLibraryA("Interhaptics.GameInputProvider.dll");
	providers.push_back((void*)LoadLibraryA("Interhaptics.GameInputProvider.dll"));
	providers.push_back((void*)LoadLibraryA("Interhaptics.RazerProvider.dll"));

	return Init() ? 1.0 : 0.0;
}

func double interhaptics_quit()
{
	for (int i = 0; i < providers.size(); i++)
	{
		HINSTANCE DllHandle = (HINSTANCE)providers[i];
		FreeLibrary(DllHandle);
	}
	
	providers.clear();

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

///////////////////////////////////// 1.4.0

func double interhaptics_set_global_intensity(double intensity)
{
	SetGlobalIntensity(intensity);
	return 0;
}

func double interhaptics_get_global_intensity()
{
	return GetGlobalIntensity();
}

func double interhaptics_add_parametric_effect_multiplatform(char* buff_args)
{
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
	uint64_t material_id = 0;
	VALIDATE_REF_TYPE(material_ref, GM_INTERHAPTICS_TYPE_MATERIAL, material_id);

	DeleteHM((int)material_id);
	return 0;
}

func double interhaptics_transients_played_on_those_body_parts_multiplatform(double perception,char* buff_args)
{
	auto args = buffer_unpack((uint8_t*)buff_args);

	auto vect = YYGetArray(args[0]);
	int* _bodyparts = (int*)malloc(vect.size() * sizeof(int));
	VectorToIntArray(vect, _bodyparts);

	size_t _numberOfBodyparts = vect.size();

	return TransientsPlayedOnThoseBodyparts((int)perception, _bodyparts, (int)_numberOfBodyparts)?1.0:0.0;
}

func double interhaptics_stop_all_events()
{
	StopAllEvents();
	return 0;
}

func double interhaptics_set_event_intensity(double material_ref,double intensity)
{
	uint64_t material_id = 0;
	VALIDATE_REF_TYPE(material_ref, GM_INTERHAPTICS_TYPE_MATERIAL, material_id);

	SetEventIntensity((int)material_id, intensity);
	
	return 0;
}

func double interhaptics_set_event_loop(double material_ref,double number_of_loop)
{
	uint64_t material_id = 0;
	VALIDATE_REF_TYPE(material_ref, GM_INTERHAPTICS_TYPE_MATERIAL, material_id);

	SetEventLoop((int)material_id,(int)number_of_loop);
	return 0;
}

func double interhaptics_set_target_intensity_multiplatform(double material_ref, char* buff_args, double intensity)
{
	uint64_t material_id = 0;
	VALIDATE_REF_TYPE(material_ref, GM_INTERHAPTICS_TYPE_MATERIAL, material_id);

	auto args = buffer_unpack((uint8_t*)buff_args);

	auto vect = YYGetArray(args[0]);
	std::vector<CommandData>  _target = VectorToCommandDataArray(vect);

	SetTargetIntensityMarshal((int)material_id, _target.data(), (int)_target.size(), (int)intensity);
	return 0;
}

///////////////////////////////////// Provider

//func double interhaptics_provider_init()
//{
//	return ProviderInit() ? 1.0 : 0.0;
//}

func double interhaptics_provider_init()
{
	typedef void(__stdcall* f_providerInit)();

	for (int i = 0; i < providers.size(); i++)
	{
		HINSTANCE DllHandle = (HINSTANCE)providers[i];

		if (!DllHandle)
		{
			//std::clog << "Provider not found." << std::endl;
			continue;
		}

		f_providerInit providerInit = (f_providerInit)GetProcAddress(DllHandle, "ProviderInit");

		if (!providerInit)
		{
			//std::clog << "providerInit not found. " << std::endl;
			continue;
		}

		providerInit();
	}
	return 0;
}

//func double interhaptics_provider_is_present()
//{
//	return ProviderIsPresent() ? 1.0 : 0.0;
//}

#include <cmath>
func double interhaptics_provider_is_present()
{
	typedef bool(__stdcall* f_providerIsPresent)();

	double ret = 0;

	for (int i = 0; i < providers.size(); i++)
	{
		HINSTANCE DllHandle = (HINSTANCE)providers[i];

		if (!DllHandle)
		{
			//std::clog << "Provider not found." << std::endl;
			continue;
		}

		f_providerIsPresent providerIsPresent = (f_providerIsPresent)GetProcAddress(DllHandle, "ProviderIsPresent");

		if (!providerIsPresent)
		{
			//std::clog << "providerIsPresent not found. " << std::endl;
			continue;
		}

		if(providerIsPresent())
			ret += (int)(1 << i);
	}
	return ret;
}

//func double interhaptics_provider_provider_clean()
//{
//	return ProviderClean() ? 1.0 : 0.0;
//}

func double interhaptics_provider_provider_clean()
{
	typedef void(__stdcall* f_providerClean)();

	for (int i = 0; i < providers.size(); i++)
	{
		HINSTANCE DllHandle = (HINSTANCE)providers[i];

		if (!DllHandle)
		{
			//std::clog << "Provider not found." << std::endl;
			continue;
		}

		f_providerClean providerClean = (f_providerClean)GetProcAddress(DllHandle, "ProviderClean");

		if (!providerClean)
		{
			//std::clog << "providerClean not found. " << std::endl;
			continue;
		}

		providerClean();
	}
	return 0;
}

//func double interhaptics_provider_render_haptics()
//{
//	ProviderRenderHaptics();
//	return 0;
//}

func double interhaptics_provider_render_haptics()
{
	typedef void(__stdcall* f_providerRenderHaptics)();

	for (int i = 0; i < providers.size(); i++)
	{
		HINSTANCE DllHandle = (HINSTANCE)providers[i];

		if (!DllHandle)
		{
			//std::clog << "Provider not found." << std::endl;
			continue;
		}

		f_providerRenderHaptics providerRenderHaptics = (f_providerRenderHaptics)GetProcAddress(DllHandle, "ProviderRenderHaptics");

		if (!providerRenderHaptics)
		{
			//std::clog << "ProviderRenderHaptics not found. " << std::endl;
			continue;
		}

		providerRenderHaptics();
	}
	return 0;
}
