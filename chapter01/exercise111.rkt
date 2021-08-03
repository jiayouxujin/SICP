#lang sicp

;exericse 1.11

;recursive
(define (f n)
    (cond  ((< n 3) n) 
           (else (+ (f (- n 1)) (* 2 (f (- n 2)))  (* 3(f (- n 3)))))
    )
)

; 1 2 (2+2+0)4 (4+4+3) 
(f 4)
(f 5)

;iter
(define (f-it n)
    (define (mul x y z)
        (+ x (* 2 y) (* 3 z))
    )
    (define (f-iter x y z count)
        (cond ((= count n) x)
            (else (f-iter y z (mul z y x) (+ count 1)))
        )
    )
    (f-iter 0 1 2 0)
)

; n=4
; 0 1 2 2
; 1 2 4 3
; 2 4 11 4
(f-it 4)
(f-it 5)
