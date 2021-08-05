#lang sicp
(#%require "average-damp.rkt")

(define cube (lambda(x)(* x x x)))
(define (cubic a b c)
    (lambda(x) (+ (cube x) (* a (square x)) (* b x) c))
)

(newtons-method (cubic 3 2 1) 1)
(newtons-method (cubic 2 5 5) 1)