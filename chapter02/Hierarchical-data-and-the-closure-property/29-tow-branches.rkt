#lang sicp


;exercise 2.29

(define (make-mobile left right)
    (list left right)
)

(define (make-branch length structure)
    (list length structure)
)

;a
(define (left-branch x)
    (car x)
)

(define (right-branch x)
    (cadr x)
)

(define (branch-length x)
    (car x)
)

(define (branch-structure x)
    (cadr x)
)


;b
; (define (total-weight z)
;     (+ (branch-weight (left-branch z)) (branch-weight (right-branch z)))
; )

; (define (branch-weight branch)
;     (if (hangs-another-mobile? branch)
;         (total-weight (branch-structure branch))
;         (branch-structure branch)    
;     )
; )

; (define (hangs-another-mobile? branch)
;     (pair? (branch-structure branch))
; )

(define (total-weight z)
    (cond ((null? z) 0)
        ((not (pair? (branch-structure z)))
            (branch-structure z)
        )
        (else(+ (total-weight (left-branch z)) (total-weight (right-branch z))))
    )
)

(define mobile (make-mobile (make-branch 10 20) (make-branch 10 25)))
(total-weight mobile)