#lang sicp

(define (sqrt-iter guess x)
    (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) x)
    )
)

(define (improve guess x)
    (define (average x y)
        (/ (+ x y) 2))
    (average guess (/ x guess))
)
(define (good-enough? guess x)
    (define (sqaure x)(* x x))
    (< (abs (- (sqaure guess ) x)) 0.001)
)

(define (abs x)
    (if (< x 0)
        (- x)
        x
    )
)

(define (sqrt x)
    (sqrt-iter 1.0 x))

(sqrt 2)