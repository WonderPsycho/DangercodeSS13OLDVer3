//sound.dm for all the footstep sounds.

//normal shoe sounding footwear; may make this the parent sound for all shoes just to catch any shoes i missed
/obj/item/clothing/shoes/black
	shoe_sound = "step_generic_floor"
/obj/item/clothing/shoes/blue
	shoe_sound = "step_generic_floor"
/obj/item/clothing/shoes/green
	shoe_sound = "step_generic_floor"
/obj/item/clothing/shoes/yellow
	shoe_sound = "step_generic_floor"
/obj/item/clothing/shoes/purple
	shoe_sound = "step_generic_floor"
/obj/item/clothing/shoes/brown
	shoe_sound = "step_generic_floor"
/obj/item/clothing/shoes/red
	shoe_sound = "step_generic_floor"
/obj/item/clothing/shoes/white
	shoe_sound = "step_generic_floor"
/obj/item/clothing/shoes/leather
	shoe_sound = "step_generic_floor"
/obj/item/clothing/shoes/rainbow
	shoe_sound = "step_generic_floor"
/obj/item/clothing/shoes/orange
	shoe_sound = "step_generic_floor"
/obj/item/clothing/shoes/syndigaloshes
	shoe_sound = "step_generic_floor"
/obj/item/clothing/shoes/sandal
	shoe_sound = "step_generic_floor"
/obj/item/clothing/shoes/galoshes
	shoe_sound = "step_generic_floor"
/obj/item/clothing/shoes/cyborg
	shoe_sound = "step_generic_floor"
/obj/item/clothing/shoes/roman
	shoe_sound = "step_generic_floor"
/obj/item/clothing/shoes/griffin
	shoe_sound = "step_generic_floor"

//boot/hard heel sounding footwear
/obj/item/clothing/shoes/jackboots
	shoe_sound = "step_boots"
/obj/item/clothing/shoes/combat
	shoe_sound = "step_boots"
/obj/item/clothing/shoes/galoshes
	shoe_sound = "step_boots"
/obj/item/clothing/shoes/workboots
	shoe_sound = "step_boots"
/obj/item/clothing/shoes/winterboots
	shoe_sound = "step_boots"
/obj/item/clothing/shoes/cult
	shoe_sound = "step_boots"
/obj/item/clothing/shoes/laceup
	shoe_sound = "step_boots"
/obj/item/clothing/shoes/centcom
	shoe_sound = "step_boots"
/obj/item/clothing/shoes/fluff/noble_boot
	shoe_sound = "step_boots"
/obj/item/clothing/shoes/singerb
	shoe_sound = "step_boots"
/obj/item/clothing/shoes/singery
	shoe_sound = "step_boots"
/obj/item/clothing/shoes/cowboyboots
	shoe_sound = "step_boots"

//metal sounding footwear
/obj/item/clothing/shoes/magboots
	shoe_sound = "step_metal"

//sock/soft fabric sounding footwear
/obj/item/clothing/shoes/slippers
	shoe_sound = "step_sock"
/obj/item/clothing/shoes/footwraps
	shoe_sound = "step_sock"
/obj/item/clothing/shoes/space_ninja
	shoe_sound = "step_sock"


//Species sounds
/datum/species
	var/footstep_sound = "step_bare" //slap slap slap, clap clap clap

/datum/species/vulpkanin
	footstep_sound = "step_paw"
/datum/species/tajaran
	footstep_sound = "step_paw"

/datum/species/slime
	footstep_sound = "step_puddle"

/datum/species/machine
	footstep_sound = "step_metal"



//Proc to find what sound to play for a specific foot
/proc/get_step_sound(mob/living/carbon/human/H, whichfoot = "r")//"r" or "l" for left and right feet
	if(!H)
		return null
	var/obj/item/organ/external/foot/F = H.bodyparts_by_name["[whichfoot]_foot"]//Cache the foot if it exists
	if(F)//Only continue if there's a foot to extrapolate the sound from
		var/sound
		if(F.status & ORGAN_ROBOT)
			sound = "step_metal"//prosthetics and stuff
		else
			sound = F.species.footstep_sound
		return sound//Return the footstep_sound var for the species of the foot type
	return null
