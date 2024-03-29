/mob/Logout()
	nanomanager.user_logout(src) // this is used to clean up (remove) this user's Nano UIs
	unset_machine()
	player_list -= src
	log_access("Logout: [key_name(src)]")
	// `holder` is nil'd out by now, so we check the `admin_datums` array directly
	//Only report this stuff if we are currently playing.
	if(admin_datums[ckey] && ticker && ticker.current_state == GAME_STATE_PLAYING)
		var/datum/admins/temp_admin = admin_datums[ckey]
		// Triggers on people with banhammer power only - no mentors tripping the alarm
		if(temp_admin.rights & R_BAN)
			message_admins("Admin logout: [key_name_admin(src)]")

			/*
			//Seriously. This just clutters up IRC. We don't really need this.
			var/list/admincounter = staff_countup(R_BAN)
			if(admincounter[1] == 0) // No active admins
				send2adminirc("[src.key] logged out - No active admins, [admincounter[2]] non-admin staff, [admincounter[3]] inactive staff.")
			*/

	..()

	callHook("mob_logout", list("client" = client, "mob" = src))

	return 1
