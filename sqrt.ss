; 求x平方根，牛顿逐步逼近法
; 猜测数为y，从1开始猜测，看x/y和y的平均值是否符合需求，不符合则继续用该平均值作为猜测数继续下一轮
(define (sqrt x)
    (define (average a b)
        (/ (+ a b) 2))
    (define (good-enuf? y)
        (< (abs (- x (* y y))) 0.01))
    (define (improve y)
        (average (/ x y) y))
    (define (try y)
        (if (good-enuf? y)
            y
            (try (improve y))))
    (try 1))


(display (sqrt 2))
