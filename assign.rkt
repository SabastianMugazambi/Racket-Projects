#lang racket
;;@author: Sabastian Mugazambi
;;@Purpose: Assignment for Programming Languages 

(define seq
  (lambda (first last)
    (if (> first last)
        #f
        (cons first
            (lambda () (seq (+ first 1) last))))))

;;(seq 1 2)

(define inf-seq
  (lambda (first)
    (cons first (lambda () (inf-seq (+ first 1))))))

;;(inf-seq 10)

(define first-n
  (lambda (l n)
    (cond ((null? l) '())
          ((equal? n 0) '())
          ((equal? (cdr l) #f) '())
          (else (cons (car l) (first-n  ((cdr l)) (- n 1)))))))
                                      
;;(first-n (inf-seq 1) 20)


(define nth
  (lambda (l n)
    (if (equal? (length (first-n l n)) n) 
        (car (reverse (first-n l n)))
        #f)))

;;(nth (seq 1 10) 5)

(define filter-multiples 
  (lambda (l n)
    (cond ([or (null? l) (equal? l #f)] '())
          ([equal? ((cdr l)) #f] '())
          ([equal? (modulo (car l) n) 0] (cons (car ((cdr l))) (lambda () (filter-multiples ((cdr ((cdr l)))) n))))
          (else (cons (car l) (lambda () (filter-multiples ((cdr l)) n)))))))

;;(filter-multiples (seq 1 10) 2)
;;((cdr (filter-multiples (seq 1 10) 2)))
;;((cdr((cdr (filter-multiples (seq 1 10) 2)))))

(first-n (filter-multiples (inf-seq 1) 2) 10)
    
             