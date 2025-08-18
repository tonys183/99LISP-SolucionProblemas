#lang scheme

(define prime-factors-aux
    (lambda (n i)
    (cond ((< n 2) '())
        ((zero? (modulo n i)) (cons i (prime-factors-aux (/ n i) i)))
        (else (prime-factors-aux n (+ i 1))))))

(define prime-factors
    (lambda (n)
    (prime-factors-aux n 2)))

(prime-factors 315)