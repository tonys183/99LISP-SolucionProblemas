#lang scheme

(define lista '(a a a b b c))

(define list-rest
    (lambda (x L)
    (cond ((null? L) L)
        ((equal? x (car L)) (list-rest x (cdr L)))
        (else L))))

(define list-dup
    (lambda (x L)
    (cond ((null? L) L)
        ((equal? x (car L)) (cons (car L) (list-dup x (cdr L))))
        (else '()))))

(define pack
    (lambda (L)
    (cond ((null? L) L)
        (else (cons (list-dup (car L) L) (pack (list-rest (car L) L)))))))

(pack lista)