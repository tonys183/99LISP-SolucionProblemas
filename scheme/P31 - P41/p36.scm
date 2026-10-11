#lang scheme

(define myReverse
    (lambda (L)
    (cond ((null? L) L)
        (else (append (myReverse (cdr L))(cons (car L) '()))))))

(define count-multiplicities-aux
  (lambda (L c i R)
    (cond ((null? L) 
        (cond ((> i 0) (myReverse (cons (list c i) R)))
            (else (myReverse R))))
        ((eq? (car L) c) (count-multiplicities-aux (cdr L) c (+ i 1) R))
        (else (count-multiplicities-aux (cdr L) (car L) 1 (cons (list c i) R))))))

(define count-multiplicities
  (lambda (L)
    (cond
      ((null? L) '())
      (else (count-multiplicities-aux (cdr L) (car L) 1 '())))))

(define prime-factors-aux
    (lambda (n i)
    (cond ((< n 2) '())
        ((zero? (modulo n i)) (cons i (prime-factors-aux (/ n i) i)))
        (else (prime-factors-aux n (+ i 1))))))

(define prime-factors-mult
    (lambda (n)
    (count-multiplicities (prime-factors-aux n 2))))

(prime-factors-mult 315)