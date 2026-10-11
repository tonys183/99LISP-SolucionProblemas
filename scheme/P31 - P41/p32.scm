#lang scheme

(define gcd
    (lambda (n m)
    (cond ((zero? m) n)
        (else (gcd m (modulo n m))))))

(gcd 36 63)