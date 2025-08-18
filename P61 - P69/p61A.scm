#lang scheme

(define tree '(a (b (d () ()) ()) (c () ())))

(define leaves
    (lambda (Tree)
    (cond ((null? Tree) '())
        ((and (null? (cadr Tree)) (null? (caddr Tree))) (list (car Tree)))
        (else (append (leaves (cadr Tree)) (leaves (caddr Tree)))))))

(leaves tree)