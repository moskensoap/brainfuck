( Brainfuck code to Ook! code translator: written by moskensoap 2024 )
( https://github(dot)com/moskensoap/brainfuck )
# Converts Brainfuck code to Ook! code
# Assumes the interpreter or compiler supports EOF=0 or leaves EOF unchanged

main variable: this(0)
temp: this(1)
backup variable: this(2)
ASCII: O@this(3) o@this(4) k@this(5) (dot)@this(6) ?@this(7) !@this(8) (space)@this(9)
brainfuck code: (right)     (left)      (plus)      (minus)     (dot)       (comma)     (bra)       (ket)
!flag:          this(10)    this(12)    this(14)    this(16)    this(18)    this(20)    this(22)    this(24)
flag:           this(11)    this(13)    this(15)    this(17)    this(19)    this(21)    this(23)    this(25)

>>>+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++                                  0   this(3)     3
>+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++    3   this(4)     4
>+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++        4   this(5)     5
>++++++++++++++++++++++++++++++++++++++++++++++                                                                     5   this(6)     6
>+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++                                                    6   this(7)     7
>+++++++++++++++++++++++++++++++++                                                                                  7   this(8)     8
>++++++++++++++++++++++++++++++++                                                                                   8   this(9)     9

<<<<<<<<<                                                                                                           9               0


+[                                                                  0       while(this(0)!=0)                   0
    [-]
    ,                                                               0       this(0)=input()                     0

    #set initial value of !flag to 0 and flag to 1
    >>>>>>>>>>                                                                                  0               10
    [-]>[-]+>[-]>[-]+>[-]>[-]+>[-]>[-]+>[-]>[-]+>[-]>[-]+>[-]>[-]+>[-]>[-]+                     10              25
    <<<<<<<<<<<<<<<<<<<<<<<<<                                                                   25              0


    #begin#cp this(0) to this(0) and this(2)#####################################################################
    >[-]>[-]<<                                                      0   this(1)=0   this(2)=0                   0
    +[->+<]>-                                                       0   move this(0) to this(1)                 1
    +[->+<<+>]>-<<-                                                 1   move this(1) to this(2) and this(0)     0
    #endn#cp this(0) to this(0) and this(2)######################################################################

    #generate !flag of right(ASCII=62)
    #if(this(0)!=right)this(10)=1
    --------------------------------------------------------------
    [                                                               0       while(this(0))                      0
        >>>>>>>>>>+<<<<<<<<<<                                       0       this(10)=1                          0
        [-]                                                         0       this(0)=0                           0
    ]                                                               0                                           0
    #generate flag of right
    #if(this(10)!=0)this(11)=0
    >>>>>>>>>>[                                                     0       while(this(10))                     10
        >-<                                                         10      this(11)=0                          10
        [-]                                                         10      this(10)=0                          10
    ]<<<<<<<<<<                                                     10                                          0            

    #begin#cp this(2) to this(2) and this(0)#####################################################################
    >>+[-<+>]<-                                                     0   move this(2) to this(1)                 1
    +[->+<<+>]>-<<-                                                 1   move this(1) to this(2) and this(0)     0
    #end#cp this(2) to this(2) and this(0)#######################################################################

    #generate !flag of left(ASCII=60)
    #if(this(0)!=left)this(12)=1
    ------------------------------------------------------------
    [                                                               0       while(this(0))                      0
        >>>>>>>>>>>>+<<<<<<<<<<<<                                   0       this(12)=1                          0
        [-]                                                         0       this(0)=0                           0
    ]                                                               0                                           0
    #generate flag of left
    #if(this(12)!=0)this(13)=0
    >>>>>>>>>>>>[                                                   0       while(this(12))                     12
        >-<                                                         12      this(13)=0                          12
        [-]                                                         12      this(12)=0                          12
    ]<<<<<<<<<<<<                                                   12                                          0

    #begin#cp this(2) to this(2) and this(0)#####################################################################
    >>+[-<+>]<-                                                     0   move this(2) to this(1)                 1
    +[->+<<+>]>-<<-                                                 1   move this(1) to this(2) and this(0)     0
    #end#cp this(2) to this(2) and this(0)#######################################################################

    #generate !flag of plus(ASCII=43)
    #if(this(0)!=plus)this(14)=1
    -------------------------------------------
    [                                                               0       while(this(0))                      0
        >>>>>>>>>>>>>>+<<<<<<<<<<<<<<                               0       this(14)=1                          0
        [-]                                                         0       this(0)=0                           0
    ]                                                               0                                           0
    #generate flag of plus
    #if(this(14)!=0)this(15)=0
    >>>>>>>>>>>>>>[                                                 0       while(this(14))                     14
        >-<                                                         14      this(15)=0                          14
        [-]                                                         14      this(14)=0                          14
    ]<<<<<<<<<<<<<<                                                 14                                          0

    #begin#cp this(2) to this(2) and this(0)#####################################################################
    >>+[-<+>]<-                                                     0   move this(2) to this(1)                 1
    +[->+<<+>]>-<<-                                                 1   move this(1) to this(2) and this(0)     0
    #end#cp this(2) to this(2) and this(0)#######################################################################

    #generate !flag of minus(ASCII=45)
    #if(this(0)!=minus)this(16)=1
    ---------------------------------------------
    [                                                               0       while(this(0))                      0
        >>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<                           0       this(16)=1                          0
        [-]                                                         0       this(0)=0                           0
    ]                                                               0                                           0
    #generate flag of minus
    #if(this(16)!=0)this(17)=0
    >>>>>>>>>>>>>>>>[                                               0       while(this(16))                     16
        >-<                                                         16      this(17)=0                          16
        [-]                                                         16      this(16)=0                          16
    ]<<<<<<<<<<<<<<<<                                               16                                          0

    #begin#cp this(2) to this(2) and this(0)#####################################################################
    >>+[-<+>]<-                                                     0   move this(2) to this(1)                 1
    +[->+<<+>]>-<<-                                                 1   move this(1) to this(2) and this(0)     0
    #end#cp this(2) to this(2) and this(0)#######################################################################

    #generate !flag of dot(ASCII=46)
    #if(this(0)!=dot)this(18)=1
    ----------------------------------------------
    [                                                               0       while(this(0))                      0
        >>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<                       0       this(18)=1                          0
        [-]                                                         0       this(0)=0                           0
    ]                                                               0                                           0
    #generate flag of dot
    #if(this(18)!=0)this(19)=0
    >>>>>>>>>>>>>>>>>>[                                             0       while(this(18))                     18
        >-<                                                         18      this(19)=0                          18
        [-]                                                         18      this(18)=0                          18
    ]<<<<<<<<<<<<<<<<<<                                             18                                          0

    #begin#cp this(2) to this(2) and this(0)#####################################################################
    >>+[-<+>]<-                                                     0   move this(2) to this(1)                 1
    +[->+<<+>]>-<<-                                                 1   move this(1) to this(2) and this(0)     0
    #end#cp this(2) to this(2) and this(0)#######################################################################

    #generate !flag of comma(ASCII=44)
    #if(this(0)!=comma)this(20)=1
    --------------------------------------------
    [                                                               0       while(this(0))                      0
        >>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<                   0       this(20)=1                          0
        [-]                                                         0       this(0)=0                           0
    ]                                                               0                                           0
    #generate flag of comma
    #if(this(20)!=0)this(21)=0
    >>>>>>>>>>>>>>>>>>>>[                                           0       while(this(20))                     20
        >-<                                                         20      this(21)=0                          20
        [-]                                                         20      this(20)=0                          20
    ]<<<<<<<<<<<<<<<<<<<<                                           20                                          0

    #begin#cp this(2) to this(2) and this(0)#####################################################################
    >>+[-<+>]<-                                                     0   move this(2) to this(1)                 1
    +[->+<<+>]>-<<-                                                 1   move this(1) to this(2) and this(0)     0
    #end#cp this(2) to this(2) and this(0)#######################################################################

    #generate !flag of bra(ASCII=91)
    #if(this(0)!=bra)this(22)=1
    -------------------------------------------------------------------------------------------
    [                                                               0       while(this(0))                      0
        >>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<               0       this(22)=1                          0
        [-]                                                         0       this(0)=0                           0
    ]                                                               0                                           0
    #generate flag of bra
    #if(this(22)!=0)this(23)=0
    >>>>>>>>>>>>>>>>>>>>>>[                                         0       while(this(22))                     22
        >-<                                                         22      this(23)=0                          22
        [-]                                                         22      this(22)=0                          22
    ]<<<<<<<<<<<<<<<<<<<<<<                                         22                                          0

    #begin#cp this(2) to this(2) and this(0)#####################################################################
    >>+[-<+>]<-                                                     0   move this(2) to this(1)                 1
    +[->+<<+>]>-<<-                                                 1   move this(1) to this(2) and this(0)     0
    #end#cp this(2) to this(2) and this(0)#######################################################################

    #generate !flag of ket(ASCII=93)
    #if(this(0)!=ket)this(24)=1
    ---------------------------------------------------------------------------------------------
    [                                                               0       while(this(0))                      0
        >>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<           0       this(24)=1                          0
        [-]                                                         0       this(0)=0                           0
    ]                                                               0                                           0
    #generate flag of ket
    #if(this(24)!=0)this(25)=0
    >>>>>>>>>>>>>>>>>>>>>>>>[                                       0       while(this(24))                     24
        >-<                                                         24      this(25)=0                          24
        [-]                                                         24      this(24)=0                          24
    ]<<<<<<<<<<<<<<<<<<<<<<<<                                       24                                          0

    #begin#cp this(2) to this(2) and this(0)#####################################################################
    >>+[-<+>]<-                                                     0   move this(2) to this(1)                 1
    +[->+<<+>]>-<<-                                                 1   move this(1) to this(2) and this(0)     0
    #end#cp this(2) to this(2) and this(0)#######################################################################




    #if this(0)==right (this(11)==1) output "Ook(dot) Ook? "
    >>>>>>>>>>>[                                                    0       while(this(11))                     11
        <<<<<<<<<<<                                                 11                                          0
        >>>.>.>.>.>>>.<<<<<<.>.>.>>.>>.                             0       Ook(dot) Ook?                       9
        >>                                                          9                                           11
        [-]                                                         11      this(11)=0                          11
    ]                                                               11                                          11

    #if this(0)==left (this(13)==1) output "Ook? Ook(dot) "
    >>[                                                             11      while(this(13))                     13
        <<<<<<<<<<<<<                                               13                                          0
        >>>.>.>.>>.>>.<<<<<<.>.>.>.>>>.                             0       Ook? Ook(dot)                       9
        >>>>                                                        9                                           13
        [-]                                                         13      this(13)=0                          13       
    ]                                                               13                                          13

    #if this(0)==plus (this(15)==1) output "Ook(dot) Ook(dot) "
    >>[                                                             13      while(this(15))                     15
        <<<<<<<<<<<<<<<                                             15                                          0
        >>>.>.>.>.>>>.<<<<<<.>.>.>.>>>.                             0       Ook(dot) Ook(dot)                   9
        >>>>>>                                                      9                                           15
        [-]                                                         15      this(15)=0                          15
    ]                                                               15                                          15

    #if this(0)==minus (this(17)==1) output "Ook! Ook! "
    >>[                                                             15      while(this(17))                     17
        <<<<<<<<<<<<<<<<<                                           17                                          0
        >>>.>.>.>>>.>.<<<<<<.>.>.>>>.>.                             0       Ook! Ook!                           9
        >>>>>>>>                                                    9                                           17
        [-]                                                         17      this(17)=0                          17
    ]                                                               17                                          17

    #if this(0)==dot (this(19)==1) output "Ook! Ook(dot) "
    >>[                                                             17      while(this(19))                     19
        <<<<<<<<<<<<<<<<<<<                                         19                                          0
        >>>.>.>.>>>.>.<<<<<<.>.>.>.>>>.                             0       Ook! Ook(dot)                       9
        >>>>>>>>>>                                                  9                                           19
        [-]                                                         19      this(19)=0                          19
    ]                                                               19                                          19

    #if this(0)==comma (this(21)==1) output "Ook(dot) Ook! "
    >>[                                                             19      while(this(21))                     21
        <<<<<<<<<<<<<<<<<<<<<                                       21                                          0
        >>>.>.>.>.>>>.<<<<<<.>.>.>>>.>.                             0       Ook(dot) Ook!                       9
        >>>>>>>>>>>>                                                9                                           21
        [-]                                                         21      this(21)=0                          21
    ]                                                               21                                          21

    #if this(0)==bra (this(23)==1) output "Ook! Ook? "
    >>[                                                             21      while(this(23))                     23
        <<<<<<<<<<<<<<<<<<<<<<<                                     23                                          0
        >>>.>.>.>>>.>.<<<<<<.>.>.>>.>>.                             0       Ook! Ook?                           9
        >>>>>>>>>>>>>>                                              9                                           23
        [-]                                                         23      this(23)=0                          23
    ]                                                               23                                          23

    #if this(0)==ket (this(25)==1) output "Ook? Ook! "
    >>[                                                             23      while(this(25))                     25
        <<<<<<<<<<<<<<<<<<<<<<<<<                                   25                                          0
        >>>.>.>.>>.>>.<<<<<<.>.>.>>>.>.                             0       Ook? Ook!                           9
        >>>>>>>>>>>>>>>>                                            9                                           25
        [-]                                                         25      this(25)=0                          25
    ]                                                               25                                          25

    <<<<<<<<<<<<<<<<<<<<<<<<<                                       25                                          0
    
]                                                                   0       loop until EOF                      0
