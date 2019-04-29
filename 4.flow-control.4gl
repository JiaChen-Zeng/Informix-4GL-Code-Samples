main
    define class_number int

    define counter int

    if 1 = 1 then
        display "Of course!"
    else
        display "If you can see this, the compiler must be thrown into the garbage can!"
    end if

    let class_number = 2
    case class_number
    when 1
        display "I'm in class 1."
    when 2    display "I'm in class 2."
    when 3    display "I'm in class 3."
    otherwise display "I'm NEET."
    end case

    case
    when class_number <= 0
        display "Wrong number! Class number can't be negative or zero."
    when class_number > 0
        display "OK right number OK."
    when 1 <> 0
        display "True. But I'll never displayed."
    end case

    let counter = 1
    while counter <= 3
        display "counter:", counter
        let counter = counter + 1
    end while

    for counter = 1 to 3
        display "counter:", counter
    end for

    for counter = 1 to 9 step 2
        if counter = 5 then
            continue for
        end if
        if counter = 9 then
            exit for
        end if
        display "counter:", counter
    end for

    exit program 0
end main
