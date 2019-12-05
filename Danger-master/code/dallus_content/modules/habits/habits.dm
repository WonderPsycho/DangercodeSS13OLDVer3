/mob/living
	var/habit_selected
	var/list/habits = list()		// List of habits for a mob
	var/selected

#define HABITS_MAX 20
#define HABITS_NAME_MIN 2
#define HABITS_NAME_MAX 12

/mob/living/proc/habbitPanel()
	set name = "Habbit Panel"
	set category = "IC"

	var/datum/habit_look/picker_holder = new()
	picker_holder.loop = picker_holder
	picker_holder.selected = habits[habit_selected]

	var/dat = picker_holder.gen_ui(src)

	picker_holder.popup = new(src, "habbitPanel","Habits!", 400, 600, picker_holder)
	picker_holder.popup.set_content(dat)
	picker_holder.popup.open()

/datum/habit_look
	var/datum/habit/selected
	var/show_interacts = 0
	var/datum/browser/popup
	var/loop = null;  // Magic self-reference to stop the handler from being GC'd before user takes action.

/datum/habit_look/Topic(href,href_list[])
	popup.set_content(gen_ui(usr))
	usr << output(popup.get_content(), "habbitPanel.browser")

/datum/habit_look/proc/gen_ui(var/mob/living/user)
	var/dat

	dat += "<HR>"

	dat += "<ol style='list-style: none; padding: 0; overflow: auto;'>"
	for(var/K in user.habits) //Fuggin can't iterate over values
		var/datum/habit/H = user.habits[K]
		if(H == selected)
			dat += "<li style='float: left'><a href='?src=\ref[src];habitpick=\ref[H]'><b>[H.name]</b>"
		else
			dat += "<li style='float: left'><a href='?src=\ref[src];habitpick=\ref[B]'>[H.name]"

	if(user.habits.len < HABBITS_MAX)
		dat += "<li style='float: left'><a href='?src=\ref[src];newhabit=1'>New+</a></li>"
	dat += "</ol>"
	dat += "<HR>"

	// Selected Habit
	if(!selected)
		dat += "No habit selected. Click one to select it."
	else
		//Habit Name Button
		dat += "<a href='?src=\ref[src];h_name=\ref[selected]'>Name:</a>"
		dat += " '[selected.name]'"

		//Habit config
		dat += "<br><a href='?src=\ref[src];h_config=\ref[selected]'>Habits</a>"

		//Delete button
		dat += "<br><a style='background:#990000;' href='?src=\ref[src];h_del=\ref[selected]'>Delete Habit</a>"

	dat += "<HR>"

	//Under the last HR, save and stuff.
	dat += "<a href='?src=\ref[src];saveprefs=1'>Save Prefs</a>"
	dat += "<a href='?src=\ref[src];refresh=1'>Refresh</a>"
	dat += "<a href='?src=\ref[src];setflavor=1'>Set Flavor</a>"


	//Returns the dat html to the habit_look
	return dat

/datum/habit_look/proc/hp_interact(href, href_list)
	var/mob/living/user = usr
	for(var/H in href_list)

	if(href_list["close"])
		del(src)  // Cleanup
		return

	if(href_list["newhabit"])
		if(user.habits.len >= HABITS_MAX)
			return 0

		var/new_name = html_encode(input(usr,"New habit's name:","New Habit") as text|null)

		if(length(new_name) > HABITS_NAME_MAX || length(new_name) < HABITS_NAME_MIN)
			alert("Entered habit name length invalid (must be longer than [HABITS_NAME_MIN], no more than than [HABITS_NAME_MAX]).","Error")
			return 0
		if(new_name in user.habits)
			alert("No duplicate habit names, please.","Error")
			return 0

		var/datum/habit/NH = new(user)
		NH.name = new_name
		user.habits[new_name] = NH
		selected = NH

	if(href_list["habitpick"])
		selected = locate(href_list["habitpick"])
		user.habit_selected = selected.name

	////
	//Please keep these the same order they are on the panel UI for ease of coding
	////
	if(href_list["h_name"])
		var/new_name = html_encode(input(usr,"Habit's new name:","New Name") as text|null)

		if(length(new_name) > HABITS_NAME_MAX || length(new_name) < HABITS_NAME_MIN)
			alert("Entered habit name length invalid (must be longer than [HABITS_NAME_MIN], no more than than [HABITS_NAME_MAX]).","Error")
			return 0
		if(new_name in user.habits)
			alert("No duplicate habit names, please.","Error")
			return 0

		user.habits[new_name] = selected
		user.habits -= selected.name
		selected.name = new_name

	if(href_list["h_config"])
		var/list/messages = list(
			"Habit Message",
			"Habit Frequency",
			"Cancel - No Changes"
		)

		alert(user,"Setting abusive or deceptive messages will result in a ban. Consider this your warning. Max 150 characters for habits.","Really, don't.")
		var/choice = input(user,"Select what you want to modify.","Pick config") in messages
		switch(choice)
			if("Habit Message")
				var/new_message = input(user,"These are sent to prey when they expire. Write them in 2nd person ('you feel X'). Avoid using %prey in this type."+help,"Digest Message (to prey)",selected.get_messages("dmp")) as message
				if(new_message)
					selected.set_messages(new_message,"hm")

			if("Habit Frequency")
				var/frequency = input(user, "Set habit frequency (as %)", "Habit frequency") as num|null
				if(!isnull(frequency))
					selected.habitchance = sanitize_integer(frequency, 0, 100, initial(selected.habitchance))

			if("Cancel - No Changes")
				return 0

	if(href_list["h_del"])
		for(var/I in user.habits)
			var/datum/habit/H = user.habits[I]

		else if(user.habits.len == 1)
			alert("You must have at least one habit.","Error")
			return 1
		else
			var/alert = alert("Are you sure you want to delete [selected]?","Confirmation","Delete","Cancel")
			if(alert == "Delete")
				user.habits -= selected.name
				user.habits.Remove(selected)
				selected = user.habits[1]
				user.habit_selected = user.habits[1]

	if(href_list["saveprefs"])
		if(!user.save_habit_prefs())
			alert("ERROR: Habit preferences failed to save!","Error")
		else
			user << "<span class='notice'>Habit preferences saved!</span>"

	//Refresh when interacted with, returning 1 makes habit_look.Topic update
	return 1
