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


(define (square x)
    (* x x)
)
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

;exercise 2.81
(define (apply-generic op . args)
    (let ((type-tags (map type-tag args)))
        (let ((proc (get op type-tags)))
            (if proc
                (apply proc (map contents args))
                (if (= (length args) 2)
                    (let ((type1 (car type-tags))
                          (type2 (cadr type-tags))
                          (a1 (car args))
                          (a2 (cadr args)))
                          (if (equal? type1 type2) ;c 增加这个判断，就不会陷入死循环
                            (error "No method for these types "(list op type-tags))
                             (let ((t1->t2 (get type1 type2))
                              (t2->t1 (get type2 type1)))
                            (cond (t1->t2
                                    (apply-generic op (t1->t2 a1) a2))
                                  (t2->t1
                                    (apply-generic op a1 (t2->t1 a2)))
                                  (else
                                    (error "No method for these types"
                                            (list op type-tags))))))
                    (error "No method for these types"
                            (list op type-tags)))))))
                          )


(define (add x y) (apply-generic 'add x y))
(define (sub x y) (apply-generic 'sub x y))
(define (mul x y) (apply-generic 'mul x y))
(define (div x y) (apply-generic 'div x y))

(define (equ? x y) (apply-generic 'equ? x y))

;exercise 2.80
(define (=zero? x) (apply-generic '=zero? x))

;scheme-number
(define (install-scheme-number-package)
    (define (tag x) (attach-tag 'scheme-number x))
    ;exercise 2.79
    (put 'equ? '(scheme-number scheme-number)
        (lambda(x y)(= x y))
    )

    ;exercise 2.80
    (put '=zero? '(scheme-number)
        (lambda(x) (= x 0))
    )
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
    ;exercise 2.79
    (put 'equ? '(rational rational)
        (lambda(x y)
            (and (= (numer x) (numer y)) (= (denom x) (denom y)))
        )
    )

    ;exercise 2.80
    (put '=zero? '(rational)
        (lambda(x)
            (= (numer x) 0)
        )
    )
    ;exercise 2.81
    (define (scheme-number->scheme-number n) n)
    (put 'scheme-number 'scheme-number scheme-number->scheme-number)
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

;rectangular-package
(define (install-rectangular-package)
    (define (real-part z) (car z))
    (define (imag-part z) (cdr z))
    (define (make-from-real-imag x y) (cons x y))
    (define (magnitude z)
        (sqrt (+ (square (real-part z)) (square (imag-part z))))
    )
    (define (angle z)
        (atan (imag-part z) (real-part z))
    )

    (define (make-from-mag-ang r a)
        (cons (* r (cos a)) (* r (sin a)))
    )

    (define (tag x) (attach-tag 'rectangular x))
    (put 'real-part '(rectangular) real-part)
    (put 'imag-part '(rectangular) imag-part)
    (put 'magnitude '(rectangular) magnitude)
    (put 'angle '(rectangular) angle)

    (put 'make-from-real-imag 'rectangular
        (lambda(x y) (tag (make-from-real-imag x y))))

    (put 'make-from-mag-ang 'rectangular
        (lambda(x y)(tag (make-from-mag-ang x y))))

'done)

(define (real-part z) (apply-generic 'real-part z))
(define (imag-part z) (apply-generic 'imag-part z))
(define (magnitude z) (apply-generic 'magnitude z))
(define (angle z) (apply-generic 'angle z))
(install-rectangular-package)


(define (install-complex-package)
    (define (make-from-real-imag x y)
        ((get 'make-from-real-imag 'rectangular) x y)   
    )
    (define (make-from-mag-ang r a)
        ((get 'make-from-mag-ang 'polar) r a)
    )

    (define (add-complex z1 z2)
        (make-from-real-imag (+(real-part z1) (real-part z2)) (+ (imag-part z1) (imag-part z2)))
    )

    (define (sub-complex z1 z2)
        (make-from-real-imag (- (real-part z1) (real-part z2)) (- (imag-part z1) (imag-part z2)))
    )

    (define (mul-complex z1 z2)
        (make-from-mag-ang (* (magnitude z1) (magnitude z2)) (- (angle z1) (angle z2)))
    )

    (define (div-complex z1 z2)
        (make-from-mag-ang (/ (magnitude z1) (magnitude z2)) (- (angle z1) (angle z2)))
    )

    (define (tag z) (attach-tag 'complex z))
    
    (put 'real-part '(complex) real-part)
    (put 'imag-part '(complex) imag-part)
    (put 'magnitude '(complex) magnitude)
    (put 'angle '(complex) angle)    

    ;exercise 2.79
    (put 'equ? '(complex complex)
        (lambda(x y) 
            (and (= (real-part x) (real-part y)) (= (imag-part x) (imag-part y)))
        )
    )

    ;exercise 2.80
    (put '=zero? '(complex)
        (lambda(x)
            (and (= (real-part x) 0) (= (imag-part x) 0))
        )
    )

    (put 'add '(complex complex)
        (lambda(z1 z2) (tag (add-complex z1 z2)))
    )

    (put 'sub '(complex complex)
        (lambda(z1 z2) (tag (sub-complex z1 z2)))
    )

    (put 'mul '(complex complex)
        (lambda(z1 z2) (tag (mul-complex z1 z2)))
    )

    (put 'div '(complex complex)
        (lambda(z1 z2) (tag (div-complex z1 z2)))
    )

    (put 'make-from-real-imag 'complex
        (lambda(x y) (tag (make-from-real-imag x y)))
    )

    (put 'make-from-mag-ang 'complex
        (lambda(r a) (tag (make-from-mag-ang r a))))
'done)

(define (make-complex-from-real-imag x y)
    ((get 'make-from-real-imag 'complex) x y)
)

(define (make-complex-from-mag-ang r a)
    ((get 'make-from-mag-ang 'complex) r a)
)

(install-complex-package)

;exercise 2.81
;a--陷入死循环，
;b 这是因为存存在scheme-number->scheme-number apply-generic会一直调用
(apply-generic 'exp (make-scheme-number 1) (make-scheme-number 2))
