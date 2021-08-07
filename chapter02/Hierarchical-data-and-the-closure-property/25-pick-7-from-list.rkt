#lang sicp

;exercise 2.25
(define x (list 1 3 (list 5 7) 9))

(car(cdr (caddr x)))