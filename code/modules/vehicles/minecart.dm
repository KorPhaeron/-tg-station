/obj/vehicle/minecart
	name = "all-terrain vehicle"
	desc = "An all-terrain vehicle built for traversing rough terrain with ease. One of the few old-earth technologies that are still relevant on most planet-bound outposts."
	icon_state = "miningcaropen"
	icon = 'icons/obj/crates.dmi'

/obj/vehicle/minecart/relaymove(mob/user, direction)
	var/turf/t = get_step(src, direction)
	var/obj/structure/minetrack/N = locate() in t
	if(N)
		..()
	else
		user << "You need minetracks to move!"
		return 0

/obj/vehicle/minecart/keycheck()
	return 1

/obj/item/stack/minetracks
	name = "minetracks"
	desc = "Lay these on the ground to build a rail"
	icon = 'icons/obj/mining.dmi'
	icon_state = "rail"

/obj/item/stack/minetracks/attack_self(mob/user)
	var/turf/t = get_turf(user)
	var/obj/structure/minetrack/N = locate() in t
	if(N)
		user << "Already a track here!"
		return
	else
		new /obj/structure/minetrack(get_turf(user))
		amount--
		if(amount <= 0)
		qdel(src)

/obj/structure/minetrack
	name = "minetracks"
	desc = "You can drive mining carts along these."
	icon = 'icons/obj/mining.dmi'
	icon_state = "rail"

/obj/structure/minetrack/attackby(obj/item/O, mob/user, params)
	..()
	if(istype(O,/obj/item/weapon/crowbar))
		new /obj/item/stack/minetracks(src.loc)
		qdel(src)
