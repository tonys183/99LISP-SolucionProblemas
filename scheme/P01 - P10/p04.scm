#lang scheme

(define lista '(1 2 5 7 9))

(define myLength
    (lambda (L)
    (cond ((null? L) 0)
        (else (+ 1 (myLength(cdr L)))))))

(myLength lista)