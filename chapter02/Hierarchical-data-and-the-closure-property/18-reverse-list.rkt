#lang racket

(define (reverse lst)
    (define (reverse-iter res lst)
        (if (null? lst)
            res
            (reverse-iter (cons (car lst) res) (cdr lst))
        )
    )
    (reverse-iter (list ) lst)
)
(provide (all-defined-out))

; (reverse (list 1 2 3 4))