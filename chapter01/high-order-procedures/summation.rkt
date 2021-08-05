#lang sicp

(define (sum term a next b)
    (if (> a b)
        0
        (+ (term a) (sum term (next a) next b))
    )
)

;cube sum
(define (inc n)
    (+ n 1)
)
(define (cube n)
    (* n n n)
)
(define (sum-cube a b)
    (sum cube a inc b)
)

(sum-cube 1 10) ;3205

; sum-integer
(define (identity n)
    n
)

(define (sum-integers a b)
    (sum identity a inc b)
)

(sum-integers 1 10) ;55