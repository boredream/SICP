; 1.9 递归和迭代
(define (inc x)
    (+ x 1))
(define (dec x)
    (- x 1))
(define (add a b)
    (display a)(display b)(newline)
    (if (= a 0)
        b
        (inc (add (dec a) b))))
(display
(add 4 5)
)(newline)

(define (add2 a b)
    (display a)(display b)(newline)
    (if (= a 0)
        b
        (add2 (dec a) (inc b))))
(display
(add2 4 5)
)(newline)

; 1.10 Ackermann函数
(newline)
(define (A x y)
    (cond ((= y 0) 0)
          ((= x 0) (* 2 y))
          ((= y 1) 2)
          (else (A (- x 1) (A x (- y 1))))))  
(display
(A 1 10)
)(newline)
; A 0 (A 1 9) -> 2* (A 1 9) -> 2* (A 0 (A 1 8)) -> 2* 2* (A 1 8) ... 
; 等价于 2^10

(display
(A 2 4)
)(newline)
; A 1 (A 2 3) 等价于 2^(A 2 3)
; A 2 3 -> A 1 (A 1 2) 等价于 2^(A 1 2)
; ... 2平方的平方3次 2*2=4*4=16*16=256*256=65536

(display
(A 3 3)
)(newline)

; 2n
(define (f n) (A 0 n))
; 2^n
(define (f n) (A 1 n))
; (((2^2)^2)^2)...n次
(define (f n) (A 2 n))

; 1.11 递归and迭代计算 fn
; 递归
(define (f n)
    (if (< n 3) 
        n
        (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3))))))
(display
(f 4)
)(newline)

; 迭代 ？？？


