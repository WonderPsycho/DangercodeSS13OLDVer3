// Setting all digimon to these values. The actual definition of each individual digimon should be made at the bottom.
/*
/datum/species/digimon
	name = "Digimon"
	name_plural = "Digimons"
	blurb = "Digivolve!"

	icobase = 'icons/mob/human_races/digimon/r_digimon.dmi'
	deform = 'icons/mob/human_races/digimon/r_digimon.dmi'

	language = null
	default_language = "Sol Common"

	is_small = 1
	has_fine_manipulation = 0

	ventcrawler = 1
	show_ssd = 0
// Only if you want to have a custom sound for these fellas.
//	scream_verb = "screeches"
//	male_scream_sound = 'sound/goonstation/voice/monkey_scream.ogg'
//	female_scream_sound = 'sound/goonstation/voice/monkey_scream.ogg'

	tail = "chimptail"
	bodyflags = HAS_TAIL
*/

/datum/species/digimon/handle_can_equip(obj/item/I, slot, disable_warning = 0, mob/living/carbon/human/user)
	switch(slot)
		if(slot_l_hand)
			if(user.l_hand)
				return 2
			return 1
		if(slot_r_hand)
			if(user.r_hand)
				return 2
			return 1
		if(slot_wear_mask)
			if(user.wear_mask)
				return 2
			if(!(I.slot_flags & SLOT_MASK))
				return 2
			return 1
		if(slot_back)
			if(user.back)
				return 2
			if(!(I.slot_flags & SLOT_BACK))
				return 2
			return 1
		if(slot_handcuffed)
			if(user.handcuffed)
				return 2
			if(!istype(I, /obj/item/weapon/restraints/handcuffs))
				return 2
			return 1
		if(slot_in_backpack)
			if(user.back && istype(user.back, /obj/item/weapon/storage/backpack))
				var/obj/item/weapon/storage/backpack/B = user.back
				if(B.contents.len < B.storage_slots && I.w_class <= B.max_w_class)
					return 1
			return 2
	return 2


/mob/living/carbon/human/digimon/New(var/new_loc)
	..(new_loc, "Digimon")


/*

Copy and paste this part, and make a CHILD to the digimon datum
/datum/species/digimon
	name = "Digimon"
	name_plural = "Digimons"
	blurb = "Digivolve!"

	icobase = 'icons/mob/human_races/digimon/r_digimon.dmi'
	deform = 'icons/mob/human_races/digimon/r_digimon.dmi'

	language = null
	default_language = "Sol Common"

	is_small = 1
	has_fine_manipulation = 0

	ventcrawler = 1
	show_ssd = 0
// Only if you want to have a custom sound for these fellas.
//	scream_verb = "screeches"
//	male_scream_sound = 'sound/goonstation/voice/monkey_scream.ogg'
//	female_scream_sound = 'sound/goonstation/voice/monkey_scream.ogg'

	tail = "chimptail"
	bodyflags = HAS_TAIL

Becomes:

/datum/species/digimon/whatever

and then all the contents from above goes below that, modify it to what you want.

*/
/datum/species/digimon
	name = "Digimon"
	name_plural = "Digimons"
	blurb = "Digivolve!"

	icobase = 'icons/mob/human_races/digimon/r_digimon.dmi'
	deform = 'icons/mob/human_races/digimon/r_digimon.dmi'

	language = null
	default_language = "Sol Common"
	species_traits = list(IS_WHITELISTED)

	is_small = 1
	has_fine_manipulation = 0

	damage_overlays = 'icons/mob/human_races/masks/dam_digimon.dmi'
	blood_mask = 'icons/mob/human_races/masks/blood_digimon.dmi'
	path = /mob/living/carbon/human/digimon

	reagent_tag = PROCESS_ORG

	total_health = 75
	brute_mod = 1.5
	burn_mod = 1.5

	ventcrawler = 1
	show_ssd = 0
// Only if you want to have a custom sound for these fellas.
//	scream_verb = "screeches"
//	male_scream_sound = 'sound/goonstation/voice/monkey_scream.ogg'
//	female_scream_sound = 'sound/goonstation/voice/monkey_scream.ogg'

	tail = "chimptail"
	bodyflags = HAS_TAIL
