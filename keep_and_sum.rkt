#lang racket
;;Keep_and_Sum Racket Lab Assignment 
;;@author Sabastian Mugazambi
;;@CS 251

;;@Keep-first-n : A function that returns the first n elements of a list
(define keep-first-n 
  (lambda (n L)
    ( cond ((< n 0) '(Error!: Please enter an interger >= 0))
           ((> n (length L)) '(Error!: Interger larger than length of list, please enter smaller interger.))
           ( else (if (= n 0)
                      '()
                      (cons (car L) 
                            (keep-first-n (- n 1) (cdr L))))))))

;;Calling the function to test           
(keep-first-n 5 '(a b c d e f g h i))

;;@Sum : A function that adds up all the elements in a list. 
;;initialising a variable to be used to store the sum
(define a 0)
(define sum
  (lambda (L)
    (if (null? L)
        0
        (+ a (+ (car L) (sum (cdr L)))))))

;;Calling the function to test
(sum '(4 5 0 1))