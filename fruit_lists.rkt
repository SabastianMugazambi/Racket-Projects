#lang racket
;;Keep_and_Sum Racket Lab Assignment 
;;@author Sabastian Mugazambi

;;@Shows a way of extracting a single element froma a list in racket
(car (cdr (cdr '(apple orange pear grapefruit))))
(car (car (cdr (cdr '((apple) (orange) (pear) (grapefruit))))))
(car (car (car (cdr (cdr '(apple (orange) ((pear)) (((grapefruit)))))))))
