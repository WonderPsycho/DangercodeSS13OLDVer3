//ANDYMAN
/obj/item/clothing/accessory/watch
	name = "Watch"
	desc = "A fine timepiece."
	icon = 'code/dallus_content/icons/custom-items-arf.dmi'
	icon_state = "watch"
	item_state = "watch"
	item_color = "watch"
	var/cooldown_timer = 300
	var/time

/obj/item/clothing/accessory/watch/attack_self(mob/user as mob)
	time = worldtime2text()    																//Get world time
	if(!is_admin(user) && istype(user,/mob/living/carbon/human))									//Check if user is not an admin and is human. If true, display world time.
		to_chat(user, "<span class='notice'>You check the time on your watch. It is [time].</span>")
		return

	if(!istype(user,/mob/living/carbon/human))														//If not a human, explain they must be human to use this item
		to_chat(user, "<span class='warning'>You must be human to use this item.</span>")
		return

	var/mob/living/carbon/human/H = user
	var/watch_actions = list("Check Time", "Change Size")											//Make a list of possible actions for this watch as an admin.
	var/user_action = input(user, "Choose an action") in watch_actions

	if (user_action == "Check Time")
		to_chat(user, "<span class='notice'>You check the time on your watch. It is [time].</span>")

	else if (user_action == "Change Size")
		if (!cooldown)
			var/size_name = input(user, "Pick a Size") in player_sizes_list
			if (size_name && player_sizes_list[size_name] && !cooldown)
				if(size_name=="Macro" && H.size_multiplier == 2)
					return
				else if(size_name == "Big" && H.size_multiplier == 1.5)
					return
				else if(size_name == "Normal" && H.size_multiplier == 1)
					return
				else if(size_name == "Small" && H.size_multiplier == 0.75)
					return
				else if(size_name == "Tiny" && H.size_multiplier == 0.4)
					return
				else
					cooldown = 1
					H.resize(player_sizes_list[size_name])
					user.visible_message("<span class='notice'>[user] begins to change size!</span>", "<span class='notice'>You begin to change size! You are now [size_name].</span>")
					sleep(cooldown_timer)
					cooldown = 0
		else
			to_chat(user, "<span class='warning'>Your watch is still recharging.</span>")


/*
//TechnicalMagi
/obj/item/clothing/accessory/collar/bell/naomi
	name = "bell collar tagged \"Naomi\""
	desc = "A collar, probably for a certain catgirl. It has \"Wolfy's Cat\" cleanly pressed into the leather, and \"Slutcat\" roughly scratched in next to it."

/obj/item/clothing/accessory/collar/bell/naomi/process()
	var/mob/living/carbon/human/H = src.get_player_wearing()
	if(!H)
		return
	else if(prob(2) & H.hallucination < 30)
		H.hallucination = 30

/obj/item/clothing/accessory/collar/bell/naomi/New()
	..()
	processing_objects.Add(src)

/obj/item/clothing/accessory/collar/bell/naomi/Destroy()
	..()
	processing_objects.Remove(src)
*/