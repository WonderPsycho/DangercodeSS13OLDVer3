/proc/ext_python(var/script, var/args, var/scriptsprefix = 1)
	if(scriptsprefix) script = "scripts/" + script

	if(world.system_type == MS_WINDOWS)
		script = replacetext(script, "/", "\\")

	var/command = python_path + " " + script + " " + args
	shell("[command]")
	return

/proc/ext_python_shodan(var/script, var/arg1, var/arg2, var/scriptsprefix = 1)
	if(scriptsprefix) script = "scripts/" + script

	if(world.system_type == MS_WINDOWS)
		script = replacetext(script, "/", "\\")

	var/command = python_path + " " + script + " " + arg1 + " " + arg2
	var/returncode = shell("[command]")

	if (returncode == 1)
		log_debug("The Shodan script crashed.")

	else if (returncode == 10)
		message_admins("Warning: [arg1] appears to have logged in from a proxy server!")
		log_admin("Warning: [arg1] appears to have logged in from a proxy server!")
		send2adminirc("Warning: [arg1] appears to have logged in from a proxy server!")

	else if (returncode == 20)
		message_admins("Warning: [arg1] appears to have logged in from a VPN!")
		log_admin("Warning: [arg1] appears to have logged in from a VPN!")
		send2adminirc("Warning: [arg1] appears to have logged in from a VPN!")

	else if (returncode == 30)
		message_admins("Warning: [arg1] appears to have logged in from a proxy server / VPN!")
		log_admin("Warning: [arg1] appears to have logged in from a proxy server / VPN!")
		send2adminirc("Warning: [arg1] appears to have logged in from a proxy server / VPN!")

	return