#lang scheme

(define lista '(1 2 3))

(define myReverse
    (lambda (L)
    (cond ((null? L) L)
        (else (append (myReverse (cdr L))(cons (car L) '()))))))

(myReverse lista)