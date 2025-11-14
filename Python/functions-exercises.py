# Part 1 A -- Make a Line
def make_line(size):
    line =""
    for i in range(size):
        line +="#"
    return line    
    
print(make_line(5))  


# Part 1 B -- Make a Square
# create a function using your make_line function to code a square
print("---")
def make_square(size):
    for i in range(size):
     print(make_line(5))     
make_square(5)   
    



# Part 1 C -- Make a Rectangle

print("---")
def make_rectangle(width, height):
   rectangle = ""
   for i in range(height):
      rectangle += (make_line(width) + "\n")
   return rectangle

print(make_rectangle(5, 3))


# Part 2 A -- Make a Stairs

print("----")
def make_downward_stairs(height):
   stairs = ""
   for i in range(height):
      stairs += (make_line(i+1) + "\n")
   return stairs

print(make_downward_stairs(5))


# Part 2 B -- Make Space-Line 


print("----")
def make_space_line(spaces, size):
    space=""
    for i in range(spaces):
        space +=" "      
    
    space =space+make_line(size)+space
    return space 
        
print(make_space_line(3, 5))


# Part 2 C -- Make Isosceles Triangle

print("----")
def make_isosceles_triangle(height):
    triangle = ""
    for i in range(1, height + 1):
        spaces = height - i
        stars = 2 * i - 1
        line = " " * spaces + "#" * stars
        triangle += line
        if i < height:
            triangle += "\n"
    return triangle
    
print(make_isosceles_triangle(5))  



# Part 3 -- Make a Diamond
print("---")
def make_diamond(height):
    diamond = ""
    for i in range(1, height + 1):
        spaces = height - i
        stars = 2 * i - 1
        line = " " * spaces + "#" * stars
        diamond += line + "\n"
    for i in range(height - 1, 0, -1):
        spaces = height - i
        stars = 2 * i - 1
        line = " " * spaces + "#" * stars
        diamond += line
        if i > 1:
            diamond += "\n"
    return diamond
print(make_diamond(5))    





