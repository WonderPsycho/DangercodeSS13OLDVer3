//Helper object for picking dionaea (and other creatures) up.
/obj/item/weapon/holder
	name = "holder"
	desc = "You shouldn't ever see this."
	icon = 'icons/obj/objects.dmi'
	slot_flags = SLOT_HEAD

	origin_tech = null
	item_state = list(
		slot_l_hand_str = 'icons/mob/inhands/lefthand_holder.dmi',
		slot_r_hand_str = 'icons/mob/inhands/righthand_holder.dmi',
		)

	pixel_y = 8

	var/mob/living/held_mob


/obj/item/weapon/holder/New()
	..()
	processing_objects.Add(src)

/obj/item/weapon/holder/Destroy()
	processing_objects.Remove(src)
	return ..()

/obj/item/weapon/holder/process()

	if(istype(loc,/turf) || !(contents.len))

		for(var/mob/M in contents)

			var/atom/movable/mob_container
			mob_container = M
			mob_container.forceMove(get_turf(src))
			M.reset_perspective()

		qdel(src)

/obj/item/weapon/holder/attackby(obj/item/weapon/W as obj, mob/user as mob, params)
	for(var/mob/M in src.contents)
		M.attackby(W,user, params)

/obj/item/weapon/holder/proc/show_message(var/message, var/m_type)
	for(var/mob/living/M in contents)
		M.show_message(message,m_type)

/obj/item/weapon/holder/emp_act(var/intensity)
	for(var/mob/living/M in contents)
		M.emp_act(intensity)

/obj/item/weapon/holder/ex_act(var/intensity)
	for(var/mob/living/M in contents)
		M.ex_act(intensity)

/obj/item/weapon/holder/container_resist(var/mob/living/L)
	var/mob/M = src.loc                      //Get our mob holder (if any).

	if(istype(M))
		M.unEquip(src)
		to_chat(M, "[src] wriggles out of your grip!")
		to_chat(L, "You wriggle out of [M]'s grip!")
	else if(istype(loc,/obj/item))
		to_chat(L, "You struggle free of [loc].")
		forceMove(get_turf(src))

	if(istype(M))
		for(var/atom/A in M.contents)
			if(istype(A,/mob/living/simple_animal/borer) || istype(A,/obj/item/weapon/holder))
				return
		M.status_flags &= ~PASSEMOTES

	return

/obj/item/weapon/holder/proc/sync(var/mob/living/M)
	dir = 2
	overlays.Cut()
	icon = M.icon
	icon_state = M.icon_state
	color = M.color
	name = M.name
	desc = M.desc
	overlays |= M.overlays
	var/mob/living/carbon/human/H = loc
	if(istype(H))
		if(H.l_hand == src)
			H.update_inv_l_hand()
		else if(H.r_hand == src)
			H.update_inv_r_hand()
		else
			H.regenerate_icons()


//Mob procs and vars for scooping up
/mob/living/var/holder_type

/mob/living/proc/get_scooped(var/mob/living/carbon/grabber)
	if(!holder_type)	return

	var/obj/item/weapon/holder/H = new holder_type(loc)
	src.forceMove(H)
	H.name = name
	if(istype(H, /obj/item/weapon/holder/mouse))	H.icon_state = icon_state
	if(desc)	H.desc = desc
	H.attack_hand(grabber)

	to_chat(grabber, "<span class='notice'>You scoop up \the [src].")
	to_chat(src, "<span class='notice'>\The [grabber] scoops you up.</span>")
	grabber.status_flags |= PASSEMOTES
	return H

/obj/item/weapon/holder/proc/update_state()
	if(istype(loc,/turf) || !(contents.len))
		if(held_mob)
			held_mob.forceMove(loc)
		drop_items()
		qdel(src)

/obj/item/weapon/holder/proc/drop_items()
	for(var/atom/movable/M in contents)
		if(M == held_mob)
			continue
		M.forceMove(get_turf(src))

//Mob specific holders.

/obj/item/weapon/holder/diona
	name = "diona nymph"
	desc = "It's a tiny plant critter."
	icon_state = "nymph"

/obj/item/weapon/holder/drone
	name = "maintenance drone"
	desc = "It's a small maintenance robot."
	icon_state = "drone"

/obj/item/weapon/holder/drone/emagged
	name = "maintenance drone"
	icon_state = "drone-emagged"

/obj/item/weapon/holder/pai
	name = "pAI"
	desc = "It's a little robot."
	icon_state = "pai"

/obj/item/weapon/holder/mouse
	name = "mouse"
	desc = "It's a small, disease-ridden rodent."
	icon = 'icons/mob/animal.dmi'
	icon_state = "mouse_gray"


/obj/item/weapon/holder/human
	icon = 'icons/mob/holder_complex.dmi'
	var/list/generate_for_slots = list(slot_l_hand, slot_r_hand, slot_back)
	slot_flags = SLOT_BACK
