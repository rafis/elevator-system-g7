note
	description: "Summary description for {ELEVATOR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ELEVATOR

feature -- Constants

	NUM_FLOORS: INTEGER = 5
			-- the number of floors

feature {NONE} -- Private attributes

    floors: ARRAY[FLOOR]
    		-- array of floors

    cabin: CABIN
    		-- cabin

feature {NONE} -- Constructor

    make
            -- Initialize a new cabin
        local
        	i: INTEGER
        do
			create floors.make_empty
			from
				i := 0
			until
				i >= NUM_FLOORS
			loop
				floors.force(create {FLOOR}.make, i+1)
				i := i + 1
			end

            create cabin.make(NUM_FLOORS)
        ensure
			all_floors_created: floors.count = NUM_FLOORS
			cabin_created: cabin /= Void
        end

feature {APPLICATION} -- Public methods

    move(floor_number: INTEGER)
            -- Move cabin to specific floor
        local
            distance: INTEGER
            i: INTEGER
        do
            if cabin.get_current_floor() < floor_number
            then
                distance := floor_number - cabin.get_current_floor()
                from
                    i := 0
                until
                    i >= distance
                loop
                    cabin.move_up()
                    i := i +1
                end
            else
                distance := cabin.get_current_floor() - floor_number
                from
                    i := 0
                until
                    i >= distance
                loop
                    cabin.move_down()
                    i := i +1
                end
            end
        end

--feature {NONE} -- Private methods

--    move_up
--            -- Move cabin one floor up
--        do
--            cabin.move_up()
--        end

--    move_down
--            -- Move cabin one floor down
--        do
--            cabin.move_down()
--        end

invariant
	elevator_has_no_benefit_if_less_than_two_floors: NUM_FLOORS >= 2

end
