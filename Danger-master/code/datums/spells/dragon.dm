/obj/effect/proc_holder/spell/dragonfireball
	name = "Fireball"
	desc = "This spell fires a fireball at a target and does little damage"

	school = "dragon"
	charge_max = 0
	clothes_req = 0
	invocation = "none"
	invocation_type = "none"
	range = 20
	cooldown_min = 30
	var/fireball_type = /obj/item/projectile/magic/dragonfireball
	action_icon_state = "fireball0"
	sound = 'sound/magic/Fireball.ogg'

	active = FALSE

/obj/effect/proc_holder/spell/dragonfireball/Click()
	var/mob/living/user = usr
	if(!istype(user))
		return

	var/msg

	if(!can_cast(user))
		msg = "<span class='warning'>You can no longer cast Fireball.</span>"
		remove_ranged_ability(user, msg)
		return

	if(active)
		msg = "<span class='notice'>You extinguish your fireball...for now.</span>"
		remove_ranged_ability(user, msg)
	else
		msg = "<span class='notice'>Your prepare to cast your fireball spell! <B>Left-click to cast at a target!</B></span>"
		add_ranged_ability(user, msg)

/obj/effect/proc_holder/spell/dragonfireball/update_icon()
	if(!action)
		return
	action.button_icon_state = "fireball[active]"
	action.UpdateButtonIcon()

/obj/effect/proc_holder/spell/dragonfireball/InterceptClickOn(mob/living/user, params, atom/target)
	if(..())
		return FALSE

	if(!cast_check(0, user))
		remove_ranged_ability(user)
		return FALSE

	var/list/targets = list(target)
	perform(targets, user = user)

	return TRUE

/obj/effect/proc_holder/spell/dragonfireball/cast(list/targets, mob/living/user = usr)
	var/target = targets[1] //There is only ever one target for fireball
	var/turf/T = user.loc
	var/turf/U = get_step(user, user.dir) // Get the tile infront of the move, based on their direction
	if(!isturf(U) || !isturf(T))
		return 0

	var/obj/item/projectile/magic/dragonfireball/FB = new fireball_type(user.loc)
	FB.current = get_turf(user)
	FB.preparePixelProjectile(target, get_turf(target), user)
	FB.fire()
	user.newtonian_move(get_dir(U, T))
	remove_ranged_ability(user)

	return 1