#lang scheme

(define lista '(a b c))

(define repli-aux
    (lambda (ele n)
    (cond ((<= n 0) '())
        (else (cons ele (repli-aux ele (- n 1)))))))
    

(define repli
    (lambda (L n)
    (cond ((null? L) L)
        (else (append (repli-aux (car L) n)(repli (cdr L) n))))))

(repli lista 2)