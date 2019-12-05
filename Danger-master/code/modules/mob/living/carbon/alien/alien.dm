#define HEAT_DAMAGE_LEVEL_1 2 //Amount of damage applied when your body temperature just passes the 360.15k safety point
#define HEAT_DAMAGE_LEVEL_2 3 //Amount of damage applied when your body temperature passes the 400K point
#define HEAT_DAMAGE_LEVEL_3 8 //Amount of damage applied when your body temperature passes the 1000K point

/mob/living/carbon/alien
	name = "alien"
	voice_name = "alien"
	speak_emote = list("hisses")
	icon = 'icons/mob/alien.dmi'
	gender = NEUTER
	dna = null


	alien_talk_understand = 1

	nightvision = 1

	var/obj/item/weapon/card/id/wear_id = null // Fix for station bounced radios -- Skie
	var/has_fine_manipulation = 0

	var/move_delay_add = 0 // movement delay to add

	status_flags = CANPARALYSE|CANPUSH
	var/heal_rate = 5

	var/large = 0
	var/heat_protection = 0.5
	var/leaping = 0
	ventcrawler = 2
	var/list/default_alien_organs = list(/obj/item/organ/internal/brain/xeno,
										/obj/item/organ/internal/xenos/hivenode)
	var/list/alien_organs = list()

/mob/living/carbon/alien/New()
	verbs += /mob/living/verb/mob_sleep
	verbs += /mob/living/verb/lay_down
	verbs += /mob/living/carbon/alien/verb/set_flavor
	for(var/O in default_alien_organs)
		alien_organs += new O
	for(var/obj/item/organ/internal/I in alien_organs)
		I.insert(src)
	/*
	if(locate(/mob/living/carbon/alien/humanoid/verb/plant) in verbs)//I don't know why but every alien has the plant verb and I cannot for the life of me find where they're getting it.
		var/obj/item/organ/internal/xenos/plasmavessel/PV = get_organ_slot("plasmavessel")
		if(!locate(/mob/living/carbon/alien/humanoid/verb/plant) in PV.alien_powers)
			verbs -= /mob/living/carbon/alien/humanoid/verb/plant
	*/
	spawn(10)
		updatePlasmaDisplay()
	..()

/mob/living/carbon/alien/get_default_language()
	if(default_language)
		return default_language
	return all_languages["Xenomorph"]

/mob/living/carbon/alien/say_quote(var/message, var/datum/language/speaking = null)
	OnSay(message, speaking)
	var/verb = "hisses"
	var/ending = copytext(message, length(message))
	if(ending=="!")
		verb = "roars"
	else if(ending=="?")
		verb = "hisses curiously"
	return verb


/mob/living/carbon/alien/adjustToxLoss(amount)
	return

/mob/living/carbon/alien/adjustFireLoss(amount) // Weak to Fire
	if(amount > 0)
		..(amount * 1.5)
		if(amount >= 20 && stat < UNCONSCIOUS)
			say("*hurt")
	else
		..(amount)
	return


/mob/living/carbon/alien/check_eye_prot()
	return 2

/mob/living/carbon/alien/updatehealth()
	if(status_flags & GODMODE)
		health = maxHealth
		stat = CONSCIOUS
		return
	health = maxHealth - getOxyLoss() - getFireLoss() - getBruteLoss() - getCloneLoss()

/mob/living/carbon/alien/handle_environment(var/datum/gas_mixture/environment)

	if(!environment)
		return

	var/loc_temp = get_temperature(environment)

//	to_chat(world, "Loc temp: [loc_temp] - Body temp: [bodytemperature] - Fireloss: [getFireLoss()] - Fire protection: [heat_protection] - Location: [loc] - src: [src]")

	// Aliens are now weak to fire.

	//After then, it reacts to the surrounding atmosphere based on your thermal protection
	if(!on_fire) // If you're on fire, ignore local air temperature
		if(loc_temp > bodytemperature)
			//Place is hotter than we are
			var/thermal_protection = heat_protection //This returns a 0 - 1 value, which corresponds to the percentage of protection based on what you're wearing and what you're exposed to.
			if(thermal_protection < 1)
				bodytemperature += (1-thermal_protection) * ((loc_temp - bodytemperature) / BODYTEMP_HEAT_DIVISOR)
		else
			bodytemperature += 1 * ((loc_temp - bodytemperature) / BODYTEMP_HEAT_DIVISOR)
		//	bodytemperature -= max((loc_temp - bodytemperature / BODYTEMP_AUTORECOVERY_DIVISOR), BODYTEMP_AUTORECOVERY_MINIMUM)

	// +/- 50 degrees from 310.15K is the 'safe' zone, where no damage is dealt.
	if(bodytemperature > 360.15)
		//Body temperature is too hot.
		throw_alert("alien_fire", /obj/screen/alert/alien_fire)
		switch(bodytemperature)
			if(360 to 400)
				apply_damage(HEAT_DAMAGE_LEVEL_1, BURN)
			if(400 to 460)
				apply_damage(HEAT_DAMAGE_LEVEL_2, BURN)
			if(460 to INFINITY)
				if(on_fire)
					apply_damage(HEAT_DAMAGE_LEVEL_3, BURN)
				else
					apply_damage(HEAT_DAMAGE_LEVEL_2, BURN)
	else
		clear_alert("alien_fire")

/mob/living/carbon/alien/handle_mutations_and_radiation()
	// Aliens love radiation nom nom nom
	if(radiation)
		if(radiation > 100)
			radiation = 100

		if(radiation < 0)
			radiation = 0

		switch(radiation)
			if(1 to 49)
				radiation--
				if(prob(25))
					adjustToxLoss(1)

			if(50 to 74)
				radiation -= 2
				adjustToxLoss(1)
				if(prob(5))
					radiation -= 5

			if(75 to 100)
				radiation -= 3
				adjustToxLoss(3)

/mob/living/carbon/alien/handle_fire()//Aliens on fire code
	if(..())
		return
	bodytemperature += BODYTEMP_HEATING_MAX //If you're on fire, you heat up!
	return

/mob/living/carbon/alien/IsAdvancedToolUser()
	return has_fine_manipulation

/mob/living/carbon/alien/Stat()
	..()
	statpanel("Status")
	stat(null, "Intent: [a_intent]")
	stat(null, "Move Mode: [m_intent]")
	show_stat_emergency_shuttle_eta()

/mob/living/carbon/alien/SetStunned(amount, updating = 1, force = 0)
	..()
	if(!(status_flags & CANSTUN) && amount)
		// add some movement delay
		move_delay_add = min(move_delay_add + round(amount / 2), 10) // a maximum delay of 10

/mob/living/carbon/alien/getDNA()
	return null

/mob/living/carbon/alien/setDNA()
	return

/mob/living/carbon/alien/verb/nightvisiontoggle()
	set name = "Toggle Night Vision"
	set category = "Alien"

	if(!nightvision)
		see_in_dark = 8
		see_invisible = SEE_INVISIBLE_MINIMUM
		nightvision = 1
		usr.hud_used.nightvisionicon.icon_state = "nightvision1"
	else if(nightvision == 1)
		see_in_dark = 4
		see_invisible = 45
		nightvision = 0
		usr.hud_used.nightvisionicon.icon_state = "nightvision0"


/mob/living/carbon/alien/assess_threat(var/mob/living/simple_animal/bot/secbot/judgebot, var/lasercolor)
	if(judgebot.emagged == 2)
		return 10 //Everyone is a criminal!
	var/threatcount = 0

	//Securitrons can't identify aliens
	if(!lasercolor && judgebot.idcheck)
		threatcount += 4

	//Lasertag bullshit
	if(lasercolor)
		if(lasercolor == "b")//Lasertag turrets target the opposing team, how great is that? -Sieve
			if((istype(r_hand,/obj/item/weapon/gun/energy/laser/redtag)) || (istype(l_hand,/obj/item/weapon/gun/energy/laser/redtag)))
				threatcount += 4

		if(lasercolor == "r")
			if((istype(r_hand,/obj/item/weapon/gun/energy/laser/bluetag)) || (istype(l_hand,/obj/item/weapon/gun/energy/laser/bluetag)))
				threatcount += 4

		return threatcount

	//Check for weapons
	if(judgebot.weaponscheck)
		if(judgebot.check_for_weapons(l_hand))
			threatcount += 4
		if(judgebot.check_for_weapons(r_hand))
			threatcount += 4

	//Mindshield implants imply trustworthyness
	if(ismindshielded(src))
		threatcount -= 1

	return threatcount

/*----------------------------------------
Proc: AddInfectionImages()
Des: Gives the client of the alien an image on each infected mob.
----------------------------------------*/
/mob/living/carbon/alien/proc/AddInfectionImages()
	if(client)
		for(var/mob/living/C in mob_list)
			if(C.status_flags & XENO_HOST)
				var/obj/item/organ/internal/body_egg/alien_embryo/A = C.get_int_organ(/obj/item/organ/internal/body_egg/alien_embryo)
				if(A)
					var/I = image('icons/mob/alien.dmi', loc = C, icon_state = "infected[A.stage]")
					client.images += I
	return


/*----------------------------------------
Proc: RemoveInfectionImages()
Des: Removes all infected images from the alien.
----------------------------------------*/
/mob/living/carbon/alien/proc/RemoveInfectionImages()
	if(client)
		for(var/image/I in client.images)
			if(dd_hasprefix_case(I.icon_state, "infected"))
				qdel(I)
	return

/mob/living/carbon/alien/canBeHandcuffed()
	return 1

/mob/living/carbon/alien/proc/updatePlasmaDisplay()
	if(hud_used) //clientless aliens
		hud_used.alien_plasma_display.maptext = "<div align='center' valign='middle' style='position:relative; top:0px; left:6px'> <font color='magenta'>[getPlasma()]</font></div>"

/mob/living/carbon/alien/larva/updatePlasmaDisplay()
	return

/mob/living/carbon/alien/can_use_vents()
	return

#undef HEAT_DAMAGE_LEVEL_1
#undef HEAT_DAMAGE_LEVEL_2
#undef HEAT_DAMAGE_LEVEL_3

/mob/living/carbon/alien/handle_footstep(turf/T)
	if(..())
		if(!footstep_sound)
			return 0
		if(buckled || lying || throwing || leaping)
			return 0
		if(!has_gravity(src))
			return 0
		if(step_count < 2)
			return 0
		var/S//Sound to play
		var/range = footstep_range
		var/volume = footstep_volume
		if(m_intent == MOVE_INTENT_WALK)
			range -= 9 //Sneaky
			volume /= 3 //Breeky

		//Miiight want to do a pass on this for performance but it works right now so I'm not touching it much.
		if(step_count >= 2)
			step_count = 0
			S = footstep_sound
		if(S)
			playsound(T, S, volume, 1, range)
			return 1
		return 0
	return 0

/mob/living/carbon/alien/getTrail()
	if(getBruteLoss() < 200)
		return pick("xltrails_1", "xltrails_2")
	else
		return pick("xttrails_1", "xttrails_2")