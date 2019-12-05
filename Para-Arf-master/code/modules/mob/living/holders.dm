var/list/holder_mob_icon_cache = list()
// Micro Holders - Extends /obj/item/weapon/holder

/obj/item/weapon/holder/micro
	name = "micro"
	desc = "Another crewmember, small enough to fit in your hand."
	icon_state = "micro"
	slot_flags = SLOT_BACK
	w_class = WEIGHT_CLASS_SMALL
	pixel_y = 0			// Override value from parent.




/obj/item/weapon/holder/micro/examine(var/mob/user)
	for(var/mob/living/M in contents)
		M.examine(user)

/obj/item/weapon/holder/MouseDrop(mob/M as mob)
	..()
	if(M != usr) return
	if(usr == src) return
	if(!Adjacent(usr)) return
	if(istype(M,/mob/living/silicon/ai)) return
	for(var/mob/living/carbon/human/O in contents)
		O.show_inv(usr)

/obj/item/weapon/holder/micro/attack_self(var/mob/living/user)
	for(var/mob/living/carbon/human/M in contents)
		M.help_shake_act(user)

/obj/item/weapon/holder/micro/update_state()
	if(istype(loc,/turf) || !(held_mob) || !(held_mob.loc == src))
		qdel(src)

/obj/item/weapon/holder/micro/Destroy()
	var/turf/here = get_turf(src)
	for(var/atom/movable/A in src)
		A.forceMove(here)
	..()

/obj/item/weapon/holder/micro/proc/get_turf_air()
	var/turf/T = get_turf(src.loc)
	if(T)
		. = held_mob.return_air()

/obj/item/weapon/holder/micro/return_air()
	return get_turf_air()

/obj/item/weapon/holder/micro/proc/return_pressure()
	. = 0
	var/datum/gas_mixture/t_air = get_turf_air()
	if(t_air)
		. = t_air.return_pressure()

/obj/item/weapon/holder/micro/proc/return_temperature()
	. = 0
	var/datum/gas_mixture/t_air = get_turf_air()
	if(t_air)
		. = t_air.return_temperature()