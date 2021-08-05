#lang racket
(#%require "../procedures-as-general-methods/finding-fixed-points-of-functions.rkt")

(define average (lambda(x y) (/ (+ x y) 2)))

(define (average-damp f)
    (lambda(x) (average x (f x)))
)

; ((average-damp (lambda(x) (* x x))) 10)

(define (sqrt x)
    (fixed-point (average-damp (lambda(y) (/ x y))) 1.0)
)

; (sqrt 4)

(define square (lambda(x) (* x x)))
(define (cube-root x)
    (fixed-point (average-damp (lambda(y)(/ x (square y)))) 1.0)
)

(define (deriv g)
    (lambda(x) (/ (- (g (+ x dx)) (g x)) dx))
)
(define dx 0.00001)
; ((deriv (lambda(x)(* x x x))) 5)

(define (newton-transform g)
    (lambda(x) (- x (/ (g x) ((deriv g) x))))
)

(define (newtons-method g guess)
    (fixed-point (newton-transform g) guess)
)

(define (sqrt-newton x)
    (newtons-method (lambda(y) (- (square y) x)) 1.0)
)

; (sqrt-newton 2)

(provide (all-defined-out))