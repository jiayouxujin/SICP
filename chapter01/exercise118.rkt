#lang sicp

;exercise 1.18

(define (double x)
    (+ x x)
)
(define (halve x)
    (/ x 2)
)
(define (multi a b)
    (multi-iter a b 0)
)

(define (multi-iter a b res)
    (cond((= b 0) res)
        ((even? b) (multi-iter (double a) (halve b) res))
        (else(multi-iter a (- b 1) (+ res a)))
    )
)

(multi 2 3)
(multi 5 4)