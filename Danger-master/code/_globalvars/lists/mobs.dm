//Languages/species/whitelist. //Languages and species fit with mobs right
var/global/list/all_species[0]
var/global/list/all_languages[0]
var/global/list/language_keys[0]					// Table of say codes for all languages
var/global/list/all_superheroes[0]
var/global/list/all_nations[0]
var/global/list/whitelisted_species = list()
var/global/list/free_species = list()
var/global/list/playable_species = list() //Lists above, combined.

var/list/clients = list()							//list of all clients
var/list/admins = list()							//list of all clients whom are admins
var/list/deadmins = list()							//list of all clients who have used the de-admin verb.
var/list/directory = list()							//list of all ckeys with associated client
var/list/stealthminID = list()						//reference list with IDs that store ckeys, for stealthmins

//Since it didn't really belong in any other category, I'm putting this here
//This is for procs to replace all the goddamn 'in world's that are chilling around the code

var/global/list/player_list = list()				//List of all mobs **with clients attached**. Excludes /mob/new_player
var/global/list/mob_list = list()					//List of all mobs, including clientless
var/global/list/silicon_mob_list = list()			//List of all silicon mobs, including clientless
var/global/list/spirits = list()					//List of all the spirits, including Masks
var/global/list/living_mob_list = list()			//List of all alive mobs, including clientless. Excludes /mob/new_player
var/global/list/dead_mob_list = list()				//List of all dead mobs, including clientless. Excludes /mob/new_player
var/global/list/respawnable_list = list()			//List of all mobs, dead or in mindless creatures that still be respawned.
var/global/list/non_respawnable_keys = list()	//List of ckeys that are excluded from respawning for remainder of round.
var/global/list/simple_animal_list = list()			//List of all simple animals, including clientless
var/global/list/snpc_list = list()      			//List of all snpc's, including clientless

var/global/list/med_hud_users = list()
var/global/list/sec_hud_users = list()
var/global/list/antag_hud_users = list()
var/global/list/surgeries_list = list()
var/global/list/hear_radio_list = list()			//Mobs that hear the radio even if there's no client



//These aren't used anywhere currently so I'm going to comment them out for now. You can just use all_species for 99% of things anyway.
/*
#define ALL_SPECIES_BY_NAME all_species_by_name
var/global/list/all_species_by_name = list(
	"Human",
	"Tajaran",
	"Skrell",
	"Unathi",
	"Diona",
	"Vulpkanin",
	"Alien",
	"Anubis",
	"Apex",
	"Avali",
	"Bat",
	"Bear",
	"Beaver",
	"Bee",
	"Beholder",
	"Butterfly",
	"Carno",
	"Ceratosaur",
	"Chicken",
	"Corgi",
	"Cow",
	"Coyote",
	"Croc",
	"Crow",
	"Cutebold",
	"Dalmation",
	"Deer",
	"Drake",
	"Elephant",
	"Elf",
	"Fennec",
	"Fox",
	"Fung",
	"Glaceon",
	"Glowfen",
	"Goat",
	"Gremlin",
	"Gria",
	"Guilmon",
	"Hawk",
	"Hippo",
	"Husky",
	"Hyena",
	"Hylotl",
	"Jackalope",
	"Jelly",
	"Kangaroo",
	"Kitsune",
	"Lab",
	"Lugia",
	"Lynx",
	"Mouse",
	"Orc",
	"Orca",
	"Otie",
	"Otter",
	"Panda",
	"Panther",
	"Penguin",
	"Pig",
	"Pony",
	"Porcupine",
	"Possum",
	"Pudding",
	"Pug",
	"Rabbit",
	"Raccoon",
	"Red Panda",
	"Renamon",
	"Roorat",
	"Sergal",
	"Shark",
	"Shepherd",
	"Shih Tzu",
	"Siamese",
	"Skunk",
	"Smilodon",
	"Snail",
	"Snarby",
	"Squirrel",
	"Stego",
	"Stitch",
	"Subterranean Slime",
	"Turtle",
	"Vulpix",
	"Vulture",
	"Wolf",
	"Zebra",
	"Zigzagoon")
*/
