/obj/structure/flora
	burn_state = FLAMMABLE
	burntime = 30

//trees
/obj/structure/flora/tree
	name = "tree"
	anchored = 1
	density = 1
	pixel_x = -16
	layer = 9

/obj/structure/flora/tree/pine
	name = "pine tree"
	icon = 'icons/obj/flora/pinetrees.dmi'
	icon_state = "pine_1"

/obj/structure/flora/tree/pine/New()
	..()
	icon_state = "pine_[rand(1, 3)]"

/obj/structure/flora/tree/pine/xmas
	name = "xmas tree"
	icon = 'icons/obj/flora/pinetrees.dmi'
	icon_state = "pine_c"

/obj/structure/flora/tree/pine/xmas/New()
	..()
	icon_state = "pine_c"

/obj/structure/flora/tree/dead
	icon = 'icons/obj/flora/deadtrees.dmi'
	icon_state = "tree_1"

/obj/structure/flora/tree/dead/New()
	..()
	icon_state = "tree_[rand(1, 6)]"

/obj/structure/flora/tree/palm
	icon = 'icons/misc/beach2.dmi'
	icon_state = "palm1"

/obj/structure/flora/tree/palm/New()
	..()
	icon_state = pick("palm1","palm2")
	pixel_x = 0

//grass
/obj/structure/flora/grass
	name = "grass"
	icon = 'icons/obj/flora/snowflora.dmi'
	anchored = 1

/obj/structure/flora/grass/brown
	icon_state = "snowgrass1bb"

/obj/structure/flora/grass/brown/New()
	..()
	icon_state = "snowgrass[rand(1, 3)]bb"


/obj/structure/flora/grass/green
	icon_state = "snowgrass1gb"

/obj/structure/flora/grass/green/New()
	..()
	icon_state = "snowgrass[rand(1, 3)]gb"

/obj/structure/flora/grass/both
	icon_state = "snowgrassall1"

/obj/structure/flora/grass/both/New()
	..()
	icon_state = "snowgrassall[rand(1, 3)]"


//bushes
/obj/structure/flora/bush
	name = "bush"
	icon = 'icons/obj/flora/snowflora.dmi'
	icon_state = "snowbush1"
	anchored = 1

/obj/structure/flora/bush/New()
	..()
	icon_state = "snowbush[rand(1, 6)]"

//newbushes

/obj/structure/flora/ausbushes
	name = "bush"
	icon = 'icons/obj/flora/ausflora.dmi'
	icon_state = "firstbush_1"
	anchored = 1

/obj/structure/flora/ausbushes/New()
	..()
	icon_state = "firstbush_[rand(1, 4)]"

/obj/structure/flora/ausbushes/reedbush
	icon_state = "reedbush_1"

/obj/structure/flora/ausbushes/reedbush/New()
	..()
	icon_state = "reedbush_[rand(1, 4)]"

/obj/structure/flora/ausbushes/leafybush
	icon_state = "leafybush_1"

/obj/structure/flora/ausbushes/leafybush/New()
	..()
	icon_state = "leafybush_[rand(1, 3)]"

/obj/structure/flora/ausbushes/palebush
	icon_state = "palebush_1"

/obj/structure/flora/ausbushes/palebush/New()
	..()
	icon_state = "palebush_[rand(1, 4)]"

/obj/structure/flora/ausbushes/stalkybush
	icon_state = "stalkybush_1"

/obj/structure/flora/ausbushes/stalkybush/New()
	..()
	icon_state = "stalkybush_[rand(1, 3)]"

/obj/structure/flora/ausbushes/grassybush
	icon_state = "grassybush_1"

/obj/structure/flora/ausbushes/grassybush/New()
	..()
	icon_state = "grassybush_[rand(1, 4)]"

/obj/structure/flora/ausbushes/fernybush
	icon_state = "fernybush_1"

/obj/structure/flora/ausbushes/fernybush/New()
	..()
	icon_state = "fernybush_[rand(1, 3)]"

/obj/structure/flora/ausbushes/sunnybush
	icon_state = "sunnybush_1"

/obj/structure/flora/ausbushes/sunnybush/New()
	..()
	icon_state = "sunnybush_[rand(1, 3)]"

/obj/structure/flora/ausbushes/genericbush
	icon_state = "genericbush_1"

/obj/structure/flora/ausbushes/genericbush/New()
	..()
	icon_state = "genericbush_[rand(1, 4)]"

/obj/structure/flora/ausbushes/pointybush
	icon_state = "pointybush_1"

/obj/structure/flora/ausbushes/pointybush/New()
	..()
	icon_state = "pointybush_[rand(1, 4)]"

/obj/structure/flora/ausbushes/lavendergrass
	icon_state = "lavendergrass_1"

/obj/structure/flora/ausbushes/lavendergrass/New()
	..()
	icon_state = "lavendergrass_[rand(1, 4)]"

/obj/structure/flora/ausbushes/ywflowers
	icon_state = "ywflowers_1"

/obj/structure/flora/ausbushes/ywflowers/New()
	..()
	icon_state = "ywflowers_[rand(1, 3)]"

/obj/structure/flora/ausbushes/brflowers
	icon_state = "brflowers_1"

/obj/structure/flora/ausbushes/brflowers/New()
	..()
	icon_state = "brflowers_[rand(1, 3)]"

/obj/structure/flora/ausbushes/ppflowers
	icon_state = "ppflowers_1"

/obj/structure/flora/ausbushes/ppflowers/New()
	..()
	icon_state = "ppflowers_[rand(1, 4)]"

/obj/structure/flora/ausbushes/sparsegrass
	icon_state = "sparsegrass_1"

/obj/structure/flora/ausbushes/sparsegrass/New()
	..()
	icon_state = "sparsegrass_[rand(1, 3)]"

/obj/structure/flora/ausbushes/fullgrass
	icon_state = "fullgrass_1"

/obj/structure/flora/ausbushes/fullgrass/New()
	..()
	icon_state = "fullgrass_[rand(1, 3)]"


/obj/item/weapon/twohanded/required/kirbyplants
	name = "potted plant"
	icon = 'icons/obj/flora/plants.dmi'
	icon_state = "plant-1"
	anchored = 0
	layer = 5
	w_class = WEIGHT_CLASS_HUGE
	force = 10
	throwforce = 13
	throw_speed = 2
	throw_range = 4

/obj/item/weapon/twohanded/required/kirbyplants/New()
	..()
	icon_state = "plant-[rand(1,35)]"
	if(prob(1))
		icon_state = "plant-36"

/obj/item/weapon/twohanded/required/kirbyplants/equipped(mob/living/user)
	var/image/I = image(icon = 'icons/obj/flora/plants.dmi' , icon_state = src.icon_state, loc = user)
	I.override = 1
	user.add_alt_appearance("sneaking_mission", I, player_list)

/obj/item/weapon/twohanded/required/kirbyplants/dropped(mob/living/user)
	..()
	user.remove_alt_appearance("sneaking_mission")

/obj/item/weapon/twohanded/required/kirbyplants/dead
	name = "\improper RD's potted plant"
	desc = "A gift from the botanical staff, presented after the RD's reassignment. There's a tag on it that says \"Y'all come back now, y'hear?\"\nIt doesn't look very healthy..."
	icon_state = "plant-dead"

//a rock is flora according to where the icon file is
//and now these defines
/obj/structure/flora/rock
	name = "rock"
	desc = "a rock"
	icon_state = "rock1"
	icon = 'icons/obj/flora/rocks.dmi'
	burn_state = FIRE_PROOF
	anchored = 1

/obj/structure/flora/rock/New()
	..()
	icon_state = "rock[rand(1,5)]"

/obj/structure/flora/rock/pile
	name = "rocks"
	desc = "some rocks"
	icon_state = "rockpile1"

/obj/structure/flora/rock/pile/New()
	..()
	icon_state = "rockpile[rand(1,5)]"

/obj/structure/flora/corn_stalk
	name = "corn stalk"
	icon = 'icons/obj/flora/plants.dmi'
	icon_state = "cornstalk1"
	anchored = 0
	layer = 5

/obj/structure/flora/corn_stalk/alt_1
	icon_state = "cornstalk2"

/obj/structure/flora/corn_stalk/alt_2
	icon_state = "cornstalk3"

/obj/structure/flora/straw_bail
	name = "straw bail"
	icon = 'icons/obj/flora/plants.dmi'
	icon_state = "strawbail1"
	density = 1
	climbable = 1 // you can climb all over them.

/obj/structure/flora/straw_bail/alt_1
	icon_state = "strawbail2"

/obj/structure/flora/straw_bail/alt_2
	icon_state = "strawbail3"

/obj/structure/bush
	name = "foliage"
	desc = "Pretty thick scrub, it'll take something sharp and a lot of determination to clear away."
	icon = 'icons/obj/flora/plants.dmi'
	icon_state = "bush1"
	density = 1
	anchored = 1
	layer = 3.2
	var/indestructable = 0
	var/stump = 0

/obj/structure/bush/New()
	if(prob(20))
		opacity = 1

/*
/obj/structure/bush/Bumped(M as mob)
	if(istype(M, /mob/living/simple_animal))
		var/mob/living/simple_animal/A = M
		A.loc = get_turf(src)
	else if(istype(M, /mob/living/carbon/monkey))
		var/mob/living/carbon/monkey/A = M
		A.loc = get_turf(src)
*/

/obj/structure/bush/attackby(var/obj/I as obj, var/mob/user as mob, params)
	//hatchets can clear away undergrowth
	if(istype(I, /obj/item/weapon/hatchet) && !stump)
		if(indestructable)
			//this bush marks the edge of the map, you can't destroy it
			to_chat(user, "<span class='warning'>You flail away at the undergrowth, but it's too thick here.</span>")
		else
			user.visible_message("<span class='danger'>[user] begins clearing away [src].</b>","<span class='warning'><b>You begin clearing away [src].</span></span>")
			spawn(rand(15,30))
				if(get_dist(user,src) < 2)
					to_chat(user, "<span class='notice'>You clear away [src].</span>")
					var/obj/item/stack/sheet/wood/W = new(src.loc)
					W.amount = rand(3,15)
					if(prob(50))
						icon_state = "stump[rand(1,2)]"
						name = "cleared foliage"
						desc = "There used to be dense undergrowth here."
						density = 0
						stump = 1
						pixel_x = rand(-6,6)
						pixel_y = rand(-6,6)
					else
						qdel(src)
	else
		return ..()

/obj/item/weapon/twohanded/required/kirbyplants/xmas
	name = "Christmas Tree"
	icon = 'icons/obj/flora/plants.dmi'
	icon_state = "plant-xmas"
	anchored = 0
	layer = 5
	w_class = WEIGHT_CLASS_HUGE
	force = 10
	throwforce = 13
	throw_speed = 2
	throw_range = 4

/obj/structure/flora/largetree/jungletree/one
	name = "jungle tree"
	icon = 'icons/obj/flora/jungletrees.dmi'
	icon_state = "tree1"

/obj/structure/flora/largetree/jungletree/two
	name = "jungle tree"
	icon = 'icons/obj/flora/jungletrees.dmi'
	icon_state = "tree2"

/obj/structure/flora/largetree/jungletree/three
	name = "jungle tree"
	icon = 'icons/obj/flora/jungletrees.dmi'
	icon_state = "tree3"

/obj/structure/flora/largetree/jungletree/four
	name = "jungle tree"
	icon = 'icons/obj/flora/jungletrees.dmi'
	icon_state = "tree4"

/obj/structure/flora/largetree/jungletree/five
	name = "jungle tree"
	icon = 'icons/obj/flora/jungletrees.dmi'
	icon_state = "tree5"

/obj/structure/flora/largetree/jungletree/six
	name = "jungle tree"
	icon = 'icons/obj/flora/jungletrees.dmi'
	icon_state = "tree6"

/obj/structure/flora/largetree/jungletree
	name = "jungle tree"
	icon = 'icons/obj/flora/jungletrees.dmi'
	icon_state = "tree"

/obj/structure/flora/largebush/jungle/one
	name = "jungle bush"
	icon = 'icons/obj/flora/largejungleflora.dmi'
	icon_state = "bush1"

/obj/structure/flora/largebush/jungle/two
	name = "jungle bush"
	icon = 'icons/obj/flora/largejungleflora.dmi'
	icon_state = "bush2"

/obj/structure/flora/largebush/jungle/three
	name = "jungle bush"
	icon = 'icons/obj/flora/largejungleflora.dmi'
	icon_state = "bush3"

/obj/structure/flora/largebush/jungle
	name = "jungle bush"
	icon = 'icons/obj/flora/largejungleflora.dmi'
	icon_state = "bush"

/obj/structure/flora/largerock/jungle/one
	name = "large jungle rock"
	icon = 'icons/obj/flora/largejungleflora.dmi'
	icon_state = "rocks1"

/obj/structure/flora/largerock/jungle/two
	name = "large jungle rock"
	icon = 'icons/obj/flora/largejungleflora.dmi'
	icon_state = "rocks2"

/obj/structure/flora/largerock/jungle/three
	name = "large jungle rock"
	icon = 'icons/obj/flora/largejungleflora.dmi'
	icon_state = "rocks3"

/obj/structure/flora/largerock/jungle
	name = "large jungle rock"
	icon = 'icons/obj/flora/largejungleflora.dmi'
	icon_state = "rocks"

/obj/structure/flora/rock/jungle/one
	name = "jungle rock"
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "rock1"

/obj/structure/flora/rock/jungle/two
	name = "jungle rock"
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "rock2"

/obj/structure/flora/rock/jungle/three
	name = "jungle rock"
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "rock3"

/obj/structure/flora/rock/jungle/four
	name = "jungle rock"
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "rock4"

/obj/structure/flora/rock/jungle/five
	name = "jungle rock"
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "rock5"

/obj/structure/flora/rock/jungle
	name = "jungle rock"
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "rock"

/obj/structure/flora/bush/jungle/oneA
	name = "jungle bush"
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "busha1"

/obj/structure/flora/bush/jungle/twoA
	name = "jungle bush"
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "busha2"

/obj/structure/flora/bush/jungle/threeA
	name = "jungle bush"
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "busha3"

/obj/structure/flora/bush/jungle/oneB
	name = "jungle bush"
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "bushb1"

/obj/structure/flora/bush/jungle/twoB
	name = "jungle bush"
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "bushb2"

/obj/structure/flora/bush/jungle/threeB
	name = "jungle bush"
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "bushb3"

/obj/structure/flora/bush/jungle/oneC
	name = "jungle bush"
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "bushc1"

/obj/structure/flora/bush/jungle/twoC
	name = "jungle bush"
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "bushc2"

/obj/structure/flora/bush/jungle/threeC
	name = "jungle bush"
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "bushc3"

/obj/structure/flora/grass/jungle/oneA
	name = "jungle grass"
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "grassa1"

/obj/structure/flora/grass/jungle/twoA
	name = "jungle grass"
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "grassa2"

/obj/structure/flora/grass/jungle/threeA
	name = "jungle grass"
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "grassa3"

/obj/structure/flora/grass/jungle/fourA
	name = "jungle grass"
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "grassa5"

/obj/structure/flora/grass/jungle/fiveA
	name = "jungle grass"
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "grassa5"

/obj/structure/flora/grass/jungle/oneB
	name = "jungle grass"
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "grassb1"

/obj/structure/flora/grass/jungle/twoB
	name = "jungle grass"
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "grassb2"

/obj/structure/flora/grass/jungle/threeB
	name = "jungle grass"
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "grassb3"

/obj/structure/flora/grass/jungle/fourB
	name = "jungle grass"
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "grassb5"

/obj/structure/flora/grass/jungle/fiveB
	name = "jungle grass"
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "grassb5"

/obj/structure/flora/bush/jungle/busha
	name = "jungle bush"
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "busha"

/obj/structure/flora/bush/jungle/bushb
	name = "jungle bush"
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "bushb"

/obj/structure/flora/bush/jungle/bushc
	name = "jungle bush"
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "bushc"

/obj/structure/flora/grass/jungle/grassa
	name = "jungle grass"
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "grassa"

/obj/structure/flora/grass/jungle/grassb
	name = "jungle grass"
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "grassb"

/obj/structure/flora/tree/jungle/tree
	name = "jungle tree"
	icon = 'icons/obj/flora/jungletreesmall.dmi'
	icon_state = "tree"


/obj/structure/flora/tree/jungle/tree/one
	name = "jungle tree"
	icon = 'icons/obj/flora/jungletreesmall.dmi'
	icon_state = "tree1"

/obj/structure/flora/tree/jungle/tree/two
	name = "jungle tree"
	icon = 'icons/obj/flora/jungletreesmall.dmi'
	icon_state = "tree2"

/obj/structure/flora/tree/jungle/tree/three
	name = "jungle tree"
	icon = 'icons/obj/flora/jungletreesmall.dmi'
	icon_state = "tree3"

/obj/structure/flora/tree/jungle/tree/four
	name = "jungle tree"
	icon = 'icons/obj/flora/jungletreesmall.dmi'
	icon_state = "tree4"

/obj/structure/flora/tree/jungle/tree/five
	name = "jungle tree"
	icon = 'icons/obj/flora/jungletreesmall.dmi'
	icon_state = "tree5"

/obj/structure/flora/tree/jungle/tree/six
	name = "jungle tree"
	icon = 'icons/obj/flora/jungletreesmall.dmi'
	icon_state = "tree6"





