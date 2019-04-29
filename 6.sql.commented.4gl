database gfastl5                                            # 指定数据库，如果你的数据库不一样的话修改一下这里

main
    define  employee    record                              # 一般记录类型像这样用，跟表里的类型一样
                id      char(10),
                name    varchar(50),
                age     int
            end record

    create temp table fgl_sample(                           # 可以直接写创建临时表，不过注意需要 IO，不是必要就用普通数组
        id   char(10),
        name varchar(50),
        age  int
    ) with no log

    if sqlca.sqlcode = 0 then                               # sqlcode 是 SQL 状态码，0 代表成功，具体查看 IBM 的某网页，搜下就有
        display "create OK"
    else
        exit program -1
    end if

    insert into fgl_sample values("VP00951", "zjc", 20)     # 增
    insert into fgl_sample values("VP00952", "qwe", 21)     # 改和查你会的
    insert into fgl_sample values("VP00953", "asd", 20)

    select *
      into employee.*                                       # 可以直接查询并赋值给 4GL 的变量
      from fgl_sample
     where name = "qwe"

    display employee.*

    display "=================================================="

    declare cur_employee_age20 cursor for                   # 声明游标，生命周期直至 free
     select *
       from fgl_sample
      where age = employee.age - 1

    open cur_employee_age20                                 # 打开游标后才能拉取

    fetch cur_employee_age20 into employee.*                # 获取新的一条数据
    display employee.*
    fetch cur_employee_age20 into employee.*
    display employee.*

    fetch cur_employee_age20 into employee.*                # 这个查询应只会查出 2 条数据，再 fetch 也没有新数据，这时不会对变量产生影响
    display employee.*

    close cur_employee_age20                                # 关闭游标
    free cur_employee_age20                                 # 释放游标后不能再次使用此游标

    display "=================================================="

    declare cur_employee_all cursor for
     select *
       from fgl_sample

    open cur_employee_all
    while true                                              # while 迭代游标的写法
        fetch cur_employee_all into employee.*
        if sqlca.sqlcode = notfound then exit while end if  # notfound 关键字为整数 100，代表成功执行但是没有新数据

        display employee.*
    end while

    display "=================================================="

    foreach cur_employee_all into employee.*                # foreach 方式迭代游标，全自动 fetch 甚至还能打开已关闭的游标
        display employee.*
    end foreach

    free cur_employee_all

    begin work                                              # 事务
    commit work

    begin work
    rollback work

end main
