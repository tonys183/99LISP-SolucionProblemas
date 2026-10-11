#lang scheme

(define gcd
    (lambda (n m)
    (cond ((zero? m) n)
        (else (gcd m (modulo n m))))))

(define coprime
    (lambda (n m)
    (cond ((= (gcd n m) 1) #t)
        (else #f))))

(define totient-phi-aux
    (lambda (n m i)
    (cond ((>= n m) i)
        ((coprime n m) (totient-phi-aux (+ n 1) m (+ i 1)))
        (else (totient-phi-aux (+ n 1) m i)))))

(define totient-phi 
    (lambda (m)
    (cond ((= m 1) 1)
        (else (totient-phi-aux 1 m 0)))))

(totient-phi 10)