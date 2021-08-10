#lang sicp

(define (add-vect x y)
    (make-vect (+ (xcor-vect x) (xcor-vect y)) (+ (ycor-vect x) (ycor-vect y)))
)

(define (sub-vect x y)
    (make-vect (- (xcor-vect x) (xcor-vect y)) (- (ycor-vect x) (ycor-vect y)))
)

(define (scale-vect s x)
    (make-vect (* s (xcor-vect x)) (* s (ycor-vect x)))
)

(define (make-vect x y)
    (cons x y)
)

(define (xcor-vect x)
    (car x)
)

(define (ycor-vect y)
    (cdr y)
)

;exercise 2.48
(define (make-segment x y)
    (cons x y)
)

(define (start-segment x)
    (car x)
)

(define (end-segment x)
    (cdr x)
)

(define seg (make-segment (make-vect 0 0) (make-vect 1 1)))
(start-segment seg)
(end-segment seg)