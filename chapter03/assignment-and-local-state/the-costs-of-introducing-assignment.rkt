#lang sicp


(define (make-simpliified-withdraw balance)
    (lambda(amount)
        (set! balance (- balance amount))   
    balance)
)

(define W (make-simpliified-withdraw 25))
(W 20)
(W 10)

(define (make-decrementer balance)
    (lambda(amount)
        (- balance amount)
    )
)
(define D (make-decrementer 25))
(D 20)
(D 10)

(define (factorial n)
    (define (iter product counter)
        (if (> counter n)
            product
            (iter (* counter product) (+ counter 1))
        )
    )
    (iter 1 1)
)

(factorial 5)