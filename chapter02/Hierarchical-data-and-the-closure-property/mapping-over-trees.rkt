#lang sicp

(define (scale-tree tree factor)
    (cond ((null? tree) nil)
        ((not (pair? tree)) 
        (* tree factor))
        (else(cons(scale-tree (car tree) factor) (scale-tree (cdr tree) factor)))
    )
)

(scale-tree (list 1 (list 2 (list 3 4) 5) (list  7)) 10)

(define (map proc items)
    (if (null? items)
        nil
        (cons (proc (car items)) (map proc (cdr items)))
    )
)

(define (scale-tree-2 tree factor)
    (map (lambda(sub-tree)
        (if (pair? sub-tree)
            (scale-tree-2 sub-tree factor)
            (* sub-tree factor))
    )
    tree)
)

(scale-tree-2 (list 1 (list 2 (list 3 4) 5) (list  7)) 10)