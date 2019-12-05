
/mob/living/carbon/alien/larva/verb/hide()
	set name = "Hide"
	set desc = "Allows to hide beneath tables or certain items. Toggled on or off."
	set category = "Alien"

	if(stat != CONSCIOUS)
		return

	if(layer != TURF_LAYER+0.2)
		layer = TURF_LAYER+0.2
		to_chat(src, text("<span class='noticealien'>You are now hiding.</span>"))
		for(var/mob/O in oviewers(src, null))
			if((O.client && !( O.blinded )))
				to_chat(O, text("<B>[] scurries to the ground!</B>", src))
	else
		layer = MOB_LAYER
		to_chat(src, text("<span class=notice'>You have stopped hiding.</span>"))
		for(var/mob/O in oviewers(src, null))
			if((O.client && !( O.blinded )))
				to_chat(O, text("[] slowly peaks up from the ground...", src))

/mob/living/carbon/alien/larva/verb/evolve()
	set name = "Evolve"
	set desc = "Evolve into a fully grown Alien."
	set category = "Alien"

	if(stat != CONSCIOUS)
		return

	if(handcuffed || legcuffed)
		to_chat(src, "<span class='warning'>You cannot evolve when you are cuffed.</span>")

	if(amount_grown >= max_grown)	//TODO ~Carn
		//green is impossible to read, so i made these blue and changed the formatting slightly
		to_chat(src, "<span class='boldnotice'>You are growing into a beautiful alien! It is time to choose a caste.</span>")
		to_chat(src, "<span class='notice'>There are three to choose from:</span>")
		to_chat(src, "<B>Hunters</B> <span class='notice'>are strong and agile, able to hunt away from the hive and rapidly move through ventilation shafts. \
					Hunters have low plasma reserves and cannot plant their own weeds to heal. \
					Hunters are physically the strongest of the three basic castes, aiding in their ability to brawl threats to the hive and to subdue and capture hosts. \
					Using hit and run tactics, hunters should strike swiftly before retreating to the nest to heal and/or drop off captured hosts.</span>")
		to_chat(src, "<B>Sentinels</B> <span class='notice'>are tasked with protecting the hive and are deadly up close and at a range. \
					They are not as physically imposing nor fast as the hunters, but they are tough and equipped with a paralysing saliva which they \
					can spit over long distances.</span>")
		to_chat(src, "<B>Drones</B> <span class='notice'>are the working class, offering the largest plasma storage and generation. \
					They are the only caste which may evolve again, turning into a queen if there isn't already one. \
					They are also the only caste which can build the hive and plant weeds. Weeds are essential for generating plasma, healing, and slowing fleeing hosts. \
					Drones are the backbone of the hive, though they are frail. Hunting parties often benefit from keeping a drone in their ranks for their versatility as \
					a healer and builder; Capable of building quick cover or laying a patch of healing weeds on the fly.</span>")
		var/alien_caste = alert(src, "Please choose which alien caste you shall belong to.",,"Hunter","Sentinel","Drone")

		var/mob/living/carbon/alien/humanoid/new_xeno
		switch(alien_caste)
			if("Hunter")
				new_xeno = new /mob/living/carbon/alien/humanoid/hunter(loc)
			if("Sentinel")
				new_xeno = new /mob/living/carbon/alien/humanoid/sentinel(loc)
			if("Drone")
				new_xeno = new /mob/living/carbon/alien/humanoid/drone(loc)
		if(mind)
			mind.transfer_to(new_xeno)
		else
			new_xeno.key = key
		new_xeno.mind.name = new_xeno.name
		qdel(src)
		return
	else
		to_chat(src, "<span class='warning'>You are not fully grown.</span>")
		return
