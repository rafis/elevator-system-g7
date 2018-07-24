note
	description: "Summary description for {FLOOR_BUTTON}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	FLOOR_BUTTON
inherit
	BUTTON

create
	make

feature {FLOOR} -- Attributes

    direction: BOOLEAN
                 -- direction of button: false - down, true - up

invariant
	direction_is_ok: direction = false or direction = true

end
