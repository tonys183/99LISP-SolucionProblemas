#lang scheme

(define lista '(1 2 5))

(define myButLast
    (lambda (L)
    (cond ((null? (cddr L))(car L))
        (else (myButLast (cdr L))))))

(myButLast lista)