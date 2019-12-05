/datum/job/civilian
	#if MAP_ID == 999//ARFS Endeavor
	title = "Colonist"
	#else
	title = "Civilian"
	#endif
	flag = CIVILIAN
	department_flag = SUPPORT
	total_positions = -1
	spawn_positions = -1
	supervisors = "the head of personnel"
	department_head = list("Head of Personnel")
	selection_color = "#dddddd"
	access = list()			//See /datum/job/assistant/get_access()
	minimal_access = list()	//See /datum/job/assistant/get_access()
	alt_titles = list("Tourist","Businessman","Trader","Assistant","Technical Assistant","Medical Intern","Research Assistant","Passenger",
	"Entertainer","Lifeguard","Waiter","Waitress","Secretary","Delivery Staff","Holo-Gladiator","Musician", "Busker", "Rock Star", "Country Star", "Rap Star",
	"Pop Idol", "Jazz Artist", "Painter", "Maintenance Explorer", "Masseuse","Massager","Test Subject", "Fish Breeder",
	"Vidcam Model", "Escort", "Actor", "Actress", "Professional Cuddle Artist", "Pet", "Laser Tag Warrior", "Stripper", "Belly Dancer", "Fashion Model", "Live Preformer", "Nanotrasen Peace Officer")
	outfit = /datum/outfit/job/assistant

/datum/job/civilian/get_access()
	if(config.assistant_maint)
		return list(access_maint_tunnels)
	else
		return list()

/datum/outfit/job/assistant
	name = "Civilian"
	jobtype = /datum/job/civilian

	uniform = /obj/item/clothing/under/color/random
	shoes = /obj/item/clothing/shoes/black


