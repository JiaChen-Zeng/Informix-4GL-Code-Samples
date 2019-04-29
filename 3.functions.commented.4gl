main
    define sumed_number int

    define  numbers record
                a, b int
            end record

    call display_divider()                                  # 调用函数的单行语句

    call sum_int(114, 514) returning sumed_number           # 调用函数并接收返回值赋值给 sumed_number，这种写法可以接收多个返回值，具体看下面
    display sumed_number

    let sumed_number = sum_int(1919, 810)                   # 调用函数的内联写法，只能把返回值赋给一个变量
    display sumed_number

    call display_divider()

    let numbers.a = 1
    let numbers.b = 2

    display numbers.*
    call swap(numbers.*) returning numbers.*                # 函数无法接收记录类型，相对地，可以用 * 一次性表示全部成员，可以当做函数实参，还可以当做返回值
    display numbers.*
end main

function display_divider()                                  # 函数定义
    display "=================================================="
end function

function sum_int(a, b)                                      # 接收两个参数
    define a, b int                                         # 参数也需要 define 以声明类型
    return a + b                                            # return 语句
end function

function swap(a, b)
    define a, b int
    return b, a                                             # 可以返回多个值
end function
