database gfastl5                                            # ????????????????????????????

main
    define  employee    record                              # ?????????????????
                id      char(10),
                name    varchar(50),
                age     int
            end record

    display "database OK"

    create temp table fgl_sample(                           # ????????????? IO ??
        id   char(10),
        name varchar(50),
        age  int
    ) with no log

    insert into fgl_sample values("VP00951", "zjc", 20)     # ?
    insert into fgl_sample values("VP00952", "qwe", 21)     # ???????????
    insert into fgl_sample values("VP00953", "asd", 20)

    select *
      into employee.*                                       # ????????? 4GL ?????
      from fgl_sample
     where name = "qwe"

    display employee.*

    display "=================================================="

    declare cur_employee_age20 cursor for                   # ????????????????? free
     select *
       from fgl_sample
      where age = employee.age - 1

    open cur_employee_age20                                 # ???????????

    fetch cur_employee_age20 into employee.*                # fetch into ??????
    display employee.*
    fetch cur_employee_age20 into employee.*
    display employee.*

    fetch cur_employee_age20 into employee.*                # ??????? 2 ??? fetch ??????????
    display employee.*

    close cur_employee_age20                                # ????
    free cur_employee_age20                                 # ????????????????????????

    display "=================================================="

    declare cur_employee_all cursor for
     select *
       from fgl_sample

    open cur_employee_all
    while true                                              # while ??????
        fetch cur_employee_all into employee.*
        if sqlca.sqlcode = notfound then exit while end if  # sqlca.sqlcode ? SQL ????????????????? IBM ????????
                                                            # notfound ?????? 100??????????????

        display employee.*
    end while

    display "=================================================="

    foreach cur_employee_all into employee.*                # foreach ??????????? fetch ???????????
        display employee.*
    end foreach

    free cur_employee_all

    begin work                                              # ??
    commit work

    begin work
    rollback work

end main
