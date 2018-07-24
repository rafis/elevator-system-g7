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
			explicit: wrapping
			explicit: contracts
		require
			default_is_wrapped: Current.is_wrapped
			modify_model(["number", "button_up", "button_down"], Current)
        do
        	if n /= {ELEVATOR}.NUM_FLOORS
        	then
        		unwrap
	        	create button_up.make(true)
	        	wrap
	        end
        	if n /= 0
        	then
        		unwrap
	        	create button_down.make(false)
	        	wrap
        	end
      		unwrap
        	number := n
        	wrap
        ensure
        	button_up_created: number /= {ELEVATOR}.NUM_FLOORS implies button_up /= Void
--        	button_up_not_created: number = {ELEVATOR}.NUM_FLOORS implies button_up = Void
        	button_down_created: number /= 0 implies button_down /= Void
--        	button_down_not_created: number = 0 implies button_down = Void
        	number_set: number = n
        end

feature
		-- Public API

	press_button_up
			-- Press button up
		do
			button_up.press()
		ensure
			button_up_is_pressed: button_up.is_active
		end

	press_button_down
			-- Press button down
		do
			button_down.press()
		ensure
			button_down_is_pressed: button_down.is_active
		end

feature
		-- Attributes

	number: INTEGER
			-- Number of this floor

	button_up: FLOOR_BUTTON
			-- Button for case when user wants to go up

	button_down: FLOOR_BUTTON
			-- Button for case when user wants to go down

invariant
	owns_def: owns = [button_up, button_down]
	button_up_exists_except_for_top_floor: number /= {ELEVATOR}.NUM_FLOORS implies button_up /= Void
	button_down_exists_except_for_ground_floor: number /= 0 implies button_down /= Void
--	button_up_not_exists_for_top_floor: number = {ELEVATOR}.NUM_FLOORS implies button_up = Void
--	button_down_not_exists_for_ground_floor: number = 0 implies button_down = Void

end
