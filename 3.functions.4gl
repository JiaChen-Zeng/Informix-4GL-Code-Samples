main
    define sumed_number int

    define  numbers record
                a, b int
            end record

    call display_divider()

    call sum_int(114, 514) returning sumed_number
    display sumed_number

    let sumed_number = sum_int(1919, 810)
    display sumed_number

    call display_divider()

    let numbers.a = 1
    let numbers.b = 2

    display numbers.*
    call swap(numbers.*) returning numbers.*
    display numbers.*
end main

function display_divider()
    display "=================================================="
end function

function sum_int(a, b)
    define a, b int
    return a + b
end function

function swap(a, b)
    define a, b int
    return b, a
end function
