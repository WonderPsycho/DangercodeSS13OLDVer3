#if !defined(MAP_FILE)

        #include "map_files\debugstation\z1.dmm"


        #define MAP_FILE "z1.dmm"
        #define MAP_NAME "Debugstation"
        #define MAP_TRANSITION_CONFIG list(\
DECLARE_LEVEL(MAIN_STATION, SELFLOOPING, list(STATION_LEVEL,STATION_CONTACT,REACHABLE,AI_OK)))

#elif !defined(MAP_OVERRIDE)

	#warn a map has already been included, ignoring Debugstation.

#endif
