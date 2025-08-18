#lang scheme

(define lista '(a b c c))

(define dupli
    (lambda (L)
    (cond ((null? L) L)
        (else (cons (car L)(cons (car L)(dupli (cdr L))))))))

(dupli lista)