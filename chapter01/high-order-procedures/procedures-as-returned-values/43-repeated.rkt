#lang sicp

(define (compose f g)
    (lambda(x)(f (g x)))
)

(define (repeated-it f n)
    (define (repeated-iter n res)
        (if (= n 1)
            res
            (repeated-iter (- n 1) (compose f res))
        )
    )
    (repeated-iter n f)
)

(define (repeated f n)
    (if (= n 1)
        f
        (compose f (repeated f (- n 1)))
    )
)

(define square (lambda(x)(* x x)))
((repeated square 2) 5)
((repeated-it square 2) 5)