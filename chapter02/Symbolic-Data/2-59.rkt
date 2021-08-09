#lang sicp



(define (element-of-set? x set)
    (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))   
    )
)

(define (adjoin-set x set)
    (if (element-of-set? x set)
        set
        (cons x set)
    )
)

;exercise 2.59
(define (union-set set1 set2)
    (if (null? set1)
        set2
        (union-set (cdr set1) (adjoin-set (car set1) set2))
    )
)

(union-set (list 1 2 3 4) (list 3 4 5))