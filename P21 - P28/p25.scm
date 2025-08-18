#lang scheme

(define lista '(a b c d))

(define nth
  (lambda (n L)
    (cond ((= n 0) (car L))
        (else (nth (- n 1) (cdr L))))))

(define remove-nth 
    (lambda (n L)
    (cond ((null? L) '()) 
        ((= n 0) (cdr L))
        (else (cons (car L) (remove-nth (- n 1) (cdr L)))))))

(define rnd-permu-helper
    (lambda (i L)
    (cons (nth i L) (rnd-permu (remove-nth i L)))))

(define rnd-permu
    (lambda (L)
    (cond ((null? L) '())
        (else (rnd-permu-helper (random (length L)) L)))))

(rnd-permu lista)