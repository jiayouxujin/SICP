#lang sicp

;exercise 2.75
;message passing
(define (make-from-mag-ang x y)
    (lambda(op)
        (cond ((eq? op 'real-part) (* x (cos y)))
            ((eq? op 'imag-part) (* x (sin y)))
            ((eq? op 'manitude) x)
            ((eq? op 'angle) y)
            (else (error "Unknown op: MAKE-FROM-MAG-ANG "op))
        )
    )
)