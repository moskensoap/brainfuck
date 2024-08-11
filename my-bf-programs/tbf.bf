( Text to Brainfuck code generator: written by moskensoap 2024 )
( https://github(dot)com/moskensoap/brainfuck )

Generate code to creat an arithmetic sequence: a(0)=0 a(1)=1 ^^^ a(255)=255 a(256)=256=0
Then move back to a(0)
Special thanks to https://github(dot)com/itchyny/2bf for generating meta code below
>>>>>>>>>>>>                                    12

++++++++[>++++++++>+++++>+++++++++++<<<-]>--.>+++.>+++..<++.<.>--.<.>.<--..>>++.<<++.>.<.>>--.<++.<-
-..>--.<++..>>++.<<--.>>.<<<+++++++++++++.---.>.>>--.<<.>>++.<<<+++.---.

<<<<<<<<<<<<                                    0


>>>>[-]++++++++++++++++++++++++++++++++++++++++++++++                          0   this(4): dot array      4
>[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++             6   this(5): right array    5
>[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++               7   this(6): left array     6
<<<<<<                                          8                                           0



#this(1) = new input this(2) = old input this(3) = temp
+                                               0   this(0)=1 to enable loop                0
[                                               0   while(this(0)!=0)                       0
    ,                                           0   this(0)=getchar()                       0
    #cp this(0) to this(0) and this(1) by two steps
    >[-]>>[-]<<<                                0   this(1)=0   this(3)=0                   0
    +[->>>+<<<]>>>-                             0   move this(0) to this(3)                 3
    +[-<<+<+>>>]<<-<-                           3   move this(3) to this(1) and this(0)     0


    #########################################################################################
    #subtract min(this(1) this(2)) from both this(1) and this(2) for outputting the relative array
    #this(7) is a backup of this(1) and this(8) is a backup of this(2)
    #this(9) is a nonzero flag of this(1) and this(10) is a nonzero flag of this(2)
    >>>>>>>>>>>[-]                              0   this(11)=0                              11
    -[                                          11  this(11)=255 and while(this(11)!=0)     11
        <[-]<[-]<[-]<[-]                        11  this(10) this(9) this(8) this(7) = 0    7
        <<<<<<<                                 7                                           0
        #cp this(1) to this(1) and this(7) by 2 steps
        >>>[-]<<<                               0   this(3)=0                               0
        >+[->>+<<]>>-                           0   move this(1) to this(3)                 3
        +[->>>>+<<<<<<+>>]>>>>-<<<<<<-          3   move this(3) to this(7) and this(1)     1
        <                                       1                                           0
        #cp this(2) to this(2) and this(8) by 2 steps
        >>>[-]<<<                               0   this(3)=0                               0
        >>+[->+<]>-                             0   move this(2) to this(3)                 3
        +[->>>>>+<<<<<<+>]>>>>>-<<<<<<-         3   move this(3) to this(8) and this(2)     2
        <<                                      2                                           0
        #if(this(1)!=0)this(9)=1
        >[                                      0   if(this(1)!=0)                          1
            >>>>>>>>+                           1   this(9)=1                               9
            <<<<<<<<[-]                         9   this(1)=0                               1
        ]                                       1                                           1
        <                                       1                                           0
        #if(this(2)!=0)this(10)=1
        >>[                                     0   if(this(2)!=0)                          2
            >>>>>>>>+                           2   this(10)=1                              10
            <<<<<<<<[-]                         10  this(2)=0                               2
        ]                                       2                                           2
        <<                                      2                                           0
        #restore this(1) using this(7) and this(2) using this(8)
        >[-]>[-]>>>>>                           0   this(1)=0 this(2)=0                     7
        +[-<<<<<<+>>>>>>]<<<<<<-                7   move this(7) to this(1)                 1
        >>>>>>>                                 1                                           8
        +[-<<<<<<+>>>>>>]<<<<<<-                8   move this(8) to this(2)                 2
        <<                                      2                                           0
        #if(this(9)!=0 and this(10)!=0) this(1) this(2) this(9) this(10) minus 1
        >>>>>>>>>[                              0   if(this(9)!=0)                          9
            >[                                  9   if(this(10)!=0)                         10
                <<<<<<<<-<-                     10  this(2) this(1) minus 1                 1
                >>>>>>>>>-                      1   this(10) minus 1                        10
            ]                                   10                                          10
            <-                                  10  this(9) minus 1                         9
        ]                                       9                                           9
        <<<<<<<<<                               9                                           0

        #move to 11th cell
        >>>>>>>>>>>                             0                                           11
        -                                       11  this(11) = this(11) minus 1             11
    ]                                           11  loop 255 times                          11
    <<<<<<<<<<<                                 11                                          0


    #########################################################################################

    #output the right array this(1) times                
    >                                           0                                           1
    [                                           1                                           1
        >>>>.<<<<                               1   putchar(this(5))                        1
        -                                       1                                           1
    ]                                           1                                           1
    <                                           1                                           0
    #output the left array this(2) times
    >>                                          0                                           2
    [                                           2                                           2
        >>>>.<<<<                               2   putchar(this(6))                        2
        -
    ]                                           2                                           2
    <<                                          2                                           0   
    #output a dot
    >>>>.<<<<                                   0   putchar(this(4))                        0




    #cp this(0) to this(0) and this(2) by two steps
    >>[-]>[-]<<<                                0   this(2)=0   this(3)=0                   0
    +[->>>+<<<]>>>-                             0   move this(0) to this(3)                 3
    +[-<+<<+>>>]<-<<-                           3   move this(3) to this(2) and this(0)     0                                         
]                                               getchar until EOF (0) which end the loop

