#lang racket
;;@author: Sabastian Mugazambi
;;@Purpose: Assignment for Programming Languages 

;;@Function that returns a list of consecutive numbers in the range 'start' to 'stop'
(define gen-list
  (lambda (start stop)
    (if (> start stop) '()
        (cons start (gen-list (+ 1 start) stop)))))

(gen-list 1 10)

;;@Function that tests whether any two adjacent values in numlist sum to val given.
(define pair-sum 
  (lambda (lst v)
    (if (equal? (length lst) 2)           
        (if (equal? (+ (car lst) (car(cdr lst))) v) #t
               #f)
            (if (equal? #t (pair-sum (cdr lst) v)) #t
                (equal? (+ (car lst) (car(cdr lst))) v)))))  
                                             
(pair-sum (gen-list 1 100) 1000)

;;lazy gen-sum
(define gen-lazy-list
  (lambda (start stop)
    (if (> start stop)
        #f
        (cons start
            (lambda () (gen-lazy-list (+ start 1) stop))))))
(gen-lazy-list 1 2)

;;@Function generates lazy list
(define pair-sum-lazy 
  (lambda (lst v)
    (if (equal? #f (cdr lst))
        (car lst)
         (if (equal? (+ (car lst) (pair-sum-lazy (cdr lst) v)) v) #t
             #f))))

(pair-sum-lazy (gen-lazy-list 1 2) 3)

