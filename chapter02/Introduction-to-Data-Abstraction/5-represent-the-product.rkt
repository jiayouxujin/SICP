#lang sicp
(#%require "../../chapter01/exercise/exponentiation.rkt")

;exercise 2.5

(define (cons x y)
    (* (fast-expt 2 x)
        (fast-expt 3 y)
    )
)

(define (car x)
    (define (car-iter count x)
        (if (not (= (remainder x 2) 0))
            count
            (car-iter (+ 1 count) (/ x 2))
        )
    )
    (car-iter 0 x)
)

(define (cdr x)
    (define (cdr-iter count x)
        (if (not (= (remainder x 3) 0)) 
            count
            (cdr-iter (+ 1 count) (/ x 3))
        )
    )
    (cdr-iter 0 x)
)

(cons 2 3)
(car (cons 2 3))
(cdr (cons 2 3))