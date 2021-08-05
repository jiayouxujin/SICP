#lang sicp

; (define x 2)
; (let ((x 3)   ;x 3
;     (y (+ x 2)))  ; y 4
;     (* x y) ; body 12
; )

(+ (let ((x 5))
    (+ x (* x 10) x)
))

(define (square x)(* x x))
(define (f x y)
    (define (f-helper a b)
        (+ (* x (square a))
            (* y b)
            (* a b)
        )
    )
    (f-helper (+ 1 (* x y)) (- 1 y))
)

(define (f-with-lambda x y)
    ((lambda (a b)
        (+ (* x (square a))
            (* y b)
            (* a b)
        )
    )
    (+ 1 (* x y))
    (- 1 y)
    )
)

(define (f-with-let x y)
    (let ((a (+ 1 (* x y)))
        (b (- 1 y)))
        (+ (* x (square a))
            (* y b)
            (* a b)
        )    
    )
)