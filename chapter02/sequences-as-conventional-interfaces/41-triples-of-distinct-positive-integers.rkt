#lang sicp


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

;filter
(define (filter f seq)
    (if (null? seq)
        seq
        (if (f (car seq))
            (cons (car seq) (filter f (cdr seq)))
            (filter f (cdr seq))
        )
    )
)




(define (unique-pairs n)
    (accumulate append nil (map (lambda(x)(map (lambda(y) (list x y)) (enumerate-interval 1 (- x 1))))
        (enumerate-interval 1 n)
    ))
)

;exercise 2.41

(define (solve n s)
    (filter (lambda(triple)
        (let ((a1 (car triple))
            (a2 (cadr triple))
            (a3 (caddr triple)))
            (and (< a1 n) (> a2 a3) (> a3 0))
        )
    ) (map (lambda(p) (append p (list (- s (car p) (cadr p)))))
        (unique-pairs n)))
)

; (unique-pairs 10)
(solve 10 10)


