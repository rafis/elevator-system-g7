note
	description: "Summary description for {ELEVATOR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"
	model: floors, cabin

class
	ELEVATOR

create
	make

feature -- Constants

	NUM_FLOORS: INTEGER = 5
			-- the number of floors

feature {NONE} -- Constructor

    make
            -- Initialize a new cabin
        note
        	status: creator
        require
			modify_model(["cabin", "floors"], Current)
        local
        	i: INTEGER
        	floor0: FLOOR
        	floor1: FLOOR
        	floor2: FLOOR
        	floor3: FLOOR
        	floor4: FLOOR
        do
        	create floors.make(1, NUM_FLOORS)
            create floor0.make(0)
            create floor1.make(1)
            create floor2.make(2)
            create floor3.make(3)
            create floor4.make(4)
            floors.put(floor0, 1)
            floors.put(floor1, 2)
            floors.put(floor2, 3)
            floors.put(floor3, 4)
            floors.put(floor4, 5)
            create cabin.make(floors)
        ensure
        	floors_created: floors /= Void
			all_floors_created: floors.count = NUM_FLOORS
			cabin_created: cabin /= Void
        end

feature -- Calling an elevator to a floor [F1]

	press_floor_up_button(floor: FLOOR)
			-- Handle event of user pressed up button
		note
			explicit: wrapping
		require
			our_floors: floors.sequence.range.has (floor)
			modify(floor)
		do
			floor.press_button_up()
		ensure
			button_up_is_pressed: floor.button_up.is_active
		end

	press_floor_down_button(floor: FLOOR)
			-- Handle event of user pressed down button
		note
			explicit: wrapping
		require
			our_floors: floors.sequence.range.has (floor)
			modify(floor)
		do
			floor.press_button_down()
		ensure
			button_down_is_pressed: floor.button_down.is_active
		end

feature -- Ordering cabin to move to a floor [F2]

	press_cabin_button(floor: FLOOR)
			-- Handle event of user pressed down button
		note
			explicit: wrapping
		require
			our_floors: floors.sequence.range.has (floor)
			modify(floor)
		do
			cabin.press_cabin_button(floor)
		ensure
			button_down_is_pressed: floor.button_down.is_active
		end

feature -- Moving cabin between floors [F3]

	tick
			-- Do one atomic tick (lock step) of simulation
		do


		end

feature -- Opening and closing doors [F4]

    open
        do
            -- TODO
        end

    close
        do
            -- TODO
        end

feature -- Indicating current floor [F5]

    get_current_floor: INTEGER
    	note
    		status: functional
    	require
    		current_floor_in_bounds: cabin.current_floor >= 0 and cabin.current_floor < NUM_FLOORS
        do
            Result := cabin.current_floor
        ensure
            Result = cabin.current_floor
        end

feature -- Public (read-only) attributes

    floors: V_ARRAY[FLOOR]
    		-- array of floors

    cabin: CABIN
    		-- cabin

invariant
	owns_def: owns = [cabin]
	elevator_has_no_benefit_if_less_than_two_floors: NUM_FLOORS >= 2
	floors_exists: floors /= Void
--	floors_sequence_range : floors.sequence.range = floors_sequence
--	all_floors_exist: floors /= Void implies floors.sequence.count = NUM_FLOORS
	cabin_exists: cabin /= Void
end
