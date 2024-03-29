/datum/event/radiation_storm
	announceWhen	= 1
	#if MAP_ID == 999//ARFS Endeavor
	var/safe_zones = list(
		/area/maintenance,
		/area/crew_quarters/sleep,
		/area/security/brig,
		/area/shuttle,
		/area/vox_station,
		/area/syndicate_station,
		/area/crew_quarters/apartment
		)
	#else
	var/safe_zones = list(
		/area/maintenance,
		/area/crew_quarters/sleep,
		/area/security/brig,
		/area/shuttle,
		/area/vox_station,
		/area/syndicate_station
		)
	#endif

/datum/event/radiation_storm/announce()
	// Don't do anything, we want to pack the announcement with the actual event

/datum/event/radiation_storm/proc/is_safe_zone(var/area/A)
	for(var/szt in safe_zones)
		if(istype(A, szt))
			return 1
	return 0

/datum/event/radiation_storm/start()
	spawn()
		event_announcement.Announce("High levels of radiation detected near the station. Please evacuate into one of the shielded maintenance tunnels.", "Anomaly Alert", new_sound = 'sound/AI/radiation.ogg')

		for(var/area/A in world)
			if(!is_station_level(A.z) || is_safe_zone(A))
				continue
			A.radiation_alert()

		make_maint_all_access()

		sleep(600)

		event_announcement.Announce("The station has entered the radiation belt. Please remain in a sheltered area until we have passed the radiation belt.", "Anomaly Alert")

		for(var/i = 0, i < 10, i++)
			for(var/mob/living/carbon/human/H in living_mob_list)
				var/armor = H.getarmor(type = "rad")
				if((RADIMMUNE in H.species.species_traits) || armor >= 100) // Leave radiation-immune species/fully rad armored players completely unaffected
					continue
				var/turf/T = get_turf(H)
				if(!T)
					continue
				if(!is_station_level(T.z) || is_safe_zone(T.loc))
					continue

				if(istype(H,/mob/living/carbon/human))
					H.apply_effect((rand(15,35)),IRRADIATE,0)
					if(prob(5))
						H.apply_effect((rand(40,70)),IRRADIATE,0)
						if(prob(75))
							randmutb(H) // Applies bad mutation
							domutcheck(H,null,1)
						else
							randmutg(H) // Applies good mutation
							domutcheck(H,null,1)

			sleep(100)

		event_announcement.Announce("The station has passed the radiation belt. Please report to medbay if you experience any unusual symptoms. Maintenance will lose all access again shortly.", "Anomaly Alert")

		for(var/area/A in world)
			if(!is_station_level(A.z) || is_safe_zone(A))
				continue
			A.reset_radiation_alert()

		sleep(600) // Want to give them time to get out of maintenance.

		revoke_maint_all_access()
