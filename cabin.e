note
	description: "Summary description for {CABIN}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"
	model: current_floor

class
	CABIN

create
    make

feature --{ELEVATOR} -- Public attributes

    current_floor: INTEGER
            -- Current floor cabin located at

    top_floor: INTEGER
    		-- Top floor

feature {NONE} -- Constructor

    make(NUM_FLOORS: INTEGER)
            -- Initialize a new cabin
		note
			status: creator
		require
			reasonable_num_floors: NUM_FLOORS > 0
        do
            current_floor := 0
            top_floor := NUM_FLOORS
        ensure
        	current_floor_initialized: current_floor = 0
        	top_floor_set: top_floor = NUM_FLOORS
        end

feature --{ELEVATOR} -- Public methods

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

invariant
	current_floor_in_bounds: current_floor >= 0 and current_floor < top_floor

end
