#lang scheme

(define tree '(a (b (d () ()) ()) (c () ())))

(define internals
    (lambda (Tree)
    (cond ((null? Tree) '())
        ((and (null? (cadr Tree)) (null? (caddr Tree))) '())
        (else (append (list (car Tree)) (internals (cadr Tree)) (internals (caddr Tree)))))))

(internals tree)