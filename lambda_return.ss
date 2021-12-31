(define (average a b)
    (/ (+ a b) 2))

; f 作为方法参数，最后方法体返回的数据还是一个lambda方法
(define average-damp 
    (lambda(f)
        (lambda(x)(average (f x) x))))

; 也可以等价写为如下。lambda的意义在于不用给匿名函数起个名
(define (average-damp f)
    (define (foo x)
        (average (f x) x))
    foo)

; 入参出参都是方法，所以是无法直接使用的，应该要外套一个方法传入参数
(define (sqrt x)
    body)

; 原始求平方根方法
(define (sqrt x)
    ; 略
    (define (improve y)
        (average (/ x y) y))
    (define (try y)
        (if (good-enuf y) 
        y 
        (try(improve y))))
    (try 1))

; 引入average-damp后简化写法
(define (sqrt x)
    ; 略
    (define (improve y)
        (average-damp lambda(a)(/ y a)))
    (define (try y)
        (if (good-enuf y) 
        y 
        (try(improve y))))
    (try 1))

