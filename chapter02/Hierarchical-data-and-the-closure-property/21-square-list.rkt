#lang sicp
; (#%require "mapping-over-lists.rkt")
;exercise 2.21

(define (square x)
    (* x x)
)
(define (square-list items)
    (if (null? items)
        nil
        (cons (square (car items)) (square-list (cdr items)))
    )
)

(define (map f items)
    (if (null? items)
        nil
        (cons (f (car items)) (map f (cdr items)))
    )
)
(define (square-list2 items)
    (map square items)
)

(square-list (list 1 2 3 4))
(square-list2 (list 1 2 3 4))