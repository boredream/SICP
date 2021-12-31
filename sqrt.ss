; 求平方根，判断 x/y 和 y 的平均值，是否接近结果，如果不够，则将平均值作为y继续尝试
(define (sqrt x)
    (define tol 0.00001)
    (define (average a b)
        (/ (+ a b) 2))
    (define (good-enuf y)
        (< (abs (- (* y y) x)) tol))
    (define (improve y)
        (average (/ x y) y))
    (define (try y)
        (if (good-enuf y) 
        y 
        (try(improve y))))
    (try 1))

(display (sqrt 16))
