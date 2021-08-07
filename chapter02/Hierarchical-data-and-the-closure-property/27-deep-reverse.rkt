#lang sicp

(define (reverse lst)
    (define (iter res lst)
        (if (null? lst)
            res
            (iter (cons (car lst) res) (cdr lst))
        )
    )
    (iter '() lst)
)

; (define (deep-reverse lst)
;     (define (iter res lst)
;         (if (null? lst)
;             res
;             (iter (cons (reverse (car lst)) res) (cdr lst))
;         )
;     )
;     (iter '() lst)
; )

(define (deep-reverse tree)
    (cond ((null? tree)
        '())
        ((not (pair? tree))
            tree
        )
        (else (list (deep-reverse (cadr tree))  (deep-reverse (car tree))))
    )
)

(define x (list (list 1 2) (list 3 4)))

x
(reverse x)
(deep-reverse x)

; (car x)
; (cadr x)-> car(cdr lst)