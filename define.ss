; 定义函数
(define (sqr x)
    (* x x))
(display (sqr 10))
(display "\n")

; 语法糖，本质和上面是一样的
(define square (lambda (x) (* x x)))
(display (square 10))
(display "\n")

; 函数定义后，也作为参数使用
(define (average x y)
    (/ (+ x y) 2))
(define (mean-square x y)
    (average (square x) (square y)))
(display (mean-square 2 3))
(display "\n")

; 条件 condition
(define (abs x) 
    (cond ((< x 0) (- x))
        ((= x 0) 0)
        ((> x 0) x)))

; 条件 if
(define (abs2 x) 
    (if (< x 0) (- x) x))

(display (abs -1))
(display (abs 0))
(display (abs 1))
(display "\n")
(display (abs2 -1))
(display (abs2 0))
(display (abs2 1))
(display "\n")

