#lang sicp

(define inc (lambda(x)(+ x 1)))
(define (double g)
    (lambda(x)(g (g x)))
)

((double inc) 1)
(((double (double double)) inc) 5) ;21