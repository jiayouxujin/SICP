#lang sicp
(#%require "../procedures-as-general-methods/finding-fixed-points-of-functions.rkt")

(define average (lambda(x y) (/ (+ x y) 2)))
(define (average-damp f)
    (lambda(x) (average x (f x)))
)

(define (fixed-point-of-transform g transform guess)
    (fixed-point (transform g) guess)
)

(define (sqrt x)
    (fixed-point-of-transform (lambda (y) (/ x y)) average-damp 1.0)
)

(sqrt 2)