my_string = "LaunchCode"


# a) Use string methods to remove the first three characters from the string and add them to the end.
print(my_string[3:]+my_string[:3] )


# Use a template literal to print the original and modified string in a descriptive phrase.

print(f"The original string is '{my_string}', and the modified string is '{my_string[3:]+my_string[:3]}'.")

# b) Modify your code to accept user input. Query the user to enter the number of letters that will be relocated.

my_string = input("Enter a word: ")
num_letters = int(input("Enter how many letters to relocate: "))
print(my_string[num_letters:]+my_string[:num_letters] )
# c) Add validation to your code to deal with user inputs that are longer than the word. In such cases, default to moving 3 characters. Also, the template literal should note the error.
my_string = input("Enter a word: ")
num_letters = int(input("Enter how many letters to relocate: "))
if num_letters > len(my_string):
    print("Warning: You entered "+ str(num_letters) +",which is longer than the word "+my_string + ", Defaulting to 3 letters.")
    num_letters = 3  # default value
print(my_string[num_letters:]+my_string[:num_letters] )
