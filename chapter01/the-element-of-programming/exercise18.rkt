#lang sicp

;exercise 1.8

(define (good-enough? guess x)  
    (define (abs x)
    (if (< x 0)
        (- x)
        x)
    )
    (define (cube x)(* x x x))

    (< (abs(- (cube guess) x)) 0.001)
)


(define (improve y x)
    (define (square x)(* x x))

    (/ (+ (/ x (square y)) (* 2 y)) 3)
)
(define (cube-iter guess x)
    (if (good-enough? guess x)
        guess
        (cube-iter (improve guess x) x))
)

(define (cube-root x)
    (cube-iter 1.0 x)
)

(cube-root 27.0)
(cube-root (* 5 5 5))