main
    define class_number int

    define counter int

    if 1 = 1 then                                           # 条件判等是一个等号
        display "Of course!"
    else                                                    # 有 else 分支但是没有 else if，如果要多条件判断用 case，具体看下面
        display "If you can see this, the compiler must be thrown into the garbage can!"
    end if

    let class_number = 2
    case class_number                                       # case 后有跟值的类似你知道的 switch
    when 1                                                  # 当 case 后的值跟 when 里的值一样就会跳转到该部分执行
        display "I'm in class 1."                           # 一般推荐这样缩进
    when 2    display "I'm in class 2."                     # 如果语句简单的话就这样缩进就行了
    when 3    display "I'm in class 3."                     # 这个 when 语句会自动 break，如果你要达成类似其他语言多个情况执行都相同操作的效果，可以配合 goto
    otherwise display "I'm NEET."                           # 上面 when 条件都不符合的情况执行这个
    end case

    case                                                    # 后面没跟值的相当于连续 if else if
    when class_number <= 0                                  # 这里可以直接写条件表达式
        display "Wrong number! Class number can't be negative or zero."
    when class_number > 0
        display "OK right number OK."
    when 1 <> 0                                             # 不等判断是用 <>，因为 when 只会执行最先符合的分支，所以这里不会执行
        display "True. But I'll never displayed."
    end case

    let counter = 1
    while counter <= 3                                      # while 循环，4GL 的下标是从 1 开始的所以推荐条件写等号
        display "counter:", counter
        let counter = counter + 1                           # 我知道你在想什么，没有自增 1 的简便写法
    end while

    for counter = 1 to 3                                    # for 循环，变量默认每次自增 1，计数变量必须提前 define 不然报错
        display "counter:", counter
    end for

    for counter = 1 to 9 step 2                             # step 可以指定计数变量自增的大小
        if counter = 5 then
            continue for                                    # continue ??? 就是你知道的 continue，相应的 while 也是这样写
        end if
        if counter = 9 then
            exit for                                        # exit ??? 是你知道的 break，while 同上
        end if
        display "counter:", counter
    end for

    exit program 0                                          # 这是退出整个程序，后面跟状态码
end main
