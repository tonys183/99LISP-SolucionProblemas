#lang scheme

(define lista '(a b c d))

(define add-to-all
    (lambda (L x)
    (cond ((null? L) L)
        (else (cons (cons x (car L)) (add-to-all (cdr L) x))))))

(define combinations
    (lambda (k L)
    (cond ((= k 0) (cons '() '()))
        ((null? L) L)
        (else (append (combinations k (cdr L)) (add-to-all (combinations (- k 1) (cdr L)) (car L)))))))

(combinations 3 lista)