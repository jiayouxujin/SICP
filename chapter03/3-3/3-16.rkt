#lang sicp

;exercise 3.16

(define nil '())
(define (count-pairs x)
    (if (not (pair? x))
        0
        (+ (count-pairs (car x)) (count-pairs (cdr x)) 1)
    )
)

; (define p3 (cons 'c nil))
; (define p2 (cons 'b p3))
; (define p1 (cons 'a p2))
; (count-pairs p1)->3

; (define p3 (cons 'c nil))
; (define p2 (cons p3 nil))
; (define p1 (cons p2 p3))
; (count-pairs p1)->4

; (define p3 (cons 'a nil))
; (define p2 (cons p3 p3))
; (define p1 (cons p2 p2))
; (count-pairs p1)->7


