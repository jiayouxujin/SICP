#lang sicp
(#%require "../../lib.scm")


(define (expmod base exp m)
    (cond ((= exp 0) 1)
        ((even? exp)
            (remainder (square (expmod base (/ exp 2) m)) m)
        )
        (else
        (remainder (* base (expmod base (- exp 1) m)) m))
    )
)

(define (fermat-test n)
    (define (try-it a)
        (= (expmod a n n) a)
    )
    (try-it (+ 1 (random (- n 1))))
)

(define (fast-prime? n time)
    (cond ((= time 0) true)
        ((fermat-test n) (fast-prime? n (- time 1)))
        (else false)
    )
)

(fast-prime? 2 5)
(fast-prime? 9 5)