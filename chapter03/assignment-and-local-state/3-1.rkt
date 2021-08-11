#lang sicp

;exercise 3.1

(define (make-accumulator sum)
    (lambda(amount)
        (set! sum (+ sum amount))
    sum)
)

(define A (make-accumulator 5))
(A 10)
(A 10)
(define B (make-accumulator 5))
(B 5)