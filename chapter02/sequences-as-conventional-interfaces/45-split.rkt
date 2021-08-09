#lang sicp
(#%require sicp-pict)

;exercise 2.45

(define (split first second)
    (lambda(painter n)
        (if (= n 0)
            painter
            (let ((smaller ((split first second) painter (- n 1))))
                (first painter (second smaller smaller))
            )
        )
    )
)

(define up-split (split below beside))
(define right-split (split beside below))

(paint (up-split einstein 1))
(paint (right-split einstein 1))