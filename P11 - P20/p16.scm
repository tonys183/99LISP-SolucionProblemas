#lang scheme

(define lista '(a b c d e f g))

(define drop-aux
    (lambda (L n count)
    (cond ((null? L) L)
        ((= count 1) (drop-aux (cdr L) n n))
        (else (cons (car L) (drop-aux (cdr L) n (- count 1)))))))

(define drop
  (lambda (L n)
  (drop-aux L n n)))

(drop lista 3)