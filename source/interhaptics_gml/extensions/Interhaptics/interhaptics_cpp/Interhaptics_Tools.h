
#if defined(OS_Windows) || defined(OS_Linux) || defined(OS_MacOs)
#include "Extension_Interface.h"

#include "YYRValue.h"
#include "pch.h"
#endif

#include "InterhapticsEngine.h"

#include <map>
#include <string>
#include <vector>

#include "ExtBufferIO.h"

#ifdef OS_Windows
#define func extern "C" __declspec(dllexport)
#else
#ifdef defined(OS_Linux) || defined(OS_MacOs)
#define func extern "C"
#else
#define func extern "C"
#endif
#endif

// Extension code
#define GM_INTERHAPTICS_EXT 0x02

// Type codes
#define GM_INTERHAPTICS_TYPE_MATERIAL 0x01
// #define GM_INTERHAPTICS_TYPE_ 0x02
// #define GM_INTERHAPTICS_TYPE_ 0x03
// #define GM_INTERHAPTICS_TYPE_ 0x04
// #define GM_INTERHAPTICS_TYPE_ 0x05
// #define GM_INTERHAPTICS_TYPE_ 0x06

#define VALIDATE_EXT(ref, output)                                                             \
	{                                                                                         \
		output = (uint64_t)ref;                                                               \
		uint32_t _ext_id = (output >> 40) & 0x3FF;                                            \
		if (_ext_id != GM_INTERHAPTICS_EXT)                                                   \
		{                                                                                     \
			LOG_ERROR("Invalid interhaptics type, type not compatible with extension call."); \
			return -1;                                                                        \
		}                                                                                     \
	}

#define VALIDATE_REF_TYPE(ref, type, output)                  \
	{                                                         \
		uint64_t _ref = 0;                                    \
		VALIDATE_EXT(ref, _ref);                              \
		uint8_t _ref_type = (_ref >> 32) & 0xFF;              \
		uint64_t _ref_id = _ref & 0xFFFFFFFF;                 \
		if (_ref_type == type)                                \
		{                                                     \
			output = _ref_id;                                 \
		}                                                     \
		else                                                  \
		{                                                     \
			LOG_ERROR("Invalid interhaptics material type."); \
			return -2;                                        \
		}                                                     \
	}

uint64_t packIndexIntoRef(uint32_t index, uint8_t type);

CommandData MapToCommandData(const std::map<std::string, const uint8_t*>& map);
std::vector<CommandData> VectorToCommandDataArray(const std::vector<const uint8_t*>& vector);
void VectorToDoubleArray(const std::vector<const uint8_t*>& vector, double* out);
void VectorToIntArray(const std::vector<const uint8_t*>& vector, int* out);