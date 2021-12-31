; 递归 a累加到b
(define (sum-int a b) 
    (if(> a b) 
    0 
    (+ a (sum-int (+ a 1) b))))

(display (sum-int 1 5))
(display "\n")

; 抽取 将累加的a元素、和a下个迭代都抽取出来，将过程直接作为参数先定义再使用
;(define (term a)
;    (* a a))
;(define (next a)
;    (+ a 1))
;(define (sum a b)
;    (if(> a b)
;    0
;    (+ (term a) (sum (next a) b))))
;(display (sum 1 5))

; 也可以将方法直接作为参数，以模板方法，直接重新定义新方法
(define (sum term a next b)
    (if(> a b)
    0
    (+ (term a) (sum term (next a) next b))))

; 可以在定义的函数再定义需要的方法
(define (sum-int a b)
    (define (identity x) x)
    (sum identity a 1+ b))
(display (sum-int 1 5))
(display "\n")

; 可以直接使用匿名方法
(define (sum-sqr a b)
    (sum (lambda(x)(* x x)) a (lambda(x)(+ x 1)) b))

(display (sum-sqr 1 5))
(display "\n")