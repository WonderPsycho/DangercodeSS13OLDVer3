/obj/item/clothing/accessory/mantelet // i had to look the name of this thing up
	name = "black mantelet"
	desc = "A short cloak that ends at the midriff. Very distinguished-looking. This one is black."
	icon_state = "mant-b"
	item_state = "mant-b"

/obj/item/clothing/accessory/mantelet/white
	name = "white mantelet"
	desc = "A short cloak that ends at the midriff. Very distinguished-looking. This one is white."
	icon_state = "mant-w"
	item_state = "mant-w"

/obj/item/clothing/accessory/mantelet/cc // everything's better with centcomm.
	name = "centcomm officer mantelet"
	desc = "A Centcomm. mantelet with gold buttons. Great for asserting oneself at important meetings, or costume parties."
	icon_state = "mant-c"
	item_state = "mant-c"


/obj/item/clothing/accessory/proc/get_player_wearing()
	var/mob/living/carbon/human/H
	if(ishuman(loc))
		H = loc
	if(istype(loc,/obj/item/clothing/under) && ishuman(loc.loc))
		H = loc.loc
	if(!H)
		return null
	else
		return H