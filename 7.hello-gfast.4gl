#########################################################################
#                                                                       #
#       object    : pg000951                                            #
#       function  : Hello GFAST                                         #
#       overview  : ????? GFAST ??????? Hello world           #
#                 : ????????????????????               #
#                 : ????????                                     #
#       Arguments : p_msg       char(100)                               #
#       return    : status              integer  0:normal               #
#                                               -1:abnormal             #
#       creation  : 2019-04-02 YMSLX.zeng_jiachen                       #
#       revision  :                                                     #
#                 :                                                     #
#       copyright : (C) 2019 YAMAHA MOTOR CO.LTD.                       #
#                                                                       #
#########################################################################

database        gfastl5                 # Database Definition

#########################################################################
#       Global Variables Definition                                     #
#########################################################################
globals
        ## Argument Area
        define  p_msg                   char(100)

        ## Message Area
        define  wg_msg1                 char(100)
        define  wg_msg2                 char(100)
        define  wg_msg3                 char(100)

        ## Eof Area

        ## Count Area

        ## Work Area

        ## Record Area

end globals

#########################################################################
#       Main                                                            #
#########################################################################
main
        define  wl_result               integer

### Isolation setting
###     {dirty read | committed read | cursor stability | repeatable read }
        set isolation to committed read

### Lock Wait Time(seconds)
        set lock mode to wait 60

        whenever error continue         ## must be a comment while testing

        let wl_result = 0

## Start Log Issue
        let wg_msg1 = "Hello GFAST ",
                      "Process start."
        call pg000951_log(0, wg_msg1, "", "")

## Initial Process
        call pg000951_init() returning wl_result

## Main Process
        if wl_result = 0 then
            call pg000951_main() returning wl_result
        end if

## Final Process
        if wl_result = 0 then
            call pg000951_final() returning wl_result
        end if

## End Log Issue
        if wl_result = 0 or wl_result = 100 then
            let wg_msg1 = "Hello GFAST ",
                          "Process ended normally."
            call pg000951_log(0, wg_msg1, "", "")
        else
            let wg_msg1 = "Hello GFAST ",
                          "Process ended abnormally."
            call pg000951_log(1, wg_msg1, "", "")
        end if

        exit program wl_result

end main

#########################################################################
#       Initial Process                                                 #
#########################################################################
function pg000951_init()

        define  wl_result               integer

        ## Init variable
        let wl_result = 0

        let p_msg               = " "

        ## Arguments check
        if num_args() = 1 then
            let  p_msg = arg_val(1)
        else
            let  wg_msg1 = "* Number of Arguments Error *"
            call pg000951_log(1, wg_msg1, "", "")
            let  wl_result = 1
        end if

        ## Arguments display
        let wg_msg1 = "Arguments / ", p_msg
        call pg000951_log(1, wg_msg1, "", "")

        return wl_result

end function

#########################################################################
#       Main Process                                                    #
#########################################################################
function pg000951_main()

        define wl_result                integer

        let wl_result = 0

        display "Hello GFAST: ", p_msg

        return wl_result

end function

#########################################################################
#       Final Process                                                   #
#########################################################################
function pg000951_final()

        define wl_result                integer

        let wl_result  = 0

        return wl_result

end function

#########################################################################
#       Log Issue Routine                                               #
#########################################################################
function pg000951_log(wl_mode, wl_msg1, wl_msg2, wl_msg3)
        define  wl_mode         integer  ,        # -1, 0, 1, 2
                wl_msg1         char(100),
                wl_msg2         char(100),
                wl_msg3         char(100),
                wl_msg4         char(100),
                wl_str          char(500),
                wl_class        char(002),
                wl_pid          char(010)

        let wl_class = "PC"                     ## Sub System code

        let wl_pid   = "pg000951"               ## Program ID

# SQL Error
        if wl_mode = -1 then
            let wl_mode = 1
            let wl_msg4 = "STS = ", sqlca.sqlcode using "-<<<<&",
                        " /ISAM=", sqlca.sqlerrd[2] using "-<<<<&"

            if sqlca.sqlerrm is not null then
                let wl_msg4 = wl_msg4 clipped, " /MSG=",sqlca.sqlerrm
            end if
            if wl_msg2 is null then
                let wl_msg2 = wl_msg4
            else
                let wl_msg3 = wl_msg4
            end if
        end if

        let wl_str = "/home/project/pj0107/shell/pg000001.csh",
                      wl_mode, " ", wl_class, " ", wl_pid,
                    " \"", wl_msg1 clipped, "\"",
                    " \"", wl_msg2 clipped, "\"",
                    " \"", wl_msg3 clipped, "\""
        run wl_str                      ## Log Output

end function
