/obj/item/rcd/interact_with_atom(atom/target, mob/living/user, list/modifiers)

	if(istype(target, /turf/simulated/floor/chasm) || istype(target, /turf/simulated/floor/lava/lava_land_surface))
		to_chat(user, SPAN_WARNING("Кажется, я не могу тут использовать РЦД."))
		return FALSE
	return ..()
