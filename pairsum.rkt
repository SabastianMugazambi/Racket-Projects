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
                                             
(pair-sum (gen-list 1 100) 199)

;;@Function: An alternative to generating the entire list of numbers which instead produce a lazy list
(define gen-lazy-list
  (lambda (start stop)
    (if (> start stop)
        #f
        (cons start
            (lambda () (gen-lazy-list (+ start 1) stop))))))

(gen-lazy-list 1 2)

;;@Function takes the outout of the gen-lazy-list and  
(define pair-sum-lazy 
  (lambda (lst v)
    (if (equal? #f  ((cdr lst)))
        #f
         (if (equal? (+ (car lst) (car((cdr lst)))) v) #t
             (pair-sum-lazy ((cdr lst)) v)))))

(pair-sum-lazy (gen-lazy-list 1 100) 1000)

