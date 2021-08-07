#lang sicp

(define x (cons (list 1 2) (list 3 4)))
;length of a list x is 1 plus length of the cdr of x
(length x)

(define (count-leaves x)
    (cond ((null? x) 0)
        ((not (pair? x)) 1)
        (else (+ (count-leaves (car x)) (count-leaves (cdr x))))
    )
)

(count-leaves x)