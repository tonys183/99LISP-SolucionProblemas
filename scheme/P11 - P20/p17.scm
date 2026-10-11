#lang scheme

(define lista '(a b c d e f g h i k))

(define split
    (lambda (L n)
    (cond ((or (null? L) (<= n 0)) (cons '() (cons L '())))
      (else (cons (cons (car L) (car (split (cdr L) (- n 1)))) (cdr (split (cdr L) (- n 1))))))))

(split lista 5)