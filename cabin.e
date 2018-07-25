note
	description: "Summary description for {CABIN}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"
	model: current_floor, top_floor, cabin_buttons

class
	CABIN

create
    make

feature {NONE} -- Constructor

    make(floors: SIMPLE_ARRAY[FLOOR])
            -- Initialize a new cabin
		note
			status: creator
		require
			reasonable_num_floors: {ELEVATOR}.NUM_FLOORS >= 2
			floors_exist: floors /= Void
			floors_allocated: floors.count = {ELEVATOR}.NUM_FLOORS
		local
			cabin_button0: CABIN_BUTTON
			cabin_button1: CABIN_BUTTON
			cabin_button2: CABIN_BUTTON
			cabin_button3: CABIN_BUTTON
			cabin_button4: CABIN_BUTTON
        do
            current_floor := 0
            top_floor := {ELEVATOR}.NUM_FLOORS - 1
            create cabin_buttons.make(1,top_floor)
            create cabin_button0.make(floors.item(1))
            create cabin_button1.make(floors.item(2))
            create cabin_button2.make(floors.item(3))
            create cabin_button3.make(floors.item(4))
            create cabin_button4.make(floors.item(5))
            cabin_buttons.put(cabin_button0, 1)
            cabin_buttons.put(cabin_button1, 2)
            cabin_buttons.put(cabin_button2, 3)
            cabin_buttons.put(cabin_button3, 4)
            cabin_buttons.put(cabin_button4, 5)
--            cabin_buttons.init(<< cabin_button0, cabin_button1, cabin_button2, cabin_button3, cabin_button4 >>)
        ensure
        	current_floor_initialized: current_floor = 0
        	top_floor_set: top_floor = {ELEVATOR}.NUM_FLOORS - 1
        	cabin_buttons_created: cabin_buttons /= Void
			cabin_buttons_correct_size: cabin_buttons.sequence.count = {ELEVATOR}.NUM_FLOORS
        end

feature -- Public methods

	move_up
            -- Move cabin one floor up
        require
        	can_not_go_higher_than_upper_floor: current_floor < top_floor - 1
        	modify_model("current_floor", Current)
		do
            current_floor := current_floor + 1
        ensure
        	cabin_moved_up: current_floor = old current_floor + 1
		end

	move_down
            -- Move cabin one floor down
        require
        	there_is_no_underground_floor: current_floor > 0
        	modify_model("current_floor", Current)
		do
            current_floor := current_floor - 1
        ensure
        	cabin_moved_up: current_floor = old current_floor - 1
		end

	press_cabin_button(floor: FLOOR)
			-- Press cabin button to show intent for going to certain floor
		require
			floor_exist: floor /= Void
--			modify_model("is_active", cabin_buttons)
		do
			--cabin_buttons[floor.number].
		ensure
--			button_up_is_pressed: button_up.is_active
		end

feature -- Public attributes

    current_floor: INTEGER
            -- Current floor cabin located at

    top_floor: INTEGER
    		-- Top floor

	cabin_buttons: V_ARRAY[CABIN_BUTTON]
			-- Cabin buttons

invariant
	current_floor_in_bounds: current_floor >= 0 and current_floor < top_floor
	reasonable_top_floor: top_floor >= 2
	cabin_buttons_exists: cabin_buttons /= Void
--	cabin_buttons_size: cabin_buttons.sequence.count = {ELEVATOR}.NUM_FLOORS

end
