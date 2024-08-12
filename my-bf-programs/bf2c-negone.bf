( Brainfuck code to C code translator: written by moskensoap 2024 )
( https://github(dot)com/moskensoap/brainfuck )
# Converts Brainfuck code to C code (EOF=-1)
# Assumes the interpreter or compiler supports EOF=-1 or leaves EOF unchanged

main variable: this(0)
temp: this(1)
backup variable: this(2)

brainfuck code: (right)     (left)      (plus)      (minus)     (dot)       (comma)     (bra)       (ket)
!flag:          this(3)     this(5)     this(7)     this(9)     this(11)    this(13)    this(15)    this(17)
flag:           this(4)     this(6)     this(8)     this(10)    this(12)    this(14)    this(16)    this(18)

ASCII: this(19)=NULL this(20)^^^this(n)=target string

>>>>>>>>>>>>>>>>>>>>                                                0                                           20

#print the head of the C code
++++++++[>++++>+++++++++++++>++++++++>++++++<<<<-]>+++.>+.+++++.-----------.+++++++++.+++++++++.----
-------------.+.<---.>>----.<++++++++++++++.+.----------------.+++++.++++++.>>--.<<-------.>++.<<<++
+++++++++++.---.>+++.>+.+++++.-----------.+++++++++.+++++++++.-----------------.+.<---.>>--.<+++++++
+++++++.+.----------------.++++++++.---.-------.>>.<<++++++.>++.<<<+++.---.>+++.>+.+++++.-----------
.+++++++++.+++++++++.-----------------.+.<---.>>--.<++++++++++++++.+.--.---------.+++++.-------.>>.<
<+.>++.<<<+++.---.+++.---.>>>>>>++++++++++[<++++++++++>-]<<<<++++++++++++++.-------.------.>>>.<<<<.
>----.+++++++++++++++++++.--------.>>>---.<<<--.>>>+++.-----.<<<-.--------.++++++++.++.+++.+++++++.>
>------.>++++.+++++.-------.<<<-------.<.>>>++..>.<<<..>>++.<<<.>+.----------.+++++++++++++++++.>>>+
+++.------.<<<------.<.>>>--.<<-.----------.+++++++++++++++++.>>>++++++.<++.<<<.>>>>++++.+++++.+++++
+.<<<<.>>>>-----------.<<<-------.>>>----------.<<<-------.-------.+.++++++++++++++.>>>.++++++.<<<++
++.--------.>>>----.<<<--.+++++.----------.++++++.-.>>---.<<<.>+++++++++++++.--------.----------.+++
++++++++++++++.>>>++++.------.<<<------.<.>------.---------.++++++++++++++++++.>>>.<<<----.---------
-.+++++++++++++++++.>>>++++++.<<<<.>>-.<<.>>>+.<<-------.>>>++++.<<<+++++++.>>>----.<<<<.>>>.<<<.>>>
++++++++.<--.<<.>>>>--.+++++.-------.<<<--------.<.++++++++++.>----.>>>++++.<<<+++++++++.>>>------.+
+.<<<-----..<----------.>>++.<<.>-----.>>>.<<<-..+++.>>>++.<----------.<<-.>>>++.<<<+++++++++.>>>---
---.<<<----.----------.+++++++++++++++++.>>>>++++++++[>+++++++<-]<++++++.<+.<--.<<.>>>>++++.---.<<<<
.>>>-.>++++++++.---------.<<<---.>>>------.++.<<<-----..<.>>++..<<.>>+++++++++++++++++.+++++++.-----
----..>+.<<<.>+++++++++.-----------.>>>++++.<<<++..---.+++.>>-.<<<++.>-----.>>>----.<<<-..+++.>>>++.
<<<<.>>>+.>>>+++.<<<<<<--.>>>>++.<<<+++++++++.>>>++++.<<<----.>>-.<-------.+++++++++++++++++++.-----
----------.+++++++++++.+++++++++++.>>>>+++++++++++.-----.++++++++.+++.+++++++++.---.-------------.<<
<+.>>>----------.<<<<<+++++++++.<.>>>>.---.<<<<.>>>-.>+++.++++++++++.<<.>>-------.-------.+.<<<-----
----.>.>>-.<<<++++.--------.>++.<--.+++++.>>>++++.++++++.-.<+.<<<.>++++++++.>>>-.<<++++.>>.++++++.<<
.>>+.<-.>------.<<.<----.>------.++.<-----..>>++++.<<<.>>>++++.----.<<<.>>>>.<<++++.<+++++.>------.<
----.>>>-----.<<<+++++++.>++++++.>---.>>>.<<<<<<.>>>>++++.<<.>>.<<--.>>+++.<<<-.>>-.>--.<<++.<--.>--
----.++.<-----..<.>>>+++.<<<.>>>-.<<+.>>>-----.<<<+++++++.>++++.>++.<<<.>>>--.<----.<--------..>>++.
<<<.>>>--.<<+.>>>.<<<+++++++.>++++.>-.>>>.<<<<<+++.<.>>.>>+++.+++++++.<<.<<.>--.>++++++++.--------.+
+++++++.>>.<<--------.>>+.<-.>------.<<.<----.>------.++.<-----..>>++++.<<<.>>>++++.----.<<<.>>>>.<<
++++.<+++++.>------.<----.>>>-----.<<<+++++++.>++++++.>---.>>>.<<<<<<.>>>>++++.<<.>>.<<--.>>+++.<<<-
.>>-.>--.<<++.<--.>------.++.<-----..>>++++.<<<.>>>--.<.<..>>++.<<<.>>>--.<<+.>>>-----.<<<+++++++.>+
+++.>-.>>>.<<<<<+++.<.>>+.>>+++++++++.<<-..>-.++.<----.>>..<-.>>>.<<<<<<.>>>+.<.>>..<<<<.>>>>>>++.<<
<<<<.>>>>----.<<++++.<------.>------.++.<-----..>>>>>--.<<<<<<.>>>.<<+.>>>-----.<<<+++++++.>++++.<<.
>>>>>>++.<<<<<<.>>>>+++++.<<.<---.>------.<----.>>>-----.<<<+++++++.>++++++.>>>>--.<<<<<+++.<<+++.--
-.+++.---.>>>>>.+++++.++++++.<<<<.>>++++++++.------------.++++++++.+++++.>--.+.<<<.>--.<<+++.---.>..
..>>>>-.<<-----.<-.>----.------.>>+.<<<<.>>++.--.>>-.----------.<<<.>++++++.<<.>>>>>>++.<<<<<<.>>>>>
>-------.-..--.+++.+++++.<<<<<<<+++.---.+++.---.>....>>--.>>-.<<--.<--------.<.>>>+.<.<..>.<+++++++.
<.>>>>>>++.<<<<<<.>>>>+++++.<<.>>-..+++.<<++.>--.<--.--.>>++++.----------.<<<+.>++++++.>+.>>>--.<<<<
<<<+++.---.>....>>>>.<<+.<<.>>>-.<-----.<--------..>.<+++++++.<.>>>>>>++..<<<<<<.>>-----------------
--.+++++++.---------..>+.<<<.>++.<<+++.---.>........>>>>+++++++.-----------.<<<---------..---.+++.>>
-.<<<++.>-----.>>>----.<<<-..+++.>>>++.<<<<.>>>+.>>>--.<<<<<<<+++.---.>--........>+++.>>>++.<<<++.+.
---.----.<.>>-------.>>-------------.<<++++.>>----.+++++++++++.<<---.-----.++++++++.+++.+++++++++.--
-.-------------.>>>>.<<<<<<<+++.---.>....>+++++++++++++++.<<+++.---.>....>----------------.--------.
++++++++.++++++.>>>++++++.<<<+.>>-.>----.<<<--..>>>.<<<+++++++.>>++++.<<<.>>>++++.----.<<<.>>>>.--.<
<<------.----------.+++++++++++++++++.>>>++++++.<---.>>>.<<<<<<<+++.---.>....>>>>--.+++++.-------.<<
<--------.<.>>>+.<<--.++++.--.<.>>>>>>++.<<<<<<.>>>>.<<<..>>>.<<<+++++++.<.>>>+.<<<.>>>>.--.<<<-----
-.----------.+++++++++++++++++.>>>++++++.<<<<.>>>++++.<<<.>>>+++.>>>--.<<<<<<<+++.---.+++.---.>....>
>>>++++.+++++.++++++.<<<<.>>>>.---------------.++++++++.+++.<<<<.>>>>>>++.<<<<<<.>>>--.>>>--.<<<<<<<
+++.---.+++.---.

[>]<[[-]<]                                                          n                                           19
<<<<<<<<<<<<<<<<<<<                                                 19                                          0

+[                                                                  0       while(this(0)!=0)                   0
    [-]-
    ,                                                               0       this(0)=input()                     0

    #set initial value of !flag to 0 and flag to 1
    >>>                                                                                         0               3
    [-]>[-]+>[-]>[-]+>[-]>[-]+>[-]>[-]+>[-]>[-]+>[-]>[-]+>[-]>[-]+>[-]>[-]+                     3              18
    <<<<<<<<<<<<<<<<<<                                                                          18              0


    #begin#cp this(0) to this(0) and this(2)#####################################################################
    >[-]>[-]<<                                                      0   this(1)=0   this(2)=0                   0
    +[->+<]>-                                                       0   move this(0) to this(1)                 1
    +[->+<<+>]>-<<-                                                 1   move this(1) to this(2) and this(0)     0
    #endn#cp this(0) to this(0) and this(2)######################################################################

    #generate !flag of right(ASCII=62)
    #if(this(0)!=right)this(3)=1
    --------------------------------------------------------------
    [                                                               0       while(this(0))                      0
        >>>+<<<                                                     0       this(3)=1                           0
        [-]                                                         0       this(0)=0                           0
    ]                                                               0                                           0
    #generate flag of right
    #if(this(3)!=0)this(4)=0
    >>>[                                                            0       while(this(3))                      3
        >-<                                                         3       this(4)=0                           3
        [-]                                                         3       this(3)=0                           3
    ]<<<                                                            3                                           0            

    #begin#cp this(2) to this(2) and this(0)#####################################################################
    >>+[-<+>]<-                                                     0   move this(2) to this(1)                 1
    +[->+<<+>]>-<<-                                                 1   move this(1) to this(2) and this(0)     0
    #end#cp this(2) to this(2) and this(0)#######################################################################

    #generate !flag of left(ASCII=60)
    #if(this(0)!=left)this(5)=1
    ------------------------------------------------------------
    [                                                               0       while(this(0))                      0
        >>>>>+<<<<<                                                 0       this(5)=1                           0
        [-]                                                         0       this(0)=0                           0
    ]                                                               0                                           0
    #generate flag of left
    #if(this(5)!=0)this(6)=0
    >>>>>[                                                          0       while(this(5))                      5
        >-<                                                         5       this(6)=0                           5
        [-]                                                         5       this(5)=0                           5
    ]<<<<<                                                          5                                           0

    #begin#cp this(2) to this(2) and this(0)#####################################################################
    >>+[-<+>]<-                                                     0   move this(2) to this(1)                 1
    +[->+<<+>]>-<<-                                                 1   move this(1) to this(2) and this(0)     0
    #end#cp this(2) to this(2) and this(0)#######################################################################

    #generate !flag of plus(ASCII=43)
    #if(this(0)!=plus)this(7)=1
    -------------------------------------------
    [                                                               0       while(this(0))                      0
        >>>>>>>+<<<<<<<                                             0       this(7)=1                           0
        [-]                                                         0       this(0)=0                           0
    ]                                                               0                                           0
    #generate flag of plus
    #if(this(7)!=0)this(8)=0
    >>>>>>>[                                                        0       while(this(7))                      7
        >-<                                                         7       this(8)=0                           7
        [-]                                                         7       this(7)=0                           7
    ]<<<<<<<                                                        7                                           0

    #begin#cp this(2) to this(2) and this(0)#####################################################################
    >>+[-<+>]<-                                                     0   move this(2) to this(1)                 1
    +[->+<<+>]>-<<-                                                 1   move this(1) to this(2) and this(0)     0
    #end#cp this(2) to this(2) and this(0)#######################################################################

    #generate !flag of minus(ASCII=45)
    #if(this(0)!=minus)this(9)=1
    ---------------------------------------------
    [                                                               0       while(this(0))                      0
        >>>>>>>>>+<<<<<<<<<                                         0       this(9)=1                           0
        [-]                                                         0       this(0)=0                           0
    ]                                                               0                                           0
    #generate flag of minus
    #if(this(9)!=0)this(10)=0
    >>>>>>>>>[                                                      0       while(this(9))                      9
        >-<                                                         9       this(10)=0                          9
        [-]                                                         9       this(9)=0                           9
    ]<<<<<<<<<                                                      9                                           0

    #begin#cp this(2) to this(2) and this(0)#####################################################################
    >>+[-<+>]<-                                                     0   move this(2) to this(1)                 1
    +[->+<<+>]>-<<-                                                 1   move this(1) to this(2) and this(0)     0
    #end#cp this(2) to this(2) and this(0)#######################################################################

    #generate !flag of dot(ASCII=46)
    #if(this(0)!=dot)this(11)=1
    ----------------------------------------------
    [                                                               0       while(this(0))                      0
        >>>>>>>>>>>+<<<<<<<<<<<                                     0       this(11)=1                          0
        [-]                                                         0       this(0)=0                           0
    ]                                                               0                                           0
    #generate flag of dot
    #if(this(11)!=0)this(12)=0
    >>>>>>>>>>>[                                                    0       while(this(11))                     11
        >-<                                                         11      this(12)=0                          11
        [-]                                                         11      this(11)=0                          11
    ]<<<<<<<<<<<                                                    11                                          0

    #begin#cp this(2) to this(2) and this(0)#####################################################################
    >>+[-<+>]<-                                                     0   move this(2) to this(1)                 1
    +[->+<<+>]>-<<-                                                 1   move this(1) to this(2) and this(0)     0
    #end#cp this(2) to this(2) and this(0)#######################################################################

    #generate !flag of comma(ASCII=44)
    #if(this(0)!=comma)this(13)=1
    --------------------------------------------
    [                                                               0       while(this(0))                      0
        >>>>>>>>>>>>>+<<<<<<<<<<<<<                                 0       this(13)=1                          0
        [-]                                                         0       this(0)=0                           0
    ]                                                               0                                           0
    #generate flag of comma
    #if(this(13)!=0)this(14)=0
    >>>>>>>>>>>>>[                                                  0       while(this(13))                     13
        >-<                                                         13      this(14)=0                          13
        [-]                                                         13      this(13)=0                          13
    ]<<<<<<<<<<<<<                                                  13                                          0

    #begin#cp this(2) to this(2) and this(0)#####################################################################
    >>+[-<+>]<-                                                     0   move this(2) to this(1)                 1
    +[->+<<+>]>-<<-                                                 1   move this(1) to this(2) and this(0)     0
    #end#cp this(2) to this(2) and this(0)#######################################################################

    #generate !flag of bra(ASCII=91)
    #if(this(0)!=bra)this(15)=1
    -------------------------------------------------------------------------------------------
    [                                                               0       while(this(0))                      0
        >>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<                             0       this(15)=1                          0
        [-]                                                         0       this(0)=0                           0
    ]                                                               0                                           0
    #generate flag of bra
    #if(this(15)!=0)this(16)=0
    >>>>>>>>>>>>>>>[                                                0       while(this(15))                     15
        >-<                                                         15      this(16)=0                          15
        [-]                                                         15      this(15)=0                          15
    ]<<<<<<<<<<<<<<<                                                15                                          0

    #begin#cp this(2) to this(2) and this(0)#####################################################################
    >>+[-<+>]<-                                                     0   move this(2) to this(1)                 1
    +[->+<<+>]>-<<-                                                 1   move this(1) to this(2) and this(0)     0
    #end#cp this(2) to this(2) and this(0)#######################################################################

    #generate !flag of ket(ASCII=93)
    #if(this(0)!=ket)this(17)=1
    ---------------------------------------------------------------------------------------------
    [                                                               0       while(this(0))                      0
        >>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<                         0       this(17)=1                          0
        [-]                                                         0       this(0)=0                           0
    ]                                                               0                                           0
    #generate flag of ket
    #if(this(17)!=0)this(18)=0
    >>>>>>>>>>>>>>>>>[                                              0       while(this(17))                     17
        >-<                                                         17      this(18)=0                          17
        [-]                                                         17      this(17)=0                          17
    ]<<<<<<<<<<<<<<<<<                                              17                                          0

    #begin#cp this(2) to this(2) and this(0)#####################################################################
    >>+[-<+>]<-                                                     0   move this(2) to this(1)                 1
    +[->+<<+>]>-<<-                                                 1   move this(1) to this(2) and this(0)     0
    #end#cp this(2) to this(2) and this(0)#######################################################################




    #if this(0)==right (this(4)==1) output
    >>>>[                                                           0       while(this(4))                      4
        <<<<                                                        4                                           0

        >>>>>>>>>>>>>>>>>>>>                                        0                                           20

        +++++++++[>++++>++++++++++++>+++++++>+++++++++++<<<<-]>----....>---.---.<.++++++++.>++++++++++.++++.
        --.<--------.>>-.-.<<.>>>--.<<..>>.<<+++++++.<.+++++++++++.-----------.>>>.--.<<------.----------.++
        +++++++++++++++.>>++++++.<<<.+++++++++++++.-------------.>>------------.--------.<+.>>.<<---.-------
        -.>>----.<<--.>>+++.-----.<<-.--------.++++++++.++.+++.+++++++.>-.--.>++.<<-------..>>.<<+++++++.>++
        ++++.<<.++++++.>>>.--.<<------.----------.+++++++++++++++++.>>++++++.>>++++++++[<+++++++>-]<<<.<<---
        ---.>>++++.-------.>>+++.<<<<.>----------.++++.--.<.>>>>++.<<<<.>>>----.<<..>>.<<+++++++.<.>>++.<<.>
        >>.--.<<------.----------.+++++++++++++++++.>>++++++.<<<.>>++++.<<.>>+++.<<.>>-----.<<.>>++++.>>--.<
        <<+++.<<+++++++++++++.---.>....>>------..>+++++++++++.++++.--.>.<<<<<+++.---.


        [>]<[[-]<]                                                  n                                           19
        <<<<<<<<<<<<<<<<<<<                                         19                                          0

        >>>>                                                        0                                           4
        [-]                                                         4       this(4)=0                           4
    ]                                                               4                                           4

    #if this(0)==left (this(6)==1) output
    >>[                                                             4       while(this(9))                      6
        <<<<<<                                                      6                                           0
        
        >>>>>>>>>>>>>>>>>>>>                                        0                                           20

        ++++++++[>++++>+++++++++++++>++++++++>+++++++++++++>+++++++<<<<<-]>....>+.---.<.++++++++.>++++++++++
        .++++.--.<--------.>>---..<<.>>>-------.<<..>>.<<+++++++.<+++++++++.>++.>>++++.<<---.--------.>>----
        .<<--.>>+++.-----.<<-.--------.++++++++.++.+++.+++++++.<-.--.>>>++.<<-------..>>.<<+++++++.<++++++.-
        -----------.++++++.>>>.--.<<------.----------.+++++++++++++++++.>>++++++.<<<++++++.------------.>>>>
        -------.--------.<<--.<<.>----------.++++.--.<.>>++.<<.>>>----.<<..>>.<<+++++++.<.>>>>++.<<<<.>>>.--
        .<<------.----------.+++++++++++++++++.>>++++++.<<<.>>>>++++.<<<<.>>>>+++.<<--.<+++.<<+++++++++++++.
        ---.>....>>>>-----..<+++++++++++.++++.--.<.<<<+++.---.


        [>]<[[-]<]                                                  n                                           19
        <<<<<<<<<<<<<<<<<<<                                         19                                          0

        >>>>>>                                                      0                                           6
        [-]                                                         6       this(6)=0                           6       
    ]                                                               6                                           6

    #if this(0)==plus (this(8)==1) output
    >>[                                                             6      while(this(8))                       8
        <<<<<<<<                                                    8                                           0
        
        >>>>>>>>>>>>>>>>>>>>                                        0                                           20

        ++++++++[>++++>++++++++++++++>+++++++<<<-]>....+++++++++++..-.>.++++.--.>+++.<<<+++++++++++++.---.


        [>]<[[-]<]                                                  n                                           19
        <<<<<<<<<<<<<<<<<<<                                         19                                          0

        >>>>>>>>                                                    0                                           8
        [-]                                                         8      this(8)=0                            8
    ]                                                               8                                           8

    #if this(0)==minus (this(10)==1) output
    >>[                                                             8      while(this(10))                      10
        <<<<<<<<<<                                                  10                                          0
        
        >>>>>>>>>>>>>>>>>>>>                                        0                                           20

        ++++++++[>++++>++++++++++++++>+++++++<<<-]>....+++++++++++++..---.>.++++.--.>+++.<<<+++++++++++++.--
        -.


        [>]<[[-]<]                                                  n                                           19
        <<<<<<<<<<<<<<<<<<<                                         19                                          0

        >>>>>>>>>>                                                  0                                           10
        [-]                                                         10      this(10)=0                          10
    ]                                                               10                                          10

    #if this(0)==dot (this(12)==1) output
    >>[                                                             10      while(this(12))                     12
        <<<<<<<<<<<<                                                12                                          0
        
        >>>>>>>>>>>>>>>>>>>>                                        0                                           20

        ++++++++[>++++>++++++++++++++>+++++++<<<-]>....>.+++++.-.-----------------.+++++.-------.+++++++++++
        ++++++.<++++++++.++.>--.++++.--.<-.>>+++.<<<+++++++++++++.---.>---------....>------------..++++++.++
        +++++++.--.-----------.<++++++++.>+++++++++++.+.----------------.+++++++++++.++++++.-.<+.>>.<<<+++.-
        --.


        [>]<[[-]<]                                                  n                                           19
        <<<<<<<<<<<<<<<<<<<                                         19                                          0

        >>>>>>>>>>>>                                                0                                           12
        [-]                                                         12      this(12)=0                          12
    ]                                                               12                                          12

    #if this(0)==comma (this(14)==1) output
    >>[                                                             12      while(this(14))                     14
        <<<<<<<<<<<<<<                                              14                                          0
        
        >>>>>>>>>>>>>>>>>>>>                                        0                                           20

        ++++++++[>++++>+++++++++++++++>++++++++>++++<<<<-]>....>----.---------------.++++++++.+++.<.>>---.>.
        <<---------.--.+++++++++++++++.-----------------.+++++.-------.+++++++++++++++++.<++++++++.+.>>--.<<
        <+++++++++++++.---.>>>>....<<---------.---.>>.<<<-.>++++++++++++++.---------------.++++++++.+++.>>.<
        ++..>.<++++++++.++++++++++.---------.<<+.<+++.---.>>>>....<<<+.>.++++.--.>>.<---------.>.<<<+++.++++
        .>>--.<<<+++.---.>>>>....<<-------------.+++++++.+++++++.--------------.<<+++.---.>>>>....<<<-------
        .>+++++++++++.++++.--.>>.<++.>.<<<--.>---------------.+++++.-------.+++++++++++++++++.<+.>++.-------
        --------.++++++++.+++.>--.<<<+++.---.


        [>]<[[-]<]                                                  n                                           19
        <<<<<<<<<<<<<<<<<<<                                         19                                          0

        >>>>>>>>>>>>>>                                              0                                           14
        [-]                                                         14      this(14)=0                          14
    ]                                                               14                                          14

    #if this(0)==bra (this(16)==1) output
    >>[                                                             14      while(this(16))                     16
        <<<<<<<<<<<<<<<<                                            16                                          0
        
        >>>>>>>>>>>>>>>>>>>>                                        0                                           20

        +++++++++[>++++>+++++++++++++<<-]>----....>++.---------------.+.+++.-------.<.++++++++.++.>+++++++++
        ++.++++.--.<-.---------.>+++++++++.<<+++++++++++++.---.


        [>]<[[-]<]                                                  n                                           19
        <<<<<<<<<<<<<<<<<<<                                         19                                          0

        >>>>>>>>>>>>>>>>                                            0                                           16
        [-]                                                         16      this(16)=0                          16
    ]                                                               16                                          16

    #if this(0)==ket (this(18)==1) output
    >>[                                                             16      while(this(18))                     18
        <<<<<<<<<<<<<<<<<<                                          18                                          0
        
        >>>>>>>>>>>>>>>>>>>>                                        0                                           20

        +++++++++[>++++>++++++++++++++<<-]>----....>-.<<+++++++++++++.---.


        [>]<[[-]<]                                                  n                                           19
        <<<<<<<<<<<<<<<<<<<                                         19                                          0

        >>>>>>>>>>>>>>>>>>                                          0                                           18
        [-]                                                         18      this(18)=0                          18
    ]                                                               18                                          18

    <<<<<<<<<<<<<<<<<<                                              18                                          0
    
    +                                                               0       this(0)=this(0) plus 1              1
]                                                                   0       loop until EOF                      0

#print the tail of the C code
++++++++[>++++>+++++++++++++>+++++++<<<-]>....>--.++++++++++++.-------------..<++++++++.>----.++++++
+++++++++++..-----------------.++++++++++++++++++++++++.<+.>>+++.<<<+++++++++++++.---.>---------....
>-------.-------------.+++++++++++++++.+.---.----.<.>>-----------.+++++++++++.<<<+++.---.>>+++++++++
++++++.<<+++.---.
