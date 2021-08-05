#lang sicp

;exercise 1.17
(define (multi a b)
    (cond((= b 0) 0)
         ((even? b) (double (multi a (halve b))))
         (else(+ a (multi a (- b 1))))
    )
)

;double :doubles an integer
(define (double x)
    (+ x x)
)

;halve :divides an even integer by 2
(define (halve x)
    (/ x 2)
)

(multi 2 3)
(multi 3 3)
(multi 5 4)