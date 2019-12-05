///////////////////// Simple Animal /////////////////////

/mob/living/simple_animal/proc/away_from_players()
	//Reduces the amount of logging spam by only allowing procs to continue if they have a player nearby to listen.
	//A return of 0 means that it is not away from players.
	// This is a stripped down version of the proc get_mobs_and_objs_in_view_fast()
	var/turf/T = get_turf(src)
	if(!T) return 1 // If the turf doesn't exist, we don't want the proc running regardless

	// Quickly grabs the mob's hearing range to check from
	var/list/hear = dview(world.view,T,INVISIBILITY_MAXIMUM)
	var/list/hearturfs = list()
	for(var/thing in hear)
		if(istype(thing,/mob))
			hearturfs += get_turf(thing)

	//Check each player to see if they're inside said 'hearing range' turfs
	for(var/mob in player_list)
		if(!istype(mob, /mob))
			error("There is a null or non-mob reference inside player_list.")
			continue
		if(get_turf(mob) in hearturfs)
			return 0
	return 1


mob/living/simple_animal/custom_emote()
	if (away_from_players()) return
	. = ..()

mob/living/simple_animal/say()
	if (away_from_players()) return
	. = ..()
