#lang sicp

;exercise 1.32

;recursive
(define (accmulate-recu combiner null-value term a next b)
    (if (> a b)
        null-value
        (combiner (term a) (accmulate-recu combiner null-value term (next a) next b))
    )
)

;iter
(define (accmulate-iter combiner null-value term a next b)
    (define (accmulate-iterative a result)
        (if (> a b)
            result
            (accmulate-iterative (next a) (combiner (term a) result))
        )
    )

    (accmulate-iterative a null-value)
)

;mul
(define (multi a b)
    (accmulate-recu (lambda(x y)(* x y)) 1 (lambda(x) x) a (lambda(x) (+ x 1)) b)
)

(multi 1 10)

;mul
(define (multi-iter a b)
    (accmulate-iter (lambda(x y)(* x y)) 1 (lambda(x) x) a (lambda(x) (+ x 1)) b)
)

(multi-iter 1 10)

;add
(define (add a b)
    (accmulate-recu (lambda(x y) (+ x y)) 0 (lambda(x) x) a (lambda(x) (+ x 1)) b)
)

(add 1 10)

(define (add-iter a b)
     (accmulate-iter (lambda(x y) (+ x y)) 0 (lambda(x) x) a (lambda(x) (+ x 1)) b)
)

(add-iter 1 10)