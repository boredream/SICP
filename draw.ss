; lec3a 画小人的例子
(define (for-each p l)
    (cond ((null? l) "done")
          (else (p (car l))
                (for-each p (cdr l)))))

; 矩形内的坐标点变化函数
(define (coord-map rect)
    (lambda(point)
        (+vect
            (+vect (scale (xcor point) (horiz rect))
                    (scale (ycor point) (vert rect)))
            (origin rect))))

; 绘制图形函数。遍历线段列表seglist里所有线段，然后用rect对其做coord-map变换，最后drawline画出来
(define (make-picture seglist)
    (lambda (rect)
        (for-each
            (lambda(s)
                (drawline 
                    ((coord-map rect) (seg-start s))
                    ((coord-map rect) (seg-end s))))
            seglist)))


