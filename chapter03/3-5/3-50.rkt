#lang sicp

(define (cons-stream a b)
    (cons a (delay b))
)

(define (stream-car stream)
    (car stream)
)

(define (stream-cdr stream)
    (force (cdr stream))
)


(define (stream-ref s n)
    (if (= n 0)
        (stream-car s)
        (stream-ref (stream-cdr s) (- n 1))
    )
)

(define (stream-map proc s)
    (if (stream-null? s)
        the-empty-stream
        (cons-stream (proc (stream-car s)) (stream-map proc (stream-cdr s)))
    )
)

(define (stream-for-each proc s)
    (if (stream-null? s)
        'done
        (begin
            (proc (stream-car s))
            (stream-for-each proc (stream-cdr s))       
        )
    )
)

(define (stream-enumerate-interval low high)
    (if (> low high)
        the-empty-stream
        (cons-stream low (stream-enumerate-interval (+ low 1) high))
    )
)

(define (stream-filter pred stream)
    (cond ((stream-null? stream) the-empty-stream)
        ((pred (stream-car stream))
            (cons-stream (stream-car stream) (stream-filter pred (stream-cdr stream)))
        )
        (else (stream-filter pred (stream-cdr stream)))
    )
)

(define (display-stream s)
    (stream-for-each display-line s)
)

(define (display-line x)
    (newline)
    (display x)
)

;exercise 3.50
(define (stream-map-mul proc . list-of-stream)
    (if (null? (car list-of-stream))
        '()
        (cons-stream 
            (apply proc (map (lambda(x)(stream-car x)) list-of-stream))
            (apply stream-map-mul (cons proc (map (lambda(x)(stream-cdr x)) list-of-stream)))
        )    
    )
)
(define one-to-ten (stream-enumerate-interval 1 10))
(display-stream (stream-map-mul + one-to-ten one-to-ten))