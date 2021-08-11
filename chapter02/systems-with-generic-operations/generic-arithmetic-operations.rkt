#lang sicp

;get and put
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
        (cadr datum)
        (error "Bad tagged datum: CONTENTS " datum)
    )
)


(define (apply-generic op . args)
    (let ((type-tags (map type-tag args)))
        (let ((proc (get op type-tags)))
            (if proc
                (apply proc (map contents args))
                (error "No method for thest types :APPLY-GENERIC " (list op type-tags))
            )
        )
    )
)
(define (add x y) (apply-generic 'add x y))
(define (sub x y) (apply-generic 'sub x y))
(define (mul x y) (apply-generic 'mul x y))
(define (div x y) (apply-generic 'div x y))

;scheme-number
(define (install-scheme-number-package)
    (define (tag x) (attach-tag 'scheme-number x))
    (put 'add '(scheme-number scheme-number)
        (lambda(x y)(+ x y))
    )
    (put 'sub '(scheme-number scheme-number)
        (lambda(x y)(- x y))
    )
    (put 'mul '(scheme-number scheme-number)
        (lambda(x y)(* x y))
    )
    (put 'div '(scheme-number scheme-number)
        (lambda(x y)(/ x y))
    )
    (put 'make 'scheme-number (lambda(x) (tag x)))
'done)

(install-scheme-number-package)
(define (make-scheme-number n)
    ((get 'make 'scheme-number) n)
)

(define scheme-number1 (make-scheme-number 1))
(define scheme-number2 (make-scheme-number 2))
(add scheme-number1 scheme-number2)

(define (install-rational-package)
    (define (numer x) (car x))
    (define (denom x) (cdr x))
    (define (make-rat n d)
        (let ((g (gcd n d)))
            (cons (/ n g) (/ d g))
        )
    )

    (define (add-rat x y)
        (make-rat (+ (* (numer x) (denom y)) (* (numer y) (denom x))) (* (denom x) (denom y)))
    )

    (define (sub-rat x y)
        (make-rat (- (* (numer x) (denom y)) (* (numer y) (denom x))) (* (denom x) (denom y)))
    )

    (define (mul-rat x y)
        (make-rat (* (numer x) (numer y)) (* (denom x) (denom y)))
    )

    (define (div-rat x y)
        (make-rat (* (numer x) (denom y)) (* (denom x) (numer y)))
    )

    (define (tag x) (attach-tag 'rational x))

    (put 'add '(rational rational)
        (lambda(x y) (tag (add-rat x y))))

    (put 'sub '(rational rational)
        (lambda(x y) (tag (sub-rat x y))))

    (put 'mul '(rational rational)
        (lambda(x y) (tag (mul-rat x y))))

    (put 'div '(rational rational)
        (lambda(x y) (tag (div-rat x y))))
    
    (put 'make 'rational 
        (lambda(n d ) (tag (make-rat n d))))
'done)
(define (make-rational n d)
    ((get 'make 'rational)n d)
)

(install-rational-package)
(define rational-1 (make-rational 1 2))
(define rational-2 (make-rational 3 4))
(add rational-1 rational-2)