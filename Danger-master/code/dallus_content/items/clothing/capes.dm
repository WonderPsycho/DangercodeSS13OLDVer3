/obj/item/clothing/cape
	name = "cape"
	desc = "You wear this on your back."
	icon = 'code/dallus_content/icons/capes.dmi'
	icon_override = 'code/dallus_content/icons/mob/arfs_back.dmi'
	icon_state = "firecape"
	item_state = "firecape"
	lefthand_file = 'code/dallus_content/icons/mob/clothing_lefthand.dmi'
	righthand_file = 'code/dallus_content/icons/mob/clothing_righthand.dmi'
	w_class = WEIGHT_CLASS_NORMAL
	slot_flags = SLOT_BACK
	burn_state = FLAMMABLE
	burntime = 10

/obj/item/clothing/cape/firecape
	name = "fire cape"
	desc = "The fabric of this cape is like animal hide if the fur was flowing lava. You feel awfully warm and protected while wearing this."
	burn_state = LAVA_PROOF
	light_color = "#e6671e"
	light_power = 1
	light_range = 2
