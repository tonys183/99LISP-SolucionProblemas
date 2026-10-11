#lang scheme

(define myReverse
    (lambda (L)
    (cond ((null? L) L)
        (else (append (myReverse (cdr L))(cons (car L) '()))))))

(define is-prime-aux
    (lambda (x i)
    (cond ((< x 2) #f)
        ((> (* i i) x) #t)
        ((zero? (modulo x i)) #f)
        (else (is-prime-aux x (+ i 1))))))

(define is-prime
    (lambda (x)
    (is-prime-aux x 2)))

(define primesR-aux
    (lambda (j k)
    (cond ((> k j) '())
        ((is-prime k) (cons k (primesR-aux j (+ k 1))))
        (else (primesR-aux j (+ k 1))))))

(define primesR
    (lambda (i j)
    (primesR-aux j i)))

(primesR 10 20)