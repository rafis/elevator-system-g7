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

	NUM_FLOORS: INTEGER = 4
			-- the number of floors

feature -- Private attributes

    floors: V_ARRAY[FLOOR]
    		-- array of floors

    cabin: CABIN
    		-- cabin

feature {NONE} -- Constructor

    make
            -- Initialize a new cabin
        note
        	status: creator
        local
        	i: INTEGER
        do
        	create floors.make(1, NUM_FLOORS)
        	check floors /= Void end
			from
				i := 1
			invariant
				counter_in_range: i >= 1 and i <= NUM_FLOORS
				floors_is_created: floors /= Void
			until
				i >= NUM_FLOORS
			loop
				floors.put(create {FLOOR}.make, i+1)
				i := i + 1
			variant
				NUM_FLOORS - i
			end

            create cabin.make(NUM_FLOORS)
        ensure
        	floors_created: floors /= Void
			all_floors_created: floors.count = NUM_FLOORS
			cabin_created: cabin /= Void
        end

feature -- Public methods

    move(floor_number: INTEGER)
            -- Move cabin to specific floor
        note
        	explicit: wrapping
        require
        	feasible_destination: floor_number >= 0 and floor_number < NUM_FLOORS
			cabin /= Void
        	modify_model("current_floor", cabin)
        local
            distance: INTEGER
            i: INTEGER
        do
            if cabin.current_floor < floor_number
            then
                distance := floor_number - cabin.current_floor
                from
                    i := 0
                invariant
                	i_in_bounds: i >= 0 and i <= distance
                until
                    i >= distance
                loop
                    cabin.move_up()
                    i := i +1
                variant
                	distance - i
                end
            else
                distance := cabin.current_floor - floor_number
                from
                    i := 0
                invariant
                	i_in_bounds: i >= 0 and i <= distance
                until
                    i >= distance
                loop
                    cabin.move_down()
                    i := i +1
                variant
                	distance - i
                end
            end
        end

--feature -- Model
--	floors_sequence: MML_SET[FLOOR]
--		note
--			status: ghost
--		attribute
--		end

invariant
	owns = [cabin, floors]
	elevator_has_no_benefit_if_less_than_two_floors: NUM_FLOORS >= 2
--	floors.sequence.range = floors_sequence
	floors_exists: floors /= Void
--	all_floors_created: floors.count = NUM_FLOORS
	cabin_exists: cabin /= Void
end
