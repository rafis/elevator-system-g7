note
	description: "Summary description for {FLOOR_BUTTON}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	FLOOR_BUTTON
inherit
	BUTTON
		rename
			make as make_button
		end

create
	make

feature
		-- Constructor

	make(dir: BOOLEAN)
			-- Initialize
		note
			status: creator
		do
			direction := dir
--			make_button
			is_active := false
		ensure
			direction = dir
			is_active_set: is_active = false
		end

feature -- Attributes

    direction: BOOLEAN
                 -- direction of button: false - down, true - up

invariant
	direction_is_ok: direction = false or direction = true

end
