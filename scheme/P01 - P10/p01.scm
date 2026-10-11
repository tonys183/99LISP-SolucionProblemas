#lang scheme

(define lista '(1 2 5))

(define myLast
    (lambda (L)
    (cond ((null? (cdr L))(car L))
        (else (myLast (cdr L))))))

(ultimo myLast)