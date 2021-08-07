#lang sicp

;exercise 2.23

(define (for-each f lst)
    (cond ((not (null? lst)) 
        (f (car lst))
        (for-each f (cdr lst))
    ))
)

(for-each (lambda(x)
    (newline)
    (display x))
    (list 57 321 88)    
)