;;;
;;; A highly simplified problem for King Arthur
;;;
(define
    (problem    claim-camelot)
    (:domain    arthur-kingdom)

    (:objects   arthur morgana - character
                forest lake fortress camelot - place
                excalibur - item)

    (:init      (player arthur)
                (alive arthur)
                (alive morgana)
                (at arthur forest)
                (at morgana fortress)
                (at excalibur lake)
                (claimable camelot)
                (claimer excalibur)
                (intends arthur (alive arthur))
                (intends arthur (claimed arthur camelot))
                (intends arthur (not (alive morgana)))
                (intends morgana (alive morgana))
                (intends morgana (claimed morgana camelot))
                (intends morgana (not (alive arthur))))

    (:goal      (claimed arthur camelot))
)
