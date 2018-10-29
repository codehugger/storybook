(define (domain arthur-kingdom)
    (:requirements :adl :domain-axioms :intentionality)
    (:types character place - object
            weapon - item)
    (:constants excalibur - weapon camelot - place)
    (:predicates    (claimed camelot)
                    (alive ?character - character)
                    (at ?character - character ?place - place)
                    (has ?character - character ?item - item)
                    (ruined ?place - place)
                    (located ?item - item ?place - place))

    ;; A character travels from one place to another.
    (:action travel
        :parameters     (?character - character ?from - place ?to - place)
        :precondition   (and
                            (not (= ?from ?to))
                            (alive ?character)
                            (at ?character ?from)
                        )
        :effect         (and
                            (not (at ?character ?from))
                            (at ?character ?to)
                        )
        :agents         (?character)
    )

    ;; A character attacks another character
    (:action attack
        :parameters     (?killer - character ?weapon - weapon ?victim - character ?place - place)
        :precondition   (and
                            (alive ?killer)
                            (at ?killer ?place)
                            (has ?killer ?weapon)
                            (alive ?victim)
                            (at ?victim ?place)
                        )
        :effect         (not (alive ?victim))
        :agents         (?killer)
    )

    ;; A character collects an item from a location.
    (:action collect-weapon
        :parameters     (?collector - character ?weapon - weapon ?place - place)
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
        :parameters     (?ruiner - character ?weapon - weapon ?place - place)
        :precondition   (and
                            (at ?ruiner ?place)
                            (has ?ruiner ?weapon)
                            (not (ruined ?place))
                        )
        :effect         (ruined ?place)
        :agents         (?ruiner)
    )

    ;; A character claims camelot.
    (:action claim-camelot
        :parameters     (?character - character)
        :precondition   (and
                            (has ?character excalibur)
                            (not (claimed camelot))
                        )
        :effect         (claimed camelot)
        :agents         (?character)
    )

    ; (:action ask-for-sword
    ;     :parameters     (?character - character ?swordmaster - character)
    ;     :precondition   (and
    ;                         (has ?swordmaster excalibur)
    ;                         (not (claimed camelot))
    ;                     )
    ;     :effect         (has ?character excalibur)
    ;     :agents         (?character)
    ; )
 )
