# We want to COMPLETELY reverse a list by flipping the order of the entries AND flipping the order of characters in each element.

# a) Define a 'reverse_characters' function. Give it one parameter, which will be the string to reverse.
def reverse_characters(text):
    
# b) Within the function, use the 'list' function to split a string into a list of individual characters
    char_list = list(text)
    
# c) 'reverse' your new list.
    char_list.reverse()
# d) Use 'join' to create the reversed string and return that string from the function.
    reversed_text = ''.join(char_list)
    return reversed_text

# e) Create a variable of type string to test your new function. 
my_variable_name =  input("Enter a word: ")

# # f) Use 'print(reverse_characters(my_variable_name))'; to call the function and verify that it correctly reverses the characters in the string.
print(reverse_characters(my_variable_name)) 
# g) Use method chaining to reduce the lines of code within the function.

def reverse_characters(text):
    return ''.join(list(text)[::-1])
my_variable_name = input("Enter a word: ")
print(reverse_characters(my_variable_name))

# 2) The 'split' method does not work on numbers, but we want the function to return a number with all the digits reversed (e.g. 1234 converts to 4321 and NOT the string "4321")
# a) Add an if statement to your reverse_characters function to check the typeof the parameter.
def reverse_characters(text):
     if type(text) == str:
# b - d) If type is ‘string’, return the reversed string as before. If type is ‘number’, convert the parameter to a string, reverse the characters, then convert it back into a number. Return the reversed number.
        return ''.join(list(text)[::-1])
     elif type(text) == int or type(text) == float:
        reversed_str = str(text)[::-1]   
        return int(reversed_str) 
# e) Be sure to print the result returned by the function to verify that your code works for both strings and numbers. Do this before moving on to the next steps.
my_variable_name =  input("Enter a word: ")
print(reverse_characters(my_variable_name)) 
# 3) Create a new function with one parameter, which is the list we want to change. The function should:
def reverse_list_items(old_list):
# a) Define and initialize an empty list.
    new_list = []
# b) Loop through the old list.
    for item in old_list[::-1]:
# c) For each element in the old list, call reverse_characters to flip the characters or digits.
        new_list.append(reverse_characters(item))
# d) Add the reversed string (or number) to the list defined in part ‘a’.
# e) Return the final, reversed list.
    return(new_list)
# f) Be sure to print the results from each test case in order to verify your code.

list_test1 = ['apple', 'potato', 'Capitalized Words']
list_test2 = [123, 8897, 42, 1168, 8675309]
list_test3 = ['hello', 'world', 123, 'orange']
print(reverse_list_items(list_test1))
print(reverse_list_items(list_test2))
print(reverse_list_items(list_test3))