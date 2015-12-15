/obj/item/clothing/head/wizard
	name = "wizard hat"
	desc = "Strange-looking hat-wear that most certainly belongs to a real magic user."
	icon_state = "wizard"
	gas_transfer_coefficient = 0.01 // IT'S MAGICAL OKAY JEEZ +1 TO NOT DIE
	permeability_coefficient = 0.01
	armor = list(melee = 30, bullet = 20, laser = 20, energy = 20, bomb = 20, bio = 20, rad = 20)
	strip_delay = 50
	put_on_delay = 50
	unacidable = 1
	burn_state = -1 //Won't burn in fires

/obj/item/clothing/head/wizard/red
	name = "red wizard hat"
	desc = "Strange-looking red hat-wear that most certainly belongs to a real magic user."
	icon_state = "redwizard"

/obj/item/clothing/head/wizard/yellow
	name = "yellow wizard hat"
	desc = "Strange-looking yellow hat-wear that most certainly belongs to a powerful magic user."
	icon_state = "yellowwizard"

/obj/item/clothing/head/wizard/black
	name = "black wizard hat"
	desc = "Strange-looking black hat-wear that most certainly belongs to a real skeleton. Spooky."
	icon_state = "blackwizard"

/obj/item/clothing/head/wizard/fake
	name = "wizard hat"
	desc = "It has WIZZARD written across it in sequins. Comes with a cool beard."
	icon_state = "wizard-fake"
	gas_transfer_coefficient = 1
	permeability_coefficient = 1
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0)

/obj/item/clothing/head/wizard/marisa
	name = "witch hat"
	desc = "Strange-looking hat-wear. Makes you want to cast fireballs."
	icon_state = "marisa"

/obj/item/clothing/head/wizard/magus
	name = "\improper Magus helm"
	desc = "A mysterious helmet that hums with an unearthly power."
	icon_state = "magus"
	item_state = "magus"

/obj/item/clothing/head/wizard/santa
	name = "Santa's hat"
	desc = "Ho ho ho. Merrry X-mas!"
	icon_state = "santahat"
	flags = BLOCKHAIR

/obj/item/clothing/suit/wizrobe
	name = "wizard robe"
	desc = "A magnificent, gem-lined robe that seems to radiate power."
	icon_state = "wizard"
	item_state = "wizrobe"
	gas_transfer_coefficient = 0.01
	permeability_coefficient = 0.01
	body_parts_covered = CHEST|GROIN|ARMS|LEGS
	armor = list(melee = 30, bullet = 20, laser = 20, energy = 20, bomb = 20, bio = 20, rad = 20)
	allowed = list(/obj/item/weapon/teleportation_scroll)
	flags_inv = HIDEJUMPSUIT
	strip_delay = 50
	put_on_delay = 50
	unacidable = 1
	burn_state = -1 //Won't burn in fires

/obj/item/clothing/suit/wizrobe/red
	name = "red wizard robe"
	desc = "A magnificent red gem-lined robe that seems to radiate power."
	icon_state = "redwizard"
	item_state = "redwizrobe"

/obj/item/clothing/suit/wizrobe/yellow
	name = "yellow wizard robe"
	desc = "A magnificant yellow gem-lined robe that seems to radiate power."
	icon_state = "yellowwizard"
	item_state = "yellowwizrobe"

/obj/item/clothing/suit/wizrobe/black
	name = "black wizard robe"
	desc = "An unnerving black gem-lined robe that reeks of death and decay."
	icon_state = "blackwizard"
	item_state = "blackwizrobe"

/obj/item/clothing/suit/wizrobe/marisa
	name = "witch robe"
	desc = "Magic is all about the spell power, ZE!"
	icon_state = "marisa"
	item_state = "marisarobe"

/obj/item/clothing/suit/wizrobe/magusblue
	name = "\improper Magus robe"
	desc = "A set of armored robes that seem to radiate a dark power."
	icon_state = "magusblue"
	item_state = "magusblue"

/obj/item/clothing/suit/wizrobe/magusred
	name = "\improper Magus robe"
	desc = "A set of armored robes that seem to radiate a dark power."
	icon_state = "magusred"
	item_state = "magusred"


/obj/item/clothing/suit/wizrobe/santa
	name = "Santa's suit"
	desc = "Festive!"
	icon_state = "santa"
	item_state = "santa"

/obj/item/clothing/suit/wizrobe/fake
	name = "wizard robe"
	desc = "A rather dull blue robe meant to mimick real wizard robes."
	icon_state = "wizard-fake"
	item_state = "wizrobe"
	gas_transfer_coefficient = 1
	permeability_coefficient = 1
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0)
	unacidable = 0
	burn_state = 0 //Burnable

/obj/item/clothing/head/wizard/marisa/fake
	name = "witch hat"
	desc = "Strange-looking hat-wear, makes you want to cast fireballs."
	icon_state = "marisa"
	gas_transfer_coefficient = 1
	permeability_coefficient = 1
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0)
	unacidable = 0
	burn_state = 0 //Burnable

/obj/item/clothing/suit/wizrobe/marisa/fake
	name = "witch robe"
	desc = "Magic is all about the spell power, ZE!"
	icon_state = "marisa"
	item_state = "marisarobe"
	gas_transfer_coefficient = 1
	permeability_coefficient = 1
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0)
	unacidable = 0
	burn_state = 0 //Burnable


/obj/item/clothing/suit/wizrobe/magusred/destiny_bond
	name = "vitality bond robes"
	desc = "Inscribed with powerful runes, these robes pass on damage to any living beings unfortunate enough to be caught in its snare."
	action_button_name = "Activate Bonds"
	var/bond_cooldown = 0
	var/list/linked_mobs = list()
	var/active_bonds = FALSE

/obj/item/clothing/suit/wizrobe/magusred/destiny_bond/attack_self(mob/user)
	if(active_bonds)
		user << "You are already linked!"
	for(var/mob/living/L in range(7, user))
		linked_mobs += L
		linked_mobs[L] = Beam(L,"vine",'icons/effects/spacevines.dmi',INFINITY, 5,/obj/effect/ebeam/vine)
	if(!(linked_mobs.len))
		return
	active_bonds = TRUE
	spawn(150)
		for(var/mob/living/L in linked_mobs)
			var/datum/beam/B = linked_mobs[L]
			if(B)
				B.End()
			linked_mobs -= L
		active_bonds = FALSE

/obj/item/clothing/suit/wizrobe/magusred/destiny_bond/hit_reaction(mob/living/carbon/human/owner, attack_text, final_block_chance, damage, attack_type)
	for(var/mob/living/L in linked_mobs)
		L.adjustBruteLoss(damage)
		L << "<span class='danger'>You take damage from being linked to [owner]'s [src]!</span>"
		L.visible_message("<span class='danger'>Blood sprays from [L] as the vitality bond takes its toll!</span>")
	return 0