
enum INTERHAPTICS_OPERATOR
{
	MINUS = -1,
	NEUTRAL = 0,
	PLUS = 1,
}

enum INTERHAPTICS_LATERAL_FLAG
{
	UNKNOWN_POSITION = -1,
	GLOBAL = 0,
	RIGHT = 1,
	LEFT = 2,
	CENTER = 3
};

enum INTERHAPTICS_GROUP_ID
{
	UNKNOWN = -1,
	ALL = 0,
	TOP = 100,
	DOWN = 101,
	ARM = 200,
	HEAD = 201,
	CHEST = 202,
	WAIST = 203,
	LEG = 204,
	UPPER_ARM = 300,
	LOWER_ARM = 301,
	HAND = 302,
	SKULL = 303,
	NECK = 304,
	UPPER_LEG = 305,
	LOWER_LEG = 306,
	FOOT = 307,
	PALM = 400,
	FINGER = 401,
	SOLE = 402,
	TOE = 403,
	THUMB = 500,
	INDEX = 501,
	MIDDLE = 502,
	RING = 503,
	PINKY = 504,
	HALLUX = 505,
	INDEX_TOE = 506,
	MIDDLE_TOE = 507,
	RING_TOE = 508,
	PINKY_TOE = 509,
	FIRST = 600,
	SECOND = 601,
	THIRD = 602,
};

enum INTERHAPTICS_PROVIDER
{
	GAME_INPUT = 1,
	SENSA = 2,
	DUAL_SENSE = 4,
}

_available_providers = interhaptics_providers_available();
_initialized = interhaptics_providers_init();

if (_available_providers != _initialized) {
	
}

if ((_available_providers & INTERHAPTICS_PROVIDER.DUAL_SENSE) != 0) {
	
}