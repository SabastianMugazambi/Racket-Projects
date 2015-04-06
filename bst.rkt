#lang racket
;; Camille Benson & Sabastian Mugazambi

;; creates a null Binary Search Tree
(define null-bst
  (lambda ()
    null))

;; checks if BST is empty
(define null-bst?
  (lambda (bst)
    (null? bst)))

;; returns the parent node of the entered bst
;; checks if valid bst
(define entry
  (lambda (bst)
    (if (and (equal? (length bst) 3)
             (list? (car (cdr bst)))
             (list? (cdr (cdr bst))))
        (car bst)
        #f)))

;; returns the left node of the entered bst
(define left
  (lambda (bst)
    (if (null? bst)
        #f
        (car (cdr bst)))))

;; returns the right node of the entered bst
(define right
  (lambda (bst)
    (if (null? bst)
        #f
        (car (cdr (cdr bst))))))

;; creates a new bst with an entered character and two lists
(define make-bst 
  (lambda (elt left right)
    (if (and (number? elt)
             (or (null? left)
                 (and (equal? (length left) 3)
                      (list? (cdr (cdr left)))
                      (list? (car (cdr left)))))
             (or (null? right)
                 (and (equal? (length right) 3)
                      (list? (cdr (cdr right)))
                      (list? (car (cdr right))))))
        (list elt left right)
        #f)))

;; traverse bst by acting on the node, traversing left then right.
(define preorder
  (lambda (bst)
    (if (null? bst)
        null
        (cons (entry bst) 
              (append (preorder (left bst))
                      (preorder (right bst)))))))

;: traverse bst by traversing left, acting on the node, then traversing right.
(define inorder 
  (lambda (bst)
    (if (null? bst)
        null
        (append (append (inorder (left bst))
                        (list (entry bst)))
                        (inorder (right bst))))))
;; traverse bst by traversing left, then right, then acting on the node.
(define postorder 
  (lambda (bst)
    (if (null? bst)
        null
        (append (append (postorder (left bst))
                        (postorder (right bst))
                        (list (entry bst)))))))

;; creates a new bst of the original bst and the inserted value.
(define insert 
  (lambda (v bst)
    (cond ((equal? (entry bst) v) bst)
          ((null? bst) (make-bst v '() '()))
          ((< (entry bst) v) (make-bst (entry bst) (left bst) (insert v (right bst))))
          ((> (entry bst) v) (make-bst (entry bst) (insert v (left bst)) (right bst))))))
          
           
        
