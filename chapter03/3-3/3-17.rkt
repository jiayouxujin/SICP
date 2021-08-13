#lang sicp

;exercise 3.17
(define nil '())
(define already-seen '())
(define (seen? x)
    (define (iter already-seen)
        (if (null? already-seen)
            false
            (or (eq? (car already-seen) x) (iter (cdr already-seen)))
        )
    )
    (iter already-seen)
)

(define (count-pairs x)
    (if (not (pair? x))
        0
        (if (seen? x)
            0
            (begin
                (set! already-seen (cons x already-seen))
                (+ (count-pairs (car x)) (count-pairs (cdr x)) 1)
            )
        )
    )
)

; (define p3 (cons 'a nil))
; (define p2 (cons p3 nil))
; (define p1 (cons p2 p3))
; (count-pairs p1)