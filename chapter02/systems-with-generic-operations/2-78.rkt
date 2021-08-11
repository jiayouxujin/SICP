#lang sicp

;exercise 2.78
(define (attach-tag type-tag . contents)
    (if (number? contents)
        contents
        (cons type-tag contents)
    )
)


(define (type-tag datum)
    (if (pair? datum)
        (car datum)
        (if (number? datum)
            'scheme-number
            (error "Bada type tag datum: TYPE-TAG" datum)
        )
    )
)

(define (contents datum)
    (if (pair? datum)
        (cadr datum)
        (if (number? datum)
            datum
            (error "Bad tagged datum: CONTENTS " datum)
        )
    )
)