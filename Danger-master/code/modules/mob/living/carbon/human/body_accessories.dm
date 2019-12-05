
var/global/list/body_accessory_by_name = list("None" = null)

/hook/startup/proc/initalize_body_accessories()

	__init_body_accessory(/datum/body_accessory/body)
	__init_body_accessory(/datum/body_accessory/tail)

	if(body_accessory_by_name.len)
		if(initialize_body_accessory_by_species())
			return 1

	return 0 //fail if no bodies are found

var/global/list/body_accessory_by_species = list("None" = null)

/proc/initialize_body_accessory_by_species()
	for(var/B in body_accessory_by_name)
		var/datum/body_accessory/accessory = body_accessory_by_name[B]
		if(!istype(accessory))	continue

		for(var/species in accessory.allowed_species)
			if(!body_accessory_by_species["[species]"])	body_accessory_by_species["[species]"] = list()
			body_accessory_by_species["[species]"] += accessory

	if(body_accessory_by_species.len)
		return 1
	return 0

/proc/__init_body_accessory(var/ba_path)
	if(ispath(ba_path))
		var/_added_counter = 0
		for(var/A in subtypesof(ba_path))
			var/datum/body_accessory/B = new A
			if(istype(B))
				if(B.allowed_species == "all")//If allowed_species is an empty list.
					B.allowed_species = all_species//Then let all species use it.
				body_accessory_by_name[B.name] += B
				++_added_counter

		if(_added_counter)
			return 1
	return 0


/datum/body_accessory
	var/name = "default"

	var/icon = null
	var/icon_state = ""

	var/animated_icon = null
	var/animated_icon_state = ""

	var/blend_mode = null

	var/pixel_x_offset = 0
	var/pixel_y_offset = 0

	var/list/allowed_species = "all"//Set to "all" to have it usable by all species, it will set this var during initialize_body_accessory_by_species().

/datum/body_accessory/proc/try_restrictions(var/mob/living/carbon/human/H)
	return 1

/datum/body_accessory/proc/get_animated_icon() //return animated if it has it, return static if it does not.
	if(animated_icon)
		return animated_icon

	else	return icon

/datum/body_accessory/proc/get_animated_icon_state()
	if(animated_icon_state)
		return animated_icon_state

	else	return icon_state


//Bodies
/datum/body_accessory/body
	blend_mode = ICON_MULTIPLY

/datum/body_accessory/body/snake
	name = "Snake Taur Body"

	icon = 'icons/mob/body_accessory_64.dmi'
	icon_state = "snake"

	pixel_x_offset = -16

/datum/body_accessory/body/horse
	name = "Horse Taur Body"

	icon = 'icons/mob/body_accessory_64.dmi'
	icon_state = "horse"

	pixel_x_offset = -16

/datum/body_accessory/body/cow
	name = "Cow Taur Body"

	icon = 'icons/mob/body_accessory_64.dmi'
	icon_state = "cow"

	pixel_x_offset = -16

/datum/body_accessory/body/slug
	name = "Slug Taur Body"

	icon = 'icons/mob/body_accessory_64.dmi'
	icon_state = "slug"

	pixel_x_offset = -16

/datum/body_accessory/body/wolf
	name = "Wolf Taur Body"
	blend_mode = ICON_ADD
	icon = 'icons/mob/body_accessory_64.dmi'
	icon_state = "wolf"

	pixel_x_offset = -16

/datum/body_accessory/body/spider
	name = "Spider Taur Body"
	blend_mode = ICON_ADD
	icon = 'icons/mob/body_accessory_64.dmi'
	icon_state = "spider"

	pixel_x_offset = -16

/datum/body_accessory/body/tent
	name = "Tentacle Legs"

	icon = 'icons/mob/body_accessory_64.dmi'
	icon_state = "tent"

	pixel_x_offset = -16

/datum/body_accessory/body/feline
	name = "Feline Taur Body"

	icon = 'icons/mob/body_accessory_64.dmi'
	icon_state = "feline"

	pixel_x_offset = -16


/datum/body_accessory/body/leoperd
	name = "Leoperd Taur Body"

	icon = 'icons/mob/body_accessory_64.dmi'
	icon_state = "leopard"

	pixel_x_offset = -16

/datum/body_accessory/body/drake
	name = "Drake Taur Body"

	icon = 'icons/mob/body_accessory_64.dmi'
	icon_state = "Drake"

	pixel_x_offset = -16


/datum/body_accessory/body/roiztail
	name = "Big Lizard Tail"

	icon = 'icons/mob/body_accessory_64.dmi'
	icon_state = "roiz_tail"

	pixel_x_offset = -16

/datum/body_accessory/body/frog
	name = "Frog Taur Body"

	icon = 'icons/mob/body_accessory_64.dmi'
	icon_state = "Frog"

	pixel_x_offset = -16

/datum/body_accessory/body/seviper
	name = "Seviper Taur Body"

	icon = 'icons/mob/body_accessory_64.dmi'
	icon_state = "seviper"

	pixel_x_offset = -16



//Tails
/datum/body_accessory/tail
	icon = 'icons/mob/body_accessory.dmi'
	animated_icon = 'icons/mob/body_accessory.dmi'
	blend_mode = ICON_ADD
	icon_state = "null"
	animated_icon_state = "null"

/datum/body_accessory/tail/try_restrictions(var/mob/living/carbon/human/H)
	if(!H.wear_suit || !(H.wear_suit.flags_inv & HIDETAIL) && !istype(H.wear_suit, /obj/item/clothing/suit/space))
		return 1
	return 0


/datum/body_accessory/tail/wingler_tail // Jay wingler fluff tail
	name = "Striped Tail"
	icon_state = "winglertail"
	animated_icon_state = "winglertail_a"

//Vulpkanin
/datum/body_accessory/tail/vulpkanin_2
	name = "Vulpkanin Alt 1 (Bushy)"
	icon_state = "vulptail2"
	animated_icon_state = "vulptail2_a"

/datum/body_accessory/tail/vulpkanin_3
	name = "Vulpkanin Alt 2 (Straight)"
	icon_state = "vulptail3"
	animated_icon_state = "vulptail3_a"

/datum/body_accessory/tail/vulpkanin_4
	name = "Vulpkanin Alt 3 (Tiny)"
	icon_state = "vulptail4"
	animated_icon_state = "vulptail4_a"

/datum/body_accessory/tail/vulpkanin_5
	name = "Vulpkanin Alt 4 (Short)"
	icon_state = "vulptail5"
	animated_icon_state = "vulptail5_a"

/datum/body_accessory/tail/vulpkanin_6
	name = "Vulpkanin Alt 5 (Straight Bushy)"
	icon_state = "vulptail6"
	animated_icon_state = "vulptail6_a"


////////////////////
//ARF TAILS YEE BOI/
////////////////////

//Alright.  So, TK here.  I'm turning most of these off.  We'll turn the on slowly, over the next few weeks.  For now, I'm only going to turn on 5.
//Think of it kinda like a test run, lol. ~TK
//Fox
//Kitty Up
//Kitty Down
//Wolf
//Lizard


/datum/body_accessory/tail/liztail
	name = "Reptile Tail"
	icon_state = "sogtail"
	animated_icon_state = "sogtailw_a"

/datum/body_accessory/tail/gliztail
	name = "Goo Dragon Tail"
	icon_state = "gsogtail"
	animated_icon_state = "gsogtailw_a"


/datum/body_accessory/tail/dragon
	name = "Dragon Tail and Wings"
	icon_state = "dragon"
	animated_icon_state = "dragonw_a"

/*
/datum/body_accessory/tail/tajytail  //:3c
	name = "Taj Tail"
	icon_state = "tajtail"
	animated_icon_state = "tajtailw_a"


/datum/body_accessory/tail/glowfentail
	name = "Glowfen Tail"
	icon_state = "glowfentail"


/datum/body_accessory/tail/stegotail
	name = "Stego Tail"
	icon_state = "stegotail"


/datum/body_accessory/tail/tigertail //Pickles~<3
	name = "Tiger Tail"
	icon_state = "tigertail"


/datum/body_accessory/tail/vulpixtail
	name = "Vulp Tail"
	icon_state = "vulpixtail"


/datum/body_accessory/tail/vulturetail
	name = "Vulture Tail"
	icon_state = "vulturetail"


/datum/body_accessory/tail/renamontail
	name = "Renamon Tail"
	icon_state = "renamontail"


/datum/body_accessory/tail/beartail
	name = "Bear Tail"
	icon_state = "beartail"


/datum/body_accessory/tail/beavertail
	name = "Beaver Tail"
	icon_state = "beavertail"


/datum/body_accessory/tail/capratail
	name = "Capra Tail"
	icon_state = "capratail"


/datum/body_accessory/tail/carnotail
	name = "Carno Tail"
	icon_state = "carnotail"


/datum/body_accessory/tail/ceratotail
	name = "Cerato Tail"
	icon_state = "ceratotail"


/datum/body_accessory/tail/corgitail
	name = "Corgi Tail"
	icon_state = "corgitail"


/datum/body_accessory/tail/cowtail
	name = "Cow Tail"
	icon_state = "cowtail"


/datum/body_accessory/tail/cowtail
	name = "Cow Tail"
	icon_state = "cowtail"


/datum/body_accessory/tail/coyotetail
	name = "Coyote Tail"
	icon_state = "coyotetail"


/datum/body_accessory/tail/crowtail
	name = "Crow Tail"
	icon_state = "crowtail"


/datum/body_accessory/tail/dalmationtail
	name = "Dalmation Tail"
	icon_state = "dalmationtail"


/datum/body_accessory/tail/deertail
	name = "Deer Tail"
	icon_state = "deertail"


/datum/body_accessory/tail/fennectail
	name = "Fennec Tail"
	icon_state = "fennectail"


/datum/body_accessory/tail/flareontail
	name = "Flareon Tail"
	icon_state = "flareontail"

*/

datum/body_accessory/tail/foxtail
	name = "Fox Tail"
	icon_state = "foxtail"

/*
/datum/body_accessory/tail/glaceontail
	name = "Glaceon Tail"
	icon_state = "glaceontail"


/datum/body_accessory/tail/guilmontail
	name = "Guilmon Tail"
	icon_state = "guilmon"
	animated_icon_state = "guilmon_a"


/datum/body_accessory/tail/hawktail
	name = "Hawk Tail"
	icon_state = "hawktail"


/datum/body_accessory/tail/huskytail
	name = "Husky Tail"
	icon_state = "huskytail"


/datum/body_accessory/tail/hyenatail
	name = "Hyena Tail"
	icon_state = "hyenatail"


/datum/body_accessory/tail/kitsunetail
	name = "Kitsune Tail"
	icon_state = "kitsunetail"

*/

/datum/body_accessory/tail/kittydowntail
	name = "Kitty Down Tail"
	icon_state = "kittydown"

/datum/body_accessory/tail/kittyuptail
	name = "Kitty Up Tail"
	icon_state = "kittyup"

/*
/datum/body_accessory/tail/labtail
	name = "Lab Tail"
	icon_state = "labtail"


/datum/body_accessory/tail/luckytail
	name = "Lucky Tail"
	icon_state = "luckytail"


/datum/body_accessory/tail/lynxtail
	name = "Lynx Tail"
	icon_state = "lynxtail"


/datum/body_accessory/tail/apextail
	name = "Monkey Tail"
	icon_state = "monkeytail"


/datum/body_accessory/tail/mousetail
	name = "Mouse Tail"
	icon_state = "mousetail"


/datum/body_accessory/tail/otietail
	name = "Otie Tail"
	icon_state = "otietail"


/datum/body_accessory/tail/ottertail
	name = "Otter Tail"
	icon_state = "ottertail"


/datum/body_accessory/tail/pandatail
	name = "Panda Tail"
	icon_state = "pandatail"


/datum/body_accessory/tail/panthertail
	name = "Panther Tail"
	icon_state = "panthertail"


/datum/body_accessory/tail/pigtail
	name = "Pig Tail"
	icon_state = "pigtail"


/datum/body_accessory/tail/ponytail
	name = "Pony Tail"
	icon_state = "ponytail"


/datum/body_accessory/tail/possumtail
	name = "Possum Tail"
	icon_state = "possumtail"


/datum/body_accessory/tail/rabbittail
	name = "Rabbit Tail"
	icon_state = "rabbittail"


/datum/body_accessory/tail/raccoontail
	name = "Raccoon Tail"
	icon_state = "raccoontail"


/datum/body_accessory/tail/redpandatail
	name = "Red Panda Tail"
	icon_state = "redpandatail"


/datum/body_accessory/tail/roorattail
	name = "Roorat Tail"
	icon_state = "roorattail"


/datum/body_accessory/tail/sergaltail
	name = "Sergal Tail"
	icon_state = "sergaltail"


/datum/body_accessory/tail/sharktail
	name = "Shark Tail"
	icon_state = "sharktail"


/datum/body_accessory/tail/shepherdtail
	name = "Shepherd Tail"
	icon_state = "shepherdtail"


/datum/body_accessory/tail/shihtzutail
	name = "Shih-Tzu Tail"
	icon_state = "shihtzutail"


/datum/body_accessory/tail/siamesetail
	name = "Siamese Tail"
	icon_state = "siamesetail"

*/
/datum/body_accessory/tail/skunktail
	name = "Skunk Tail"
	icon_state = "skunktail_s"
	icon = 'icons/effects/species.dmi'
/*

/datum/body_accessory/tail/snailtail
	name = "Snail Tail"
	icon_state = "snailtail"


/datum/body_accessory/tail/snarbytail
	name = "Snarby Tail"
	icon_state = "snarbytail"

*/
/datum/body_accessory/tail/squirreltail
	name = "Squirrel Tail"
	icon_state = "squirreltail_s"
	icon = 'icons/effects/species.dmi'
/*

/datum/body_accessory/tail/turtletail
	name = "Turtle Tail"
	icon_state = "turtletail"

*/

/datum/body_accessory/tail/wolftail
	name = "Wolf Tail"
	icon_state = "wolftail"

/*
/datum/body_accessory/tail/zebratail
	name = "Zebra Tail"
	icon_state = "zebratail"


/datum/body_accessory/tail/zigtail
	name = "Zig Tail"
	icon_state = "zigtail"

*/
/datum/body_accessory/tail/acaeliustail
	name = "Acaelius Tail"
	icon_state = "acaeliustail_s"
	allowed_species = list("Human", "IPC")
	icon = 'icons/effects/species.dmi'


// ARF WINGS
//THIS POSISTION IS LIKELY TEMPORARY UNTIL JON CAN FIGURE OUT HOW TO ADD
//WINGS PROPERLY, WITHOUT TAKING UP THE TAIL SLOT
//Going to take up the tails slot for now, deal with it - TP

/datum/body_accessory/tail/succredtail
	name = "Succubus Red Wings"
	icon_state = "succubus-red_s"
	icon = 'icons/effects/species.dmi'


/datum/body_accessory/tail/succbltail
	name = "Succubus Black Wings"
	icon_state = "succubus-black_s"
	icon = 'icons/effects/species.dmi'

/datum/body_accessory/tail/succputail
	name = "Succubus Pink Wings"
	icon_state = "succubus-purple_s"
	icon = 'icons/effects/species.dmi'

/datum/body_accessory/tail/batbltail
	name = "Bat Black Wings"
	icon_state = "bat-black_s"
	icon = 'icons/effects/species.dmi'

/datum/body_accessory/tail/batredtail
	name = "Bat Red Wings"
	icon_state = "bat-red_s"
	icon = 'icons/effects/species.dmi'
/*
/datum/body_accessory/tail/batcolortail
	name = "Bat Colorable Wings"
	icon_state = "bat-color"
*/

/datum/body_accessory/tail/feathtail
	name = "Feathered Wings"
	icon_state = "feathered_s"
	icon = 'icons/effects/species.dmi'

/datum/body_accessory/tail/mothtail
	name = "Moth Wings"
	icon_state = "moth_s"
	icon = 'icons/effects/species.dmi'

/datum/body_accessory/tail/mothfulltail
	name = "Moth Fluff and Wings"
	icon_state = "moth_full_s"
	icon = 'icons/effects/species.dmi'

/datum/body_accessory/tail/beewingtail
	name = "Bee Wings"
	icon_state = "beewings_s"
	icon = 'icons/effects/species.dmi'

/datum/body_accessory/tail/dragontail
	name = "Dragon Wings"
	icon_state = "dragon_s"
	icon = 'icons/effects/species.dmi'

/datum/body_accessory/tail/sepulchretail
	name = "Sepulchre Wings"
	icon_state = "sepulchre_wings_s"
	icon = 'icons/effects/species.dmi'

/datum/body_accessory/tail/harpytail
	name = "Harpy Wings"
	icon_state = "harpywings_s"
	icon = 'icons/effects/species.dmi'

/datum/body_accessory/tail/miriafluffdragontail
	name = "Fluff Dragon Tail"
	icon_state = "miria-fluffdragontail_s"
	icon = 'icons/effects/species.dmi'

/datum/body_accessory/tail/miriafluffwingstail
	name = "Fluff Dragon Wings"
	icon_state = "miria-fluffwings_s"
	icon = 'icons/effects/species.dmi'

/datum/body_accessory/tail/screewingtail
	name = "Scree Wings"
	icon_state = "scree-wings_s"
	icon = 'icons/effects/species.dmi'

/datum/body_accessory/tail/xenobackplatetail
	name = "Xenomorph Back Growth"
	icon_state = "snag-backplate_s"
	icon = 'icons/effects/species.dmi'

/datum/body_accessory/tail/kerenawingtail
	name = "Kerena Wings"
	icon_state = "kerena-wings_s"
	icon = 'icons/effects/species.dmi'

/datum/body_accessory/tail/spiderwingtail
	name = "Spider Leg Back Growth"
	icon_state = "spider-legs_s"
	icon = 'icons/effects/species.dmi'

/datum/body_accessory/tail/eyestalkstail
	name = "Eyestalk Growth"
	icon_state = "liquidfirefly-eyestalks_s"
	icon = 'icons/effects/species.dmi'

/datum/body_accessory/tail/tentaclewingtail
	name = "Tentacle Growth"
	icon_state = "tentacle_s"
	icon = 'icons/effects/species.dmi'

/datum/body_accessory/tail/angelwingtail
	name = "Angel Wings"
	icon_state = "angel_s"
	icon = 'icons/effects/species.dmi'

/datum/body_accessory/tail/butterflybluewingtail
	name = "Blue Butterfly Wings"
	icon_state = "butterflymain_s"
	icon = 'icons/effects/species.dmi'

/datum/body_accessory/tail/swallowcolorablewingtail
	name = "Swallowtail Butterfly Colorable Wings"
	icon_state = "swallowtail_s"
	icon = 'icons/effects/species.dmi'

/datum/body_accessory/tail/monarchwingtail
	name = "Monarch Butterfly Wings"
	icon_state = "butterflycolor_s"  //Not supposed to be colored, lol
	icon = 'icons/effects/species.dmi'

/datum/body_accessory/tail/monarchcolorwingtail
	name = "Monarch Butterfly Colorable Wings"
	icon_state = "monarch"  //Supposed to be colored, lol
	icon = 'icons/effects/species.dmi'

/datum/body_accessory/tail/ninetails
	name = "Nine tails"
	icon_state = "nine_tails"
	icon = 'icons/effects/species.dmi'

/datum/body_accessory/tail/seviper
	name = "Seviper tail"
	icon_state = "sevipertail"
	icon = 'icons/effects/species.dmi'
