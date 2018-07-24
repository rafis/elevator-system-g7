note
	description: "Summary description for {BUTTON}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"
	model: is_active

class
	BUTTON

create
	make

feature {NONE} -- Constructor

	make
			-- Initialize a button
		note
			status: creator
		do
			is_active := false
		ensure
			is_active_set: is_active = false
		end

feature -- Functions

	press
		require
			modify_model("is_active", Current)
		do
			is_active := true
		ensure
			is_active = true
		end

	release
		require
			can_release_only_active: is_active = true
			modify_model("is_active", Current)
		do
			is_active := false
		ensure
			is_active = false
		end

feature -- Attributes

	is_active: BOOLEAN
			-- Button state

invariant
	is_active_is_ok: is_active = false or is_active = true

end
