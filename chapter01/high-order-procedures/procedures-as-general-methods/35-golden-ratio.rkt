#lang sicp
(#%require "finding-fixed-points-of-functions.rkt")

(define golden-ratio
    (fixed-point (lambda(x)(+ 1 (/ 1 x))) 1.0)
)

golden-ratio