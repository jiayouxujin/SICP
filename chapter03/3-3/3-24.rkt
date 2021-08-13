#lang sicp

(define (make-table same-key?)
    (let ((local-table (list '*table*)))
        (define (assoc key table)
            (cond ((null? table) false)
                ((same-key? key (caar table)) (car table))
                (else
                    (assoc key (cdr table)))
            )
        )
        (define (lookup key-1 key-2)
            (let ((subtable (assoc key-1 (cdr local-table))))
                (if subtable
                    (let ((record (assoc key-2 (cdr subtable))))
                        (if record
                            (cdr record)
                            #f))
                    #f)))
        (define (insert! key-1 key-2 value)
            (let ((subtable (assoc key-1 (cdr local-table))))
                (if subtable
                    (let ((record (assoc key-2 (cdr subtable))))
                        (if record
                            (set-cdr! record value)
                            (set-cdr! subtable
                                      (cons (key-2 value)
                                            (cdr subtable)))))
                    (set-cdr! local-table
                              (cons (list key-1
                                          (cons key-2 value))
                                    (cdr local-table)))))
            'ok)
        (define (dispatch m)
            (cond ((eq? m 'lookup-proc) lookup)
                  ((eq? m 'insert-proc!) insert!)
                  (else 
                    (error "Unknown operation -- TABLE" m))))
        dispatch))

(define number-table (make-table =))
((number-table 'insert-proc!) 10086 10086 'hello-moto)
((number-table 'lookup-proc) 10086 10086)