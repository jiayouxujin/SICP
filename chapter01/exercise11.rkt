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