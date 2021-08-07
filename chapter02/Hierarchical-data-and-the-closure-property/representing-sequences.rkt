#lang sicp

(define one-through-four (list 1 2 3 4))
; one-through-four
; (car one-through-four)
; (cdr one-through-four)
; (car (cdr one-through-four))
; (cons 10 one-through-four)

(define (list-ref items n)
    (if (= n 0)
        (car items)
        (list-ref (cdr items) (- n 1))
    )
)

(define squares (list 1 4 9 16 25))
; (list-ref squares 3)

(define (length items)
    (if (null? items)
        0
        (+ 1 (length (cdr items)))
    )
)

; (define odds (list 1 3 5 7))
; (length odds)

(define (length-it items)
    (define (length-iter item count)
        (if (null? item)
            count
            (length-iter (cdr item) (+ 1 count))
        )
    )
    (length-iter items 0)
)

; (length-it squares)

(define (append list1 list2)
    (if (null? list1)
        list2
        (cons (car list1) (append (cdr list1) list2))
    )
)

(append squares (list 1 2 3 4))