note
	description: "Summary description for {FLOOR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"
	model: button_up, button_down

class
	FLOOR

create
	make

feature {NONE}
		-- Constructor

   	make
		note
			status: creator
        do
        	create button_up.make
        	create button_down.make
		ensure
			button_up_created: button_up /= Void
			button_dow_created: button_down /= Void
        end

feature {ELEVATOR}
		-- Attributes

	button_up: FLOOR_BUTTON
	button_down: FLOOR_BUTTON

end
