#pragma once

#include <vector>

typedef bool(*f_bool)();
typedef void(*f_void)();

void* LoadModule(const char* moduleFilename);
void* GetFunctionAddress(void* module, const char* name);
std::vector<const char*> GetProviderFilenames();