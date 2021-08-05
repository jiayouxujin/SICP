#lang sicp

(define (exp b n)
    (exp-iter b n 1)
)

(define (exp-iter b n a)
    (cond ((= n 0)a)
          ((even? n)(exp-iter (* b b) (/ n 2) a))
          (else (exp-iter b (- n 1) (* a b)))
    )
)

(define (even? n)
    (= (remainder n 2) 0)
)

(exp 2 1)
(exp 4 4)

;4 5 1
;4 4 4
;4 2 64
;4 1 256