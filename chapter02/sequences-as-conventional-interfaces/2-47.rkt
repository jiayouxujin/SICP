#lang sicp

;exercise 2.47

(define (make-frame origin edge1 edge2)
    (list origin edge1 edge2)
)

(define frame1 (make-frame 1 2 3))
(define (origin x)
    (car x)
)
(origin frame1)

(define (edge1 x)
    (cadr x)
)
(edge1 frame1)

(define (edge2 x)
    (caddr x)
)
(edge2 frame1)


(define (make-frame-2 origin edge1 edge2)
    (cons origin (cons edge1 edge2))
)
(define frame2 (make-frame 1 2 3))
(define (origin-2 x)
    (car x)
)
(origin-2 frame2)
(define (edge1-2 x)
    (cadr x)
)
(edge1-2 frame2)
(define (edge2-2 x)
    (caddr x)
)
(edge2-2 frame2)