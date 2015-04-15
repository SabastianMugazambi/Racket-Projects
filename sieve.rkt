#lang racket
;;@author: Sabastian Mugazambi
;;@Purpose: Assignment for Programming Languages 

;;@Function that takes two integers and returns an integer lazy list containing the sequence of values first, first+1, ... , last.
(define seq
  (lambda (first last)
    (if (> first last)
        #f
        (cons first
            (lambda () (seq (+ first 1) last))))))
;;(seq 1 2)

;;@Function that takes an integer and returns an integer lazy list containing the infinite sequence of values first,first+1, ....
(define inf-seq
  (lambda (first)
    (cons first (lambda () (inf-seq (+ first 1))))))
;;(inf-seq 10)

;;@Function that takes a lazy list and an integer and returns an ordinary Racket list containing the first n values in the lazy-list.
(define first-n
  (lambda (l n)
    (cond ((null? l) '())
          ((equal? n 0) '())
          ((equal? (cdr l) #f) '())
          (else (cons (car l) (first-n  ((cdr l)) (- n 1)))))))                                      
;;(first-n (inf-seq 1) 20)


;;@Function that takes a lazy list and an integer and returns the n-th value in the lazy-list (counting from 1).
(define nth
  (lambda (l n)
    (if (equal? (length (first-n l n)) n) 
        (car (reverse (first-n l n)))
        #f)))
;;(nth (seq 1 10) 5)

;;@Function that returns a new lazy list that has n and all integer multiples of n removed from lazy-list.
(define filter-multiples 
  (lambda (l n)
    (cond ([or (null? l) (equal? l #f)] '())
          ([equal? ((cdr l)) #f] '())
          ([equal? (modulo (car l) n) 0] (cons (car ((cdr l))) (lambda () (filter-multiples ((cdr ((cdr l)))) n))))
          (else (cons (car l) (lambda () (filter-multiples ((cdr l)) n)))))))
;;(first-n (filter-multiples (inf-seq 1) 2) 11)

;;@Function that helps the primes function return the prime numbers.
(define sieve 
  (lambda (l)
    (cons (car l) (lambda () (sieve (filter-multiples ((cdr l)) (car l)))))))        

;;@Function that computes a lazy list containing all prime numbers, starting at 2, using the "Sieve of Eratosthenes."
(define primes
  (lambda ()
    (sieve (inf-seq 2))))  

;;(first-n (primes) 10) 
;;(nth (primes) 20)