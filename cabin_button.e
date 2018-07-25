note
	description: "Summary description for {CABIN_BUTTON}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CABIN_BUTTON
inherit
	BUTTON
		rename
			make as make_button
		end

create
	make

feature
		-- Constructor

	make(f: FLOOR)
			-- Initialize
		note
			status: creator
		require
			destination_floor_defined: f /= Void
		do
--			make_button
			is_active := false
			floor := f
		ensure
			is_active_set: is_active = false
			floor_set: floor = f
		end


feature -- Attributes

    floor: FLOOR
                 -- destination floor where a user wants to go

invariant
	owns_def: owns = [floor]
	floor_created: floor /= Void

end
