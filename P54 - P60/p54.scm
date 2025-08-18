#lang scheme

(define tree '(a (b () ()) ()))
(define tree2 '(a (b () ())))

(define istree
    (lambda (Tree)
    (cond ((null? Tree) #t)
        ((and (= (length Tree) 3) (istree (cadr Tree)) (istree (caddr Tree))) #t)
        (else #f))))

(istree tree)
(istree tree2)