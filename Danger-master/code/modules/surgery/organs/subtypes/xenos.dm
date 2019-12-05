/obj/item/organ/internal/xenos
	origin_tech = "biotech=5"
	icon_state = "xgibmid2"
	var/list/alien_powers = list()
	tough = TRUE
	sterile = TRUE
/*
///can be changed if xenos get an update..
/obj/item/organ/internal/xenos/insert(mob/living/carbon/M, special = 0)
	..()
	for(var/P in alien_powers)
		M.verbs |= P

/obj/item/organ/internal/xenos/remove(mob/living/carbon/M, special = 0)
	for(var/P in alien_powers)
		M.verbs -= P
	. = ..()

/obj/item/organ/internal/xenos/prepare_eat()
	var/obj/S = ..()
	S.reagents.add_reagent("sacid", 10)
	return S
*/

/obj/item/organ/internal/xenos/New()
	. = ..()
	for(var/A in alien_powers)
		if(ispath(A))
			alien_powers -= A
			alien_powers += new A(src)

/obj/item/organ/internal/xenos/insert(mob/living/carbon/M, special = 0)
	..()
	for(var/obj/effect/proc_holder/alien/P in alien_powers)
		M.AddAbility(P)


/obj/item/organ/internal/xenos/remove(mob/living/carbon/M, special = 0)
	for(var/obj/effect/proc_holder/alien/P in alien_powers)
		M.RemoveAbility(P)
	..()



//XENOMORPH ORGANS

/obj/item/organ/internal/xenos/plasmavessel
	name = "plasma vessel"
	icon_state = "plasma"
	w_class = WEIGHT_CLASS_NORMAL
	origin_tech = "biotech=5;plasmatech=4"
	parent_organ = "chest"
	slot = "plasmavessel"
	alien_powers = list(/obj/effect/proc_holder/alien/transfer)


	var/stored_plasma = 0
	var/max_plasma = 500
	var/heal_rate = 2
	var/plasma_rate = 10
	var/emergency_generation = FALSE//Will generate plasma very slowly to 50 if TRUE. For drones/queens/etc who are seperated from weeds/plasma and need to restart.

/obj/item/organ/internal/xenos/plasmavessel/prepare_eat()
	var/obj/S = ..()
	S.reagents.add_reagent("plasma", stored_plasma/10)
	return S

/obj/item/organ/internal/xenos/plasmavessel/queen
	name = "bloated plasma vessel"
	icon_state = "plasma_large"
	origin_tech = "biotech=6;plasmatech=4"
	stored_plasma = 200
	max_plasma = 500
	plasma_rate = 25
	alien_powers = list(/obj/effect/proc_holder/alien/plant, /obj/effect/proc_holder/alien/transfer)
	emergency_generation = TRUE

/obj/item/organ/internal/xenos/plasmavessel/drone
	name = "large plasma vessel"
	icon_state = "plasma_large"
	stored_plasma = 200
	max_plasma = 500
	alien_powers = list(/obj/effect/proc_holder/alien/plant, /obj/effect/proc_holder/alien/transfer)
	emergency_generation = TRUE

/obj/item/organ/internal/xenos/plasmavessel/sentinel
	stored_plasma = 100
	max_plasma = 250
	alien_powers = list(/obj/effect/proc_holder/alien/transfer)

/obj/item/organ/internal/xenos/plasmavessel/hunter
	name = "small plasma vessel"
	icon_state = "plasma_tiny"
	stored_plasma = 50
	max_plasma = 100
	alien_powers = list(/obj/effect/proc_holder/alien/transfer)

/obj/item/organ/internal/xenos/plasmavessel/larva
	name = "tiny plasma vessel"
	icon_state = "plasma_tiny"
	max_plasma = 100
	alien_powers = list(/obj/effect/proc_holder/alien/transfer)


/obj/item/organ/internal/xenos/plasmavessel/on_life()
	//If there are alien weeds on the ground then heal if needed or give some plasma
	if(locate(/obj/structure/alien/weeds) in owner.loc)
		if(owner.health >= owner.maxHealth)
			owner.adjustPlasma(plasma_rate)
		else
			var/heal_amt = heal_rate
			if(!isalien(owner))
				heal_amt *= 0.2
			owner.adjustPlasma(plasma_rate*0.5)
			owner.adjustBruteLoss(-heal_amt)
			owner.adjustFireLoss(-heal_amt)
			owner.adjustOxyLoss(-heal_amt)
			owner.adjustCloneLoss(-heal_amt)
	else if(emergency_generation && stored_plasma < 50 && prob(25))//Just enough to plant some weeds.
		owner.adjustPlasma(round(max(1,plasma_rate/10)))// 1/10 plasma rate or 1, whichever is more; Rounded.
		if(stored_plasma > 50)//round off neatly at 50 because it looks better.
			stored_plasma = 50

/obj/item/organ/internal/xenos/plasmavessel/insert(mob/living/carbon/M, special = 0)
	..()
	if(isalien(M))
		var/mob/living/carbon/alien/A = M
		A.updatePlasmaDisplay()

/obj/item/organ/internal/alien/plasmavessel/remove(mob/living/carbon/M, special = 0)
	. =..()
	if(isalien(M))
		var/mob/living/carbon/alien/A = M
		A.updatePlasmaDisplay()


/obj/item/organ/internal/xenos/acidgland
	name = "acid gland"
	icon_state = "acid"
	parent_organ = "head"
	slot = "acid"
	origin_tech = "biotech=5;materials=2;combat=2"
	alien_powers = list(/obj/effect/proc_holder/alien/acid)


/obj/item/organ/internal/xenos/hivenode
	name = "hive node"
	icon_state = "hivenode"
	parent_organ = "head"
	slot = "hivenode"
	origin_tech = "biotech=5;magnets=4;bluespace=3"
	w_class = WEIGHT_CLASS_TINY
	alien_powers = list(/obj/effect/proc_holder/alien/whisper)

/obj/item/organ/internal/xenos/hivenode/insert(mob/living/carbon/M, special = 0)
	..()
	M.faction |= "alien"
	M.add_language("Hivemind")
	M.add_language("Xenomorph")

/obj/item/organ/internal/xenos/hivenode/remove(mob/living/carbon/M, special = 0)
	M.faction -= "alien"
	M.remove_language("Hivemind")
	M.remove_language("Xenomorph")
	. = ..()

/obj/item/organ/internal/xenos/neurotoxin
	name = "neurotoxin gland"
	icon_state = "neurotox"
	parent_organ = "head"
	slot = "neurotox"
	origin_tech = "biotech=5;combat=5"
	alien_powers = list(/obj/effect/proc_holder/alien/neurotoxin)

/obj/item/organ/internal/xenos/resinspinner
	name = "resin spinner"//...there tiger....
	parent_organ = "mouth"
	icon_state = "liver-x"
	slot = "spinner"
	origin_tech = "biotech=5;materials=4"
	alien_powers = list(/obj/effect/proc_holder/alien/resin)

/obj/item/organ/internal/xenos/eggsac
	name = "egg sac"
	icon_state = "eggsac"
	parent_organ = "groin"
	slot = "eggsac"
	w_class = WEIGHT_CLASS_BULKY
	origin_tech = "biotech=6"
	alien_powers = list(/obj/effect/proc_holder/alien/lay_egg)
