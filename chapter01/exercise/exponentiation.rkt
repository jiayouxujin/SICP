#lang racket

;linear recursive
(define (expt b n)
    (if (= n 0)
        1
        (* b (expt b (- n 1)))
    )
)

; (expt 2 1)
; (expt 4 5)

;linear iteration
(define (expt-it b n)
    (define (expt-iter res count)
        (if (= count n)
            res
            (expt-iter (* res b) (+ count 1))
        )
    )
    (expt-iter 1 0)
)

; (expt-it 2 1)
; (expt-it 4 5)

;fast-expt
(define (fast-expt b n)
    (cond ((= n 0)1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))
    )
)

(define (square x)
    (* x x)
)
(define (even? n)
    (=  (remainder n 2) 0)
)


; (fast-expt 2 1)
; (fast-expt 4 5)
(provide (all-defined-out))