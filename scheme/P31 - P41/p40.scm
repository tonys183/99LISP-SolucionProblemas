#lang scheme

(define is-prime-aux
    (lambda (x i)
    (cond ((< x 2) #f)
        ((> (* i i) x) #t)
        ((zero? (modulo x i)) #f)
        (else (is-prime-aux x (+ i 1))))))

(define is-prime
    (lambda (x)
    (is-prime-aux x 2)))

(define goldbach-aux
    (lambda (n m)
    (cond ((and (is-prime (- n m)) (is-prime m)) (list m (- n m)))
        (else (goldbach-aux n (+ m 1))))))

(define goldbach
    (lambda (n)
    (goldbach-aux n 2)))

(goldbach 28)