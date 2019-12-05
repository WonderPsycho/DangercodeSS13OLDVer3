	//Killbow

/obj/item/weapon/melee/classic_baton/killbow
	name = "S.I.N. Leader Staff"
	desc = "An Arf Representative cane modified to sport the classic SIN style, custom made it shows some buttons on the side and seems to spark with power."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "killbow_staff"
	item_state = "killbow_staff"
	force = 10
	attack_verb = list("mesmerizes")

	//Cebutris

/obj/item/weapon/soap/cebusoap
	name = "soap"
	desc = "A deluxe Wolfle Co. brand bar of soap. Smells of high-class Wolf Girl.."
	gender = FEMALE
	icon = 'icons/obj/items.dmi'
	icon_state = "soapcebu"
	w_class = WEIGHT_CLASS_SMALL
	throwforce = 0
	throw_speed = 4
	throw_range = 20

	//Truedark

/obj/item/weapon/katana/nay
	name = "nayriin's cerimonial katana"
	desc = "A silver lined obsidian katana inscribed with silver kanji characters. It has a silk grip and a pink tassle. Just by its looks, this was not a fighting sword."
	icon_state = "naykatana"
	item_state = "naykatana"
	force = 0
	slot_flags = SLOT_BELT
	throwforce = 0
	attack_verb = list("bapped", "wacked", "bonked")

	//Gozulio

/obj/item/weapon/melee/classic_baton/telescopic/goz/whitecane
	name = "white cane"
	desc = "A telescoping white cane. They are commonly used by the blind or visually impaired as a mobility tool or as a courtesy to others. This on appears to be heavily reinforced."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "goz_whitecane_0"
	item_state = null
	slot_flags = SLOT_BELT
	w_class = WEIGHT_CLASS_SMALL
	needs_permit = 0
	force = 0
	on = 0

/obj/item/weapon/melee/classic_baton/telescopic/goz/whitecane/attack_self(mob/user as mob)
	on = !on
	if(on)
		to_chat(user, "<span class ='warning'>You extend the baton.</span>")
		icon_state = "goz_whitecane_0"
		item_state = "goz_whitecane"
		w_class = WEIGHT_CLASS_BULKY //doesnt fit in backpack when its on for balance
		force = 0 //stunbaton damage
		attack_verb = list("smacked", "struck", "cracked", "beaten")
	else
		to_chat(user, "<span class ='notice'>You collapse the white cane.</span>")
		icon_state = "goz_whitecane"
		item_state = null //no sprite for concealment even when in hand
		slot_flags = SLOT_BELT
		w_class = WEIGHT_CLASS_SMALL
		force = 0 //not so robust now
		attack_verb = list("hit", "poked")
	if(istype(user,/mob/living/carbon/human))
		var/mob/living/carbon/human/H = user
		H.update_inv_l_hand()
		H.update_inv_r_hand()
	playsound(src.loc, 'sound/weapons/batonextend.ogg', 50, 1)
	add_fingerprint(user)

	//Runeguden
/*
/obj/item/toy/plushie/rune
	name = "Rune Plush"
	desc = "Everyone's adorable tiny slime, (Made by Rachel.co)"
	icon = 'icons/obj/toy.dmi'
	icon_state = "rune"
	anchored = 0
	density = 1

	//Runeguden

/obj/item/weapon/storage/toolbox/lunchbox/rune
	name = "Rune's Lunchbox"
	icon_state = "lunchbox_lovelyhearts"
	item_state_slots = list(slot_r_hand_str = "lunchbox_lovelyhearts", slot_l_hand_str = "lunchbox_lovelyhearts")
	desc = "A cute pink lunch box with red hearts."

/obj/item/weapon/storage/toolbox/lunchbox/rune/filled
	filled = TRUE
*/
	//Cebutris
/*
/obj/item/device/pda/awoo
	icon_state = "pda-awoo"
	desc = "An adorable wolf PDA. Looking at it makes you want to Awoo.."

	//Thingpony

/obj/item/device/pda/fox
	icon_state = "pda-fox"
	desc = "An adorable fox PDA."
*/
	//Malamarissa

/obj/item/weapon/foam/huntersaxe
	name = "Hunting Axe"
	attack_verb = list("bonked","whacked")
	icon = 'icons/obj/weapons.dmi'
	icon_state = "huntersaxe"
	desc = "One of the trick weapons of the workshop, commonly used on the hunt. Retains the qualities of an axe, but offers a wider palette of attacks by transforming. Boasts a heavy blunt attack, leading to high rally potential. No matter their pasts, beasts are no more than beasts. Some choose this axe to play the part of executioner."
	slot_flags = SLOT_BACK

// Chokin and Tokin
/obj/item/toy/cattoygreen
	name = "toy mouse"
	desc = "A colorful toy mouse!"
	icon = 'code/dallus_content/icons/custom-items-arf.dmi'
	icon_state = "toy_mouseg"
	w_class = 2.0
	var/cooldown = 0

//NESgamer190 giveaway item
/obj/item/weapon/reagent_containers/food/drinks/flask/cryo
	name = "cryo flask"
	desc = "A dary grey flask with purple lights running up and down the side of it. While it is ment to resemble a cryo beaker, it does not have the ability of it."
	icon_state = "cryoflask"
	materials = list(MAT_METAL=250)
	volume = 60

//Dropshotz giveaway item
/obj/item/weapon/reagent_containers/food/drinks/coffee/bluespace
	name = "A blucepace cup of coffee"
	desc = "Careful, the beverage you're about to enjoy is extremely hot."
	icon_state = "bluespace_coffee"
	list_reagents = list("coffee" = 9000) //Don't actually know how to make bluespace, so 9000 seems like a good number to make "endless"