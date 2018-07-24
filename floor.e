note
	description: "Summary description for {FLOOR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"
	model: number, button_up, button_down

class
	FLOOR

create
	make

feature {NONE}
		-- Constructor

   	make(n: INTEGER)
		note
			status: creator
        do
        	create button_up.make
        	create button_down.make
        	number := n
        ensure
        	button_up_created: button_up /= Void
        	button_down_created: button_down /= Void
        	number_set: number = n
        end

feature {ELEVATOR}
		-- Attributes

	number: INTEGER
			-- Number of this floor

	button_up: FLOOR_BUTTON
			-- Button for case when user wants to go up

	button_down: FLOOR_BUTTON
			-- Button for case when user wants to go down

invariant
	owns_def: owns = [button_up, button_down]
	button_up_exists: button_up /= Void
	button_down_exists: button_down /= Void

end
