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

(is-prime 101)