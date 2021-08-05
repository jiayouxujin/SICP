#lang sicp

(define (f g) (g 2))

(f (lambda(x) (* x x)))
(f (lambda(z) (* z (+ z 1))))
;(f f)->(2 2)->expected a procedure that can be applied to arguments