#lang sicp

;put and get
;https://stackoverflow.com/questions/5499005/how-do-i-get-the-functions-put-and-get-in-sicp-scheme-exercise-2-78-and-on/19114031#19114031
(define global-array '())

(define (make-entry k v) (list k v))
(define (key entry) (car entry))
(define (value entry) (cadr entry))

(define (put op type item)
  (define (put-helper k array)
    (cond ((null? array) (list(make-entry k item)))
          ((equal? (key (car array)) k) array)
          (else (cons (car array) (put-helper k (cdr array))))))
  (set! global-array (put-helper (list op type) global-array)))

(define (get op type)
  (define (get-helper k array)
    (cond ((null? array) #f)
          ((equal? (key (car array)) k) (value (car array)))
          (else (get-helper k (cdr array)))))
  (get-helper (list op type) global-array))


(define (attach-tag type-tag . contents)
    (cons type-tag contents)
)


(define (type-tag datum)
    (if (pair? datum)
        (car datum)
        (error "Bad tagged datum: TYPE-TAG" datum)
    )
)

(define (contents datum)
    (if (pair? datum)
        (cdr datum)
        (error "Bad tagged datum: CONTENTS " datum)
    )
)
(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
    (and (variable? v1) (variable? v2) (eq? v1 v2))
)

(define (=number? x y)
    (and (number? x) (= x y))
)

;exercise 2.73

(define (deriv exp var)
    (cond ((number? exp) 0)
        ((variable? exp) (if (same-variable? exp var) 1 0))
        (else ((get 'deriv (operator exp))(operands exp) var))
    )
)

;a
;因为number?和variable? 与* +不同，不是一种数据类型。如果也要通过op-table来操作的话，需要('number 1),使得系统变得复杂

;b
(define (operator exp)
    (if (pair? exp)
        (car exp)
        (error "Bad exp with operator: " exp)
    )
)

(define (operands exp)
    (if (pair? exp)
        (cdr exp)
        (error "Bad exp with operands: " exp)
    )
)

(define (install-sum-package)
    (define (addend s)
        (car s))
    (define (augend s)
        (cadr s))
    (define (make-sum x y)
        (cond ((=number? x 0) y)
            ((=number? y 0) x)
            ((and (number? x) (number? y))
                (+ x y)
            )
            (else(attach-tag '+ x y))
        )
    )

    (put 'addend '+ addend)
    (put 'augend '+ augend)
    (put 'make-sum '+ make-sum)

    (put 'deriv '+
        (lambda (exp var)
            (make-sum (deriv (addend exp) var) (deriv (augend exp) var))))
)

(define (make-sum x y)
    ((get 'make-sum '+) x y)
)

(define (addend sum)
    ((get 'addend '+) (contents sum))
)

(define (augend sum)
    ((get 'augend '+) (contents sum))
)

(define (install-product-package)
    (define (multiplier p)
        (car p)
    )
    (define (multiplicand p)
        (cadr p)
    )
    
    (define (make-product x y)
        (cond ((or (=number? x 0) (=number? y 0)) 0)
            ((=number? x 1) y)
            ((=number? y 1) x)
            ((and (number? x) (number? y))
                (* x y))
            (else (attach-tag '* x y))
        )
    )

    (put 'multiplier '* multiplier)
    (put 'multiplicand '* multiplicand)
    (put 'make-product '* make-product)

    (put 'deriv '* 
        (lambda(exp var) (make-sum 
            (make-product (multiplier exp) (deriv (multiplicand exp) var))
            (make-product (deriv (multiplier exp) var) (multiplicand exp)))))
)

(define (make-product x y)
    ((get 'make-product '*) x y)
)

(define (multiplier product)
    ((get 'multiplier '*)(contents product))
)

(define (multiplicand product)
    ((get 'multiplicand '*)(contents product))
)

;c
(define (install-exponentiation-package)

    (define (base exp)
        (car exp))

    (define (exponent exp)
        (cadr exp))

    (define (make-exponentiation base n)
        (cond ((= n 0)
                0)
              ((= n 1)
                base)
              (else
                (attach-tag '** base n))))

    (put 'base '** base)
    (put 'exponent '** exponent)
    (put 'make-exponentiation '** make-exponentiation)

    (put 'deriv '**
         (lambda (exp var)
            (let ((n (exponent exp))
                  (u (base exp)))
                (make-product
                    n
                    (make-product
                        (make-exponentiation
                            u
                            (- n 1))
                        (deriv u var))))))
'done)

(define (make-exponentiation base n)
    ((get 'make-exponentiation '**) base n))

(define (base exp)
    ((get 'base '**) (contents exp)))

(define (exponent exp)
    ((get 'exponent '**) (contents exp)))


;d
;需要修改get和put的顺序
(install-sum-package)
(install-product-package)
(install-exponentiation-package)
(deriv '(+ x 3) 'x)
(deriv '(* x y) 'x)
(deriv '(** x 3) 'x)