#lang sicp

;exercise 1.20
(define (gcd a b)
    (if ((= b 0) a)
        ((gcd b (remainder a b)))
    )
)

;applicative-order 5次