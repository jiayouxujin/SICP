#lang sicp

;exercise 1.7
;is to watch how guess changes from one iteration to the next and to stop when the change is a very small fraction of the guess
(define (good-enough? oldvalue newvalue)
    (> 0.01 (/ (abs (- newvalue oldvalue)) oldvalue))
)

(define (sqrt-iter guess x)
    (if (good-enough? guess (improve guess x))
        (improve guess x)
        (sqrt-iter (improve guess x) x)
    )
)

(define (improve guess x)
    (define (average x y)
        (/ (+ x y) 2))
    (average guess (/ x guess))
)


(define (abs x)
    (if (< x 0)
        (- x)
        x
    )
)

(define (sqrt x)
    (sqrt-iter 1.0 x))

;exercise 1.7

;test-smaller-number ->0.00948683298(correct ans) but get 0.03220324381282134
(sqrt 0.00009)

;test-large-number ->陷入死循环【不过很奇怪，更长一点的数反而不会死循环】
(sqrt 900000000000000000000000000000000000000000000000000000000000000000000000000000000000)