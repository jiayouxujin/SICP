#lang sicp

;exercise 1.44

(define dx 0.00001)
(define (smooth f)
    (lambda(x)(/ (+ (f x) (f (+ x dx)) (f (- x dx))) 3))
)

((smooth (lambda(x)(* x x))) 5)


(define (smooth-n-times f n)
    (if (= n 1)
        (smooth f)
        (smooth (smooth-n-times f (- n 1)))
    )
)

((smooth-n-times (lambda(x)(* x x)) 10)5)