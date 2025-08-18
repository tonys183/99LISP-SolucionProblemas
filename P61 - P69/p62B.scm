#lang scheme

(define tree '(a (b (d () ()) ()) (c () ())))

(define atLevel
    (lambda (Tree n)
    (cond ((null? Tree) '())
        ((= n 0) (list (car Tree)))
        (else (append (atLevel (cadr Tree) (- n 1)) (atLevel (caddr Tree) (- n 1)))))))

(atLevel tree 1)