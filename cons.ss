; cons构造对象,一对数据。car取第一个 cdr第二个
(define x (cons 2 3))
(display (car x))
(display "\n")
(display (cdr x))
(display "\n")

; list 链表，相当于多个cons拼接
(define 1to4 (list 1 2 3 4))
(display 1to4)
(display "\n")

(display (car (cdr (cdr 1to4))))
(display "\n")

; cdr cdr ... 的方式太蠢，应该递归
; 例子：定义一个将list里元素都放大的方法
(define nil '())
(define (scale-list s l)
    (if(null? l)
        nil
        (cons (* (car l) s)
            (scale-list s (cdr l)))))
(display (scale-list 10 1to4))
(display "\n")

; 上面方法是对list里每个元素进行操作，将操作行为也继续抽象，map
(define (map p l)
    (if(null? l)
        nil
        (cons (p (car l))
            (map p (cdr l)))))

(define (scale-list s l)
    (map (lambda(x)(* 10 x)) l))

(display (scale-list 10 1to4))
(display "\n")
