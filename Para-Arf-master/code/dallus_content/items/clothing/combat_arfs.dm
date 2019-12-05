/obj/item/clothing/head/helmet/space/void/retrotech
	name = "retrotech helmet"
	desc = "A clear green bowl style helmet made out of reinforced glass composite."
	icon = 'icons/mob/head_arfs.dmi'
	icon_state = "retrotechhelmet_mob"
	icon_override = 'icons/mob/head_arfs.dmi'
	flags_inv = null
	item_state = "retrotechhelmet_mob"
	armor = list(melee = 60, bullet = 70, laser = 10,energy = 0, bomb = 35, bio = 100, rad = 60)
	siemens_coefficient = 0.6
	species_restricted = list("Tajara")

/obj/item/clothing/suit/space/void/retrotech
	name = "retrotech pressure suit"
	desc = "A white suit that resembles a softsuit, but is actually very well armored. Made from a ceramo-kevlar composite for maxium flexibility and protection."
	icon = 'icons/mob/suit_arfs.dmi'
	icon_state = "retrotech_mob"
	icon_override = 'icons/mob/suit_arfs.dmi'
	item_state = "retrotech_mob"
	slowdown = 0
	w_class = ITEMSIZE_NORMAL
	armor = list(melee = 70, bullet = 60, laser = 60, energy = 35, bomb = 35, bio = 100, rad = 60)
	allowed = list(/obj/item/device/flashlight,/obj/item/weapon/tank,/obj/item/device/suit_cooling_unit,/obj/item/weapon/gun,/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/weapon/melee/baton,/obj/item/weapon/melee/energy/sword,/obj/item/weapon/handcuffs)
	siemens_coefficient = 0.6
	species_restricted = list("Tajara")

