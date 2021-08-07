#lang sicp

;exercise 2.30

(define (map proc items)
    (if (null? items)
        nil
        (cons (proc (car items)) (map proc (cdr items)))
    )
)

(define (square x)
    (* x x)
)
(define (square-tree tree)
    (map (lambda(sub-tree)
        (if (pair? sub-tree)
            (square-tree sub-tree)
            (square sub-tree)
        )
    )
    tree)
)

(square-tree
    (list 1
        (list 2 (list 3 4) 5 )
            (list 6 7)))