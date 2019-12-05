/mob/living/carbon/alien/humanoid/queen
	name = "alien queen"
	caste = "q"
	maxHealth = 200
	health = 200
	icon_state = "alienq"
	status_flags = CANPARALYSE
	heal_rate = 5
	large = 1
	ventcrawler = 0
	default_alien_organs = list(/obj/item/organ/internal/brain/xeno,
								/obj/item/organ/internal/xenos/hivenode,
								/obj/item/organ/internal/xenos/plasmavessel/queen,
								/obj/item/organ/internal/xenos/acidgland,
								/obj/item/organ/internal/xenos/resinspinner,
								/obj/item/organ/internal/xenos/eggsac,
								/obj/item/organ/internal/xenos/neurotoxin)
/mob/living/carbon/alien/humanoid/queen/New()
	create_reagents(100)

	//there should only be one queen
	for(var/mob/living/carbon/alien/humanoid/queen/Q in living_mob_list)
		if(Q == src)		continue
		if(Q.stat == DEAD)	continue
		if(Q.client)
			name = "alien princess ([rand(1, 999)])"	//if this is too cutesy feel free to change it/remove it.
			break

	real_name = src.name
//	alien_organs += new /obj/item/organ/internal/xenos/plasmavessel/queen
//	alien_organs += new /obj/item/organ/internal/xenos/acidgland
//	alien_organs += new /obj/item/organ/internal/xenos/eggsac
//	alien_organs += new /obj/item/organ/internal/xenos/resinspinner
//	alien_organs += new /obj/item/organ/internal/xenos/neurotoxin
	..()

/mob/living/carbon/alien/humanoid/queen/movement_delay()
	. = ..()
	. += 2

//Queen verbs
/obj/effect/proc_holder/alien/lay_egg
	name = "Lay Egg (150)"
	desc = "Lay an egg to produce huggers to impregnate prey with."
	plasma_cost = 150
	check_turf = TRUE
	action_icon_state = "alien_egg"

/obj/effect/proc_holder/alien/lay_egg/fire(mob/living/carbon/user)
	if(locate(/obj/structure/alien/egg) in get_turf(user))
		to_chat(user, "<span class='alertalien'>There's already an egg here.</span>")
		return FALSE

	if(!check_vent_block(user))
		return FALSE

	user.visible_message("<span class='alertalien'>[user] has laid an egg!</span>")
	new /obj/structure/alien/egg(user.loc)
	playsound(get_turf(src), "alien_secrete", 100, 1, 2)
	return TRUE


/mob/living/carbon/alien/humanoid/queen/large
	icon = 'icons/mob/alienlarge.dmi'
	icon_state = "alienq"
	pixel_x = -16
	large = 1
