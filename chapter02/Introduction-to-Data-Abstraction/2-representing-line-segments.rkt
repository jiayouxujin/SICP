#lang sicp

;define point
;constructor
(define (make-point x y)
    (cons x y)
)
;selector
(define (x-point x)
    (car x)
)
(define (y-point x)
    (cdr x)
)

;print
(define (print-point p)
    (newline)
    (display "(")
    (display (x-point p))
    (display ",")
    (display (y-point p))
    (display ")")
)

;define segment
(define (make-segment x y)
    (cons x y)
)
(define (start-segment x)
    (car x)
)
(define (end-segment x)
    (cdr x)
)

;define midpoint-segment
(define (midpoint-segment x)
    (make-point (/ (+ (x-point (start-segment x)) (x-point (end-segment x))) 2) (/ (+ (y-point (start-segment x)) (y-point (end-segment x))) 2))
)

(print-point(midpoint-segment(make-segment (make-point 1 2) (make-point 3 4))))
