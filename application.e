note
	description : "Elevator application root class"
	date        : "$Date$"
	revision    : "$Revision$"

class
	APPLICATION

create
	make

feature {NONE} -- Initialization

	make
		note
			status: creator
			explicit: wrapping, contracts
        local
            elevator: ELEVATOR
		do
            create elevator

			print("%N_________Test completed___________%N");
		end

end
