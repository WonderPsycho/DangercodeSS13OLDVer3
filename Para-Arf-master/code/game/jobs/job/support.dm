//Food
/datum/job/bartender
	title = "Bartender"
	flag = BARTENDER
	department_flag = SUPPORT
	total_positions = 1
	spawn_positions = 1
	is_service = 1
	#if MAP_ID == 999//ARFS Endeavor
	supervisors = "the captain"
	department_head = list("Captain")
	#else
	supervisors = "the head of personnel"
	department_head = list("Head of Personnel")
	#endif
	selection_color = "#dddddd"
	access = list(access_hydroponics, access_bar, access_kitchen, access_morgue, access_weapons, access_mineral_storeroom)
	minimal_access = list(access_bar, access_maint_tunnels, access_weapons, access_mineral_storeroom)
	alt_titles = list("Barista", "Mixologist", "Barmaid", "Taverner")
	outfit = /datum/outfit/job/bartender

/datum/outfit/job/bartender
	name = "Bartender"
	jobtype = /datum/job/bartender

	uniform = /obj/item/clothing/under/rank/bartender
	suit = /obj/item/clothing/suit/armor/vest
	shoes = /obj/item/clothing/shoes/black
	l_ear = /obj/item/device/radio/headset/headset_service
	glasses = /obj/item/clothing/glasses/sunglasses/reagent
	pda = /obj/item/device/pda/bar
/*
	backpack_contents = list(
		/obj/item/toy/russian_revolver = 1
	)
	*/

/datum/outfit/job/bartender/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return

	H.dna.SetSEState(SOBERBLOCK,1)
	H.mutations += SOBER
	H.check_mutations = 1



/datum/job/chef
	title = "Chef"
	flag = CHEF
	department_flag = SUPPORT
	total_positions = 1
	spawn_positions = 1
	is_service = 1
	#if MAP_ID == 999//ARFS Endeavor
	supervisors = "the captain"
	department_head = list("Captain")
	#else
	supervisors = "the head of personnel"
	department_head = list("Head of Personnel")
	#endif
	selection_color = "#dddddd"
	access = list(access_hydroponics, access_bar, access_kitchen, access_morgue)
	minimal_access = list(access_kitchen, access_maint_tunnels)
	alt_titles = list("Cook", "Baker", "Sous Chef", "Teppanyaki Chef", "Pastry Chef", "Fry Cook", "Burger Flipper", "Culinary Artist")
	outfit = /datum/outfit/job/chef

/datum/outfit/job/chef
	name = "Chef"
	jobtype = /datum/job/chef

	uniform = /obj/item/clothing/under/rank/chef
	suit = /obj/item/clothing/suit/chef
	shoes = /obj/item/clothing/shoes/black
	head = /obj/item/clothing/head/chefhat
	l_ear = /obj/item/device/radio/headset/headset_service
	pda = /obj/item/device/pda/chef



/datum/job/hydro
	title = "Botanist"
	flag = BOTANIST
	department_flag = SUPPORT
	#if MAP_ID == 999//ARFS Endeavor
	total_positions = 2
	spawn_positions = 2
	supervisors = "the captain"
	department_head = list("Captain")
	#else
	total_positions = 3
	spawn_positions = 2
	supervisors = "the head of personnel"
	department_head = list("Head of Personnel")
	#endif
	is_service = 1
	selection_color = "#dddddd"
	access = list(access_hydroponics, access_bar, access_kitchen, access_morgue)
	minimal_access = list(access_hydroponics, access_morgue, access_maint_tunnels)
	alt_titles = list("Hydroponicist", "Botanical Researcher", "Farmer", "Horticulturalist", "Florist", "Beekeeper")
	outfit = /datum/outfit/job/hydro

/datum/outfit/job/hydro
	name = "Botanist"
	jobtype = /datum/job/hydro

	uniform = /obj/item/clothing/under/rank/hydroponics
	suit = /obj/item/clothing/suit/apron
	gloves = /obj/item/clothing/gloves/botanic_leather
	shoes = /obj/item/clothing/shoes/black
	l_ear = /obj/item/device/radio/headset/headset_service
	suit_store = /obj/item/device/plant_analyzer
	pda = /obj/item/device/pda/botanist

	backpack = /obj/item/weapon/storage/backpack/botany
	satchel = /obj/item/weapon/storage/backpack/satchel_hyd
	dufflebag = /obj/item/weapon/storage/backpack/duffel/hydro



//Cargo
/datum/job/qm
	title = "Quartermaster"
	flag = QUARTERMASTER
	department_flag = SUPPORT
	#if MAP_ID == 999//ARFS Endeavor
	total_positions = 0
	spawn_positions = 0
	#else
	total_positions = 1
	spawn_positions = 1
	#endif
	is_supply = 1
	supervisors = "the head of personnel"
	department_head = list("Head of Personnel")
	selection_color = "#dddddd"
	access = list(access_maint_tunnels, access_mailsorting, access_cargo, access_cargo_bot, access_qm, access_mint, access_mining, access_mining_station, access_mineral_storeroom)
	minimal_access = list(access_maint_tunnels, access_mailsorting, access_cargo, access_cargo_bot, access_qm, access_mint, access_mining, access_mining_station, access_mineral_storeroom)
	alt_titles = list("Supply Chief", "Seneschal", "Storage Manager", "Material Aquisistions Manager")
	outfit = /datum/outfit/job/qm

/datum/outfit/job/qm
	name = "Quartermaster"
	jobtype = /datum/job/qm

	uniform = /obj/item/clothing/under/rank/cargo
	shoes = /obj/item/clothing/shoes/brown
	l_ear = /obj/item/device/radio/headset/headset_cargo
	glasses = /obj/item/clothing/glasses/sunglasses
	id = /obj/item/weapon/card/id/supply
	l_hand = /obj/item/weapon/clipboard
	pda = /obj/item/device/pda/quartermaster



/datum/job/cargo_tech
	title = "Cargo Technician"
	flag = CARGOTECH
	department_flag = SUPPORT
	is_supply = 1
	#if MAP_ID == 999//ARFS Endeavor
	supervisors = "the captain"
	department_head = list("Captain")
	total_positions = 4
	spawn_positions = 4
	#else
	supervisors = "the quartermaster"
	department_head = list("Head of Personnel")
	total_positions = 2
	spawn_positions = 2
	#endif
	selection_color = "#dddddd"
	access = list(access_maint_tunnels, access_mailsorting, access_cargo, access_cargo_bot, access_qm, access_mint, access_mining, access_mining_station, access_mineral_storeroom)
	minimal_access = list(access_maint_tunnels, access_cargo, access_cargo_bot, access_mailsorting, access_mineral_storeroom)
	alt_titles = list("Courier", "Warehouse Staff", "Inventory Specialist", "Storage Associate", "Material Aquisition Underofficer", "Material Export Underofficer")
	outfit = /datum/outfit/job/cargo_tech

/datum/outfit/job/cargo_tech
	name = "Cargo Technician"
	jobtype = /datum/job/cargo_tech

	uniform = /obj/item/clothing/under/rank/cargotech
	shoes = /obj/item/clothing/shoes/black
	l_ear = /obj/item/device/radio/headset/headset_cargo
	id = /obj/item/weapon/card/id/supply
	pda = /obj/item/device/pda/cargo



/datum/job/mining
	title = "Shaft Miner"
	flag = MINER
	department_flag = SUPPORT
	is_supply = 1
	#if MAP_ID == 999//ARFS Endeavor
	supervisors = "the captain"
	department_head = list("Captain")
	total_positions = 5//Just because people like mining. Will be cramped with this many, but at least they get the job.
	spawn_positions = 5
	#else
	supervisors = "the quartermaster"
	department_head = list("Head of Personnel")
	total_positions = 3
	spawn_positions = 3
	#endif
	selection_color = "#dddddd"
	access = list(access_maint_tunnels, access_mailsorting, access_cargo, access_cargo_bot, access_qm, access_mint, access_mining, access_mining_station, access_mineral_storeroom)
	minimal_access = list(access_mining, access_mint, access_mining_station, access_mailsorting, access_maint_tunnels, access_mineral_storeroom)
	alt_titles = list("Spelunker", "Drill Technician", "Prospector", "Asteroid Miner", "Licensed Adventurer", "Astro-Medic", "Smithy")
	outfit = /datum/outfit/job/mining

/datum/outfit/job/mining
	name = "Shaft Miner"
	jobtype = /datum/job/mining

	uniform = /obj/item/clothing/under/rank/miner
	gloves = /obj/item/clothing/gloves/fingerless
	shoes = /obj/item/clothing/shoes/workboots
	l_ear = /obj/item/device/radio/headset/headset_cargo/mining
	id = /obj/item/weapon/card/id/supply
	l_pocket = /obj/item/weapon/reagent_containers/food/pill/patch/styptic
	r_pocket = /obj/item/device/flashlight/seclite
	pda = /obj/item/device/pda/shaftminer
	backpack_contents = list(
		/obj/item/weapon/mining_voucher = 1,
		/obj/item/weapon/storage/bag/ore = 1
	)

	backpack = /obj/item/weapon/storage/backpack/industrial
	satchel = /obj/item/weapon/storage/backpack/satchel_eng



//Griff //BS12 EDIT

/datum/job/clown
	title = "Clown"
	flag = CLOWN
	department_flag = SUPPORT
	#if MAP_ID == 999//ARFS Endeavor
	total_positions = 0
	spawn_positions = 0
	#else
	total_positions = 1
	spawn_positions = 1
	#endif
	is_service = 1
	supervisors = "the head of personnel"
	department_head = list("Head of Personnel")
	selection_color = "#dddddd"
	access = list(access_clown, access_theatre, access_maint_tunnels)
	minimal_access = list(access_clown, access_theatre, access_maint_tunnels)
	alt_titles = list("Comedian", "Ragamuffin", "Magician", "Prankster", "Tripologist","Head of Laughter","Giggle Lord", "Harlequin")
	outfit = /datum/outfit/job/clown

/datum/outfit/job/clown
	name = "Clown"
	jobtype = /datum/job/clown

	uniform = /obj/item/clothing/under/rank/clown
	shoes = /obj/item/clothing/shoes/clown_shoes
	mask = /obj/item/clothing/mask/gas/clown_hat
	l_pocket = /obj/item/weapon/bikehorn
	l_ear = /obj/item/device/radio/headset/headset_service
	id = /obj/item/weapon/card/id/clown
	pda = /obj/item/device/pda/clown
	backpack_contents = list(
		/obj/item/weapon/reagent_containers/food/snacks/grown/banana = 1,
		/obj/item/weapon/stamp/clown = 1,
		/obj/item/toy/crayon/rainbow = 1,
		/obj/item/weapon/storage/fancy/crayons = 1,
		/obj/item/weapon/reagent_containers/spray/waterflower = 1,
		/obj/item/weapon/reagent_containers/food/drinks/bottle/bottleofbanana = 1,
		/obj/item/device/instrument/bikehorn = 1
	)

	backpack = /obj/item/weapon/storage/backpack/clown
	satchel = /obj/item/weapon/storage/backpack/clown
	dufflebag = /obj/item/weapon/storage/backpack/duffel/clown

/datum/outfit/job/clown/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(H.gender == FEMALE)
		mask = /obj/item/clothing/mask/gas/sexyclown
		uniform = /obj/item/clothing/under/sexyclown

/datum/outfit/job/clown/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return

	if(H.get_species() == "Machine")
		var/obj/item/organ/internal/cyberimp/brain/clown_voice/implant = new
		implant.insert(H)

	H.mutations.Add(CLUMSY)
	H.dna.SetSEState(COMICBLOCK, 1, 1)
	genemutcheck(H, COMICBLOCK, null, MUTCHK_FORCED)


/datum/job/mime
	title = "Mime"
	flag = MIME
	department_flag = SUPPORT
	#if MAP_ID == 999//ARFS Endeavor
	total_positions = 1
	spawn_positions = 1
	#else
	total_positions = 1
	spawn_positions = 1
	#endif
	is_service = 1
	supervisors = "the head of personnel"
	department_head = list("Head of Personnel")
	selection_color = "#dddddd"
	access = list(access_mime, access_theatre, access_maint_tunnels)
	minimal_access = list(access_mime, access_theatre, access_maint_tunnels)
	alt_titles = list("French Clown", "Head of Berets")
	outfit = /datum/outfit/job/mime

/datum/outfit/job/mime
	name = "Mime"
	jobtype = /datum/job/mime

	uniform = /obj/item/clothing/under/mime
	suit = /obj/item/clothing/suit/suspenders
	back = /obj/item/weapon/storage/backpack/mime
	gloves = /obj/item/clothing/gloves/color/white
	shoes = /obj/item/clothing/shoes/black
	head = /obj/item/clothing/head/beret
	mask = /obj/item/clothing/mask/gas/mime
	l_ear = /obj/item/device/radio/headset/headset_service
	id = /obj/item/weapon/card/id/mime
	pda = /obj/item/device/pda/mime
	backpack_contents = list(
		/obj/item/toy/crayon/mime = 1,
		/obj/item/weapon/reagent_containers/food/drinks/bottle/bottleofnothing = 1,
		/obj/item/weapon/cane = 1
	)

/datum/outfit/job/mime/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(H.gender == FEMALE)
		uniform = /obj/item/clothing/under/sexymime
		suit = /obj/item/clothing/mask/gas/sexymime

/datum/outfit/job/mime/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return

	if(H.mind)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/aoe_turf/conjure/mime_wall(null))
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/mime/speak(null))
		H.mind.miming = 1



/datum/job/janitor
	title = "Janitor"
	flag = JANITOR
	department_flag = SUPPORT
	#if MAP_ID == 999//ARFS Endeavor
	supervisors = "the captain"
	department_head = list("Captain")
	total_positions = 4
	spawn_positions = 4
	#else
	supervisors = "the quartermaster"
	department_head = list("Head of Personnel")
	total_positions = 1
	spawn_positions = 1
	#endif
	is_service = 1
	selection_color = "#dddddd"
	access = list(access_janitor, access_maint_tunnels)
	minimal_access = list(access_janitor, access_maint_tunnels)
	alt_titles = list("Custodial Technician", "Sanitation Technician", "Maid")
	outfit = /datum/outfit/job/janitor

/datum/outfit/job/janitor
	name = "Janitor"
	jobtype = /datum/job/janitor

	uniform = /obj/item/clothing/under/rank/janitor
	shoes = /obj/item/clothing/shoes/black
	l_ear = /obj/item/device/radio/headset/headset_service
	pda = /obj/item/device/pda/janitor


//More or less assistants
/datum/job/librarian
	title = "Librarian"
	flag = LIBRARIAN
	department_flag = SUPPORT
	#if MAP_ID == 999//ARFS Endeavor
	total_positions = 1
	spawn_positions = 1
	#else
	total_positions = 1
	spawn_positions = 1
	#endif
	is_service = 1
	supervisors = "the head of personnel"
	department_head = list("Head of Personnel")
	selection_color = "#dddddd"
	access = list(access_library, access_maint_tunnels)
	minimal_access = list(access_library, access_maint_tunnels)
	alt_titles = list("Journalist", "Professor", "Historian", "Writer", "Poet", "Cataloger", "Archivist",
	"Chronicler", "Reporter", "Game Master", "Dungeon Master", "Story Teller", "Bookkeeper")
	outfit = /datum/outfit/job/librarian

/datum/outfit/job/librarian
	name = "Librarian"
	jobtype = /datum/job/librarian

	uniform = /obj/item/clothing/under/suit_jacket/red
	shoes = /obj/item/clothing/shoes/black
	l_ear = /obj/item/device/radio/headset/headset_service
	l_pocket = /obj/item/device/laser_pointer
	r_pocket = /obj/item/weapon/barcodescanner
	l_hand = /obj/item/weapon/storage/bag/books
	pda = /obj/item/device/pda/librarian

/datum/job/barber
	title = "Barber"
	flag = BARBER
	department_flag = KARMA
	#if MAP_ID == 999//ARFS Endeavor
	total_positions = 0
	spawn_positions = 0
	#else
	total_positions = 1
	spawn_positions = 1
	#endif
	is_service = 1
	supervisors = "the head of personnel"
	department_head = list("Head of Personnel")
	selection_color = "#dddddd"
	alt_titles = list("Hair Stylist","Beautician")
	access = list(access_maint_tunnels)
	minimal_access = list(access_maint_tunnels)
	outfit = /datum/outfit/job/barber

/datum/outfit/job/barber
	name = "Barber"
	jobtype = /datum/job/barber

	uniform = /obj/item/clothing/under/barber
	shoes = /obj/item/clothing/shoes/black
	l_ear = /obj/item/device/radio/headset/headset_service
	backpack_contents = list(
		/obj/item/clothing/shoes/black = 1,
		/obj/item/weapon/storage/box/lip_stick = 1,
		/obj/item/weapon/storage/box/barber = 1
	)


/////////////////
///A.R.F. Jobs///
/////////////////

//Bridge Officers are basically bridge bunnies who spend their time on the bridge watching consoles.  This job used to be for heads of staff to have easy lewd targets, but seeing as
//how we no longer let heads lewd, they're really just more of a warm body watching cameras.  Not that that is bad thing, per say.  Whenever we roll back the rule for heads lewding
//they can go back to being lewd bunnies. ~TK

//I can't quite figure out how to make them work so that you can select a priority level for them at round start, I'm going to go ahead and push them though, as they do work.
//You just gotta sign on as one after the round starts, which to be honest isn't a SUPER big deal. ~TK

/datum/job/bridgeofficer
	title = "Bridge Officer"
	flag = BRIDGE_OFFICER
	department_head = list("Captain")
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	alt_titles = list("Console Monitor","Bridge Bunny", "Bridge Liason", "Bridge Secretary", "Communications Officer")
	supervisors = "the Command Staff.  You are also <b>NOT A MEMBER OF COMMAND STAFF, YOU ARE NOT IN THE CHAIN OF COMMAND.</b>  You are not a beat cop, you aren't here to arrest people.  <b>You are a glorified console watcher</b>, and probably cocksleeve."
	selection_color = "#DAA520"

	outfit = /datum/outfit/job/bridgeofficer

	access = list(access_heads)
	minimal_access = list(access_heads, access_medical)

/datum/outfit/job/bridgeofficer
	name = "Bridge Officer"
	jobtype = /datum/job/bridgeofficer

	head = /obj/item/clothing/head/beret
	l_ear = /obj/item/device/radio/headset/heads/captain
	uniform = /obj/item/clothing/under/color/lightbrown
	shoes = /obj/item/clothing/shoes/jackboots
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses
	backpack_contents = list(/obj/item/clothing/head/collectable/rabbitears)
	backpack = /obj/item/weapon/storage/backpack/security
	satchel = /obj/item/weapon/storage/backpack/satchel_sec
	l_hand = /obj/item/weapon/clipboard