#lang sicp

;exercise 2.20
(define (filter f lst)
    (cond ((null? lst)
        lst)
        ((f (car lst))
            (cons (car lst) (filter f (cdr lst)))
        )
        (else (filter f (cdr lst)))
    )
)

(define (same-parity x . w)
    (filter (if (even? x)
        even?
        odd?)
        (cons x w)
    )
)

(same-parity 1 2 3 4 5 6 7)
(same-parity 2 3 4 5 6 7)