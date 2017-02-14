(define (domain rcll)

    (:requirements 
        :durative-actions
        :numeric-fluents
        :object-fluents
        :typing
        :adl
    )

    (:types
        locatable location - object
        robot machine - locatable
    )

    (:constants

    )

    (:predicates
        (at ?a - locatable ?l - location)
        (gripper-free ?r - robot)
        (occupied ?l - location)
        (busy ?r - robot)
        (loading-tray-free ?m - machine)
        (output-available ?m - machine)
    )

    (:functions
        (drive-time ?from ?to - location) - number
    )

    (:durative-action move
        :parameters (?r - robot ?from ?to - location)
        :duration (= ?duration (drive-time ?from ?to))
        :condition 
        (and
            (at start (at ?r ?from))
            (at start (not (busy ?r)))
            (at end (not (occupied ?to)))
        )
        :effect 
        (and 
            (at start (not (occupied ?from)))
            (at start (busy ?r))
            (at end (occupied ?to))
            (at end (at ?r ?to))
            (at end (not (busy ?r)))
        )
    )
    (:durative-action load-machine
        :parameters (?r - robot ?m - machine ?l - location)
        :duration (= ?duration 1)
        :condition (and
            (at start (at ?r ?l))
            (at start (at ?m ?l))
            (at start (not (gripper-free ?r)))
            (at start (loading-tray-free ?m))
            (at start (not (busy ?r)))
            (over all (at ?r ?l))
        )
        :effect (and
            (at start (busy ?r))
            (at end (gripper-free ?r))
            (at end (not (loading-tray-free ?m)))
            (at end (not (busy ?r)))
        )
    )
    
    (:durative-action unload-machine
        :parameters (?r - robot ?m - machine ?l - location)
        :duration (= ?duration 1)
        :condition (and
            (at start (at ?r ?l))
            (at start (at ?m ?l))
            (at start (gripper-free ?r))
            (at start (output-available ?m))
            (at start (not (busy ?r)))
            (over all (at ?r ?l))
        )
        :effect (and
            (at start (busy ?r))
            (at end (not (gripper-free ?r)))
            (at end (not (output-available ?m)))
            (at end (not (busy ?r)))
        )
    )
)
