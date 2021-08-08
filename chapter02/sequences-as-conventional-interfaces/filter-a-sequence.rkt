#lang sicp

;square
(define (square x)
    (* x x)
)
;map
(define (map f lst)
    (if (null? lst)
        nil
        (cons (f (car lst)) (map f (cdr lst)))
    )
)

; (map square (list 1 2 3 4 5))

;filter
(define (filter predicate sequence)
    (cond ((null? sequence) nil)
        ((predicate (car sequence))
            (cons (car sequence) (filter predicate (cdr sequence)))
        )
        (else(filter predicate (cdr sequence)))
    )
)

; (filter even? (list 1 2 3 4 5))

;accumulate
(define (accumulate op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence) (accumulate op initial (cdr sequence)))
    )
)

; (accumulate + 0 (list 1 2 3 4))

;enumerate
(define (enumerate-interval low high)
    (if (> low high)
        nil
        (cons low (enumerate-interval (+ 1 low) high))
    )
)

; (enumerate-interval 2 7)

(define (enumerate-tree tree)
    (cond ((null? tree) nil)
        ((not (pair? tree)) (list tree))
        (else (append (enumerate-tree (car tree)) (enumerate-tree (cdr tree))))
    )
)

; (enumerate-tree (list 1 (list 2 (list 3 4)) 5))

(define (sum-odd-squares tree)
    (accumulate + 0 (map square (filter odd? (enumerate-tree tree))))
)

; (sum-odd-squares (list 1 (list 2 (list 3 4) 5)))

(define (fib n)
    (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib (- n 1)) (fib (- n 2))))
    )
)

(define (even-fibs n)
    (accumulate
        cons
        nil
        (filter even? (map fib (enumerate-interval 0 n)))
    )
)

; (even-fibs 10)

(define (list-fib-squares n)
    (accumulate
        cons
        nil
        (map square (map fib (enumerate-interval 0 n)))
    )
)

; (list-fib-squares 10)

(define (product-of-square-of-odd-elemetns sequence)
    (accumulate
        *
        1
        (map square (filter odd? sequence))   
    )
)

(product-of-square-of-odd-elemetns (list 1 2 3 4 5))