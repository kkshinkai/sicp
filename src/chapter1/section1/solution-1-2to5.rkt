#lang racket
;;1-2
(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5))))) (* 3 (- 6 2) (- 2 7)))

;;1-3
#|Define a procedure that takes three numbers
as arguments and returns the sum of the squares of the two
larger numbers.
|#

(define sum-square (lambda (x y)(+ (* x x) (* y y))))

(define (new-sum x y z)
  (cond((and (> x y) (> y z)) (sum-square x y))
       ((and (> x y) (> z y)) (sum-square x z))
       ((and (> y x) (> z x)) (sum-square z y))))
;test
(new-sum 1 2 3)

;;1-4
#|Observe that our model of evaluation allows
for combinations whose operators are compound expressions. Use this observation to describe the behavior of the
following procedure|#

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

;if return a procedure
(a-plus-abs-b 1 -2)

;;1-5
#| Applicative Order and Normal Order
In Applicative-Order mode, all argument will be calculate first,which cause infinite loop in this case.(define (p) (p))
In Normal-Order mode, only when this value is needed, the actual parameter value passed in will be calculated.
So, in this example, the interpreter that can return 0 normally uses Normal Order.
If the interpreter stalls, then the interpreter uses Applicative Order.
|#
(define (p) (p))
(define (test x y)
(if (= x 0) 0 y))
;In this interpretor, Applicative Order is used. Therefore, "(test 0 (p))" will cause infinite loop. 
;(test 0 (p))
