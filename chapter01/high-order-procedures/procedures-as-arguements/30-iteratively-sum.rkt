#lang sicp

;exercise 1.30
(define (sum term a next b)
    (define (iter a result)
        (if (> a b)
            result
            (iter (next a) (+ (term a) result))
        )
    )
    (iter a 0)
)

;test

(define (next x)(
    + x 1))

(define (term x) x)

(sum term 1 next 10)