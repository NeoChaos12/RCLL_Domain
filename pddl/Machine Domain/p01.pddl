(define (problem rcll-1)
(:domain rcll)
(:objects
	m_bs - bs
	m_rs1 - rs1
	m_rs2 - rs2
	m_cs1 - cs1
	m_cs2 - cs2
	m_ds - ds
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
	(has-color p1_base null)
	(has-color p1_ring1 null)
	(has-color p1_ring2 null)
	(has-color p1_ring3 null)
	(has-color p1_cap null)
	(has-color p2_base null)
	(has-color p2_ring1 null)
	(has-color p2_ring2 null)
	(has-color p2_ring3 null)
	(has-color p2_cap null)
	(has-color p3_base null)
	(has-color p3_ring1 null)
	(has-color p3_ring2 null)
	(has-color p3_ring3 null)
	(has-color p3_cap null)
	(in-domain p1_base black)
	(in-domain p1_base white)
	(in-domain p1_base red)
	(in-domain p2_base black)
	(in-domain p2_base white)
	(in-domain p2_base red)
	(in-domain p3_base black)
	(in-domain p3_base white)
	(in-domain p3_base red)
	(in-domain p1_ring1 blue)
	(in-domain p1_ring1 yellow)
	(in-domain p1_ring1 orange)
	(in-domain p1_ring1 green)
	(in-domain p2_ring1 blue)
	(in-domain p2_ring1 yellow)
	(in-domain p2_ring1 orange)
	(in-domain p2_ring1 green)
	(in-domain p3_ring1 blue)
	(in-domain p3_ring1 yellow)
	(in-domain p3_ring1 orange)
	(in-domain p3_ring1 green)
	(in-domain p1_cap black)
	(in-domain p1_cap gray)
	(in-domain p2_cap black)
	(in-domain p2_cap gray)
	(in-domain p3_cap black)
	(in-domain p3_cap gray)
)

(:goal 
        (and 
		(has-color p1_base black)
		(has-color p1_ring1 null)
		(has-color p1_ring2 null)
		(has-color p1_ring3 null)
		(has-color p1_cap black)
        )
    
)

(:metric minimize (total-time))

)
