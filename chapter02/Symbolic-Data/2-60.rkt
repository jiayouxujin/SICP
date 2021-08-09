#lang sicp

;exercise 2.60

(define (element-of-set? x set)
    (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))
    )
)

; (element-of-set? '2 '(1 2 3 3 2 1))

(define (adjoin-set x set)
    (cons x set)
)

; (adjoin-set '2 '(1 2 3 3 2 1))

(define (union-set set1 set2)
    (append set1 set2)
)

; (union-set '(1 2 3) '(2 3 4))

(define (intersection-set set1 set2)
    (define (iter res set1)
        (cond ((null? set1) res)
            ((element-of-set? (car set1) set2) (iter (adjoin-set (car set1) res) (cdr set1)))
            (else (iter res (cdr set1)))
        )   
    )
    (iter '() set1)
)

; (intersection-set '(1 2 3 3 2 1) '(1 2 3))
