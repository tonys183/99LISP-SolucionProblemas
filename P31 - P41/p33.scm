#lang scheme

(define gcd
    (lambda (n m)
    (cond ((zero? m) n)
        (else (gcd m (modulo n m))))))

(define coprime
    (lambda (n m)
    (cond ((= (gcd n m) 1) #t)
        (else #f))))

(coprime 35 64)