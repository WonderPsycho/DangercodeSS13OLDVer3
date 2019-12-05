/*NOTES:
These are general powers. Specific powers are stored under the appropriate alien creature type.
*/

/*Alien spit now works like a taser shot. It won't home in on the target but will act the same once it does hit.
Doesn't work on other aliens/AI.*/



/obj/effect/proc_holder/alien
	name = "Alien Power"
	panel = "Alien"
	var/plasma_cost = 0
	var/check_turf = FALSE
	has_action = TRUE
	datum/action/spell_action/alien/action
	action_icon = 'icons/mob/actions/actions_xeno.dmi'
	action_icon_state = "spell_default"
	action_background_icon_state = "bg_alien"
/*
/obj/effect/proc_holder/alien/proc/can_cast()
	return action.IsAvailable()
*/

/obj/effect/proc_holder/alien/New()
	. = ..()
	action = new(src)

/obj/effect/proc_holder/alien/Click()
	if(!iscarbon(usr))
		return 1
	var/mob/living/carbon/user = usr
	if(cost_check(check_turf,user))
		if(fire(user) && user) // Second check to prevent runtimes when evolving
			user.adjustPlasma(-plasma_cost)
	return 1

/obj/effect/proc_holder/alien/on_gain(mob/living/carbon/user)
	return

/obj/effect/proc_holder/alien/on_lose(mob/living/carbon/user)
	return

/obj/effect/proc_holder/alien/fire(mob/living/carbon/user)
	return 1

/obj/effect/proc_holder/alien/get_panel_text()
	. = ..()
	if(plasma_cost > 0)
		return "[plasma_cost]"

//Cost check for mobs
/mob/living/carbon/proc/AlienCostCheck(cost = 1, check_turf=0 ,silent = 0)
	if(stat)
		if(!silent)
			to_chat(src, "<span class='noticealien'>You must be conscious to do this.</span>")
		return 0
	if(getPlasma() < cost)
		if(!silent)
			to_chat(src, "<span class='noticealien'>Not enough plasma stored.</span>")
		return 0
	if(check_turf && (!isturf(loc) || isspaceturf(loc)))
		if(!silent)
			to_chat(src, "<span class='noticealien'>Bad place for a garden!</span>")
		return 0
	return 1

/obj/effect/proc_holder/alien/proc/cost_check(check_turf=0,mob/living/carbon/user,silent = 0)
	if(user.stat)
		if(!silent)
			to_chat(user, "<span class='noticealien'>You must be conscious to do this.</span>")
		return 0
	if(user.getPlasma() < plasma_cost)
		if(!silent)
			to_chat(user, "<span class='noticealien'>Not enough plasma stored.</span>")
		return 0
	if(check_turf && (!isturf(user.loc) || isspaceturf(user.loc)))
		if(!silent)
			to_chat(user, "<span class='noticealien'>Bad place for a garden!</span>")
		return 0
	return 1




/obj/effect/proc_holder/alien/proc/check_vent_block(mob/living/user)
	var/obj/machinery/atmospherics/components/unary/atmos_thing = locate() in user.loc
	if(atmos_thing)
		var/rusure = alert(user, "Laying eggs and shaping resin here would block access to [atmos_thing]. Do you want to continue?", "Blocking Atmospheric Component", "Yes", "No")
		if(rusure != "No")
			return FALSE
	return TRUE

/obj/effect/proc_holder/alien/plant
	name = "Plant Weeds (50)"
	desc = "Plants some alien weeds."
	plasma_cost = 50
	check_turf = 1
	action_icon_state = "alien_plant"

/obj/effect/proc_holder/alien/plant/fire(mob/living/carbon/user)
	if(locate(/obj/structure/alien/weeds/node) in get_turf(user))
		to_chat(user, "There's already a weed node here.")
		return 0
	user.visible_message("<span class='alertalien'>[user] has planted some alien weeds!</span>")
	new/obj/structure/alien/weeds/node(user.loc)
	playsound(user.loc, "alien_secrete", 100, 1, 2)
	return 1

/obj/effect/proc_holder/alien/whisper
	name = "Whisper (10)"
	desc = "Whisper to someone."
	plasma_cost = 10
	action_icon_state = "alien_whisper"

/obj/effect/proc_holder/alien/whisper/fire(mob/living/carbon/user)
	var/list/options = list()
	for(var/mob/living/Ms in oview(user))
		options += Ms
	var/mob/living/M = input("Select who to whisper to:","Whisper to?",null) as null|mob in options
	if(!M)
		return 0
	var/msg = sanitize(input("Message:", "Alien Whisper") as text|null)
	if(msg)
		log_say("Alien Whisper: [key_name(user)]->[key_name(M)]: [msg]")
		to_chat(M, "<span class='noticealien'>You hear a strange, alien voice in your head...<span class='noticealien'>[msg]")
		to_chat(user, "<span class='noticealien'>You said: [msg] to [M]</span>")
		for(var/mob/dead/observer/G in player_list)
			G.show_message("<i>Alien message from <b>[user]</b> ([ghost_follow_link(user, ghost=G)]) to <b>[M]</b> ([ghost_follow_link(M, ghost=G)]): [msg]</i>")
	else
		return 0
	return 1

/obj/effect/proc_holder/alien/transfer
	name = "Transfer Plasma"
	desc = "Transfer Plasma to another alien."
	plasma_cost = 0
	action_icon_state = "alien_transfer"

/obj/effect/proc_holder/alien/transfer/fire(mob/living/carbon/user)
	var/list/mob/living/carbon/aliens_around = list()
	for(var/mob/living/carbon/A  in oview(1,user))
		if(A.get_int_organ(/obj/item/organ/internal/xenos/plasmavessel))
			aliens_around.Add(A)
	if(!aliens_around.len)
		to_chat(user, "<span class='noticealien'>There is nobody nearby you can transfer plasma to.</span>")
		return 0
	var/mob/living/carbon/M = input("Select who to transfer to:","Transfer plasma to?",null) as null|mob in aliens_around
	if(!M)
		return 0
	var/amount = input("Amount:", "Transfer Plasma to [M]") as num
	if (amount)
		amount = min(abs(round(amount)), user.getPlasma())
		if (get_dist(user,M) <= 1)
			M.adjustPlasma(amount)
			user.adjustPlasma(-amount)
			to_chat(M, "<span class='noticealien'>[user] has transferred [amount] plasma to you.</span>")
			to_chat(user, "<span class='noticealien'>You transfer [amount] plasma to [M]</span>")
		else
			to_chat(user, "<span class='noticealien'>You need to be closer!</span>")
	return

/obj/effect/proc_holder/alien/acid
	name = "Corrosive Acid (200)"
	desc = "Drench an object in acid, destroying it over time."
	plasma_cost = 200
	action_icon_state = "alien_acid"

/obj/effect/proc_holder/alien/acid/on_gain(mob/living/carbon/user)
	user.verbs.Add(/mob/living/carbon/proc/corrosive_acid)

/obj/effect/proc_holder/alien/acid/on_lose(mob/living/carbon/user)
	user.verbs.Remove(/mob/living/carbon/proc/corrosive_acid)

/obj/effect/proc_holder/alien/acid/proc/corrode(atom/O, mob/living/carbon/user = usr)

	if(O in oview(1))
		// OBJ CHECK
		if(isobj(O))
			var/obj/I = O
			if(I.unacidable)	//So the aliens don't destroy energy fields/singularies/other aliens/etc with their acid.
				to_chat(src, "<span class='noticealien'>You cannot dissolve this object.</span>")
				return
		// TURF CHECK
		else if(istype(O, /turf/simulated))
			var/turf/T = O
			// R WALL
			if(istype(T, /turf/simulated/wall/r_wall))
				to_chat(src, "<span class='noticealien'>You cannot dissolve this object.</span>")
				return
			// R FLOOR
			if(istype(T, /turf/simulated/floor/engine))
				to_chat(src, "<span class='noticealien'>You cannot dissolve this object.</span>")
				return
		else// Not a type we can acid.
			return

		user.adjustPlasma(-200)
		new /obj/effect/acid(get_turf(O), O)
		visible_message("<span class='alertalien'>[src] vomits globs of vile stuff all over [O]. It begins to sizzle and melt under the bubbling mess of acid!</span>")
		playsound(O.loc, "alien_secrete", 100, 1, 2)


	/*
	if(target in oview(1,user))
		if(target.acid_act(200, 100))
			user.visible_message("<span class='alertalien'>[user] vomits globs of vile stuff all over [target]. It begins to sizzle and melt under the bubbling mess of acid!</span>")
			return 1
		else
			to_chat(user, "<span class='noticealien'>You cannot dissolve this object.</span>")


			return 0
	else
		to_chat(src, "<span class='noticealien'>Target is too far away.</span>")
		return 0
	*/

/obj/effect/proc_holder/alien/acid/fire(mob/living/carbon/alien/user)
	var/O = input("Select what to dissolve:","Dissolve",null) as null|turf|obj in oview(1,user)
	if(!O || user.incapacitated())
		return 0
	else
		return corrode(O,user)

/mob/living/carbon/proc/corrosive_acid(O as obj|turf in oview(1)) // right click menu verb ugh
	set name = "Corrossive Acid"

	if(!iscarbon(usr))
		return
	var/mob/living/carbon/user = usr
	var/obj/effect/proc_holder/alien/acid/A = locate() in user.abilities
	if(!A)
		return
	if(user.getPlasma() > A.plasma_cost && A.corrode(O))
		user.adjustPlasma(-A.plasma_cost)

/obj/effect/proc_holder/alien/neurotoxin
	name = "Spit Neurotoxin (50)"
	desc = "Spits neurotoxin at someone, paralyzing them for a short time."
	action_icon_state = "alien_neurotoxin_0"
	plasma_cost = 50
	active = FALSE

/obj/effect/proc_holder/alien/neurotoxin/fire(mob/living/carbon/user)
	var/message
	if(active)
		message = "<span class='notice'>You empty your neurotoxin gland.</span>"
		remove_ranged_ability(user, message)
	else
		message = "<span class='notice'>You prepare your neurotoxin gland. <B>Left-click to fire at a target!</B></span>"
		add_ranged_ability(user, message, TRUE)

/obj/effect/proc_holder/alien/neurotoxin/update_icon()
	action.button_icon_state = "alien_neurotoxin_[active]"
	action.UpdateButtonIcon()

/obj/effect/proc_holder/alien/neurotoxin/InterceptClickOn(mob/living/caller, params, atom/target)
	caller.changeNext_move(CLICK_CD_MELEE)
	if(..())
		return
	var/p_cost = plasma_cost //Cached
	if(!iscarbon(ranged_ability_user) || ranged_ability_user.lying || ranged_ability_user.stat)
		remove_ranged_ability()
		return

	var/mob/living/carbon/user = ranged_ability_user

	if(user.getPlasma() < p_cost)
		to_chat(user, "<span class='warning'>You need at least [p_cost] plasma to spit.</span>")
		remove_ranged_ability()
		return

	var/turf/T = user.loc
	var/turf/U = get_step(user, user.dir) // Get the tile infront of the move, based on their direction
	if(!isturf(U) || !isturf(T))
		return FALSE

	user.visible_message("<span class='danger'>[user] spits neurotoxin!", "<span class='alertalien'>You spit neurotoxin.</span>")
	var/obj/item/projectile/bullet/neurotoxin/A = new /obj/item/projectile/bullet/neurotoxin(user.loc)
	A.preparePixelProjectile(target, get_turf(target), user, params)
	A.fire()
	user.newtonian_move(get_dir(U, T))
	user.adjustPlasma(-p_cost)

	return TRUE

/obj/effect/proc_holder/alien/neurotoxin/on_lose(mob/living/carbon/user)
	remove_ranged_ability()

/obj/effect/proc_holder/alien/neurotoxin/add_ranged_ability(mob/living/user, msg)
	..()
	if(isalienadult(user))
		var/mob/living/carbon/alien/humanoid/A = user
//		A.drooling = 1
		A.update_icons()

/obj/effect/proc_holder/alien/neurotoxin/remove_ranged_ability(mob/living/user, msg)
	..()
	if(isalienadult(user))
		var/mob/living/carbon/alien/humanoid/A = user
//		A.drooling = 0
		A.update_icons()

/obj/effect/proc_holder/alien/resin
	name = "Secrete Resin (55)"
	desc = "Secrete tough malleable resin."
	plasma_cost = 55
	check_turf = TRUE
	var/list/structures = list(
		"resin wall" = /obj/structure/alien/resin/wall,
		"resin membrane" = /obj/structure/alien/resin/membrane,
		"resin nest" = /obj/structure/stool/bed/nest)

	action_icon_state = "alien_resin"

/obj/effect/proc_holder/alien/resin/fire(mob/living/carbon/user)
	if(locate(/obj/structure/alien/resin) in user.loc)
		to_chat(user, "<span class='danger'>There is already a resin structure there.</span>")
		return FALSE

	if(!check_vent_block(user))
		return FALSE

	var/choice = input("Choose what you wish to shape.","Resin building") as null|anything in structures
	if(!choice)
		return FALSE
	if (!cost_check(check_turf,user))
		return FALSE
	to_chat(user, "<span class='notice'>You shape a [choice].</span>")
	user.visible_message("<span class='notice'>[user] vomits up a thick purple substance and begins to shape it.</span>")

	choice = structures[choice]
	new choice(user.loc)
	playsound(user.loc, "alien_secrete", 100, 1, 2)
	return TRUE

/obj/effect/proc_holder/alien/regurgitate
	name = "Regurgitate"
	desc = "Empties the contents of your stomach."
	plasma_cost = 0
	action_icon_state = "alien_barf"

/obj/effect/proc_holder/alien/regurgitate/fire(mob/living/carbon/user)
	if(user.stomach_contents.len)
		for(var/atom/movable/A in user.stomach_contents)
			user.stomach_contents.Remove(A)
			A.forceMove(user.loc)
			if(isliving(A))
				var/mob/M = A
				M.reset_perspective()
		user.visible_message("<span class='alertealien'>[user] hurls out the contents of their stomach!</span>")
	return

/obj/effect/proc_holder/alien/sneak
	name = "Sneak"
	desc = "Blend into the shadows to stalk your prey."
	active = 0

	action_icon_state = "alien_sneak"
/*
/obj/effect/proc_holder/alien/sneak/fire(mob/living/carbon/alien/humanoid/user)
	if(!active)
		user.alpha = 75 //Still easy to see in lit areas with bright tiles, almost invisible on resin.
		user.sneaking = 1
		active = 1
		to_chat(user, "<span class='noticealien'>You blend into the shadows...</span>")
	else
		user.alpha = initial(user.alpha)
		user.sneaking = 0
		active = 0
		to_chat(user, "<span class='noticealien'>You reveal yourself!</span>")
*/

/mob/living/carbon/proc/getPlasma()
	var/obj/item/organ/internal/xenos/plasmavessel/vessel = get_int_organ(/obj/item/organ/internal/xenos/plasmavessel)
	if(!vessel)
		return 0
	return vessel.stored_plasma


/mob/living/carbon/proc/adjustPlasma(amount)
	var/obj/item/organ/internal/xenos/plasmavessel/vessel = get_int_organ(/obj/item/organ/internal/xenos/plasmavessel)
	if(!vessel)
		return 0
	vessel.stored_plasma  = max(vessel.stored_plasma  + amount,0)
	vessel.stored_plasma  = min(vessel.stored_plasma , vessel.max_plasma) //upper limit of max_plasma, lower limit of 0
	for(var/X in abilities)
		var/obj/effect/proc_holder/alien/APH = X
		if(APH.has_action)
			APH.action.UpdateButtonIcon()
	return 1

/mob/living/carbon/alien/adjustPlasma(amount)
	. = ..()
	updatePlasmaDisplay()

/mob/living/carbon/proc/usePlasma(amount)
	if(getPlasma() >= amount)
		adjustPlasma(-amount)
		return 1

	return 0







/*
/mob/living/carbon/proc/powerc(X, Y)//Y is optional, checks for weed planting. X can be null.
	if(stat)
		to_chat(src, "<span class='noticealien'>You must be conscious to do this.</span>")
		return 0
	else if(X && getPlasma() < X)
		to_chat(src, "<span class='noticealien'>Not enough plasma stored.</span>")
		return 0
	else if(Y && (!isturf(src.loc) || istype(src.loc, /turf/space)))
		to_chat(src, "<span class='noticealien'>You can't place that here!</span>")
		return 0
	else	return 1

/mob/living/carbon/alien/humanoid/verb/plant()
	set name = "Plant Weeds (50)"
	set desc = "Plants some alien weeds"
	set category = "Alien"

	if(locate(/obj/structure/alien/weeds/node) in get_turf(src))
		to_chat(src, "<span class='noticealien'>There's already a weed node here.</span>")
		return

	if(powerc(50,1))
		adjustPlasma(-50)
		visible_message("<span class='alertalien'>[src] has planted some alien weeds!</span>")
		var/obj/structure/alien/weeds/W = (locate(/obj/structure/alien/weeds) in get_turf(src))
		if(W)
			qdel(W)
		new /obj/structure/alien/weeds/node(loc)
		playsound(loc, "alien_secrete", 100, 1, 7)
	return

/mob/living/carbon/alien/humanoid/verb/whisp(mob/M as mob in oview())
	set name = "Whisper (10)"
	set desc = "Whisper to someone"
	set category = "Alien"

	if(powerc(10))
		adjustPlasma(-10)
		var/msg = sanitize(input("Message:", "Alien Whisper") as text|null)
		if(msg)
			log_say("Alien Whisper: [key_name(src)]->[key_name(M)]: [msg]")
			to_chat(M, "<span class='noticealien'>You hear a strange, alien voice in your head...<span class='noticealien'>[msg]")
			to_chat(src, "<span class='noticealien'>You said: [msg] to [M]</span>")
			for(var/mob/dead/observer/G in player_list)
				G.show_message("<i>Alien message from <b>[src]</b> ([ghost_follow_link(src, ghost=G)]) to <b>[M]</b> ([ghost_follow_link(M, ghost=G)]): [msg]</i>")
	return

/mob/living/carbon/alien/humanoid/verb/transfer_plasma(mob/living/carbon/alien/M as mob in oview())
	set name = "Transfer Plasma"
	set desc = "Transfer Plasma to another alien"
	set category = "Alien"

	if(isalien(M))
		var/amount = input("Amount:", "Transfer Plasma to [M]") as num
		if(amount)
			amount = abs(round(amount))
			if(powerc(amount))
				if(get_dist(src,M) <= 1)
					M.adjustPlasma(amount)
					adjustPlasma(-amount)
					to_chat(M, "<span class='noticealien'>[src] has transfered [amount] plasma to you.</span>")
					to_chat(src, {"<span class='noticealien'>You have trasferred [amount] plasma to [M]</span>"})
				else
					to_chat(src, "<span class='noticealien'>You need to be closer.</span>")
	return


/mob/living/carbon/alien/humanoid/proc/corrosive_acid(O as obj|turf in oview(1)) //If they right click to corrode, an error will flash if its an invalid target./N
	set name = "Corrossive Acid (200)"
	set desc = "Drench an object in acid, destroying it over time."
	set category = "Alien"

	if(powerc(200))
		if(O in oview(1))
			// OBJ CHECK
			if(isobj(O))
				var/obj/I = O
				if(I.unacidable)	//So the aliens don't destroy energy fields/singularies/other aliens/etc with their acid.
					to_chat(src, "<span class='noticealien'>You cannot dissolve this object.</span>")
					return
			// TURF CHECK
			else if(istype(O, /turf/simulated))
				var/turf/T = O
				// R WALL
				if(istype(T, /turf/simulated/wall/r_wall))
					to_chat(src, "<span class='noticealien'>You cannot dissolve this object.</span>")
					return
				// R FLOOR
				if(istype(T, /turf/simulated/floor/engine))
					to_chat(src, "<span class='noticealien'>You cannot dissolve this object.</span>")
					return
			else// Not a type we can acid.
				return

			adjustPlasma(-200)
			new /obj/effect/acid(get_turf(O), O)
			visible_message("<span class='alertalien'>[src] vomits globs of vile stuff all over [O]. It begins to sizzle and melt under the bubbling mess of acid!</span>")
			playsound(O, "alien_secrete", 100, 1, 7)
		else
			to_chat(src, "<span class='noticealien'>Target is too far away.</span>")
	return
/*
/mob/living/carbon/alien/humanoid/proc/neurotoxin() // ok
	set name = "Spit Neurotoxin (50)"
	set desc = "Spits neurotoxin at someone, paralyzing them for a short time."
	set category = "Alien"

	if(powerc(50))
		adjustPlasma(-50)
		src.visible_message("<span class='danger'>[src] spits neurotoxin!", "<span class='alertalien'>You spit neurotoxin.</span>")
		playsound(src, "alien_spit", 100, 1, 7)
		var/turf/T = loc
		var/turf/U = get_step(src, dir) // Get the tile infront of the move, based on their direction
		if(!isturf(U) || !isturf(T))
			return

		var/obj/item/projectile/bullet/neurotoxin/A = new /obj/item/projectile/bullet/neurotoxin(usr.loc)
		A.current = U
		A.firer = src
		A.yo = U.y - T.y
		A.xo = U.x - T.x
		A.fire()
		A.newtonian_move(get_dir(U, T))
		newtonian_move(get_dir(U, T))
	return
*/
/mob/living/carbon/alien/humanoid/proc/resin() // -- TLE
	set name = "Secrete Resin (55)"
	set desc = "Secrete tough malleable resin."
	set category = "Alien"

	if(powerc(55))
		var/choice = input("Choose what you wish to shape.","Resin building") as null|anything in list("resin wall","resin membrane","resin nest") //would do it through typesof but then the player choice would have the type path and we don't want the internal workings to be exposed ICly - Urist

		if(!choice || !powerc(55))	return
		adjustPlasma(-55)
		for(var/mob/O in viewers(src, null))
			O.show_message(text("<span class='alertalien'>[src] vomits up a thick purple substance and shapes it!</span>"), 1)
		playsound(loc, "alien_secrete", 100, 1, 7)
		switch(choice)
			if("resin wall")
				new /obj/structure/alien/resin/wall(loc)
			if("resin membrane")
				new /obj/structure/alien/resin/membrane(loc)
			if("resin nest")
				new /obj/structure/stool/bed/nest(loc)
	return

/mob/living/carbon/alien/humanoid/verb/regurgitate()
	set name = "Regurgitate"
	set desc = "Empties the contents of your stomach"
	set category = "Alien"

	if(powerc())
		if(stomach_contents.len)
			for(var/mob/M in src)
				if(M in stomach_contents)
					stomach_contents.Remove(M)
					M.loc = loc
					//Paralyse(10)
			src.visible_message("<span class='alertalien'><B>[src] hurls out the contents of their stomach!</span>")
	return

/mob/living/carbon/proc/getPlasma()
 	var/obj/item/organ/internal/xenos/plasmavessel/vessel = get_int_organ(/obj/item/organ/internal/xenos/plasmavessel)
 	if(!vessel) return 0
 	return vessel.stored_plasma


/mob/living/carbon/proc/adjustPlasma(amount)
 	var/obj/item/organ/internal/xenos/plasmavessel/vessel = get_int_organ(/obj/item/organ/internal/xenos/plasmavessel)
 	if(!vessel) return
 	vessel.stored_plasma = max(vessel.stored_plasma + amount,0)
 	vessel.stored_plasma = min(vessel.stored_plasma, vessel.max_plasma) //upper limit of max_plasma, lower limit of 0
 	return 1

/mob/living/carbon/alien/adjustPlasma(amount)
	. = ..()
	updatePlasmaDisplay()

/mob/living/carbon/proc/usePlasma(amount)
	if(getPlasma() >= amount)
		adjustPlasma(-amount)
		return 1

 	return 0



/// /TG/ ALIEN POWERS///

/obj/effect/proc_holder/alien
	name = "Alien Power"
	panel = "Alien"
	var/plasma_cost = 0
	var/check_turf = FALSE
	has_action = TRUE
	datum/action/spell_action/alien/action
	action_icon = 'icons/mob/actions/actions_xeno.dmi'
	action_icon_state = "spell_default"
	action_background_icon_state = "bg_alien"

/obj/effect/proc_holder/alien/New()
	. = ..()
	action = new(src)

/obj/effect/proc_holder/alien/Click()
	if(!iscarbon(usr))
		return 1
	var/mob/living/carbon/user = usr
	if(cost_check(check_turf,user))
		if(fire(user) && user) // Second check to prevent runtimes when evolving
			user.adjustPlasma(-plasma_cost)
	return 1

/obj/effect/proc_holder/alien/on_gain(mob/living/carbon/user)
	return

/obj/effect/proc_holder/alien/on_lose(mob/living/carbon/user)
	return

/obj/effect/proc_holder/alien/fire(mob/living/carbon/user)
	return 1

/obj/effect/proc_holder/alien/get_panel_text()
	. = ..()
	if(plasma_cost > 0)
		return "[plasma_cost]"

/obj/effect/proc_holder/alien/proc/cost_check(check_turf=0,mob/living/carbon/user,silent = 0)
	if(user.stat)
		if(!silent)
			to_chat(user, "<span class='noticealien'>You must be conscious to do this.</span>")
		return 0
	if(user.getPlasma() < plasma_cost)
		if(!silent)
			to_chat(user, "<span class='noticealien'>Not enough plasma stored.</span>")
		return 0
	if(check_turf && (!isturf(user.loc) || isspaceturf(user.loc)))
		if(!silent)
			to_chat(user, "<span class='noticealien'>Bad place for a garden!</span>")
		return 0
	return 1

/obj/effect/proc_holder/alien/proc/check_vent_block(mob/living/user)
	var/obj/machinery/atmospherics/components/unary/atmos_thing = locate() in user.loc
	if(atmos_thing)
		var/rusure = alert(user, "Laying eggs and shaping resin here would block access to [atmos_thing]. Do you want to continue?", "Blocking Atmospheric Component", "Yes", "No")
		if(rusure != "No")
			return FALSE
	return TRUE


/obj/effect/proc_holder/alien/neurotoxin
	name = "Spit Neurotoxin"
	desc = "Spits neurotoxin at someone, paralyzing them for a short time."
	action_icon_state = "alien_neurotoxin_0"
	active = FALSE

/obj/effect/proc_holder/alien/neurotoxin/fire(mob/living/carbon/user)
	var/message
	if(active)
		message = "<span class='notice'>You empty your neurotoxin gland.</span>"
		remove_ranged_ability(message)
	else
		message = "<span class='notice'>You prepare your neurotoxin gland. <B>Left-click to fire at a target!</B></span>"
		add_ranged_ability(user, message, TRUE)

/obj/effect/proc_holder/alien/neurotoxin/update_icon()
	action.button_icon_state = "alien_neurotoxin_[active]"
	action.UpdateButtonIcon()

/obj/effect/proc_holder/alien/neurotoxin/InterceptClickOn(mob/living/caller, params, atom/target)
	if(..())
		return
	var/p_cost = 50
	if(!iscarbon(ranged_ability_user) || ranged_ability_user.lying || ranged_ability_user.stat)
		remove_ranged_ability()
		return

	var/mob/living/carbon/user = ranged_ability_user

	if(user.getPlasma() < p_cost)
		to_chat(user, "<span class='warning'>You need at least [p_cost] plasma to spit.</span>")
		remove_ranged_ability()
		return

	var/turf/T = user.loc
	var/turf/U = get_step(user, user.dir) // Get the tile infront of the move, based on their direction
	if(!isturf(U) || !isturf(T))
		return FALSE

	user.visible_message("<span class='danger'>[user] spits neurotoxin!", "<span class='alertalien'>You spit neurotoxin.</span>")
	var/obj/item/projectile/bullet/neurotoxin/A = new /obj/item/projectile/bullet/neurotoxin(user.loc)
	A.preparePixelProjectile(target, user, params)
	A.fire()
	user.newtonian_move(get_dir(U, T))
	user.adjustPlasma(-p_cost)

	return TRUE

/obj/effect/proc_holder/alien/neurotoxin/on_lose(mob/living/carbon/user)
	remove_ranged_ability()

/obj/effect/proc_holder/alien/neurotoxin/add_ranged_ability(mob/living/user, msg)
	..()
	if(isalienadult(user))
		var/mob/living/carbon/alien/humanoid/A = user
//		A.drooling = 1
		A.update_icons()

/obj/effect/proc_holder/alien/neurotoxin/remove_ranged_ability(mob/living/user, msg)
	..()
	if(isalienadult(user))
		var/mob/living/carbon/alien/humanoid/A = user
//		A.drooling = 0
		A.update_icons()
*/