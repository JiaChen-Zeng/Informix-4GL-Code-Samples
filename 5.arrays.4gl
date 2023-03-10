main
    define index int

    define string     varchar(10),
           sub_string varchar(10)

    define numbers array [5] of int

    define bitmap array [4, 5] of int

    define vector dynamic array of int

    let string = "abcdefg"

    let sub_string = string[1]
    display sub_string

    let sub_string = string[1, 5]
    display sub_string

    display "=================================================="

    let numbers[1] = 1
    let numbers[2] = 3
    let numbers[3] = 5

    display numbers[1], numbers[2], numbers[3]

    let bitmap[1, 1] = 9
    display bitmap[1, 1]

    display "=================================================="

    display numbers[0]
    display numbers[4], numbers[5]

    display "=================================================="

    allocate array vector[3]

    for index = 1 to 3
        display vector[index]
        let vector[index] = index ** 2
    end for

    resize array vector[5]

    for index = 1 to 5
        display vector[index]
    end for

    deallocate array vector

    display "=================================================="

    initialize numbers to null

    let numbers[1] = 2
    let numbers[2] = 4
    let numbers[3] = 6
    let numbers[4] = 8

    let index = 1
    while numbers[index] is not null
        display numbers[index]
        let index = index + 1
    end while
end main
