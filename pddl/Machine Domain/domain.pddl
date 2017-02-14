(define (domain rcll)

    (:requirements 
        :durative-actions
        :numeric-fluents
        :object-fluents
        :typing
        :adl
    )

    (:types
        attribute color machine - object
	base ring cap - attribute
	bs rs cs ds - machine
	rs1 rs2 - rs
	cs1 cs2 - cs
    )

    (:constants
	null - color
	black - color
	silver - color
	red - color
	blue - color
	yellow - color
	orange - color
	green - color
	gray - color
    )

    (:predicates
        (has-color ?a - attribute ?c - color)
	(in-domain ?a - attribute ?c - color)
	(base-available ?m - machine)
	(busy ?m - machine)
	(has-output ?m - machine)
	(has-base ?m - machine)
	(ring-is-ready ?r - rs)
	(cap-is-ready ?c - cs)
    )

    (:functions
	has-color (
    )

    (:durative-action dispatch-base
        :parameters (?m - bs)
        :duration (= ?duration 1)
        :condition (and
		(at start (not (busy ?m)))
		;(at start (not (has-output ?m)))
		(at start (not (has-base ?m)))
        )
        :effect (and 
		(at start (busy ?m))
		;(over all (busy ?m))
		(at end (not (busy ?m)))
		;(at end (has-output ?m))
		(at end (has-base ?m))
        )
    )

    (:durative-action retrieve-base
        :parameters (?c - color ?m - bs ?attr - base)
        :duration (= ?duration 1)
        :condition (and
		(at start (not (busy ?m)))
		;(at start (not (has-output ?m)))
		(at start (not (has-base ?m)))
		(at start (in-domain ?attr ?c))
		(at start (not (has-color ?attr ?c)))
        )
        :effect (and 
		(at start (busy ?m))
		(over all (busy ?m))
		(at end (not (busy ?m)))
		;(at end (has-output ?m))
		(at end (has-color ?attr ?c))
        )
    )

    (:durative-action rs-receive-base
        :parameters (?r - rs ?m - machine)
        :duration (= ?duration 1)
        :condition (and
		(at start (not (busy ?r)))
		(at start (has-base ?m))
		(at start (not (ring-is-ready ?r)))
        )
        :effect (and
		(at start (busy ?r))
		(over all (busy ?r))
		(at end (not (has-base ?m)))
		(at end (not (busy ?r)))
		(at end (ring-is-ready ?r))
        )
    )
    
    (:durative-action rs-place-ring
        :parameters (?r - rs ?c - color ?attr - attribute)
        :duration (= ?duration 1)
        :condition (and
		(at start (not (busy ?r)))
		(at start (ring-is-ready ?r))
		(at start (in-domain ?attr ?c))
		(at start (not (has-color ?attr ?c)))
        )
        :effect (and
		(at start (busy ?r))
		(at start (not (ring-is-ready ?r)))
		(over all (busy ?r))
		(at end (not (busy ?r)))
		(at end (has-color ?attr ?c))
        )
    )

    (:durative-action cs-retrieve-cap
        :parameters (?c - cs)
        :duration (= ?duration 1)
        :condition (and
		(at start (not (busy ?c)))
		(at start (not (has-base ?c)))
		(at start (not (cap-is-ready ?c)))
        )
        :effect (and
		(at start (busy ?c))
		(over all (busy ?c))
		(at end (has-base ?c))
		(at end (not (busy ?c)))
		(at end (cap-is-ready ?c))
        )
    )
    
    (:durative-action cs-mount-cap
        :parameters (?m - cs ?c - color ?attr - attribute)
        :duration (= ?duration 1)
        :condition (and
		(at start (not (busy ?m)))
		(at start (ring-is-ready ?m))
		(at start (in-domain ?attr ?c))
		(at start (not (has-color ?attr ?c)))
        )
        :effect (and
		(at start (busy ?m))
		(at start (not (ring-is-ready ?m)))
		(over all (busy ?m))
		(at end (not (busy ?m)))
		(at end (has-color ?attr ?c))
        )
    )

    (:durative-action clear-base
        :parameters (?m - machine)
        :duration (= ?duration 1)
        :condition (and
		(at start (not (busy ?m)))
		(at start (has-base ?m))
        )
        :effect (and
		(at start (busy ?m))
		(over all (busy ?m))
		(at end (not (busy ?m)))
		(at end (not (has-base ?m)))
        )
    )
    
    (:durative-action deposit-in-ds
        :parameters (?m - ds)
        :duration (= ?duration 1)
        :condition (and
		(at start (not (busy ?m)))
        )
        :effect (and
		(at start (busy ?m))
		(over all (busy ?m))
		(at end (not (busy ?m)))
        )
    )

)


