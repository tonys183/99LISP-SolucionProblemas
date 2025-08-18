#lang scheme

(define lista '(a b c d))

(define combinations
    (lambda (k L)
    (cond ((= k 0) (list '()))
        ((null? L) '())
        (else (append (map (lambda (c) 
                            (cons (car L) c)) (combinations (- k 1) (cdr L))) (combinations k (cdr L)))))))

(combinations 2 lista)