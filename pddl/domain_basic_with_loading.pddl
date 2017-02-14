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
	base ring cap - attribute
	bs rs cs ds - machine
	rs1 rs2 - rs
	cs1 cs2 - cs
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
    )

    (:predicates
        (has-color ?p - product ?a - attribute ?c - color)
	(is-empty ?p - product ?a - attribute)
	(being-processed ?p - product)
	(busy ?m - machine)
	(cap-loaded ?m - cs)
	(ring-loaded ?m - rs ?c - ring-color)
	(base-available ?m - machine)
	(contains-color ?m - machine ?c - color)
	(is-at ?o - locatable ?l - location)
    )

    (:functions

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
        :parameters (?m - bs ?p - product ?b - base ?c - base_color)
        :duration (= ?duration 1)
        :condition (and
		(at start (not (busy ?m)))
		(at start (is-empty ?p ?b))
		(at start (not (being-processed ?p)))
		(at start (is-at ?p ?m))
		(at end (is-at ?p ?m))
        )
        :effect (and 
		(at start (busy ?m))
		(at start (being-processed ?p))
		(at end (not (busy ?m)))
		(at end (not (being-processed ?p)))
		(at end (not (is-empty ?p ?b)))
		(at end (has-color ?p ?b ?c))
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

    (:durative-action mount-ring
        :parameters (?m - rs ?p - product ?r - ring ?c - ring_color)
        :duration (= ?duration 0.5)
        :condition (and
		(at start (not (busy ?m)))
		(at start (is-empty ?p ?r))
		(at start (not (being-processed ?p)))
		(at start (ring-loaded ?m ?c))
		(at start (contains-color ?m ?c))
		(at start (is-at ?p ?m))
		(at end (is-at ?p ?m))
        )
        :effect (and 
		(at start (busy ?m))
		(at start (being-processed ?p))
		(at end (not (busy ?m)))
		(at end (not (being-processed ?p)))
		(at end (not (is-empty ?p ?r)))
		(at end (has-color ?p ?r ?c))
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
        :parameters (?m - cs ?p - product ?pc - cap ?c - cap_color)
        :duration (= ?duration 0.75)
        :condition (and
		(at start (not (busy ?m)))
		(at start (is-empty ?p ?pc))
		(at start (not (being-processed ?p)))
		(at start (cap-loaded ?m))
		(at start (contains-color ?m ?c))
		(at start (is-at ?p ?m))
		(at end (is-at ?p ?m))
        )
        :effect (and 
		(at start (busy ?m))
		(at start (being-processed ?p))
		(at end (not (busy ?m)))
		(at end (not (being-processed ?p)))
		(at end (not (is-empty ?p ?pc)))
		(at end (has-color ?p ?pc ?c))
		(at end (not (cap-loaded ?m)))
        )
    )
)


