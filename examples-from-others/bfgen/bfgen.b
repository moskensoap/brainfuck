[ Generates Brainfuck text, written by Erik Thomasson Forsberg 2016 ]

>,[>,] 					Read input until nullcharacter
<[<]  					Return pointer to register 0
>[.[ 					Loop the length of ASCII character
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>	Move far away from the string in memory (32 bytes)
++++++++++
[>++++<-]
>+++. 					Print increment operator
---<
++++++++++
[>----<-]
<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<- 	Go back to char pointer and decrement value
]
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
++++++++++
[>+++++<-]
>----.					Print output operator
++++++++++++++++. 			Print register shift right operator
--<
++++++++++
[>-----<-]
>.---------- 				Print linebreak for easy to read code
<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 	Go to next char
]
