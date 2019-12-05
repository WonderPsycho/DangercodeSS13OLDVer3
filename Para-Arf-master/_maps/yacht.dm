/* Old definition when I was testing.
#if !defined(MAP_FILE)

        #include "map_files\yacht\yacht.dmm"
		#include "map_files\cyberiad\z2.dmm"

        #define MAP_FILE "z1.dmm"
        #define MAP_NAME "A.R.F.S. DP"
        #define MAP_TRANSITION_CONFIG list(\
DECLARE_LEVEL(MAIN_STATION, SELFLOOPING, list(STATION_LEVEL,STATION_CONTACT,REACHABLE,AI_OK)),\
DECLARE_LEVEL(CENTCOMM, SELFLOOPING, list(ADMIN_LEVEL, BLOCK_TELEPORT, IMPEDES_MAGIC)))

		#include "map_files\yacht\yacht_areas.dm"
		#include "map_files\yacht\yacht_jobs.dm"

#elif !defined(MAP_OVERRIDE)

	#warn a map has already been included, ignoring Debugstation.

#endif

*/

#if !defined(MAP_FILE)
        #include "map_files\yacht\yacht.dmm"
        #include "map_files\yacht\z2.dmm"
        #include "map_files\yacht\z3.dmm"
        #include "map_files\yacht\z4.dmm"
        #include "map_files\generic\z5.dmm"
        #include "map_files\generic\z6.dmm"
        #include "map_files\generic\z7.dmm"

        #define MAP_FILE "yacht.dmm"
        #define MAP_ID 999//Map ID is for compiling certain code for specific maps. To find these, ctrl-f for [#if MAP_ID == 999].
        #define MAP_NAME "ARFS Endeavor"
        #define STATION_NAME "ARFS Endeavor"
        #define MAP_TRANSITION_CONFIG list(\
DECLARE_LEVEL(MAIN_STATION, CROSSLINKED, list(STATION_LEVEL,STATION_CONTACT,REACHABLE,AI_OK)),\
DECLARE_LEVEL(CENTCOMM, SELFLOOPING, list(ADMIN_LEVEL, BLOCK_TELEPORT, IMPEDES_MAGIC)),\
DECLARE_LEVEL(EMPTY_AREA, CROSSLINKED, list(REACHABLE)),\
DECLARE_LEVEL(CONSTRUCTION, CROSSLINKED, list(REACHABLE)),\
DECLARE_LEVEL(MINING, CROSSLINKED, list(REACHABLE, STATION_CONTACT, HAS_WEATHER, ORE_LEVEL, AI_OK)),\
DECLARE_LEVEL(DERELICT, CROSSLINKED, list(REACHABLE)),\
DECLARE_LEVEL(EMPTY_AREA, CROSSLINKED, list(REACHABLE)))

#elif !defined(MAP_OVERRIDE)

	#warn a map has already been included, ignoring ARFS Endeavor.

#endif
