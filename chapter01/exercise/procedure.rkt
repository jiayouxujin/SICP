#lang sicp
;sauqre
(define (square x)(* x x))
(square 5)
;sum-of-square
(define (sum-of-square x y)(+ (square x) (square y)))
(sum-of-square 3 4)
;further procedures
(define (f a)
    (sum-of-square (+ a 1) (* a 2))
)
(f 5)
;cond
; (define (abs x)
;     (cond ((> x 0)x)
;           ((= x 0)0)
;           ((< x 0)(- x))))

; (abs -5)
;further abs
; (define (abs x)
;     (cond ((< x 0) (- x))
;           (else x)))
; (abs 5)
; (abs -5)
;more abs
; (define (abs x)
;     (cond ((< x 0) (- x))
;             (x)))
; (abs 6)
; (abs -6)

;if abs
(define (abs x)
    (if (< x 0)
        (- x)
        x))
(abs -7)
(abs 7)
