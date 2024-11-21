#include "windows.h"
#include "Interhaptics_Platform.h"

std::vector<const char*> GetProviderFilenames() {
	return {
	"Interhaptics.GameInputProvider.dll",	// GameInput
	"Interhaptics.RazerProvider.dll",		// Sensa
	"Interhaptics.DualSensePCProvider.dll"	// DualSense
	};
}

void* LoadModule(const char* moduleFilename) {
	return LoadLibraryA(moduleFilename);
}

void* GetFunctionAddress(void* module, const char* name) {
	return GetProcAddress((HMODULE)module, name);
}
