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


;perimeter
(define (perimeter-rectangle r)
    (let ((length (length-of-rectangle r))
        (width (width-of-rectangle r)))
        (* 2 (+ length width))    
    )
)

;area
(define (area-rectangle r)
    (let ((length (length-of-rectangle r))
        (width (width-of-rectangle r)))
        (* length width)    
    )
)

;define make-rectangle
(define (make-rectangle length width)
    (cons length width)
)

(define (length-rectangle r)
    (car r)
)

(define (width-rectangle r)
    (cdr r)
)

(define (length-of-rectangle r)
    (let ((length (length-rectangle r)))
        (let ((start (start-segment length))
            (end (end-segment length)))
            (- (x-point end) (x-point start))    
        )
    )
)

(define (width-of-rectangle r)
    (let ((width (width-rectangle r)))
        (let ((start (start-segment width))
            (end (end-segment width)))
            (- (y-point end) (y-point start))    
        )
    )
)

(define l (make-segment (make-point 1 2) (make-point 4 2)))
(define w (make-segment (make-point 1 2) (make-point 1 4)))

(define r (make-rectangle l w))

(width-of-rectangle r)
(length-of-rectangle r)

(perimeter-rectangle r)
(area-rectangle r)