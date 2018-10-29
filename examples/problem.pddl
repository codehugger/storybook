;;;
;;; A highly simplified problem for King Arthur
;;;
(define (problem claim-camelot)
    (:domain    arthur-kingdom)

    (:objects   arthur - character
                forest lake - place)

    (:init      (alive arthur)
                (located excalibur lake)
                (at arthur forest)
                (intends arthur (claimed camelot))
    )

    (:goal      (claimed camelot))
)
