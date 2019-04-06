#lang sicp

(define (a-plus-abs-a a b)
  ((if (> b 0) + -) a b))

(a-plus-abs-a 10 10)
(a-plus-abs-a 10 -10)
(a-plus-abs-a 3 5)
(a-plus-abs-a 3 -5)