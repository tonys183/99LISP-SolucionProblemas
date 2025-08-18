#lang scheme

(define lista '(a b c d))

(define myLength
    (lambda (L)
    (cond ((null? L) 0)
        (else (+ 1 (myLength(cdr L)))))))

(define element-at
    (lambda (L n)
    (cond ((= n 0)(car L))
        (else (element-at (cdr L)(- n 1))))))

(define remove-at
    (lambda (L i)
    (cond ((null? L) L)
        ((= i 0) (cdr L))
        (else (cons (car L) (remove-at (cdr L) (- i 1)))))))

(define rnd-permu-select
    (lambda (L i)
    (cons (element-at L i)
          (rnd-permu-aux (remove-at L i)))))

(define rnd-permu-aux
    (lambda (L)
    (cond ((null? L) L)
        (else (rnd-permu-select L (random (myLength L)))))))

(define rnd-permu
    (lambda (L)
    (rnd-permu-aux L)))

(rnd-permu lista)