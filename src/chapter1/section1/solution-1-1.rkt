#lang racket

#| Exercise 1.1: Below is a sequence of expressions. What is the result printed by the interpreter in
response to each expression? Assume that the sequence is to be evaluated in the order in which it is
presented. |#

(require rackunit)

(define-syntax solution
  (syntax-rules (>>> Expected:)
    [(solution number >>> in Expected: out)
     (check-equal? in out (string-append "solution " (symbol->string number)))]
    [(solution number >>> (def ...)) (def ...)]))


[ solution '1.1.1
  >>> 10
  Expected: 10 ]

[ solution '1.1.2
  >>> (+ 5 3 4)
  Expected: 12 ]

[ solution '1.1.3
  >>> (- 9 1)
  Expected: 8 ]

[ solution '1.1.4
  >>> (/ 6 2)
  Expected: 3 ]

[ solution '1.1.5
  >>> (+ (* 2 4) (- 4 6))
  Expected: 6 ]

[ solution '1.1.6
  >>> (define a 3) ]

[ solution '1.1.7
  >>> (define b (+ a 1)) ]

[ solution '1.1.8
  >>> (+ a b (* a b))
  Expected: 19 ]

[ solution '1.1.9
  >>> (= a b)
  Expected: #false ]

[ solution '1.1.10
  >>> (if (and (> b a) (< b (* a b)))
          b
          a)
  Expected: 4 ]

[ solution '1.1.11
  >>> (cond ((= a 4) 6)
            ((= b 4)
             (+ 6 7 a))
            (else 25))
  Expected: 16 ]

[ solution '1.1.12
  >>> (+ 2 (if (> b a) b a))
  Expected: 6 ]

[ solution '1.1.13
  >>> (* (cond ((> a b) a)
               ((< a b) b)
               (else -1))
         (+ a 1))
  Expected: 16 ]
