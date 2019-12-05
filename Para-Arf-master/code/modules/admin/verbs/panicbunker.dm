/client/proc/panicbunker()
	set category = "Server"
	set name = "Toggle Panic Bunker"
	if (!config.sql_enabled)
		to_chat(usr, "<span class='adminnotice'>The Database is not enabled!</span>")
		return

	var/temp = ""
	if (config.panic_bunker)
		config.panic_bunker = 0
		temp = "off"
		send2adminirc("[src.key] deactivated the panic bunker.")
	else
		config.panic_bunker = 1
		temp = "on"
		send2adminirc("[src.key] activated the panic bunker.")

	log_admin("[src.key] has toggled the Panic Bunker, it is now [temp]")
	message_admins("[src.key] has toggled the Panic Bunker, it is now [temp].")
	if (!dbcon.IsConnected())
		message_admins("The Database is not connected! Panic bunker will not work until the connection is reestablished.")

/client/proc/requestmoreadmins()
	set category = "Admin"
	set name = "Request More Admins"
	send2adminirc("[src.key] has requested additional admins.")