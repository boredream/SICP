; 1.1
(define a 3)
(define b (+ a 1))

(display
(if (and (> b a) (< b (* a b)))
    b
    a)
)(newline)

(display
(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25))
)(newline)

(display
(+ 2 (if (> b a) b a))
)(newline)

(display
(* (cond ((> a b) a)
         ((< a b) b)
         (else -1))
    (+ a 1))
)(newline)

; 1.2
(newline)
(display
(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5)))))
   (* 3 (- 6 2) (- 2 7)))
)(newline)

; 1.3 找仨里最大俩的和
(newline)
(define (add3 a b c)
    (cond ((and (>= (+ a b) (+ a c)) (>= (+ a b) (+ b c))) (+ a b))
          ((and (>= (+ a c) (+ b c)) (>= (+ a c) (+ a b))) (+ a c))
          (else (+ b c))))
(display
(add3 1 2 3)
)(newline)
(display
(add3 1 1 1)
)(newline)
(display
(add3 1 1 2)
)(newline)
(display
(add3 1 4 3)
)(newline)
(display
(add3 3 2 1)
)(newline)
(display
(add3 2 1 3)
)(newline)

; 1.4 if的返回值可以是运算符
(newline)
(define (a-plus-abs-b a b)
    ((if (> b 0) + -) a b))
(display
(a-plus-abs-b 1 -1)
)(newline)
(display
(a-plus-abs-b 1 1)
)(newline)

; 1.5

; 1.6 自定义if语句
(newline)
(define (new-if predicate then-clause else-clause)
    (cond (predicate then-clause)
          (else else-clause)))
(display
(new-if (= 2 3) 0 5)
)(newline)

; if语句只会执行和返回对应分支的语句。自定义的new-if传入的俩clause语句都会执行
(if #t (display "true") (display "false"))(newline) ; true
(new-if #t (display "true") (display "false"))(newline) ; false true

; 1.7 牛顿平方根优化good-enuf? 利用两次差值
(newline)
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

(define (sqrtNew x)
    (define (average a b)
        (/ (+ a b) 2))
    (define (good-enuf? oldY newY)
        (< (/ (abs (- newY oldY)) oldY) 0.01)) ; 新值变化的比例<0.01时视为足够好
    (define (improve y)
        (average (/ x y) y))
    (define (try y)
        (define newY (improve y))
        (if (good-enuf? y newY)
            y
            (try newY)))
    (try 1))

; 原版sqrt有问题，过小的值时很容易<0.01，无法达到精确值；过大的值时一直到不了0.01会无限循环
(display
(sqrt 0.0009)
)(newline)
; 所以使用比例值更合适
(display
(sqrtNew 0.0009)
)(newline)

; 1.8 牛顿法求立方根
(newline)
(define (cubet x)
     (define (averageNew a b)
        (/ (+ (/ a (* b b)) (* 2 b)) 3))
    (define (good-enuf? oldY newY)
        (< (/ (abs (- newY oldY)) oldY) 0.01))
    (define (improve y)
        (averageNew x y))
    (define (try y)
        (define newY (improve y))
        (if (good-enuf? y newY)
            y
            (try newY)))
    (try 1))
(display
(cubet 27)
)(newline)

