#lang racket

#| Exercise 1.7:
Change the improve method.
|#

(define (sqrt-iter guess x)
  (if (good-enough? guess (improve guess x))
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define ( average x y)
  (/ (+ x y) 2))

(define (abs x) (if(< x 0)(- x)x))

(define (good-enough? old-guess new-guess)
  (< (/ (abs (- new-guess old-guess)) old-guess) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 0.000000000000000000000000000000000001)
