( Brainfuck code to Phantom code translator: written by moskensoap 2024 )
( https://github(dot)com/moskensoap/brainfuck )
# Converts Brainfuck code to Phantom code
# Assumes the interpreter or compiler supports EOF=0 or leaves EOF unchanged

main variable: this(0)
temp: this(1)
backup variable: this(2)
ASCII: Space@this(3) LF@this(4) Tab@this(5)
brainfuck code: (right)     (left)      (plus)      (minus)     (dot)       (comma)     (bra)       (ket)
!flag:          this(6)     this(8)    this(10)    this(12)    this(14)    this(16)    this(18)    this(20)
flag:           this(7)     this(9)    this(11)    this(13)    this(15)    this(17)    this(19)    this(21)

>>>++++++++++++++++++++++++++++++++                                 0       this(3)                             3
>++++++++++                                                         3       this(4)                             4
>+++++++++                                                          4       this(5)                             5

<<<<<                                                               5                                           0


+[                                                                  0       while(this(0)!=0)                   0
    [-]
    ,                                                               0       this(0)=input()                     0

    #set initial value of !flag to 0 and flag to 1
    >>>>>>                                                                                      0               6
    [-]>[-]+>[-]>[-]+>[-]>[-]+>[-]>[-]+>[-]>[-]+>[-]>[-]+>[-]>[-]+>[-]>[-]+                     6              21
    <<<<<<<<<<<<<<<<<<<<<                                                                       21              0


    #begin#cp this(0) to this(0) and this(2)#####################################################################
    >[-]>[-]<<                                                      0   this(1)=0   this(2)=0                   0
    +[->+<]>-                                                       0   move this(0) to this(1)                 1
    +[->+<<+>]>-<<-                                                 1   move this(1) to this(2) and this(0)     0
    #endn#cp this(0) to this(0) and this(2)######################################################################

    #generate !flag of right(ASCII=62)
    #if(this(0)!=right)this(6)=1
    --------------------------------------------------------------
    [                                                               0       while(this(0))                      0
        >>>>>>+<<<<<<                                               0       this(6)=1                           0
        [-]                                                         0       this(0)=0                           0
    ]                                                               0                                           0
    #generate flag of right
    #if(this(6)!=0)this(7)=0
    >>>>>>[                                                         0       while(this(6))                      6
        >-<                                                         6       this(7)=0                           6
        [-]                                                         6       this(6)=0                           6
    ]<<<<<<                                                         6                                           0            

    #begin#cp this(2) to this(2) and this(0)#####################################################################
    >>+[-<+>]<-                                                     0   move this(2) to this(1)                 1
    +[->+<<+>]>-<<-                                                 1   move this(1) to this(2) and this(0)     0
    #end#cp this(2) to this(2) and this(0)#######################################################################

    #generate !flag of left(ASCII=60)
    #if(this(0)!=left)this(8)=1
    ------------------------------------------------------------
    [                                                               0       while(this(0))                      0
        >>>>>>>>+<<<<<<<<                                           0       this(8)=1                           0
        [-]                                                         0       this(0)=0                           0
    ]                                                               0                                           0
    #generate flag of left
    #if(this(8)!=0)this(9)=0
    >>>>>>>>[                                                       0       while(this(8))                      8
        >-<                                                         8      this(9)=0                            8
        [-]                                                         8      this(8)=0                            8
    ]<<<<<<<<                                                       8                                           0

    #begin#cp this(2) to this(2) and this(0)#####################################################################
    >>+[-<+>]<-                                                     0   move this(2) to this(1)                 1
    +[->+<<+>]>-<<-                                                 1   move this(1) to this(2) and this(0)     0
    #end#cp this(2) to this(2) and this(0)#######################################################################

    #generate !flag of plus(ASCII=43)
    #if(this(0)!=plus)this(10)=1
    -------------------------------------------
    [                                                               0       while(this(0))                      0
        >>>>>>>>>>+<<<<<<<<<<                                       0       this(10)=1                          0
        [-]                                                         0       this(0)=0                           0
    ]                                                               0                                           0
    #generate flag of plus
    #if(this(10)!=0)this(11)=0
    >>>>>>>>>>[                                                     0       while(this(10))                     10
        >-<                                                         10      this(11)=0                          10
        [-]                                                         10      this(10)=0                          10
    ]<<<<<<<<<<                                                     10                                          0

    #begin#cp this(2) to this(2) and this(0)#####################################################################
    >>+[-<+>]<-                                                     0   move this(2) to this(1)                 1
    +[->+<<+>]>-<<-                                                 1   move this(1) to this(2) and this(0)     0
    #end#cp this(2) to this(2) and this(0)#######################################################################

    #generate !flag of minus(ASCII=45)
    #if(this(0)!=minus)this(12)=1
    ---------------------------------------------
    [                                                               0       while(this(0))                      0
        >>>>>>>>>>>>+<<<<<<<<<<<<                                   0       this(12)=1                          0
        [-]                                                         0       this(0)=0                           0
    ]                                                               0                                           0
    #generate flag of minus
    #if(this(12)!=0)this(13)=0
    >>>>>>>>>>>>[                                                   0       while(this(12))                     12
        >-<                                                         12      this(13)=0                          12
        [-]                                                         12      this(12)=0                          12
    ]<<<<<<<<<<<<                                                   12                                          0

    #begin#cp this(2) to this(2) and this(0)#####################################################################
    >>+[-<+>]<-                                                     0   move this(2) to this(1)                 1
    +[->+<<+>]>-<<-                                                 1   move this(1) to this(2) and this(0)     0
    #end#cp this(2) to this(2) and this(0)#######################################################################

    #generate !flag of dot(ASCII=46)
    #if(this(0)!=dot)this(14)=1
    ----------------------------------------------
    [                                                               0       while(this(0))                      0
        >>>>>>>>>>>>>>+<<<<<<<<<<<<<<                               0       this(14)=1                          0
        [-]                                                         0       this(0)=0                           0
    ]                                                               0                                           0
    #generate flag of dot
    #if(this(14)!=0)this(15)=0
    >>>>>>>>>>>>>>[                                                 0       while(this(14))                     14
        >-<                                                         14      this(15)=0                          14
        [-]                                                         14      this(14)=0                          14
    ]<<<<<<<<<<<<<<                                                 14                                          0

    #begin#cp this(2) to this(2) and this(0)#####################################################################
    >>+[-<+>]<-                                                     0   move this(2) to this(1)                 1
    +[->+<<+>]>-<<-                                                 1   move this(1) to this(2) and this(0)     0
    #end#cp this(2) to this(2) and this(0)#######################################################################

    #generate !flag of comma(ASCII=44)
    #if(this(0)!=comma)this(16)=1
    --------------------------------------------
    [                                                               0       while(this(0))                      0
        >>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<                           0       this(16)=1                          0
        [-]                                                         0       this(0)=0                           0
    ]                                                               0                                           0
    #generate flag of comma
    #if(this(16)!=0)this(17)=0
    >>>>>>>>>>>>>>>>[                                               0       while(this(16))                     16
        >-<                                                         16      this(17)=0                          16
        [-]                                                         16      this(16)=0                          16
    ]<<<<<<<<<<<<<<<<                                               16                                          0

    #begin#cp this(2) to this(2) and this(0)#####################################################################
    >>+[-<+>]<-                                                     0   move this(2) to this(1)                 1
    +[->+<<+>]>-<<-                                                 1   move this(1) to this(2) and this(0)     0
    #end#cp this(2) to this(2) and this(0)#######################################################################

    #generate !flag of bra(ASCII=91)
    #if(this(0)!=bra)this(18)=1
    -------------------------------------------------------------------------------------------
    [                                                               0       while(this(0))                      0
        >>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<                       0       this(18)=1                          0
        [-]                                                         0       this(0)=0                           0
    ]                                                               0                                           0
    #generate flag of bra
    #if(this(18)!=0)this(19)=0
    >>>>>>>>>>>>>>>>>>[                                             0       while(this(18))                     18
        >-<                                                         18      this(19)=0                          18
        [-]                                                         18      this(18)=0                          18
    ]<<<<<<<<<<<<<<<<<<                                             18                                          0

    #begin#cp this(2) to this(2) and this(0)#####################################################################
    >>+[-<+>]<-                                                     0   move this(2) to this(1)                 1
    +[->+<<+>]>-<<-                                                 1   move this(1) to this(2) and this(0)     0
    #end#cp this(2) to this(2) and this(0)#######################################################################

    #generate !flag of ket(ASCII=93)
    #if(this(0)!=ket)this(20)=1
    ---------------------------------------------------------------------------------------------
    [                                                               0       while(this(0))                      0
        >>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<                   0       this(20)=1                          0
        [-]                                                         0       this(0)=0                           0
    ]                                                               0                                           0
    #generate flag of ket
    #if(this(20)!=0)this(21)=0
    >>>>>>>>>>>>>>>>>>>>[                                           0       while(this(20))                     20
        >-<                                                         20      this(21)=0                          20
        [-]                                                         20      this(20)=0                          20
    ]<<<<<<<<<<<<<<<<<<<<                                           20                                          0

    #begin#cp this(2) to this(2) and this(0)#####################################################################
    >>+[-<+>]<-                                                     0   move this(2) to this(1)                 1
    +[->+<<+>]>-<<-                                                 1   move this(1) to this(2) and this(0)     0
    #end#cp this(2) to this(2) and this(0)#######################################################################




    #if this(0)==right (this(7)==1) output "SpaceLF"
    >>>>>>>[                                                        0       while(this(7))                      7
        <<<<<<<                                                     7                                           0
        >>>.>.>>>                                                   0       putchar(SpaceLF)                    7
        [-]                                                         7       this(7)=0                           7
    ]                                                               7                                           7

    #if this(0)==left (this(9)==1) output "LFSpace"
    >>[                                                             7       while(this(9))                      9
        <<<<<<<<<                                                   9                                           0
        >>>>.<.>>>>>>                                               0       putchar(LFSpace)                    9
        [-]                                                         9       this(9)=0                           9       
    ]                                                               9                                           9

    #if this(0)==plus (this(11)==1) output "SpaceSpace"
    >>[                                                             9      while(this(11))                      11
        <<<<<<<<<<<                                                 11                                          0
        >>>..>>>>>>>>                                               0       putchar(SpaceSpace)                 11
        [-]                                                         11      this(11)=0                          11
    ]                                                               11                                          11

    #if this(0)==minus (this(13)==1) output "TabTab"
    >>[                                                             11      while(this(13))                     13
        <<<<<<<<<<<<<                                               13                                          0
        >>>>>..>>>>>>>>                                             0       putchar(TabTab)                     13
        [-]                                                         13      this(13)=0                          13
    ]                                                               13                                          13

    #if this(0)==dot (this(15)==1) output "TabSpace"
    >>[                                                             13      while(this(15))                     15
        <<<<<<<<<<<<<<<                                             15                                          0
        >>>>>.<<.>>>>>>>>>>>>                                       0       putchar(TabSpace)                   15
        [-]                                                         15      this(15)=0                          15
    ]                                                               15                                          15

    #if this(0)==comma (this(17)==1) output "SpaceTab"
    >>[                                                             15      while(this(17))                     17
        <<<<<<<<<<<<<<<<<                                           17                                          0
        >>>.>>.>>>>>>>>>>>>                                         0       putchar(SpaceTab)                   17
        [-]                                                         17      this(17)=0                          17
    ]                                                               17                                          17

    #if this(0)==bra (this(19)==1) output "TabLF"
    >>[                                                             17      while(this(19))                     19
        <<<<<<<<<<<<<<<<<<<                                         19                                          0
        >>>>>.<.>>>>>>>>>>>>>>>                                     0       putchar(TabLF)                      19
        [-]                                                         19      this(19)=0                          19
    ]                                                               19                                          19

    #if this(0)==ket (this(21)==1) output "LFTab"
    >>[                                                             19      while(this(21))                     21
        <<<<<<<<<<<<<<<<<<<<<                                       21                                          0
        >>>>.>.>>>>>>>>>>>>>>>>                                     0       putchar(LFTab)                      21
        [-]                                                         21      this(21)=0                          21
    ]                                                               21                                          21

    <<<<<<<<<<<<<<<<<<<<<                                           21                                          0
    
]                                                                   0       loop until EOF                      0
