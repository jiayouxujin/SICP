#lang sicp

;accumulate
(define (accumulate op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence) (accumulate op initial (cdr sequence)))
    )
)

;filter
(define (filter f seq)
    (if (null? seq)
        seq
        (if (f (car seq))
            (cons (car seq) (filter f (cdr seq)))
            (filter f (cdr seq))
        )
    )
)

;enumerate
(define (enumerate-interval low high)
    (if (> low high)
        nil
        (cons low (enumerate-interval (+ 1 low) high))
    )
)

(define (smallest-divisor n) (find-divisor n 2))

(define (square x)
    (* x x)
)
(define (divides a b)
    (= (remainder b a) 0)
)
(define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
        ((divides test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))
    )
)

(define (prime? n)
    (= n (smallest-divisor n))
)

(define (sum-primes a b)
    (accumulate +
        0
        (filter prime? (enumerate-interval a b)))
)
