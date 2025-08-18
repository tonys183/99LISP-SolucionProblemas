#lang scheme

(define lista '(1 2 1))

(define myReverse
    (lambda (L)
    (cond ((null? L) L)
        (else (append (myReverse (cdr L))(cons (car L) '()))))))

(define isPalindrome
    (lambda (L)
    (cond ((or (null? L) (null? (cdr L))) #t) 
        (else (equal? (myReverse L) L)))))

(isPalindrome lista)