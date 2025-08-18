#lang scheme

(define lista '(a a a b b c))

(define compress
    (lambda (L)
    (cond ((null? L) L)
        ((null? (cdr L))(cons (car L) '()))
        ((equal? (car L) (cadr L))(compress(cdr L)))
        (else (cons (car L)(compress (cdr L)))))))

(compress lista)