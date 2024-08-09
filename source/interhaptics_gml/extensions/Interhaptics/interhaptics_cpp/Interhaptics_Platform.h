#pragma once

#include <vector>

void* LoadModule(const char* moduleFilename);
void* GetFunctionAddress(void* module, const char* name);
std::vector<const char*> GetProviderFilenames();