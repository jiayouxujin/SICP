#lang sicp

(define (smallest-divisor n) (find-divisor n 2))

(define (square x)
    (* x x)
)
(define (divides a b)
    (= (remainder b a) 0)
)
(define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
        ((divides test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))
    )
)

;prime?
(define (prime? n)
    (= n (smallest-divisor n))
)


;filter
(define (filter f lst)
    (cond ((null? lst)
        lst)
        ((f (car lst))
            (cons (car lst) (filter f (cdr lst)))
        )
        (else (filter f (cdr lst)))
    )
)

;enumerate
(define (enumerate-interval low high)
    (if (> low high)
        nil
        (cons low (enumerate-interval (+ 1 low) high))
    )
)

;accumulate
(define (accumulate op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence) (accumulate op initial (cdr sequence)))
    )
)


; (accumulate
;     append nil (map (lambda(i)
;         (map (lambda(j) (list i j))
;             (enumerate-interval 1 (- i 1))))
;                 (enumerate-interval 1 6)))


(define (flatmap proc seq)
    (accumulate append nil (map proc seq))
)

(define (prime-sum? pair)
    (prime? (+ (car pair) (cadr pair)))
)

(define (make-pair-sum pair)
    (list (car pair) (cadr pair) (+ (car pair) (cadr pair)))
)

(define (prime-sum-pairs n)
    (map make-pair-sum (filter prime-sum? (unique-pairs n)))
)

(define (unique-pairs n)
    (accumulate append nil (map (lambda(x)(map (lambda(y) (list x y)) (enumerate-interval 1 (- x 1))))
        (enumerate-interval 1 n)
    ))
)

(unique-pairs 6)
(prime-sum-pairs 6)