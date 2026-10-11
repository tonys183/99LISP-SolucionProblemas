#lang scheme

(define lista '(a b c d))

(define insert-at
    (lambda (x L i)
    (cond ((null? L) L)
      ((= i 1) (cons x L))
      (else (cons (car L) (insert-at x (cdr L) (- i 1)))))))
        
(insert-at 'x lista 4)