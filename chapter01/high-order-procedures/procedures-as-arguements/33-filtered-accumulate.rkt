#lang sicp
(#%require "../../exercise/prime-number.rkt")

;recu
(define (filtered-accumulate combiner filtered? null-value term a next b)
    (cond((> a b)
        null-value)
        ((filtered? a)
            (combiner (term a) (filtered-accumulate combiner filtered? null-value term (next a) next b))
        )
        (else(combiner null-value (filtered-accumulate combiner filtered? null-value term (next a) next b)))    
    )
)

;iter
(define (filtered-accumulate-iter combiner filtered? null-value term a next b)
    (define (accmulate-iter a result)
        (cond((> a b) result)
            ((filtered? a)
                (accmulate-iter (next a) (combiner (term a) result))
            )
            (else(accmulate-iter (next a) (combiner null-value result)))
        )
    )
    (accmulate-iter a null-value)
)


;the sum of prime number
(define (sum-prime a b)
    (filtered-accumulate + prime? 0 (lambda(x) x) a (lambda(x)(+ x 1)) b)
)

(sum-prime 1 10)


;the product of relatively prime to n
(define (product-relatively-prime a b)
    (define (relative-gcd? x)
        (= (gcd x b) 1)
    )
    (filtered-accumulate * relative-gcd? 1 (lambda(x) x) a (lambda(x) (+ 1 x)) b )
)

(product-relatively-prime 1 10)

;test-iter
(define (sum-prime-iter a b)
    (filtered-accumulate-iter + prime? 0 (lambda(x) x) a (lambda(x)(+ x 1)) b)
)

(sum-prime-iter 1 10)

;test-product-iter
(define (product-relatively-prime-iter a b)
    (define (relative-gcd? x)
        (= (gcd x b) 1)
    )
    (filtered-accumulate * relative-gcd? 1 (lambda(x) x) a (lambda(x) (+ 1 x)) b )
)
(product-relatively-prime-iter 1 10)