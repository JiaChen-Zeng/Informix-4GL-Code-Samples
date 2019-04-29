
globals
    define name        varchar(50)
    define employee_id char(10)
end globals

main
    define age      int,
           your_age integer

    define width, height int

    define  cat             record
                head        smallint,
                tail        int,
                leg         bigint,
                birthday    datetime year to second,
                alive       int,
                message     varchar(20)
            end record

    let name = "zjc"
    let employee_id = 'VP', '00951'

    display employee_id, name
    display employee_id clipped, name

    display "=================================================="

    let AgE = 20

    display age

    display "=================================================="

    let cat.head = 1
    let cat.tail = 1
    let cat.leg = 4
    let cat.birthday = current
    let cat.alive = true
    let cat.message = "meow! meow!!!"

    display cat.*
end main
