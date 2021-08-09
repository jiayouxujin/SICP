#lang sicp

;exercise 2.62

;(1 2 3 4)
;(2 3 4)
(define (union-set set1 set2)
    (cond 
        ((null? set1) set2)
        ((null? set2) set1)
        (else 
             (let ((a1 (car set1))
            (a2 (car set2)))
            (cond
                ((> a1 a2)(cons a2 (union-set set1 (cdr set2))))
                ((< a1 a2) (cons a1 (union-set (cdr set1) set2)))
                (else (cons a1 (union-set (cdr set1) (cdr set2))))
            )    
        )  
        )
    )
)

(union-set '(1 2 3 4) '(2 3 4))