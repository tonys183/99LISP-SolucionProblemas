#lang scheme

(define range
    (lambda (i j)
    (cond ((= i j) (cons i '()))
      (else (cons i (range (+ i 1) j))))))
        
(range 10 20)