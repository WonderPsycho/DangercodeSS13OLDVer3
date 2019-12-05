/*
	//Pickles
/obj/item/clothing/under/bowlingoutfit
	name = "Bowling Outfit"
	desc = "A Bowling Outfit, it says 'Pickles' on the tag"
	icon_state = "bowlingoutfit"

	//Andy
/obj/item/clothing/under/middriftturtleneck
	name = "Mid-Driff Turtleneck"
	desc = "A sweater that seems to be a bit short, showing off the wearers stomach."
	icon_state = "middriftturtleneck"

	//Killbow
/obj/item/clothing/under/arroganza
	name = "arroganza"
	desc = ""
	icon_state = "arroganza"

	//TechnicalMagi
/obj/item/clothing/under/bb/sweater/worn
	name = "frayed black sweater"
	desc = "A well-loved black sweater, slightly frayed at the edges. It's been obviously re-stitched a few times, but looks like it was treated with care."

	//VictiniLover
/obj/item/clothing/under/tiedye
	name = "A tie-dyed shirt"
	desc = "A vibrant tie-dyed shirt! Looks perfect for a small fennec"
	icon_state = "tiedye"

//Donation items
	//Andyman

*/
/obj/item/weapon/rig/dragon
	name = "breacher chassis control module"
	desc = "A specially modified Unathi Breacher RIG, made to fit a dragon. It looks as though most of the armor plating has been removed and it has been refitted for engineering use. It displays 'OWEN' on a holotag affixed to the left side of the chestplate, along with a CentCom identification number, permitting possession and deployment of this RIG solely to a Mr. Dameon Owen"
	suit_type = "breacher chassis"
	icon_state = "breacher_rig"
	vision_restriction = 0
	siemens_coefficient = 0
	w_class = WEIGHT_CLASS_SMALL
	armor = list(melee = 10, bullet = 5, laser = 10, energy = 5, bomb = 10, bio = 100, rad = 50)
	emp_protection = 0
	slowdown = 1
	offline_slowdown = 2
	offline_vision_restriction = 0
	initial_modules = list(
			/obj/item/rig_module/maneuvering_jets,
			/obj/item/rig_module/vision/meson,
			/obj/item/rig_module/device/plasmacutter
			)

	chest_type = /obj/item/clothing/suit/space/new_rig/dragon
	helm_type = /obj/item/clothing/head/helmet/space/new_rig/dragon
	glove_type = /obj/item/clothing/gloves/rig/dragon
	boot_type = /obj/item/clothing/shoes/magboots/rig/dragon

/obj/item/clothing/suit/space/new_rig/dragon
	icon = 'icons/obj/clothing/species/dragon/suits.dmi'
	species_restricted = list("Dragon")
	sprite_sheets = list("Dragon" = 'icons/mob/species/dragon/suit.dmi')

/obj/item/clothing/head/helmet/space/new_rig/dragon
	icon = 'icons/obj/clothing/species/dragon/hats.dmi'
	species_restricted = list("Dragon")
	sprite_sheets = list("Dragon" = 'icons/mob/species/dragon/helmet.dmi')

/obj/item/clothing/gloves/rig/dragon
	icon = 'icons/obj/clothing/species/dragon/gloves.dmi'
	species_restricted = list("Dragon")
	sprite_sheets = list("Dragon" = 'icons/mob/species/dragon/gloves.dmi')

/obj/item/clothing/shoes/magboots/rig/dragon
	icon = 'icons/obj/clothing/species/dragon/shoes.dmi'
	species_restricted = list("Dragon")
	sprite_sheets = list("Dragon" = 'icons/mob/species/dragon/feet.dmi')



	//Gozulio
/obj/item/clothing/suit/radiation/gozu
	name = "A.R.F Engineering Officers Radiation Suit"
	desc = "An A.R.F. Engineering Corp officers radiation suit, for working around hazardous radioactive materials. This one has \"Glitterpaws\" writen on its back and with A.R.F. Insignia on its front"
	icon_state = "gozrad"
	item_state = "gozrad"

	//Malmarrisa
/obj/item/clothing/under/hunter
	name = "hunting outfit"
	desc = "A Hunting Outfit."
	icon = 'code/dallus_content/icons/custom-items-arf.dmi'
	icon_state = "hunters_coat"
	item_color = "hunters_coat"
	item_state = "hunters_coat"


	//Killbow
/obj/item/clothing/under/killbow
	name = "S.I.N. Leader Suit"
	desc = ""
	icon = 'code/dallus_content/icons/custom-items-arf.dmi'
	icon_state = "arroganza"
	item_color = "arroganza"
	item_state = "arroganza"

	//Rune
/obj/item/clothing/under/birthdaysuit
	name = "birthday suit"
	desc = "There's nothing here! Skimpy!"
	icon = 'code/dallus_content/icons/custom-items-arf.dmi'
	icon_state = "birthdaysuit"
	item_color = "birthdaysuit"
	item_state = "birthdaysuit"
	body_parts_covered = 0
	body_parts_covered = 0
	has_sensor = 0
	species_fit = list()

	//Pickles
/obj/item/clothing/under/bowlingoutfit
	name = "bowling outfit"
	desc = "A bowling outfit, it says 'Pickles' on the tag"
	icon = 'code/dallus_content/icons/custom-items-arf.dmi'
	icon_state = "bowlingoutfit"
	item_color = "bowlingoutfit"
	item_state = "bowlingoutfit"

	//Andy
/obj/item/clothing/under/middriftturtleneck
	name = "mid-driff turtleneck"
	desc = "A sweater that seems to be a bit short, showing off the wearers stomach."
	icon = 'code/dallus_content/icons/custom-items-arf.dmi'
	icon_state = "middriftturtleneck"
	item_color = "middriftturtleneck"
	item_state = "middriftturtleneck"

/obj/item/clothing/under/whiteskirt/twopiece
	name = "two piece white skirt"
	desc = "A two-piece white skirt"
	icon_state = "cwhiteskirt"
	item_state = "cwhiteskirt"
	item_color = "cwhiteskirt"

//Giveaway item for TheAmazingDaito
/obj/item/clothing/under/tron/female
	name = "female tron uniform"
	desc = "A tron style uniform made to fit the female form."
	icon_state = "tron_f"
	item_state = "tron_f"
	item_color = "tron_f"

/obj/item/clothing/under/tron/male
	name = "male tron uniform"
	desc = "A tron style uniform made to fit the male form"
	icon_state = "tron_m"
	item_state = "tron_m"
	item_color = "tron_m"

//Giveaway item for Whovain
/obj/item/clothing/under/crystal
	name = "bikni loincloth"
	desc = "A cream colored loincloth with matching bra."
	icon_state = "crystal"
	item_state = "crystal"
	item_color = "crystal"