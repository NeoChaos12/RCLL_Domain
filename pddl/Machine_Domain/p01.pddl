(define (problem rcll-1)
(:domain rcll)
(:objects
	p1 - product
	p2 - product
	p3 - product
)

(:init
	(contains-color m_rs1 blue)
	(contains-color m_rs1 green)
	(contains-color m_rs2 yellow)
	(contains-color m_rs2 orange)
	(contains-color m_cs1 black)
	(contains-color m_cs2 white)
)

(:goal 
        (and 
		(color-of-base p1 black)
		(color-of-ring1 p1 blue)
		(color-of-ring2 p1 green)
		(color-of-cap p1 black)
		(color-of-base p2 red)
		(color-of-ring1 p2 orange)
		(color-of-ring2 p2 yellow)
		(color-of-cap p2 white)
		(color-of-base p3 silver)
		(color-of-ring1 p3 blue)
		(color-of-ring2 p3 blue)
		(color-of-cap p3 white)
        )
    
)

(:metric minimize (total-time))

)
