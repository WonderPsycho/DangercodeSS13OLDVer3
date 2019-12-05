// Uniform slot
/datum/gear/uniform
	subtype_path = /datum/gear/uniform
	slot = slot_w_uniform
	cost = 2
	sort_category = "Uniforms and Casual Dress"

/datum/gear/uniform/skirt
	subtype_path = /datum/gear/uniform/skirt

/datum/gear/uniform/skirt/blue
	display_name = "plaid skirt, blue"
	path = /obj/item/clothing/under/dress/plaid_blue

/datum/gear/uniform/skirt/purple
	display_name = "plaid skirt, purple"
	path = /obj/item/clothing/under/dress/plaid_purple

/datum/gear/uniform/skirt/red
	display_name = "plaid skirt, red"
	path = /obj/item/clothing/under/dress/plaid_red

/datum/gear/uniform/skirt/black
	display_name = "skirt, black"
	path = /obj/item/clothing/under/blackskirt

/datum/gear/uniform/skirt/whiteskirt
	display_name = "skirt, white"
	path = /obj/item/clothing/under/whiteskirt

/datum/gear/uniform/under/nuditypermit
	display_name = "nudity permit"
	path =/obj/item/clothing/under/nuditypermit

/datum/gear/uniform/skirt/job
	subtype_path = /datum/gear/uniform/skirt/job
	subtype_cost_overlap = FALSE

/datum/gear/uniform/skirt/job/ce
	display_name = "skirt, ce"
	path = /obj/item/clothing/under/rank/chief_engineer/skirt
	allowed_roles = list("Chief Engineer")

/datum/gear/uniform/skirt/job/atmos
	display_name = "skirt, atmos"
	path = /obj/item/clothing/under/rank/atmospheric_technician/skirt
	allowed_roles = list("Chief Engineer","Life Support Specialist")

/datum/gear/uniform/skirt/job/eng
	display_name = "skirt, engineer"
	path = /obj/item/clothing/under/rank/engineer/skirt
	allowed_roles = list("Chief Engineer","Station Engineer")

/datum/gear/uniform/skirt/job/roboticist
	display_name = "skirt, roboticist"
	path = /obj/item/clothing/under/rank/roboticist/skirt
	allowed_roles = list("Research Director","Roboticist")

/datum/gear/uniform/skirt/job/cmo
	display_name = "skirt, cmo"
	path = /obj/item/clothing/under/rank/chief_medical_officer/skirt
	allowed_roles = list("Chief Medical Officer")

/datum/gear/uniform/skirt/job/chem
	display_name = "skirt, chemist"
	path = /obj/item/clothing/under/rank/chemist/skirt
	allowed_roles = list("Chief Medical Officer","Chemist")

/datum/gear/uniform/skirt/job/viro
	display_name = "skirt, virologist"
	path = /obj/item/clothing/under/rank/virologist/skirt
	allowed_roles = list("Virologist")

/datum/gear/uniform/skirt/job/med
	display_name = "skirt, medical"
	path = /obj/item/clothing/under/rank/medical/skirt
	allowed_roles = list("Chief Medical Officer","Medical Doctor","Psychiatrist","Paramedic","Coroner")

/datum/gear/uniform/skirt/job/phys
	display_name = "skirt, physician"
	path = /obj/item/clothing/under/rank/security/brigphys/skirt
	allowed_roles = list("Brig Physician")

/datum/gear/uniform/skirt/job/sci
	display_name = "skirt, scientist"
	path = /obj/item/clothing/under/rank/scientist/skirt
	allowed_roles = list("Research Director","Scientist")

/datum/gear/uniform/skirt/job/cargo
	display_name = "skirt, cargo"
	path = /obj/item/clothing/under/rank/cargotech/skirt
	allowed_roles = list("Quartermaster","Cargo Technician")

/datum/gear/uniform/skirt/job/qm
	display_name = "skirt, QM"
	path = /obj/item/clothing/under/rank/cargo/skirt
	allowed_roles = list("Quartermaster")

/datum/gear/uniform/skirt/job/warden
	display_name = "skirt, warden"
	path = /obj/item/clothing/under/rank/warden/skirt
	allowed_roles = list("Head of Security", "Warden")

/datum/gear/uniform/skirt/job/security
	display_name = "skirt, security"
	path = /obj/item/clothing/under/rank/security/skirt
	allowed_roles = list("Head of Security", "Warden", "Detective", "Security Officer")

/datum/gear/uniform/skirt/job/security/alt
	display_name = "skirt, alt, security"
	path = /obj/item/clothing/under/rank/security/skirt/alt
	allowed_roles = list("Head of Security", "Warden", "Detective", "Security Officer")

/datum/gear/uniform/skirt/job/head_of_security
	display_name = "skirt, hos"
	path = /obj/item/clothing/under/rank/head_of_security/skirt
	allowed_roles = list("Head of Security")

/datum/gear/uniform/skirt/job/ntrep
	display_name = "skirt, nt rep"
	path = /obj/item/clothing/under/rank/ntrep/skirt
	allowed_roles = list("Nanotrasen Representative")

/datum/gear/uniform/skirt/job/blueshield
	display_name = "skirt, blueshield"
	path = /obj/item/clothing/under/rank/blueshield/skirt
	allowed_roles = list("Blueshield")


/datum/gear/uniform/medical
	subtype_path = /datum/gear/uniform/medical

/datum/gear/uniform/medical/pscrubs
	display_name = "medical scrubs, purple"
	path = /obj/item/clothing/under/rank/medical/purple
	allowed_roles = list("Chief Medical Officer", "Medical Doctor")

/datum/gear/uniform/medical/gscrubs
	display_name = "medical scrubs, green"
	path = /obj/item/clothing/under/rank/medical/green
	allowed_roles = list("Chief Medical Officer", "Medical Doctor")

/datum/gear/uniform/sec
	subtype_path = /datum/gear/uniform/sec

/datum/gear/uniform/sec/formal
	display_name = "security uniform, formal"
	path = /obj/item/clothing/under/rank/security/formal
	allowed_roles = list("Head of Security", "Warden", "Detective", "Security Officer", "Security Pod Pilot")

/datum/gear/uniform/sec/secorporate
	display_name = "security uniform, corporate"
	path = /obj/item/clothing/under/rank/security/corp
	allowed_roles = list("Head of Security", "Warden", "Security Officer", "Security Pod Pilot")

/datum/gear/uniform/sec/dispatch
	display_name = "security uniform, dispatch"
	path = /obj/item/clothing/under/rank/dispatch
	allowed_roles = list("Head of Security", "Warden", "Security Officer", "Security Pod Pilot")

/datum/gear/uniform/sec/casual
	display_name = "security uniform, casual"
	path = /obj/item/clothing/under/rank/security2
	allowed_roles = list("Head of Security", "Warden", "Security Officer", "Detective", "Security Pod Pilot")

/datum/gear/uniform/shorts
	subtype_path = /datum/gear/uniform/shorts

/datum/gear/uniform/shorts/red
	display_name = "shorts, red"
	path = /obj/item/clothing/under/shorts/red

/datum/gear/uniform/shorts/green
	display_name = "shorts, green"
	path = /obj/item/clothing/under/shorts/green

/datum/gear/uniform/shorts/blue
	display_name = "shorts, blue"
	path = /obj/item/clothing/under/shorts/blue

/datum/gear/uniform/shorts/black
	display_name = "shorts, black"
	path = /obj/item/clothing/under/shorts/black

/datum/gear/uniform/shorts/grey
	display_name = "shorts, grey"
	path = /obj/item/clothing/under/shorts/grey

/datum/gear/uniform/pants
	subtype_path = /datum/gear/uniform/pants

/datum/gear/uniform/pants/jeans
	display_name = "jeans, classic"
	path = /obj/item/clothing/under/pants/classicjeans

/datum/gear/uniform/pants/bsjeans
	display_name = "jeans, bluespace"
	path = /obj/item/clothing/under/pants/bluespacejeans

/datum/gear/uniform/pants/mjeans
	display_name = "jeans, mustang"
	path = /obj/item/clothing/under/pants/mustangjeans

/datum/gear/uniform/pants/bljeans
	display_name = "jeans, black"
	path = /obj/item/clothing/under/pants/blackjeans

/datum/gear/uniform/pants/yfjeans
	display_name = "jeans, Young Folks"
	path = /obj/item/clothing/under/pants/youngfolksjeans

/datum/gear/uniform/pants/whitepants
	display_name = "pants, white"
	path = /obj/item/clothing/under/pants/white

/datum/gear/uniform/pants/redpants
	display_name = "pants, red"
	path = /obj/item/clothing/under/pants/red

/datum/gear/uniform/pants/blackpants
	display_name = "pants, black"
	path = /obj/item/clothing/under/pants/black

/datum/gear/uniform/pants/tanpants
	display_name = "pants, tan"
	path = /obj/item/clothing/under/pants/tan

/datum/gear/uniform/pants/bluepants
	display_name = "pants, blue"
	path = /obj/item/clothing/under/pants/blue

/datum/gear/uniform/pants/trackpants
	display_name = "trackpants"
	path = /obj/item/clothing/under/pants/track

/datum/gear/uniform/pants/khakipants
	display_name = "pants, khaki"
	path = /obj/item/clothing/under/pants/khaki

/datum/gear/uniform/pants/caopants
	display_name = "pants, camo"
	path = /obj/item/clothing/under/pants/camo

//Added by ThingPony

/datum/gear/uniform/color
	subtype_path = /datum/gear/uniform/color

/datum/gear/uniform/color/black
	display_name = "black jumpsuit"
	path = /obj/item/clothing/under/color/black

/datum/gear/uniform/color/blackf
	display_name = "feminine black jumpsuit"
	path = /obj/item/clothing/under/color/blackf

/datum/gear/uniform/color/blue
	display_name = "blue jumpsuit"
	path = /obj/item/clothing/under/color/blue

/datum/gear/uniform/color/green
	display_name = "green jumpsuit"
	path = /obj/item/clothing/under/color/green

/datum/gear/uniform/color/grey
	display_name = "grey jumpsuit"
	path = /obj/item/clothing/under/color/grey

/datum/gear/uniform/color/orange
	display_name = "orange jumpsuit"
	path = /obj/item/clothing/under/color/orange

/datum/gear/uniform/color/pink
	display_name = "pink jumpsuit"
	path = /obj/item/clothing/under/color/pink

/datum/gear/uniform/color/red
	display_name = "red jumpsuit"
	path = /obj/item/clothing/under/color/red

/datum/gear/uniform/color/white
	display_name = "white jumpsuit"
	path = /obj/item/clothing/under/color/white

/datum/gear/uniform/color/yellow
	display_name = "yellow jumpsuit"
	path = /obj/item/clothing/under/color/yellow

/datum/gear/uniform/color/lightblue
	display_name = "lightblue jumpsuit"
	path = /obj/item/clothing/under/color/lightblue

/datum/gear/uniform/color/aqua
	display_name = "aqua jumpsuit"
	path = /obj/item/clothing/under/color/aqua

/datum/gear/uniform/color/purple
	display_name = "purple jumpsuit"
	path = /obj/item/clothing/under/color/purple

/datum/gear/uniform/color/lightpurple
	display_name = "lightpurple jumpsuit"
	path = /obj/item/clothing/under/color/lightpurple

/datum/gear/uniform/color/lightgreen
	display_name = "lightgreen jumpsuit"
	path = /obj/item/clothing/under/color/lightgreen

/datum/gear/uniform/color/lightbrown
	display_name = "lightbrown jumpsuit"
	path = /obj/item/clothing/under/color/lightbrown

/datum/gear/uniform/color/brown
	display_name = "brown jumpsuit"
	path = /obj/item/clothing/under/color/brown

/datum/gear/uniform/color/yellowgreen
	display_name = "yellowgreen jumpsuit"
	path = /obj/item/clothing/under/color/yellowgreen

/datum/gear/uniform/color/darkblue
	display_name = "darkblue jumpsuit"
	path = /obj/item/clothing/under/color/darkblue

/datum/gear/uniform/color/lightred
	display_name = "lightred jumpsuit"
	path = /obj/item/clothing/under/color/lightred

/datum/gear/uniform/color/darkred
	display_name = "darkred jumpsuit"
	path = /obj/item/clothing/under/color/darkred

/datum/gear/uniform/color/red/jersey
	display_name = "red team jersey"
	path =/obj/item/clothing/under/color/red/jersey

/datum/gear/uniform/color/blue/jersey
	display_name = "blue team jersey"
	path =/obj/item/clothing/under/color/blue/jersey

/datum/gear/uniform/sleepwear
	subtype_path = /datum/gear/uniform/sleepwear

/datum/gear/uniform/sleepwear/bluepj
	display_name = "blue pj's"
	path =/obj/item/clothing/under/pj/blue

/datum/gear/uniform/sleepwear/redpj
	display_name = "Red pj's"
	path =/obj/item/clothing/under/pj/red

/datum/gear/uniform/suit
	subtype_path = /datum/gear/uniform/suit

/datum/gear/uniform/suit/black
	display_name = "black suit"
	path =/obj/item/clothing/under/suit_jacket

/datum/gear/uniform/suit/reallyblack
	display_name = "executive suit"
	path =/obj/item/clothing/under/suit_jacket/really_black

/datum/gear/uniform/suit/female
	display_name = "feminine executive suit"
	path =/obj/item/clothing/under/suit_jacket/female

/datum/gear/uniform/suit/red
	display_name = "red suit"
	path =/obj/item/clothing/under/suit_jacket/red

/datum/gear/uniform/suit/navy
	display_name = "navy suit"
	path =/obj/item/clothing/under/suit_jacket/navy

/datum/gear/uniform/suit/tan
	display_name = "tan suit"
	path =/obj/item/clothing/under/suit_jacket/tan

/datum/gear/uniform/suit/burgundy
	display_name = "burgundy suit"
	path =/obj/item/clothing/under/suit_jacket/burgundy

/datum/gear/uniform/suit/charcoal
	display_name = "charcoal suit"
	path =/obj/item/clothing/under/suit_jacket/charcoal

/datum/gear/uniform/suit/charcoal
	display_name = "charcoal suit"
	path =/obj/item/clothing/under/suit_jacket/charcoal

/datum/gear/uniform/under
	subtype_path = /datum/gear/uniform/under

/datum/gear/uniform/under/schoolgirl
	display_name = "schoolgirl uniform"
	path =/obj/item/clothing/under/schoolgirl

/datum/gear/uniform/under/overalls
	display_name = "laborer's overalls"
	path =/obj/item/clothing/under/overalls

/datum/gear/uniform/under/kilt
	display_name = "kilt"
	path =/obj/item/clothing/under/kilt

/datum/gear/uniform/under/dressfire
	display_name = "flame dress"
	path =/obj/item/clothing/under/dress/dress_fire

/datum/gear/uniform/under/dressgreen
	display_name = "green dress"
	path =/obj/item/clothing/under/dress/dress_green

/datum/gear/uniform/under/dressorange
	display_name = "orange dress"
	path =/obj/item/clothing/under/dress/dress_orange

/datum/gear/uniform/under/dresspink
	display_name = "pink dress"
	path =/obj/item/clothing/under/dress/dress_pink

/datum/gear/uniform/under/dressyellow
	display_name = "yellow dress"
	path =/obj/item/clothing/under/dress/dress_yellow

/datum/gear/uniform/under/dresssaloon
	display_name = "saloon dress"
	path =/obj/item/clothing/under/dress/dress_saloon

/datum/gear/uniform/under/plaidblue
	display_name = "blue plaid skirt"
	path =/obj/item/clothing/under/dress/plaid_blue

/datum/gear/uniform/under/plaidred
	display_name = "red plaid skirt"
	path =/obj/item/clothing/under/dress/plaid_red

/datum/gear/uniform/under/plaidpurple
	display_name = "purple plaid skirt"
	path =/obj/item/clothing/under/dress/plaid_purple

/datum/gear/uniform/under/brideorange
	display_name = "orange wedding dress"
	path =/obj/item/clothing/under/wedding/bride_orange

/datum/gear/uniform/under/bridepurple
	display_name = "purple wedding dress"
	path =/obj/item/clothing/under/wedding/bride_purple

/datum/gear/uniform/under/brideblue
	display_name = "blue wedding dress"
	path =/obj/item/clothing/under/wedding/bride_blue

/datum/gear/uniform/under/bridered
	display_name = "red wedding dress"
	path =/obj/item/clothing/under/wedding/bride_red

/datum/gear/uniform/under/bridewhite
	display_name = "white wedding dress"
	path =/obj/item/clothing/under/wedding/bride_white

/datum/gear/uniform/under/sundress
	display_name = "sundress"
	path =/obj/item/clothing/under/sundress

/datum/gear/uniform/under/purpleskirt
	display_name = "purple skirt"
	path =/obj/item/clothing/under/purpleskirt

/datum/gear/uniform/under/croptop
	display_name = "crop top"
	path =/obj/item/clothing/under/croptop

/datum/gear/uniform/under/sakurakimono
	display_name = "pink sakura kimono"
	path =/obj/item/clothing/under/sakurakimono

/datum/gear/uniform/under/jesteralt
	display_name = "jester outfit"
	path =/obj/item/clothing/under/jesteralternative

/datum/gear/uniform/under/roll
	display_name = "roll costume"
	path =/obj/item/clothing/under/roll

/datum/gear/uniform/under/towel
	display_name = "towel"
	path =/obj/item/clothing/under/towel

/datum/gear/uniform/under/miku
	display_name = "miku"
	path =/obj/item/clothing/under/miku

/datum/gear/uniform/under/princess
	display_name = "princess dress"
	path =/obj/item/clothing/under/princess

/datum/gear/uniform/under/anthy
	display_name = "swiss dress"
	path =/obj/item/clothing/under/anthy

/datum/gear/uniform/under/pinkdress
	display_name = "pink princess dress"
	path =/obj/item/clothing/under/pinkdress

/datum/gear/uniform/under/blueskirt
	display_name = "blue skirt"
	path =/obj/item/clothing/under/blueskirt

/datum/gear/uniform/under/blueskirt/redskirt
	display_name = "red skirt"
	path =/obj/item/clothing/under/blueskirt/redskirt

/datum/gear/uniform/under/schoolgirl/red
	display_name = "red schoolgirl uniform"
	path =/obj/item/clothing/under/schoolgirl/red

/datum/gear/uniform/under/schoolgirl/green
	display_name = "green schoolgirl uniform"
	path =/obj/item/clothing/under/schoolgirl/green

/datum/gear/uniform/under/schoolgirl/orange
	display_name = "orange schoolgirl uniform"
	path =/obj/item/clothing/under/schoolgirl/orange

/datum/gear/uniform/under/solaradress
	display_name = "solara dress"
	path =/obj/item/clothing/under/solaradress

/datum/gear/uniform/under/darkreddress
	display_name = "dark red dress"
	path =/obj/item/clothing/under/darkreddress

/datum/gear/uniform/under/whitesundress
	display_name = "white sundress"
	path =/obj/item/clothing/under/whitesundress

/datum/gear/uniform/under/geisha
	display_name = "geisha"
	path =/obj/item/clothing/under/geisha

/datum/gear/uniform/under/keyholesweater
	display_name = "keyhole sweater"
	path =/obj/item/clothing/under/keyholesweater

/datum/gear/uniform/under/maiyang
	display_name = "mai yang dress"
	path =/obj/item/clothing/under/maiyang

/datum/gear/uniform/under/schoolgirl/purple
	display_name = "purple schoolgirl uniform"
	path =/obj/item/clothing/under/schoolgirlpurple

/datum/gear/uniform/under/schoolgirl/yellow
	display_name = "yellow schoolgirl uniform"
	path =/obj/item/clothing/under/schoolgirlyellow

/datum/gear/uniform/under/cheongsamblue
	display_name = "blue cheongsam"
	path =/obj/item/clothing/under/cheongsamblue

/datum/gear/uniform/under/cheongsamred
	display_name = "red cheongsam"
	path =/obj/item/clothing/under/cheongsamred

/datum/gear/uniform/under/whitedress1
	display_name = "poofy white dress"
	path =/obj/item/clothing/under/whitedress1

/datum/gear/uniform/under/schoolgirl/black
	display_name = "black schoolgirl uniform"
	path =/obj/item/clothing/under/schoolgirlblack

/datum/gear/uniform/under/cuttopred
	display_name = "red cut top"
	path =/obj/item/clothing/under/cuttop_red

//added in by Luke Vale

/datum/gear/uniform/under/purp_skirt
	display_name = "purple sweater skirt"
	path =/obj/item/clothing/under/purp_skirt

/datum/gear/uniform/virgin_s
	display_name = "vs sweater, light blue"
	path =/obj/item/clothing/under/v_sweater_lblue

/datum/gear/uniform/amishsuit
	display_name = "amish suit"
	path = /obj/item/clothing/under/sl_suit

/datum/gear/uniform/sinsuit
	display_name = "S.I.N. Suit"
	path = /obj/item/clothing/under/sinsuit

/datum/gear/uniform/emfsuit
	display_name = "E.M.F. Suit"
	path = /obj/item/clothing/under/emfsuit

/datum/gear/uniform/tron/female
	display_name = "female tron uniform"
	path = /obj/item/clothing/under/tron/female

/datum/gear/uniform/tron/male
	display_name = "male tron uniform"
	path = /obj/item/clothing/under/tron/male

/datum/gear/uniform/crystal
	display_name = "bikni loincloth"
	path = /obj/item/clothing/under/crystal