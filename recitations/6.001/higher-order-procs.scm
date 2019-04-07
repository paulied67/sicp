#lang sicp

; definitions
(define dx 0.00390625) ; define a constant; has an exact binary fraction representation
(define (square x) (* x x)) ; function that squares a number
;(define (ddx f x)
;  (/
;     (- (f (+ x dx)) (f x))
;     dx
;   )
;); find the derivative of a number

; call the ddx function
;(ddx square 3)

; However, this procedure is, technically speaking, ugly! Its signature is
; ((number ==> number), number) ==> number

; and it appears to confound two separate issues:
;  (1) how to find a numerical approximation to the derivative of a function, and
;  (2) how to evaluate that derivate at a particular value of x.

; Instead, we should prefer the following:

(define (deriv f)
  (lambda (x)
    (/ (- (f (+ x dx))
          (f x))
       dx)))

((deriv square) 3)
;Value: 6.00390625

; This deriv procedure's signature is
; (number ==> number) ==> (number ==> number)

; which is much more regular
; (it transforms an input of a certain type into an output of the same type),
; and then allows us to define ddx in terms of deriv, if we choose, as

(define (ddx f x)
  ((deriv f) x))

; Elegance has its rewards, because if we now become interested in taking the
; second derivative of a function, we can simply compose our existing ability
; to take the first derivative, twice. Thus, for example:

((deriv (deriv square)) 3)
;Value: 2.

; Further, we might try

((deriv (deriv (deriv square))) 3)
;Value: 0.

; which is great. In fact, if we define

(define (compose f g)
  (lambda (x)
    (f (g x))))

; then note that we may define

(define 2nd-deriv (compose deriv deriv))

; and indeed

((2nd-deriv square) 8)
;Value: 2.

; Note that we first saw compose as a procedure that composes two procedures each of which has signature
; number ==> number

; leading to examples of its use such as

((compose square sqrt) 7)
;Value: 7.000000000000001

; In the present case, we are using it on two procedures each of which has signature
; (number ==> number) ==> (number ==> number)

; The fact that we are able to do this without changing the definition
; of compose indicates that we have successfully captured some essence
; of the mathematical notion of composition.

; playing with lambdas (file:///Applications/Racket%20v7.2/doc/r5rs/r5rs-std/r5rs-Z-H-7.html#%25_idx_96)
(lambda (x) (+ x x)) ; <-- this is of type 'procedure'
((lambda (x) (+ x x)) 3) ; <-- using the function instead of a function label

