( Blub code to Brainfuck code translator: written by moskensoap 2024 )
( https://github(dot)com/moskensoap/brainfuck )
#convert Blub code to Brainfuck code


variable:   this(0)
backup:     this(1)
temp:       this(2)

const:  right   left    plus    minus   dot     comma       bra         ket         f           i           s
cell:   this(3) this(4) this(5) this(6) this(7) this(8)     this(9)     this(10)    this(11)    this(12)    this(13)  
ASCII:  62      60      43      45      46      44          91          93          102         105          115

input           new !flag       new flag                old flag
(dot)           this(14)        this(15)                this(16)
?               this(17)        this(18)                this(19)
!               this(20)        this(21)                this(22)

new@!flag should be initialized to 0 and new@flag should be initialized to 1
if no target char found(comma) set new@!flag to 1 and new@flag to 0
if target char found(comma) do nothing

>>>++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++                                       0       this(3)=62      3
>++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++                                           3       this(4)=60      4                                           
>+++++++++++++++++++++++++++++++++++++++++++                                                            4       this(5)=43      5
>+++++++++++++++++++++++++++++++++++++++++++++                                                          5       this(6)=45      6
>++++++++++++++++++++++++++++++++++++++++++++++                                                         6       this(7)=46      7
>++++++++++++++++++++++++++++++++++++++++++++                                                           7       this(8)=44      8
>+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++            8       this(9)=91      9
>+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++          9       this(10)=93     10
>++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 10      this(11)=102    11
>+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++      this(12)=105    12
>+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  this(13)=115    
<<<<<<<<<<<<<                                                                                           13                      0                                                                                           




+[                                                                  0       while(this(0)!=0)                   0
    ,                                                               0       this(0)=getchar()                   0

    #initialize this(1) and this(2) to 0
    >[-]>[-]<<                                                      0       this(1)=0   this(2)=0               0

    #cp this(0) to this(1) and this(0)
    +[->>+<<]>>-                                                    0   move this(0) to this(2)                 2
    +[-<+<+>>]<-<-                                                  0   move this(2) to this(1) and this(0)     0

    #initialize this(14) this(17) this(20) to 0 and this(15) this(18) this(21) to 1
    >>>>>>>>>>>>>>[-]>[-]+>>[-]>[-]+>>[-]>[-]+<<<<<<<<<<<<<<<<<<<<< 0   initialize new@!flag and new@flag       0

    #############################################################################################################

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

    #begin#cp this(1) to this(1) and this(0)#####################################################################
    >+[->+<]>-                                                      0   move this(1) to this(2)                 2
    +[-<+<+>>]<-<-                                                  2   move this(2) to this(1) and this(0)     0
    #end#cp this(1) to this(1) and this(0)#######################################################################

    #generate !flag of ?(ASCII=63)
    #if(this(0)!=?)this(17)=1
    ---------------------------------------------------------------
    [                                                               0       while(this(0))                      0
        >>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<                         0       this(17)=1                          0
        [-]                                                         0       this(0)=0                           0
    ]                                                               0                                           0
    #generate flag of ?
    #if(this(17)!=0)this(18)=0
    >>>>>>>>>>>>>>>>>[                                              0       while(this(17))                     17
        >-<                                                         17      this(18)=0                          17
        [-]                                                         17      this(17)=0                          17
    ]<<<<<<<<<<<<<<<<<                                              17                                          0

    #begin#cp this(1) to this(1) and this(0)#####################################################################
    >+[->+<]>-                                                      0   move this(1) to this(2)                 2
    +[-<+<+>>]<-<-                                                  2   move this(2) to this(1) and this(0)     0
    #end#cp this(1) to this(1) and this(0)#######################################################################

    #generate !flag of !(ASCII=33)
    #if(this(0)!=!)this(20)=1
    ---------------------------------
    [                                                               0       while(this(0))                      0
        >>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<                   0       this(20)=1                          0
        [-]                                                         0       this(0)=0                           0
    ]                                                               0                                           0
    #generate flag of !
    #if(this(20)!=0)this(21)=0
    >>>>>>>>>>>>>>>>>>>>[                                           0       while(this(20))                     20
        >-<                                                         20      this(21)=0                          20
        [-]                                                         20      this(20)=0                          20
    ]<<<<<<<<<<<<<<<<<<<<                                           20                                          0

    #begin#cp this(1) to this(1) and this(0)#####################################################################
    >+[->+<]>-                                                      0   move this(1) to this(2)                 2
    +[-<+<+>>]<-<-                                                  2   move this(2) to this(1) and this(0)     0
    #end#cp this(1) to this(1) and this(0)#######################################################################

    #if new@flag==(dot)
    >>>>>>>>>>>>>>>[                                                0       while(this(15))                     15
        #if old@flag==(dot)
        >[                                                          15      while(this(16))                     16
            <<<<<<<<<<<.>>>>>>>>>>>                                 16      putchar(this(5)(plus))              16
            <[-]>                                                   16      this(15)=0                          16
            [-]                                                     16      this(16)=0                          16
        ]                                                           16                                          16
        #if old@flag==?
        >>>[                                                        16      while(this(19))                     19
            <<<<<<<<<<<<<<<.>>>>>>>>>>>>>>>                         19      putchar(this(4)(left))              19
            <<<<[-]>>>>                                             19      this(15)=0                          19
            [-]                                                     19      this(19)=0                          19
        ]                                                           19                                          19
        #if old@flag==!
        >>>[                                                        19      while(this(22))                     22
            <<<<<<<<<<<<<<<.>>>>>>>>>>>>>>>                         22      putchar(this(7)(dot))               22
            <<<<<<<[-]>>>>>>>                                       22      this(15)=0                          22
            [-]                                                     22      this(22)=0                          22
        ]                                                           22                                          22

        <<<<<<<                                                     22                                          15

        #move this(15) to this(16)
        +[->+<]>-                                                   15      this(16)=this(15)                   16
        <                                                           16                                          15
    ]<<<<<<<<<<<<<<<                                                15                                          0



    #if new@flag==(?)
    >>>>>>>>>>>>>>>>>>[                                             0       while(this(18))                     18
        #if old@flag==(dot)
        <<[                                                         18      while(this(16))                     16
            <<<<<<<<<<<<<.>>>>>>>>>>>>>                             16      putchar(this(3)(right))             16
            >>[-]<<                                                 16      this(18)=0                          16
            [-]                                                     16      this(16)=0                          16
        ]                                                           16                                          16
        #if old@flag==?
        >>>[                                                        16      while(this(19))                     19
            #putchar(fishfood)
            <<<<<<<<.>.>.                                           19      putchar(f11i12s13)                  13
            <-.+>                                                   13      putchar(h)                          13
            <<.                                                     13      putchar(f11)                        11
            >++++++..------<                                        11      putchar(oo)                         11
            --.++                                                   11      putchar(d)                          11
            >>>>>>>>                                                11                                          19
            <[-]>                                                   19      this(18)=0                          19
            [-]                                                     19      this(19)=0                          19
        ]                                                           19                                          19
        #if old@flag==!
        >>>[                                                        19      while(this(22))                     22
            <<<<<<<<<<<<<.>>>>>>>>>>>>>                             22      putchar(this(9)(bra))               22
            <<<<[-]>>>>                                             22      this(18)=0                          22
            [-]                                                     22      this(22)=0                          22
        ]                                                           22                                          22

        <<<<                                                        22                                          18

        #move this(18) to this(19)
        +[->+<]>-                                                   18      this(19)=this(18)                   19
        <                                                           19                                          18
    ]<<<<<<<<<<<<<<<<<<                                             18                                          0



    #if new@flag==(!)
    >>>>>>>>>>>>>>>>>>>>>[                                          0       while(this(21))                     21
        #if old@flag==(dot)
        <<<<<[                                                      21      while(this(16))                     16
            <<<<<<<<.>>>>>>>>                                       16      putchar(this(8)(comma))             16
            >>>>>[-]<<<<<                                           16      this(21)=0                          16
            [-]                                                     16      this(16)=0                          16
        ]                                                           16                                          16
        #if old@flag==?
        >>>[                                                        16      while(this(19))                     19
            <<<<<<<<<.>>>>>>>>>                                     19      putchar(this(10)(ket))              19
            >>[-]<<                                                 19      this(21)=0                          19
            [-]                                                     19      this(19)=0                          19
        ]                                                           19                                          19
        #if old@flag==!
        >>>[                                                        19      while(this(22))                     22
            <<<<<<<<<<<<<<<<.>>>>>>>>>>>>>>>>                       22      putchar(this(6)(minus))             22
            <[-]>                                                   22      this(21)=0                          22
            [-]                                                     22      this(22)=0                          22
        ]                                                           22                                          22

        <                                                           22                                          21

        #move this(21) to this(22)
        +[->+<]>-                                                   21      this(22)=this(21)                   22
        <                                                           22                                          21
    ]<<<<<<<<<<<<<<<<<<<<<                                          21                                          0



]                                                                   0       loop until EOF                      0