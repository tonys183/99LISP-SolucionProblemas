#lang scheme

(define lista '((a b c) (d e) (f g h) (d e) (i j k l) (m n) (o)))

(define myLength
    (lambda (L)
    (cond ((null? L) 0)
        (else (+ 1 (myLength(cdr L)))))))

(define insert-length
  (lambda (x SL)
    (cond ((null? SL) (cons x SL))
        ((<= (myLength x) (myLength (car SL))) (cons x SL))
        (else (cons (car SL) (insert-length x (cdr SL)))))))

(define lsort
    (lambda (L)
    (cond ((null? L) L)
        (else (insert-length (car L) (lsort (cdr L)))))))

(lsort lista)