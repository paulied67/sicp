#lang sicp

(define (sq a) (* a a))
(define (sq-sum a b) (+ (sq a) (sq b)))


(define (dosqr a b c)
  (cond ((and (< a b) (< a c)) (sq-sum b c))
      (else (cond ((and (< c b) (< c a)) (sq-sum b a))
        (else (sq-sum a c))))))

(dosqr 3 4 3)

  