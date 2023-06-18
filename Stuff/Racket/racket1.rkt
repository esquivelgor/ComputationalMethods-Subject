#lang racket

"un string"

(+ 1 1)

; Comment here
(/ 7 3)

(exact->inexact 1/3)


(exact->inexact(/(+ 40 78 21 91 97 100)6))


(expt 2 3)


(positive? -3)
(odd? 3)
(integer? 3/3)

(define x 10)

; Function definition
(define
  (cuadrado x)(* x x)
  )

(define
  (cm-in x)(/ 2.54)
  )

;(define(abs x)(if (> x 0) x (- x)))

;(abs -5)

(define(abs x)(cond
                ((<= 0) x)
                ((>= 0) (- x))
))

(not #t)
(and #t #f)

(define(>= x y)(if (> y x) #t #f))

(define(sum n)(if (= n 1) 1 (+ n (sum (- n 1)))))
(define(power a b)(if (= b 0) 1 (* a (power a (- b 1)))))

'(1 2 3 4)

(car '(a b c))

(cdr '(a b c))

(car(cdr '(a b c)))

(caddr '(a b c))

(cdadr '((a) (b c) (d) e))

(cdr(cons 1 2))
;(cr(cons 1 '()))

((lambda(x)(* x x))5)