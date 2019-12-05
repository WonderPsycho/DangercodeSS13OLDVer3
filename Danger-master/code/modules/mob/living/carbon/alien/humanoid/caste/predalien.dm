/mob/living/carbon/alien/humanoid/pred
	name = "abomination"
	caste = "pred"
	maxHealth = 150
	health = 150
	icon_state = "alienpred"
	strength = 4
	default_alien_organs = list(/obj/item/organ/internal/brain/xeno,
								/obj/item/organ/internal/xenos/hivenode,
								/obj/item/organ/internal/xenos/plasmavessel/queen,
								/obj/item/organ/internal/xenos/acidgland,
								/obj/item/organ/internal/xenos/resinspinner)

/mob/living/carbon/alien/humanoid/pred/New()
	if(name == "abomination")
		name = text("abomination ([rand(1, 1000)])")
	real_name = name
	..()