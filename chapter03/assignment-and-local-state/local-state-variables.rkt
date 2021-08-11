#lang sicp

(define balance 100)

(define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount)) balance)
        "Insufficient funds"
    )
)

; (withdraw 20)
; (withdraw 20)
; (withdraw 20)

(define new-withdraw
    (let ((balance 100))
        (lambda(amount)
            (if (>= balance amount)
                (begin (set! balance (- balance amount)) balance)
                "Insufficient funds"
            )
        )
    )
)

(define withdraw-2 new-withdraw)
; (withdraw-2 20)
; (withdraw-2 20)
; (withdraw-2 20)

(define (make-withdraw balance)
    (lambda(amount)
        (if (>= balance amount)
            (begin (set! balance (- balance amount)) balance)
            "Insufficient funds"
        )
    )
)

(define W1 (make-withdraw 100))
; (W1 20)
; (W1 20)
; (W1 20)
; (W1 60)

(define (make-account balance)
    (define (withdraw amount)
        (if (>= balance amount)
            (begin (set! balance (- balance amount))
                balance)
            "Insufficient funds"
        )
    )
    (define (deposit amount)
        (set! balance (+ balance amount))
    balance)
    (define (dispatch m)
        (cond ((eq? m 'withdraw) withdraw)
            ((eq? m 'deposit) deposit)
            (else (error "Unknown request: MAKE-ACCOUNT" m))
        )
    )
dispatch)

(define acc (make-account 100))
; ((acc 'withdraw) 50)
; ((acc 'deposit) 40)