#lang scheme

(define lista '(a b c d))

(define remove-at
    (lambda(L i)
    (cond ((null? L) L)
      ((= i 1) (cdr L))
      (else (cons (car L) (remove-at (cdr L) (- i 1)))))))
        
(remove-at lista 3)