#lang sicp

;exercise 2.17

(define (last-pair lst)
    (cond ((null? list)
        (error "last-pair:empty list"))
        ((null? (cdr lst))
            lst
        )
        (else(last-pair (cdr lst)))    
    )
)
(last-pair (list 23 72 149 34))