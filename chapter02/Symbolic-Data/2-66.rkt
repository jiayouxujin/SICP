#lang sicp

;exercise 2.66

; (define (lookup-tree given-key set-of-records)
;     (cond ((null? set-of-records) false)
;         ((= given-key (key (entry set-of-records))) (entry set-of-records))
;         ((> given-key (key (entry set-of-records))) 
;             (lookup-tree given-key (right-branch set-of-records))
;         )
;         (else(lookup-tree given-key (left-branch set-of-records)))
;     )
; )