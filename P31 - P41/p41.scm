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

(define goldbach-aux
    (lambda (n m)
    (cond ((and (is-prime (- n m)) (is-prime m)) (list m (- n m)))
        (else (goldbach-aux n (+ m 1))))))

(define goldbach
    (lambda (n)
    (goldbach-aux n 2)))

(define goldbach-list-aux
    (lambda (i j R)
    (cond ((> i j) (myReverse R))
          ((odd? i) (goldbach-list-aux (+ i 1) j R))
          (else (goldbach-list-aux (+ i 2) j (cons (list i (goldbach i)) R))))))

(define goldbach-list
    (lambda (i j)
    (goldbach-list-aux i j '())))
    
(goldbach-list 9 20)