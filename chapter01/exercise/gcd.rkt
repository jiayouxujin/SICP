#lang racket

;(gcd a b)=(gcd b r) which r is the result of (remainder a b)
(define (gcd a b)
    (if (=  b 0)
        a
        (gcd b (remainder a b))
    )
)

(provide (all-defined-out))