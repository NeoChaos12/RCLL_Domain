(define (problem rcll-1)
(:domain rcll)
(:objects
	robot1 - robot
	robot2 - robot
	machine1 - machine
	machine2 - machine
	machine3 - machine
	l1 - location
	l2 - location
	l3 - location
)

(:init
	(at robot2 l1)
	(occupied l1)
	(gripper-free robot2)
	(at robot1 l3)
	(occupied l3)
	(gripper-free robot1)
	(at machine1 l1)
	(at machine2 l2)
	(at machine3 l3)
        (loading-tray-free machine1)
        (loading-tray-free machine2)
        (loading-tray-free machine3)
	(output-available machine1)
	(output-available machine2)
	(= (drive-time l1 l2) 406.3)
	(= (drive-time l1 l3) 73.1)
	(= (drive-time l2 l1) 406.3)
	(= (drive-time l2 l3) 356.8)
	(= (drive-time l3 l1) 73.1)
	(= (drive-time l3 l2) 356.8))

(:goal 
        (and 
            ;(not (output-available machine1))
            ;(not (output-available machine2))
            (at robot1 l1)
            (at robot2 l3)
        )
    
)

(:metric minimize (total-time))

)
