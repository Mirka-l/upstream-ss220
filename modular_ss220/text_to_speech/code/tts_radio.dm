/obj/item/radio/talk_into(mob/living/M, list/message_pieces, channel, verbage)
	return FALSE

/proc/hear_message_obj(list/listening_obj, mob/M, list/message_pieces, verbage)
	var/list/transmited_channels = list()
	for(var/obj/obj in listening_obj)
		spawn(0) // KILL THIS
			if(obj) // It's possible that it could be deleted in the meantime.
				if(isradio(obj))
					var/obj/item/radio/radio = obj
					if(radio.broadcasting && get_dist(radio, M) <= radio.canhear_range && !(radio.frequency in transmited_channels))
						if(radio.talk_into(M, message_pieces, null, verbage))
							transmited_channels += radio.frequency
				else
					obj.hear_talk(M, message_pieces, verbage)
