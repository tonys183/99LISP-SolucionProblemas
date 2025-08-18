#lang scheme

(define lista '(a b c d))

(define myLength
    (lambda (L)
    (cond ((null? L) 0)
        (else (+ 1 (myLength(cdr L)))))))

(define element-at
    (lambda(L n)
    (cond ((= n 0)(car L))
        (else (element-at (cdr L)(- n 1))))))

(define rnd-select
    (lambda(L n)
    (cond ((= n 0) '())
      (else (cons (element-at L (random (myLength L))) (rnd-select L (- n 1)))))))
        
(rnd-select lista 3)