#lang sicp

;exercise 1.6 new-if
(define (new-if predicate then-clause else-clause)
    (cond (predicate then-clause)
        (else else-clause)))

;下面会陷入死循环，这是因为applicative-order的解析方式，即进入到new-if，所有arguemnts都会被计算，
;一旦调用new-if就会计算sqrt-iter，就进入到死循环 sqrt-iter -> new-if ->sqrt-iter
(define (sqrt-iter guess x)
    (new-if (good-enough? guess x)
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