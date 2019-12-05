//Belly datums here with a lot of handy procs.

// -----------------------
// BASICALLY, WHAT THIS IS ROIGHT DOWN HERE, IS AN ATTEMPT TO IMPORT 10% OF VIRGO'S VORECODE, WHICH IS PRETTY DARN GOOD.
// Why make something completely new when there's something better out there when you can actually import it in your work?
//
//
// Basically, all credit goes to virgo and their amazing devs, with the brains. I'll be here, just trying to catch up.
//
// -----------------------



/datum/belly
	var/name								// Name of this location
	var/human_prey_swallow_time = 100		// Time in deciseconds to swallow /mob/living/carbon/human
	var/nonhuman_prey_swallow_time = 30		// Time in deciseconds to swallow anything else
	var/escapable = 1						// Belly can be resisted out of at any time
	var/escapetime = 60 SECONDS				// Deciseconds, how long to escape this belly
	var/can_taste = 0						// If this belly prints the flavor of prey when it eats someone.

	var/tmp/digest_mode = DM_HOLD				// Whether or not to digest. Default to not digest.
	var/tmp/list/digest_modes = list(DM_HOLD,DM_DIGEST,DM_HEAL,DM_ABSORB,DM_DRAIN,DM_UNABSORB)	// Possible digest modes
	var/tmp/mob/living/owner					// The mob whose belly this is.
	var/tmp/list/internal_contents = list()		// People/Things you've eaten into this belly!
