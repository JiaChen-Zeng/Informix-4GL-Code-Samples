main
    define index int

    define string     varchar(10),      # 字符数组
           sub_string varchar(10)

    define numbers array [5] of int     # 静态数组，长度为 5，of 后面接元素类型

    define bitmap array [4, 5] of int   # 二维静态数组，维度最多到 3

    define vector dynamic array of int  # 动态数组，到运行时才分配内存空间，可以动态改变长度

    let string = "abcdefg"

    let sub_string = string[1]          # 下标从 1 开始，截取一个字符
    display sub_string

    let sub_string = string[1, 5]       # 截取一段字符
    display sub_string

    display "=================================================="

    let numbers[1] = 1                  # 静态数组也是一样
    let numbers[2] = 3
    let numbers[3] = 5

    display numbers[1], numbers[2], numbers[3]

    let bitmap[1, 1] = 9                # 二维的写法，跟定义的时候类似
    display bitmap[1, 1]

    display "=================================================="

    display numbers[0]                  # 越界访问结果不可预测，RP 好的话你会看到 0
    display numbers[4], numbers[5]      # 还没有赋值的元素结果不可预测

    display "=================================================="

    allocate array vector[3]            # 分配 3 个元素的内存空间，并会初始化内容元素为 null

    for index = 1 to 3
        display vector[index]           # null 输出的时候会输出一个空格
        let vector[index] = index ** 2  # 幂乘
    end for

    resize array vector[5]              # 重新分配数组大小，原有数组内容会保留

    for index = 1 to 5
        display vector[index]
    end for

    deallocate array vector             # 释放数组空间，有需要释放吗？

    display "=================================================="

    initialize numbers to null          # 可以用这个一次性初始化数组所有值为 null

    let numbers[1] = 2
    let numbers[2] = 4
    let numbers[3] = 6
    let numbers[4] = 8

    let index = 1
    while numbers[index] is not null    # 对最后一个元素一定为 null 的数组建议条件像这样迭代，注意若全部填充了就会越界
        display numbers[index]
        let index = index + 1
    end while
end main
