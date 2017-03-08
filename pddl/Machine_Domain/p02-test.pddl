(define (problem rcll-1)
(:domain rcll)
(:objects
	m_bs - bs
	m_rs1 - rs1
	m_rs2 - rs2
	m_cs1 - cs1
	m_cs2 - cs2
	dummy - machine
	p1 - product
	p2 - product
	p3 - product
	p1_base - base
	p1_ring1 - ring
	p1_ring2 - ring
	p1_ring3 - ring
	p1_cap - cap
	p2_base - base
	p2_ring1 - ring
	p2_ring2 - ring
	p2_ring3 - ring
	p2_cap - cap
	p3_base - base
	p3_ring1 - ring
	p3_ring2 - ring
	p3_ring3 - ring
	p3_cap - cap
)

(:init
	(is-at p1 dummy)
	(is-at p2 dummy)
	(is-at p3 dummy)
	(is-empty p1 p1_base)
	(is-empty p1 p1_ring1)
	(is-empty p1 p1_ring2)
	(is-empty p1 p1_ring3)
	(is-empty p1 p1_cap)
	(is-empty p2 p2_base)
	(is-empty p2 p2_ring1)
	(is-empty p2 p2_ring2)
	(is-empty p2 p2_ring3)
	(is-empty p2 p2_cap)
	(is-empty p3 p3_base)
	(is-empty p3 p3_ring1)
	(is-empty p3 p3_ring2)
	(is-empty p3 p3_ring3)
	(is-empty p3 p3_cap)
	(contains-color m_rs1 blue)
	(contains-color m_rs1 green)
	(contains-color m_rs2 yellow)
	(contains-color m_rs2 orange)
	(contains-color m_cs1 black)
	(contains-color m_cs2 white)
)

(:goal 
        (and 
		(has-color p1 p1_base black)
		(has-color p1 p1_ring1 blue)
		(has-color p1 p1_ring2 green)
		(has-color p1 p1_ring3 blue)
		(has-color p1 p1_cap black)
		(has-color p2 p2_base red)
		(has-color p2 p2_ring1 orange)
		(has-color p2 p2_ring2 yellow)
		(has-color p2 p2_ring3 blue)
		(has-color p2 p2_cap white)
		(has-color p3 p3_base silver)
		(has-color p3 p3_ring1 blue)
		(has-color p3 p3_ring2 blue)
		(has-color p3 p3_ring3 orange)
		(has-color p3 p3_cap white)
        )
    
)

(:metric minimize (total-time))

)
