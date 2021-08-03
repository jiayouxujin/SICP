#lang sicp

;Exercise 1.1

;10->10
10

;(+ 5 3 4)->12
(+ 5 3 4)

;(- 9 1)->8
(- 9 1)

;(/ 6 3)->2
(/ 6 3)

;(+ (* 2 4) (- 4 6))->6
(+ (* 2 4) (- 4 6))

;(define a 3)->none (a->3)
(define a 3)

;(define b (+ a 1))->none (b->4)
(define b (+ a 1))

;(+ a b (* a b))->(+ 3 4 12)->19
(+ a b (* a b))

;(= a b)->#f(means false)
(= a b)

; (if (and (> b a)(< b (* a b)))
;     b
;     a) ->a->4
(if (and (> b a)(< b (* a b)))
    b
    a)

; (cond ((= a 4) 6)
;       ((= b 4)(+ 6 7 a))
;       (else 25))->16
(cond ((= a 4) 6)
      ((= b 4)(+ 6 7 a))
      (else 25))

; (+ 2 (if (> b a)b a))->(+ 2 4)->6
(+ 2 (if (> b a)b a))

; (* (cond ((> a b) a)
;          ((< a b) b)
;          (else -1))
;     (+ a 1))->(* b (+ a 1))->(* 4 4)->16
(* (cond ((> a b) a)
         ((< a b) b)
         (else -1))
    (+ a 1))


;exercise 1.2
;(5+4)+(2 -(3-(6+4/5)))/3(6-2)(2-7)
(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5))))) (* 3 (- 6 2) (- 2 7)))

;exercise 1.3
;sum-tow-large-number
(define (sum-tow-large-number x y z)
    (define (square x)(* x x))
    (define (sum-square x y)(+ (square x) (square y)))
    (define (>= x y) (or (> x y) (= x y)))
    (cond ((and (>= x z) (>= y z))
        (sum-square x y))
        ((and (>= x y) (>= z y))
        (sum-square x z))
        ((and (>= y x) (>= z x))
        (sum-square y z)))
)
(sum-tow-large-number 1 -2 3)

;exercise 1.4
; (define (a-plus-abs-b a b)
;     ((if (> b 0)+ -)a b)) if b>0 (+ a b) else (- a b)
(define (a-plus-abs-b a b)
    ((if (> b 0)+ -)a b))
; (a-plus-abs-b 1 2)->3
; (a-plus-abs-b 1 -2)->3

