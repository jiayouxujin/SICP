#lang sicp

;tree recursion
; (define (fib n)
;     (cond ((= n 0) 0)
;           ((= n 1) 1)
;           (else (+ (fib (- n 1)) (fib (- n 2))))
;     )
; )

;0 1 1 2 3 5
; (fib 5)

;linear iteratively
(define (fib n)
    (define (fib-iter x y count)
        (if (= count n)
            x
            (fib-iter (+ x y) x (+ count 1))
        )
    )
    (fib-iter 1 0 1)
)
(fib 5)
