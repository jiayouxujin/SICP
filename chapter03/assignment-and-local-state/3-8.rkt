#lang sicp

;exercise 3.8

(define f
    (lambda(x) x)
)
;right->left
(+ (f 0) (f 1))