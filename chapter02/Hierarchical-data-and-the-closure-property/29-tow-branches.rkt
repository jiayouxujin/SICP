#lang sicp


;exercise 2.29

; (define (make-mobile left right)
;     (list left right)
; )

; (define (make-branch length structure)
;     (list length structure)
; )

;d
(define (make-mobile left right)
    (cons left right)
)

(define (make-branch length structure)
    (cons length structure)
)
; ;a
(define (left-branch x)
    (car x)
)

(define (right-branch x)
    (cdr x)
)

(define (branch-length x)
    (car x)
)

(define (branch-structure x)
    (cdr x)
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

;b
(define (total-weight z)
    (cond ((null? z) 0)
        ((not (pair? (branch-structure z)))
            (branch-structure z)
        )
        (else(+ (total-weight (left-branch z)) (total-weight (right-branch z))))
    )
)

(define mobile (make-mobile (make-branch 10 20) (make-branch 20 10)))
(total-weight mobile)

;c
(define (balanced? mobile)
    (let((left (left-branch mobile))
        (right (right-branch mobile)))
        (and (same-torque? left right) (branch-balance? left) (branch-balance? right))
    )
)

(define (branch-torque branch)
    (* (branch-length branch) (total-weight branch))
)
(define (same-torque? left right)
    (= (branch-torque left) (branch-torque right))
)

(define (branch-balance? branch)
    (if (pair? (branch-structure branch))
        (balanced? (branch-structure branch))
        true    
    )
)
(balanced? mobile)

