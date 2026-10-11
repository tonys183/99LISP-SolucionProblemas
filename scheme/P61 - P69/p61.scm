#lang scheme

(define tree '(a (b () ()) (c () ())))

(define countLeaves
    (lambda (Tree)
    (cond ((null? Tree) 0)
        ((and (null? (cadr Tree)) (null? (caddr Tree))) 1)
        (else (+ (countLeaves (cadr Tree)) (countLeaves (caddr Tree)))))))

(countLeaves tree)