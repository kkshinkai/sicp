#lang racket

(require rackunit)

#| Exercise 1.2. Translate the following expression into prefix form:

                  5 + 4 + (2 - (3 - (6 + ⅘)))
                 ─────────────────────────────
                        3(6 − 2)(2 − 7)
|#
(check-equal?
 (/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5))))) (* 3 (- 6 2) (- 2 7)))
 -37/150)

#| Exercise 1.3. Define a procedure that takes three numbers as arguments and
returns the sum of the squares of the two larger numbers. |#

(define (sum-square x y)
  (+ (* x x) (* y y)))

(define (new-sum x y z)
  (cond ((and (> x y) (> y z)) (sum-square x y))
        ((and (> x y) (> z y)) (sum-square x z))
        ((and (> y x) (> z x)) (sum-square z y))))

(check-equal? (new-sum 1 2 3) 13)

#| Exercise 1.4. Observe that our model of evaluation allows for combinations
whose operators are compound expressions. Use this observation to describe the
behavior of the following procedure: |#

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

; 'if' returns a procedure
(check-equal? (if (> +1 0) + -) +) ; while 'b' is positive
(check-equal? (if (> -1 0) + -) -) ; while 'b' is non-positive

(check-equal? (a-plus-abs-b 1 -2) 3)

#| Exercise 1.5. Ben Bitdiddle has invented a test to determine whether the
interpreter he is faced with is using applicative-order evaluation or
normal-order evaluation. He defines the following two procedures: |#

(define (p) (p))
(define (test x y)
  (if (= x 0) 0 y))

#| Then he evaluates the expression |#

; (test 0 (p))

#| What behavior will Ben observe with an interpreter that uses
applicative-order evaluation? What behavior will he observe with an interpreter
that uses normal-order evaluation? Explain your answer. (Assume that the
evaluation rule for the special form if is the same whether the interpreter is
using normal or applicative order: The predicate expression is evaluated first,
and the result determines whether to evaluate the consequent or the alternative
expression.) |#

#| Answer: In applicative-order evaluation, arguments will be calculated first,
which causes an infinite loop in this case. In normal-order evaluation, the
arguments passed in will only be calculated by need.

;; Seriously? You missed the point, but the result is right ...
Thus, the interpreter that can return 0 expectedly uses normal order, the
interpreter that stucks uses applicative order.

What is the difference between the following two pieces of code?

    // (1)
    #define normal_test(x, y) ((x) == 0 ? 0 : (y))

    // (2)
    int app_test(int x, int y) {
        return x == 0 ? 0 : y;
    }

|#
