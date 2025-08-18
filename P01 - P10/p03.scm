#lang scheme

(define lista '(1 2 5 7 9))

(define element-at
    (lambda (L n)
    (cond ((= n 1)(car L))
        (else (element-at (cdr L)(- n 1))))))

(element-at lista 3)