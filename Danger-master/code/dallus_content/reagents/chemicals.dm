/datum/reagent/drink/juice/caramel
	name = "Caramel"
	id = "caramel"
	description = "Caramel, a sugary concoction made to give you diabetes."
	taste_description = "caramel"
	color = "#ffc775"

/datum/reagent/drink/juice/vanilla
	name = "Vanilla"
	id = "vanilla"
	description = "A simple flavor for a simple thing"
	taste_description = "vanilla"
	color = "#ffc775"

/datum/reagent/drink/juice/gum
	name = "Gum Juice"
	id = "gum"
	description = "Ew."
	taste_description = "sweet bubblegum"
	color = "#ff87ed"

/datum/reagent/drink/juice/pear
	name = "Pear Juice"
	id = "pear"
	description = "Pear juice, pretty sweet!"
	taste_description = "sweet pears"
	color = "#b5ff87"

/datum/reagent/drink/juice/strawberry
	name = "Strawberry Juice"
	id = "strawberry"
	description = "Strawberry juice, super sweet!"
	taste_description = "strawberries"
	color = "#ff886d"

/datum/reagent/drink/juice/durian
	name = "Durian Extract"
	id = "durian"
	description = "Durian Extract, smells terrible! Tastes like buttery cookies though."
	taste_description = "buttery sweetness"
	color = "#e8f966"

/datum/reagent/drink/juice/kiwi
	name = "Kiwi Juice"
	id = "kiwi"
	description = "Kiwi juice, super sweet!"
	taste_description = "kiwi"
	color = "#88f966"

/datum/reagent/drink/juice/coconut
	name = "Coconut Juice"
	id = "coconut"
	description = "Coconut juice, tastey!"
	taste_description = "coconut"
	color = "#e0e0e0"

/datum/reagent/drink/juice/cranberry
	name = "Cranberry Juice"
	id = "cranberry"
	description = "Cranberry juice, super sweat!"
	taste_description = "super sweet cranberries"
	color = "#fc786f"

/datum/reagent/drink/juice/grapefruit
	name = "Grapefruit Juice"
	id = "grapefruit"
	description = "Grapefruit juice, super sweat!"
	taste_description = "super sweet grapefruits"
	color = "#ffc775"

/datum/reagent/drink/juice/mango
	name = "Mango Juice"
	id = "mango"
	description = "Mango juice!"
	taste_description = "mangos"
	color = "#ffd596"

/datum/reagent/drink/juice/peach
	name = "Peach Juice"
	id = "peach"
	description = "Peach juice!"
	taste_description = "peaches"
	color = "#ffd596"

/datum/reagent/drink/juice/pineapple
	name = "Pineapple Juice"
	id = "pineapple"
	description = "Pineapple juice!"
	taste_description = "pineapples"
	color = "#fcf26f"

/datum/reagent/drink/juice/plum
	name = "Plum Juice"
	id = "plum"
	description = "Plum juice!"
	taste_description = "plums"
	color = "#b76ffc"

/datum/reagent/drink/juice/raspberry
	name = "Raspberry Juice"
	id = "raspberry"
	description = "Raspberry juice!"
	taste_description = "raspberries"
	color = "#fc6f6f"

/datum/reagent/drink/juice/peanut
	name = "Peanut Juice"
	id = "peanut"
	description = "Peanut juice!"
	taste_description = "peanuts"
	color = "#ffbd54"

//
// Aphrodisiac!
//

/datum/reagent/aphrodisiac
	name = "Aphrodisiac" //Parent class for all alcoholic reagents.
	id = "aphrodisiac"
	description = "You so horny."
	taste_description = "sweetness"
	reagent_state = LIQUID
	color = "#FF9999"
	var/nutriment_factor = 0

	glass_name = "aphrodisiac"
	glass_desc = "Smells nice, I dare you to drink it."

/datum/reagent/aphrodisiac/affect_ingest(var/mob/living/carbon/M, var/alien, var/removed)
	if(!M)	return
	var/count = 1
	switch(count)
		if(1 to 30)
			if(prob(9)) M.emote("blush")
		if (30 to INFINITY)
			if(prob(3)) M.emote("blush")
			if(prob(5)) M.emote("moan")
	count++

/datum/chemical_reaction/aphrodisiac
	name = "Aphrodisiac"
	result = "aphrodisiac"
	result_amount = 6
	required_reagents = list("carbon" = 2, "hydrogen" = 2, "oxygen" = 2, "water" = 1)
	mix_message = "The mixture boils off a pink vapor..."//The water boils off, leaving the crocin
