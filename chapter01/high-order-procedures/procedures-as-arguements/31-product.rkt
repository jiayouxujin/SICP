#lang sicp

;exercise 1.31

;recursive product
(define (product-recu term a next b)
    (if (> a b)
        1  ;need care
        (* (term a) (product-recu term (next a) next b))
    )
)

;iterative process
(define (product-iter term a next b)
    (define (product-iterative a result)
        (if (> a b)
            result
            (product-iterative (next a) (* (term a) result))
        )
    )
    (product-iterative a 1)
)

;test-factorial
(define (factorial n)
    (product-recu (lambda(x) x) 1 (lambda(x) (+ x 1)) n)
)
(factorial 5)

;test-iterative-product
(define (factorial-iter n)
    (product-iter (lambda(x) x) 1 (lambda(x) (+ x 1)) n)
)
(factorial-iter 5)

;test-pi
;exact->inexact 分数转成小数
(define (pi n)
    (define (term a)
        (if (even? a)(/ (+ a 2) (+ a 1))
            (/ (+ a 1) (+ a 2))
        )
    )
    (* 4 (exact->inexact (product-recu term 1 (lambda(x) (+ x 1)) n)))
)

(pi 1)
(pi 100)