#lang sicp

;exercise 3.3

(define (make-account amount password)
    (lambda(pass op)
        (if (not (eq? pass password))
            (lambda(x)
                ;就是在密码不正确时，需要返回一个函数，而不是直接输出一个字符串，银行它后面还要调用具体金额
                "Incorrect password"
            )
            (cond ((eq? op 'withdraw)
                    (lambda(x)
                        (if (>= amount x)
                            (begin (set! amount (- amount x)) amount)
                            "Insufficient funds"
                        )
                    )
                )
                ((eq? op 'deposit)
                    (lambda(x)
                        (set! amount (+ amount x))
                    amount)
                )
                (else (error "Unknown request: MAKE-ACCOUNT" op))    
            )
        )
    )
)

(define acc (make-account 100 'secret-password))
((acc 'secret-password 'withdraw) 40)
((acc 'secret-password 'deposit) 40)
((acc 'password 'deposit) 40)