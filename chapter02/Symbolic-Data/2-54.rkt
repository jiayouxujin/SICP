#lang sicp

;exercise 2.54

(define (equal? lst1 lst2)
    (if (and (null? lst1) (null? lst2))
        true
        (if (or (null? lst1) (null? lst2))
            false
            (if (not (and (pair? lst1) (pair? lst2)))
                (eq? lst1 lst2)
                (and (equal? (car lst1) (car lst2)) (equal? (cdr lst1) (cdr lst2)))
            )        
        )
    )
)

(equal? '(this is a list) '(this is a list))
(equal? '(this is a list) '(this (is a) list))
