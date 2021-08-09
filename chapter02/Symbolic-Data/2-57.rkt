#lang sicp

;exercise 2.56

(define (deriv exp var)
    (cond ((number? exp) 0)
        ((variable? exp) (if (same-variable? exp var) 1 0))
        ((sum? exp) (make-sum (deriv (addend exp) var) 
                (deriv (augend exp) var)))
        ((product? exp)
            (make-sum 
                (make-product (multiplier exp)
                    (deriv (multiplicand exp) var))
                (make-product (deriv (multiplier exp) var)
                    (multiplicand exp)))
        )
        ((exponentiation? exp)
            (if (same-variable? (base exp) var)
            (make-product (exponent exp) 
            (make-exponentiation (base exp) (- (exponent exp) 1)))
            0
            )
        )
        (else
            (error "unknown expression type :DERIV" exp))

    )
)

(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
    (and (variable? v1) (variable? v2) (eq? v1 v2))
)

(define (=number? exp num)
    (and (number? exp) (= exp num))
)

(define (exponentiation? exp)
    (and (pair? exp) (eq? (car exp) '**))
)

(define (base exp)
    (cadr exp)
)

(define (exponent exp)
    (caddr exp)
)

(define (make-exponentiation base exp)
    (cond ((=number? exp 0) 1)
        ((=number? exp 1) base)
        (else '(** base exp))
    )
)

(define (make-sum . args)
  (define (iter res l)
    (if (null? l)
      res
      (let ((first (car l)))
        (if (=number? first 0)
          (iter res (cdr l))
          (iter (append res (list (car l)))
                (cdr l))))))
  (iter '(+) args))

(define (make-product . args)
  (define (iter res l)
    (if (null? l)
      res
      (iter (append res (list (car l)))
            (cdr l))))
  (iter '(*) args))

(define (sum? x) (and (pair? x) (eq? (car x) '+)))
(define (addend s) (cadr s))
(define (augend s) (more-exp '(+) s))

(define (product? x)(and (pair? x) (eq? (car x) '*)))
(define (multiplier p) (cadr p))
(define (multiplicand p) (more-exp '(*) p))


(define (more-exp symbol exp)
    (define (iter res l)
        (if (null? l)
            res
            (iter (append res (list (car l)))
                (cdr l))
        )
    )
    (if (null? (cdddr exp))
        (caddr exp)
        (let ((rest (cddr exp)))
            (iter symbol rest)
        )
    )
)


(deriv '(** x 5) 'x)
(deriv '(** x 5) 'y)
(deriv '(** 3 5) 'x)
(deriv '(+ x (** x 2)) 'x)

(deriv '(+ x (* y x) x 12) 'x)