#lang scheme

(define lista '(1 (2 (3 4))))

(define my-flatten
    (lambda (L)
    (cond ((null? L) L)
        ((list? (car L)) (append (my-flatten (car L)) (my-flatten (cdr L))))
        (else (cons (car L) (my-flatten(cdr L)))))))

(my-flatten lista)