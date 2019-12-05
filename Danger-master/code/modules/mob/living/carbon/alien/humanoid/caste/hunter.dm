/mob/living/carbon/alien/humanoid/hunter
	name = "alien hunter"
	caste = "h"
	maxHealth = 100
	health = 100
	icon_state = "alienh"
	default_alien_organs = list(/obj/item/organ/internal/brain/xeno,
								/obj/item/organ/internal/xenos/hivenode)
/mob/living/carbon/alien/humanoid/hunter/New()
	if(name == "alien hunter")
		name = text("alien hunter ([rand(1, 1000)])")
	real_name = name
	default_alien_organs |= /obj/item/organ/internal/xenos/plasmavessel/hunter
	..()

/mob/living/carbon/alien/humanoid/hunter/movement_delay()
	. = -0.75		//hunters are sanic
	. += ..()	//but they still need to slow down on stun

//Hunter verbs

/mob/living/carbon/alien/humanoid/hunter/proc/toggle_leap(var/message = 1)
	leap_on_click = !leap_on_click
	leap_icon.icon_state = "leap_[leap_on_click ? "on":"off"]"
	if(message)
		to_chat(src, "<span class='noticealien'>You will now [leap_on_click ? "leap at":"slash at"] enemies!</span>")
	else
		return

/mob/living/carbon/alien/humanoid/hunter/ClickOn(var/atom/A, var/params)
	face_atom(A)
	if(leap_on_click)
		leap_at(A)
	else
		..()

#define MAX_ALIEN_LEAP_DIST 7

/mob/living/carbon/alien/humanoid/hunter/proc/leap_at(var/atom/A)
	if(pounce_cooldown)
		to_chat(src, "<span class='alertalien'>You are too fatigued to pounce right now!</span>")
		return

	if(leaping) //Leap while you leap, so you can leap while you leap
		return

	if(!has_gravity(src) || !has_gravity(A))
		to_chat(src, "<span class='alertalien'>It is unsafe to leap without gravity!</span>")
		//It's also extremely buggy visually, so it's balance+bugfix
		return
	if(lying)
		return

	leaping = 1
	update_icons()
	throw_at(A, MAX_ALIEN_LEAP_DIST, 1, spin = 0, diagonals_first = 1, callback = CALLBACK(src, .leap_end))

/mob/living/carbon/alien/humanoid/hunter/proc/leap_end()
	if(leaping)//we didn't hit anything, but still landed on the ground so we make a sound.
		playsound(loc, "alien_step", 150, 1, 3)
		leaping = 0
	update_icons()

/mob/living/carbon/alien/humanoid/hunter/throw_impact(atom/A)
	if(!leaping)
		return ..()

	if(A)
		if(isliving(A))
			var/mob/living/L = A
			var/blocked = 0
			if(ishuman(A))
				var/mob/living/carbon/human/H = A
				if(H.check_shields(0, "the [name]", src, attack_type = LEAP_ATTACK))
					blocked = 1
			if(!blocked)
				L.visible_message("<span class ='danger'>[src] pounces on [L]!</span>", "<span class ='userdanger'>[src] pounces on you!</span>")
				if(ishuman(L))
					var/mob/living/carbon/human/H = L
					playsound(loc, "alien_step", 150, 1, 3)
					H.apply_effect(strength, WEAKEN, H.run_armor_check(null, "melee"))
				else
					L.Weaken(strength)
				sleep(2)//Runtime prevention (infinite bump() calls on hulks)
				step_towards(src,L)
			else
				Weaken(2, 1, 1)

			toggle_leap(0)
		else if(A.density && !A.CanPass(src))
			visible_message("<span class ='danger'>[src] smashes into [A]!</span>", "<span class ='alertalien'>[src] smashes into [A]!</span>")
			playsound(loc, "alien_step_run", 150, 1, 7)
			Weaken(2, 1, 1)

		if(leaping)
			leaping = 0
			update_icons()
			update_canmove()
	pounce_cooldown = !pounce_cooldown
	spawn(pounce_cooldown_time) //3s by default
		pounce_cooldown = !pounce_cooldown

/mob/living/carbon/alien/humanoid/float(on)
	if(leaping)
		return
	..()
