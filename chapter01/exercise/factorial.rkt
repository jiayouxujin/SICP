#lang sicp

; (define (factorial n)
;     (if (= n 1)
;         1
;         (* n (factorial (- n 1))))
; )

; (factorial 6)


; (define (factorial n)
;     (fact-iter 1 1 n))

; (define (fact-iter product counter max-count)
;     (if (> counter max-count)
;         product
;         (fact-iter (* product counter) (+ counter 1) max-count)
;     )
; )

; (factorial 6)

(define (factorial n)
    (define (fact-iter product counter)
        (if (> counter n)
            product
            (fact-iter (* product counter) (+ counter 1))
        )
    )
    (fact-iter 1 1)
)

(factorial 6)