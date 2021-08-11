#lang sicp

;exercise 3.2
(define (make-monitor mf)
    (let ((counter 0))
        (lambda(x)
            (cond ((eq? x 'how-many-calls? ) counter)
                ((eq? x 'resets) (set! counter 0))
                (else (begin (set! counter (+ 1 counter)) (mf x)))
            )
        )
    )
)


(define s (make-monitor sqrt))
(s 100)
(s 'how-many-calls? )