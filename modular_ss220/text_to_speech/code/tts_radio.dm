/obj/item/radio/talk_into(mob/living/M, list/message_pieces, channel, verbage)
	if(!M || !message_pieces)
		return FALSE

	return ..()

/proc/hear_message_obj(list/listening_obj, mob/M, list/message_pieces, verbage)
	var/list/transmited_channels = list()
	for(var/obj/O in listening_obj)
		if(!O)
			continue

		if(isradio(O))
			var/obj/item/radio/radio = O
			if(!radio.broadcasting)
				continue
			if(get_dist(radio, M) > radio.canhear_range)
				continue
			if(radio.frequency in transmited_channels)
				continue
			if(radio.talk_into(M, message_pieces, null, verbage))
				transmited_channels += radio.frequency
		else
			O.hear_talk(M, message_pieces, verbage)
