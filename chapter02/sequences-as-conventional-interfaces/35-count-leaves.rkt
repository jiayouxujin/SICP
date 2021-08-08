#lang sicp

;accumulate
(define (accumulate op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence) (accumulate op initial (cdr sequence)))
    )
)

(define (enumerate-tree tree)
    (cond ((null? tree) nil)
        ((not (pair? tree)) (list tree))
        (else (append (enumerate-tree (car tree)) (enumerate-tree (cdr tree))))
    )
)

(define (map f lst)
    (if (null? lst)
        nil
        (cons (f (car lst)) (map f (cdr lst)))
    )
)



;exercise 2.35
(define (count-leaves t)
    (accumulate +  0 (map (lambda(x)
            (if (pair? x)
                (count-leaves x)
                1
            )
    ) t))
)

(count-leaves (list (list 1 2) (list 3 4)))