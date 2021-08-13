#lang sicp

;exercise 3.13

(define (make-cycle x)
    (set-cdr! (last-pair x) x)
x)

(define (last-pair x)
    (if (null? (cdr x))
        x
        (last-pair (cdr x))
    )
)

(define z (make-cycle (list 'a 'b 'c)))
z

(last-pair z) ;陷入死循环