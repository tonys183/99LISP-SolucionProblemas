#lang scheme

(define lista '(a b c d e f g h i k))

(define slice
  (lambda (L i j)
  (cond ((or (null? L) (> i j)) '())
    ((= i 1) (cons (car L) (slice (cdr L) 1 (- j 1))))
    (else (slice (cdr L) (- i 1) (- j 1))))))

(slice lista 3 7)