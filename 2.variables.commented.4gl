# 有点长，不急，一行一行读
globals                                     # 这块区域声明全局变量
    define name        varchar(50)          # 变量声明语句，4GL 的类型都类似数据库的类型，这个是字符串，不像低级语言，它能容纳 50 长度的字符而不是 49，它最后没有 \0
    define employee_id char(10)             # char 跟 varchar 的区别就是 char 后面有空白填充
                                            # 除了要跟数据库表里类型一样的时候，都推荐用 varchar，因为 4GL 的 varchar 跟 char 所占空间相同
end globals

main
    define age      int,                    # define 语句必须写在函数的最开头，主函数也算一种函数，多个变量用逗号简写
           your_age integer                 # int 跟 integer 指的是完全一样的类型，都是 4 字节整数

    define width, height int                # 如果变量类型一样的话可以这样用逗号简写
                                            # 变量一般都有初始值，整数的话是 0

    define  cat             record          # 记录类型，类似于结构体，这个缩进是我偏好的，因为我还没正式进入过项目组所以… 看着办
                                            # 4GL 中没有定义类型，所以如果多个变量都是同样的记录类型的话，只能把类型部分复制多次
                                            # 记录类型中还可以嵌套记录类型，具体看书
                                            # 4GL 没有操作指针的能力，无法声明递归结构的记录类型
                head        smallint,       # 下面展示一点你知道的数据库的类型
                tail        int,
                leg         bigint,
                birthday    datetime year to second,
                alive       int,            # 没有布尔类型，用整数代替
                message     varchar(20)
            end record

    let name = "zjc"                        # 字符串字面量用 "" 或者 '' 括起来
    let employee_id = 'VP', '00951'         # 连接字符串用 , 或者 || ，两个效果有点不一样，具体看书

    display employee_id, name               # 注意输出的这两个文字之间有空格，参照第 3 行想想为什么
    display employee_id clipped, name       # clipped 可以去掉多余的空格

    display "=================================================="

    let AgE = 20                            # 4GL 大小写不敏感，这样写指的也是同样的 age 变量

    display age                             # 4GL 输出整数的时候会向右对齐，我也不知道怎么禁用掉，如果你知道的话写到这里

    display "=================================================="

    let cat.head = 1                        # 访问记录变量的成员用 .
    let cat.tail = 1
    let cat.leg = 4
    let cat.birthday = current              # 表示当前时间的关键字
    let cat.alive = true                    # 虽然没有布尔类型但是有关键字，其实就是整数，true 是 1，false 是 0
    let cat.message = "meow! meow!!!"       # 英文的喵喵，顺便说下日文是めう你信吗

    display cat.*                           # 使用 * 可一次性代表记录的全部成员
end main
