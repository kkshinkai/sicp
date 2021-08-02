#lang racket

#| Exercise 1.6: This exercise mainly talk about the difference about Applicative Order and Normal Order.
"else-clause" of "new if" will be expanded at the beginning, and will lead to the infinite loop of the program.
|#

;;original
(define (improve guess x)
  (average guess (/ x guess)))

(define ( average x y)
  (/ (+ x y) 2))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (square x)(* x x))

(define (abs x) (if(< x 0)(- x)x))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))



(sqrt 9)
;;new-if error:Interactions disabled; out of memory
;;(new-sqrt 9)