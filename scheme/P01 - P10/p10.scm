#lang scheme

(define lista '(a a a b b c))

(define myLength
    (lambda (L)
    (cond ((null? L) 0)
        (else (+ 1 (myLength(cdr L)))))))

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

(define encode-aux
    (lambda (L)
    (cond ((null? L) L)
        (else (cons (cons (myLength (car L)) (cons (car (car L)) '())) (encode-aux (cdr L)))))))

(define encode
    (lambda (L)
    (encode-aux (pack L))))

(encode lista)