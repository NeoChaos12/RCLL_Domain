(define (domain rcll)

    (:requirements 
        :durative-actions
        :numeric-fluents
        :object-fluents
        :typing
        :adl
    )

    (:types
        product - locatable
	machine - location
	bs rs cs ds - machine
	base_color ring_color cap_color - color
    )

    (:constants
	black - base_color
	silver - base_color
	red - base_color
	blue - ring_color
	orange - ring_color
	yellow - ring_color
	green - ring_color
	black - cap_color
	white - cap_color
	m_bs - bs
	m_rs1 - rs
	m_rs2 - rs
	m_cs1 - cs
	m_cs2 - cs
    )

    (:predicates
	(being-processed ?p - product)
	(busy ?m - machine)
	(cap-loaded ?m - cs)
	(ring-loaded ?m - rs ?c - ring-color)
	(base-available ?m - machine)
	(contains-color ?m - machine ?c - color)
	(is-at ?o - locatable ?l - location)
	(product-initialized ?p - product)
	(has-base ?p - product)
	(has-ring1 ?p - product)
	(has-ring2 ?p - product)
	(has-cap ?p - product)
	(color-of-base ?p - product ?c - base_color)
	(color-of-ring1 ?p - product ?c - ring_color)
	(color-of-ring2 ?p - product ?c - ring_color)
	(color-of-cap ?p - product ?c - cap_color)
    )

    (:functions

    )

    (:durative-action initialize-product
	:parameters (?p - product)
	:duration (= ?duration 0.1)
	:condition (and
		(at start (not (product-initialized ?p)))
		(at start (not (busy m_bs)))
		(at start (not (being-processed ?p)))
	)
	:effect (and
		(at start (busy m_bs))
		(at start (being-processed ?p))
		(at end (not (busy m_bs)))
		(at end (not (being-processed ?p)))
		(at end (product-initialized ?p))
		(at end (is-at ?p m_bs))
	)
    )

    (:durative-action move-product
	:parameters (?p - product ?from ?to - location)
	:duration (= ?duration 2)
	:condition (and
		(at start (is-at ?p ?from))
		(at start (not (being-processed ?p)))
		(at start (not (busy ?from)))
		(at start (not (busy ?to)))
	)
	:effect (and
		(at start (being-processed ?p))
		(at start (busy ?from))
		(at start (busy ?to))
		(at start (not (is-at ?p ?from)))
		(at end (not (being-processed ?p)))
		(at end (not (busy ?from)))
		(at end (not (busy ?to)))
		(at end (is-at ?p ?to))
	)
    )

    (:durative-action retrieve-base
        :parameters (?p - product ?c - base_color)
        :duration (= ?duration 1)
        :condition (and
		(at start (not (busy m_bs)))
		(at start (not (being-processed ?p)))
		(at start (is-at ?p m_bs))
		(at start (product-initialized ?p))
		(at start (not (has-base ?p)))
		(at end (is-at ?p m_bs))
        )
        :effect (and 
		(at start (busy m_bs))
		(at start (being-processed ?p))
		(at end (not (busy m_bs)))
		(at end (not (being-processed ?p)))
		(at end (has-base ?p))
		(at end (color-of-base ?p ?c))
        )
    )

    (:durative-action ready-ring
        :parameters (?m - rs ?c - ring_color)
        :duration (= ?duration 0.25)
        :condition (and
		(at start (not (busy ?m)))
		(at start (not (ring-loaded ?m ?c)))
        )
        :effect (and 
		(at start (busy ?m))
		(at end (not (busy ?m)))
		(at end (ring-loaded ?m ?c))
        )
    )

    (:durative-action mount-ring1
        :parameters (?m - rs ?p - product ?c - ring_color)
        :duration (= ?duration 0.5)
        :condition (and
		(at start (not (busy ?m)))
		(at start (not (being-processed ?p)))
		(at start (ring-loaded ?m ?c))
		(at start (contains-color ?m ?c))
		(at start (is-at ?p ?m))
		(at start (has-base ?p))
		(at start (not (has-ring1 ?p)))
		(at start (not (has-cap ?p)))
		(at end (is-at ?p ?m))
        )
        :effect (and 
		(at start (busy ?m))
		(at start (being-processed ?p))
		(at end (not (busy ?m)))
		(at end (not (being-processed ?p)))
		(at end (has-ring1 ?p))
		(at end (color-of-ring1 ?p ?c))
		(at end (not (ring-loaded ?m ?c)))
        )
    )

    (:durative-action mount-ring2
        :parameters (?m - rs ?p - product ?c - ring_color)
        :duration (= ?duration 0.5)
        :condition (and
		(at start (not (busy ?m)))
		(at start (not (being-processed ?p)))
		(at start (ring-loaded ?m ?c))
		(at start (contains-color ?m ?c))
		(at start (is-at ?p ?m))
		(at start (has-base ?p))
		(at start (has-ring1 ?p))
		(at start (not (has-ring2 ?p)))
		(at start (not (has-cap ?p)))
		(at end (is-at ?p ?m))
        )
        :effect (and 
		(at start (busy ?m))
		(at start (being-processed ?p))
		(at end (not (busy ?m)))
		(at end (not (being-processed ?p)))
		(at end (has-ring2 ?p))
		(at end (color-of-ring2 ?p ?c))
		(at end (not (ring-loaded ?m ?c)))
        )
    )
 
   (:durative-action load-cap-from-shelf
        :parameters (?m - cs)
        :duration (= ?duration 0.25)
        :condition (and
		(at start (not (busy ?m)))
		(at start (not (cap-loaded ?m)))
        )
        :effect (and 
		(at start (busy ?m))
		(at end (not (busy ?m)))
		(at end (cap-loaded ?m))
        )
    )

    (:durative-action mount-cap
        :parameters (?m - cs ?p - product ?c - cap_color)
        :duration (= ?duration 0.75)
        :condition (and
		(at start (not (busy ?m)))
		(at start (not (being-processed ?p)))
		(at start (cap-loaded ?m))
		(at start (contains-color ?m ?c))
		(at start (is-at ?p ?m))
		(at start (not (has-cap ?p)))
		(at start (has-base ?p))
		(at end (is-at ?p ?m))
        )
        :effect (and 
		(at start (busy ?m))
		(at start (being-processed ?p))
		(at end (not (busy ?m)))
		(at end (not (being-processed ?p)))
		(at end (has-cap ?p))
		(at end (color-of-cap ?p ?c))
		(at end (not (cap-loaded ?m)))
        )
    )
)

