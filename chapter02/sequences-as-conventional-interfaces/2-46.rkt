#lang sicp

;exercise 2.46
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
