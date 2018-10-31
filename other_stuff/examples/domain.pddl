(define (domain arthur-kingdom)
    (:requirements :adl :domain-axioms :intentionality)
    (:types place character item - object)
    (:predicates    (alive ?character - character)
                    (at ?character - character ?place - place)
                    (claimed ?character - character ?place - place)
                    (claimer ?item - item)
                    (claimable ?place - place)
                    (has ?character - character ?item - item)
                    (located ?item - item ?place - place)
                    (ruined ?place - place)
                    (weapon ?item - item))

    ;; A character travels from one place to another.
    (:action travel
        :parameters     (?traveller - character ?from - place ?to - place)
        :precondition   (and
                            (alive ?traveller)
                            (at ?traveller ?from)
                            (not (ruined ?to))
                        )
        :effect         (and
                            (not (at ?traveller ?from))
                            (at ?traveller ?to)
                        )
        :agents         (?traveller)
    )

    ;; A character attacks another character
    (:action attack
        :parameters     (?killer - character ?weapon - item ?victim - character ?place - place)
        :precondition   (and
                            (weapon ?weapon)
                            (alive ?killer)
                            (alive ?victim)
                            (has ?killer ?weapon)
                            (at ?killer ?place)
                            (at ?victim ?place)
                        )
        :effect         (not (alive ?victim))
        :agents         (?killer)
    )

    ;; A character collects an item from a location.
    (:action collect-weapon
        :parameters     (?collector - character ?weapon - item ?place - place)
        :precondition   (and
                            (at ?collector ?place)
                            (located ?weapon ?place)
                            (not (ruined ?place))
                        )
        :effect         (has ?collector ?weapon)
        :agents         (?collector)
    )

    ;; A character ruins a location.
    (:action ruin
        :parameters     (?ruiner - character ?weapon - item ?place - place)
        :precondition   (and
                            (at ?ruiner ?place)
                            (has ?ruiner ?weapon)
                            (not (ruined ?place))
                        )
        :effect         (ruined ?place)
        :agents         (?ruiner)
    )

    ;; A character claims place.
    (:action claim
        :parameters     (?claimant - character ?weapon - item ?place - place)
        :precondition   (and
                            (weapon ?weapon)
                            (at ?claimant ?place)
                            (claimer ?weapon)
                            (claimable ?place)
                            (has ?claimant ?weapon)
                            (not (claimed ?claimant ?place))
                        )
        :effect         (claimed ?claimant ?place)
        :agents         (?claimant)
    )
 )
