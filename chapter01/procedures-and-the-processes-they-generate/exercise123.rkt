#lang sicp
(#%require "../lib.scm")

(define (smallest-divisor n)
    (find-divisor n 2)
)

(define (find-divisor n test-divisor)
    (cond ((> (square test-divisor)  n) n)
        ((divide? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))
    )
)

(define (divide? a b)
    (= (remainder b a) 0)
)

;exercise 1.23
(define (next test-divisor)
    (if (= test-divisor 2) 3
        (+ test-divisor 2)
    )
)

(define (prime? n)
    (= (smallest-divisor n) n)
)
