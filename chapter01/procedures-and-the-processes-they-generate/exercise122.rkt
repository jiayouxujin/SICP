#lang sicp
(#%require "../lib.scm")

(define (smallest-divisor n)
    (find-divisor n 2)
)

(define (find-divisor n test-divisor)
    (cond((> (square test-divisor) n) n)
        ((divide test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))
    )
)

(define (divide a b)
    (= (remainder b a) 0)
)


;exercise 1.22
(define (time-prime-test n)
    (newline)
    (display n)
    (start-prime-test n (runtime))
)

(define (start-prime-test n start-time)
    (if (prime? n)
        (report-prime (- (runtime) start-time))
    )
)   

(define (report-prime elapsed-time)
    (display " *** ")
    (display elapsed-time)
)


(define (prime? n)
    (= (smallest-divisor n) n)
)

;generate next odd number
(define (next-odd n)
    (if (even? n) (+ 1 n)
        (+ 2 n)
    )
)

(define (continue-primes n count)
    (cond ((= count 0)
        (display "are primes. and the elapsed-time is ")
        )
        ((prime? n)
            (display n)
            (display " ")
            (continue-primes (next-odd n) (- count 1)))
        (else(continue-primes (next-odd n) count))
        )
)

(define (search-for-primes n)
    (define start-time (runtime))
    (continue-primes n 3)
    (- (runtime) start-time)
)

(search-for-primes 1000)
(search-for-primes 10000)
(search-for-primes 100000)