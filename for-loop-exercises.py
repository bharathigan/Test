#1.Construc t for loops that accomplish the following tasks:

	#1.Print the numbers 0 - 20, one number per line.
	   Answer: 0
               1
               2
               3
               4
               5
               6
               7
               8
               9
               10
               11
               12
               13
               14
               15
               16
               17
               18
               19
               20
for num  in range(21):
 print(num)
 
	#2.Print only the ODD values from 3 - 29, one number per line.
       Answer: 3
               5
               7
               9
               11
               13
               15
               17
               19
               21
               23
               25
               27

for num  in range(3, 29):
          if num%2==1:
           print(num)
          
	#3.Print the EVEN numbers 12 down to -14 in descending order, one number per line.
    Answer:
            12
            10
            8
            6
            4
            2
            0
            -2
            -4
            -6
            -8
            -10
            -12
            -14
    
for num  in range(12, -15,-1):
          if num%2==0:
           print(num)     
	#4.Print the numbers 50 down to 20 in descending order, but only if the numbers are multiples of 3.
    Answer:
            48
            45
            42
            39
            36
            33
            30
            27
            24
            21

for num  in range(50, 20,-1):
         if num%3==0:
           print(num) 
           
           