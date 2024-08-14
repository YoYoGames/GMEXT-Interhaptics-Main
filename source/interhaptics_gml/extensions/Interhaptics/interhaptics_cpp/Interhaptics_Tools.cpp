
#include "Interhaptics_Tools.h"

uint64_t packIndexIntoRef(uint32_t index, uint8_t type)
{
	uint64_t packedValue = 0;
	packedValue |= static_cast<uint64_t>(GM_INTERHAPTICS_EXT) << (8 + 32);
	packedValue |= static_cast<uint64_t>(type) << 32;
	packedValue |= index;

	return packedValue;
}

CommandData MapToCommandData(const std::map<std::string, const uint8_t*>& map)
{
	Operator sign = Operator::Neutral;
	GroupID group = GroupID::Unknown;
	LateralFlag side = LateralFlag::Global;

	if (auto search = map.find("sign"); search != map.end())
	{
		sign = (Operator)YYGetReal(search->second);
	}
	if (auto search = map.find("group"); search != map.end())
	{
		group = (GroupID)YYGetReal(search->second);
	}
	if (auto search = map.find("side"); search != map.end())
	{
		side = (LateralFlag)YYGetReal(search->second);
	}

	CommandData command_data(sign, group, side);

	return command_data;
}

std::vector<CommandData> VectorToCommandDataArray(const std::vector<const uint8_t*>& vector)
{
	std::vector<CommandData> vec = {};
	for (int i = 0; i < vector.size(); i++)
	{
		auto map = YYGetStruct(vector[i]);
		CommandData command_data = MapToCommandData(map);
		vec.push_back(command_data);
	}
	return vec;
}

void VectorToDoubleArray(const std::vector<const uint8_t*>& vector, double* out)
{
	for (int i = 0; i < vector.size(); i++)
		out[i] = YYGetReal(vector[i]);;
}

void VectorToIntArray(const std::vector<const uint8_t*>& vector, int* out)
{
	for (int i = 0; i < vector.size(); i++)
		out[i] = (int)YYGetReal(vector[i]);;
}
