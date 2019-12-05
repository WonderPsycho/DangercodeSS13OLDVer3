/////////
//ZIPPO//
/////////
/obj/item/weapon/lighter
	name = "cheap lighter"
	desc = "A cheap-as-free lighter."
	icon = 'icons/obj/items.dmi'
	icon_state = "lighter-g"
	item_state = "lighter-g"
	var/icon_on = "lighter-g-on"
	var/icon_off = "lighter-g"
	w_class = WEIGHT_CLASS_SMALL
	throwforce = 4
	flags = CONDUCT
	slot_flags = SLOT_BELT
	attack_verb = list("burnt", "singed")
	var/lit = 0

/obj/item/weapon/lighter/zippo
	name = "zippo lighter"
	desc = "The zippo."
	icon_state = "zippo"
	item_state = "zippo"
	icon_on = "zippoon"
	icon_off = "zippo"

/obj/item/weapon/lighter/random
	New()
		var/color = pick("r","c","y","g")
		icon_on = "lighter-[color]-on"
		icon_off = "lighter-[color]"
		icon_state = icon_off

/obj/item/weapon/lighter/attack_self(mob/living/user)
	if(user.r_hand == src || user.l_hand == src || isrobot(user))
		if(!lit)
			lit = 1
			w_class = WEIGHT_CLASS_BULKY
			icon_state = icon_on
			item_state = icon_on
			if(istype(src, /obj/item/weapon/lighter/zippo) )
				user.visible_message("<span class='rose'>Without even breaking stride, [user] flips open and lights [src] in one smooth movement.</span>")
				playsound(src.loc, 'sound/items/ZippoLight.ogg', 25, 1)
			else
				if(prob(75))
					user.visible_message("<span class='notice'>After a few attempts, [user] manages to light the [src].</span>")
				else
					to_chat(user, "<span class='warning'>You burn yourself while lighting the lighter.</span>")
					var/mob/living/M = user
					if(ishuman(M))
						var/mob/living/carbon/human/H = M
						var/obj/item/organ/external/affecting = H.get_organ("[user.hand ? "l" : "r" ]_hand")
						if(affecting.take_damage( 0, 5 ))		//INFERNO
							H.UpdateDamageIcon()
							H.updatehealth()
					user.visible_message("<span class='notice'>After a few attempts, [user] manages to light the [src], they however burn their finger in the process.</span>")

			set_light(2)
			processing_objects.Add(src)
		else
			lit = 0
			w_class = WEIGHT_CLASS_TINY
			icon_state = icon_off
			item_state = icon_off
			if(istype(src, /obj/item/weapon/lighter/zippo) )
				user.visible_message("<span class='rose'>You hear a quiet click, as [user] shuts off [src] without even looking at what they're doing. Wow.")
				playsound(src.loc, 'sound/items/ZippoClose.ogg', 25, 1)
			else
				user.visible_message("<span class='notice'>[user] quietly shuts off the [src].")

			set_light(0)
			processing_objects.Remove(src)
	else
		return ..()
	return


/obj/item/weapon/lighter/attack(mob/living/carbon/M as mob, mob/living/carbon/user as mob)
	if(!isliving(M))
		return
	M.IgniteMob()
	if(!istype(M, /mob))
		return

	if(istype(M.wear_mask, /obj/item/clothing/mask/cigarette) && user.zone_sel.selecting == "mouth" && lit)
		var/obj/item/clothing/mask/cigarette/cig = M.wear_mask
		if(M == user)
			cig.attackby(src, user)
		else
			if(istype(src, /obj/item/weapon/lighter/zippo))
				cig.light("<span class='rose'>[user] whips the [name] out and holds it for [M]. Their arm is as steady as the unflickering flame they light \the [cig] with.</span>")
			else
				cig.light("<span class='notice'>[user] holds the [name] out for [M], and lights the [cig.name].</span>")
			M.update_inv_wear_mask()
	else
		..()

/obj/item/weapon/lighter/process()
	var/turf/location = get_turf(src)
	if(location)
		location.hotspot_expose(700, 5)
	return

//EXTRA LIGHTERS
/obj/item/weapon/lighter/zippo/arf_rep
	name = "gold engraved zippo"
	desc = "An engraved golden Zippo lighter with the letters ARF on it."
	icon_state = "zippo_arf_off"
	icon_on = "zippo_arf_on"
	icon_off = "zippo_arf_off"

/obj/item/weapon/lighter/zippo/blue
	name = "blue zippo lighter"
	desc = "A zippo lighter made of some blue metal."
	icon_state = "bluezippo"
	icon_on = "bluezippoon"
	icon_off = "bluezippo"

/obj/item/weapon/lighter/zippo/black
	name = "black zippo lighter"
	desc = "A black zippo lighter."
	icon_state = "blackzippo"
	icon_on = "blackzippoon"
	icon_off = "blackzippo"

/obj/item/weapon/lighter/zippo/engraved
	name = "engraved zippo lighter"
	desc = "A intricately engraved zippo lighter."
	icon_state = "engravedzippo"
	icon_on = "engravedzippoon"
	icon_off = "engravedzippo"

/obj/item/weapon/lighter/zippo/gonzo
	name = "Gonzo Fist zippo"
	desc = "A Zippo lighter with the iconic Gonzo Fist on a matte black finish."
	icon_state = "gonzozippo"
	icon_on = "gonzozippoon"
	icon_off = "gonzozippo"

/obj/item/weapon/lighter/zippo/rugged
	name = "Rugged Plazippo"
	desc = "A Rugged Zippo awarded to officers in the A.R.F.C.G. This one uses plasma."
	icon_state = "Rugged_Plazippo"
	icon_on = "Rugged_Plazippo_On"
	icon_off = "Rugged_Plazippo"

/obj/item/weapon/lighter/zippo/bloodstained
	name = "Bloddstained Plazippo"
	desc = "An officers plazippo covered in dried blood. Closer inspection reveals an engraving that reads 'Mama is proud of you'."
	icon_state = "Bloodstained_Plazippo"
	icon_on = "Bloodstained_Plazippo_On"
	icon_off = "Bloodstained_Plazippo"

/obj/item/weapon/lighter/zippo/cosmic
	name = "Cosmic Guard Zippo"
	desc = "A Zippo given to members of the A.R.F. Cosmic Guard, the military branch."
	icon_state = "Cosmic_Guard_Zippo"
	icon_on = "Cosmic_Guard_Zippo_On"
	icon_off = "Cosmic_Guard_Zippo"

//New zippo's from AIEOU station

/obj/item/weapon/lighter/zippo/moffzippo
	name = "Moff Zippo"
	desc = "A dark grey zippo with a pretty moff on it!."
	icon_state = "moffzippo"
	icon_on = "moffzippoon"
	icon_off = "moffzippo"

/obj/item/weapon/lighter/zippo/red
	name = "Red Zippo"
	desc = "A simple red zippo with a sliver band."
	icon_state = "redzippo"
	icon_on = "redzippoon"
	icon_off = "redzippo"

/obj/item/weapon/lighter/zippo/ironiczippo
	name = "ironic zippo"
	desc = "A zippo in the shape of a fire extinguisher."
	icon_state = "ironiczippo"
	icon_on = "ironiczippoon"
	icon_off = "ironiczippo"

/obj/item/weapon/lighter/zippo/cappiezippo
	name = "Captains Zippo"
	desc = "A gold and black zippo for the Captain."
	icon_state = "cappiezippo"
	icon_on = "cappiezippoon"
	icon_off = "cappiezippo"

/obj/item/weapon/lighter/zippo/rainbowzippo
	name = "Rainbow Zippo"
	desc = "A very colorful zippo!."
	icon_state = "rainbowzippo"
	icon_on = "rainbowzippoon"
	icon_off = "rainbowzippo"

/obj/item/weapon/lighter/zippo/royalzippo
	name = "Captains Zippo"
	desc = "A very royal looking zippo"
	icon_state = "royalzippo"
	icon_on = "royalzippoon"
	icon_off = "royalzippo"

/obj/item/weapon/lighter/zippo/commiezippo
	name = "Black and Red Zippo"
	desc = "It's a black and red zippo"
	icon_state = "commiezippo"
	icon_on = "commiezippoon"
	icon_off = "commiezippo"
///////////
//MATCHES//
///////////
/obj/item/weapon/match
	name = "match"
	desc = "A simple match stick, used for lighting fine smokables."
	icon = 'icons/obj/cigarettes.dmi'
	icon_state = "match_unlit"
	var/lit = 0
	var/smoketime = 5
	w_class = WEIGHT_CLASS_TINY
	origin_tech = "materials=1"
	attack_verb = list("burnt", "singed")

/obj/item/weapon/match/process()
	var/turf/location = get_turf(src)
	smoketime--
	if(smoketime < 1)
		icon_state = "match_burnt"
		lit = -1
		processing_objects.Remove(src)
		return
	if(location)
		location.hotspot_expose(700, 5)
		return

/obj/item/weapon/match/dropped(mob/user as mob)
	if(lit == 1)
		lit = -1
		damtype = "brute"
		icon_state = "match_burnt"
		item_state = "cigoff"
		name = "burnt match"
		desc = "A match. This one has seen better days."
		processing_objects.Remove(src)
	return ..()

/obj/item/weapon/match/attack(mob/living/carbon/M as mob, mob/living/carbon/user as mob)
	if(!isliving(M))
		return ..()
	if(lit == 1) M.IgniteMob()
	if(!istype(M, /mob))
		return ..()

	if(istype(M.wear_mask, /obj/item/clothing/mask/cigarette) && user.zone_sel.selecting == "mouth" && lit == 1)
		var/obj/item/clothing/mask/cigarette/cig = M.wear_mask
		if(M == user)
			cig.attackby(src, user)
		else
			cig.light("<span class='notice'>[user] holds the [name] out for [M], and lights the [cig.name].</span>")
	else
		..()


//added in by Luke Vale

/obj/item/weapon/lighter/plasma
	name = "plasma lighter"
	desc = "Created by a mad man, this lighter uses a actual plasma fire to light up your cigarette. In fine print, it warns to not try to use it as a makeshift plasma cutter."
	icon_state = "P_lighter_off"
	item_state = "zippo"
	icon_on = "P_lighter_on"
	icon_off = "P_lighter_off"

/obj/item/weapon/lighter/plasma/attack_self(mob/living/user)
	if(user.r_hand == src || user.l_hand == src || isrobot(user))
		if(!lit)
			lit = 1
			w_class = WEIGHT_CLASS_BULKY
			icon_state = icon_on
			item_state = icon_on
			if(istype(src, /obj/item/weapon/lighter/plasma) )
				user.visible_message("<span class='rose'>Without even breaking stride, [user] activates and ignites [src] in one smooth movement.</span>")
				playsound(src.loc, 'sound/items/ZippoLight.ogg', 25, 1)
			else
				if(prob(75))
					user.visible_message("<span class='notice'>After a few attempts, [user] manages to light the [src].</span>")
				else
					to_chat(user, "<span class='warning'>You burn yourself while lighting the lighter.</span>")
					var/mob/living/M = user
					if(ishuman(M))
						var/mob/living/carbon/human/H = M
						var/obj/item/organ/external/affecting = H.get_organ("[user.hand ? "l" : "r" ]_hand")
						if(affecting.take_damage( 0, 5 ))		//INFERNO
							H.UpdateDamageIcon()
							H.updatehealth()
					user.visible_message("<span class='notice'>After a few attempts, [user] manages to light the [src], they however burn their finger in the process.</span>")

			set_light(2)
			processing_objects.Add(src)
		else
			lit = 0
			w_class = WEIGHT_CLASS_TINY
			icon_state = icon_off
			item_state = icon_off
			if(istype(src, /obj/item/weapon/lighter/zippo) )
				user.visible_message("<span class='rose'>You hear a quiet click, as [user] shuts off [src] without even looking at what they're doing. Wow.")
				playsound(src.loc, 'sound/items/ZippoClose.ogg', 25, 1)
			else
				user.visible_message("<span class='notice'>[user] quietly shuts off the [src].")

			set_light(0)
			processing_objects.Remove(src)
	else
		return ..()
	return
