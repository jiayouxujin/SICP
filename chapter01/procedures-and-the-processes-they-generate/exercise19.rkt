#lang sicp


;increments its argument by 1
(define (inc x)
    (+ x 1)
)
;decrements its argument by 1
(define (dec x)
    (- x 1)
)

;recursive
(define (plus a b)
    (if (= a 0)
        b
        (inc (plus (dec a) b))
    )
)
(plus 4 5)

;iterative
(define (plus-iter a b)
    (if (= a 0)
        b
        (plus-iter (dec a) (inc b))
    )
)

(plus-iter 4 5)