#lang sicp

(define (sum term a next b)
    (if (> a b)
        0
        (+ (term a) (sum term (next a) next b))
    )
)

(define (simpson-rule f a b n)
    (define h (/ (- b a) n)); h

    (define (term cur)
        (define basic (* (/ h 3) (f (+ a (* cur h)))))
        (cond ((or (= cur 0) (= cur n)) basic)
            ((even? cur) (* 2 basic))
            (else (* 4 basic))
        )
    )

    ;next
    (define (next x)
        (+ x 1)
    )
    (if (odd? n)(" n can't be odd")
        (sum term (exact->inexact 0) next n)
    )
)

(define (cube x)
    (* x x x)
)

(simpson-rule cube 0 1 100)
(simpson-rule cube 0 1 1000)