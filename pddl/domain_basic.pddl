(define (domain rcll)

    (:requirements 
        :durative-actions
        :numeric-fluents
        :object-fluents
        :typing
        :adl
    )

    (:types
        product attribute color machine - object
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
    )

    (:functions

    )

    (:durative-action retrieve-base
        :parameters (?m - bs ?p - product ?b - base ?c - base_color)
        :duration (= ?duration 1)
        :condition (and
		(at start (not (busy ?m)))
		(at start (is-empty ?p ?b))
		(at start (not (being-processed ?p)))
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

    (:durative-action mount-ring
        :parameters (?m - rs ?p - product ?r - ring ?c - ring_color)
        :duration (= ?duration 0.5)
        :condition (and
		(at start (not (busy ?m)))
		(at start (is-empty ?p ?r))
		(at start (not (being-processed ?p)))
        )
        :effect (and 
		(at start (busy ?m))
		(at start (being-processed ?p))
		(at end (not (busy ?m)))
		(at end (not (being-processed ?p)))
		(at end (not (is-empty ?p ?r)))
		(at end (has-color ?p ?r ?c))
        )
    )

    (:durative-action mount-cap
        :parameters (?m - cs ?p - product ?pc - cap ?c - cap_color)
        :duration (= ?duration 0.75)
        :condition (and
		(at start (not (busy ?m)))
		(at start (is-empty ?p ?pc))
		(at start (not (being-processed ?p)))
        )
        :effect (and 
		(at start (busy ?m))
		(at start (being-processed ?p))
		(at end (not (busy ?m)))
		(at end (not (being-processed ?p)))
		(at end (not (is-empty ?p ?pc)))
		(at end (has-color ?p ?pc ?c))
        )
    )
)


